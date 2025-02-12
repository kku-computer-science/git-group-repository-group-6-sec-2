<?php
namespace App\Services\APIFetcher;

use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class ScopusAPIService {
    protected string $apiKey = '6ab3c2a01c29f0e36b00c8fa1d013f83';

    public function fetchData($userId): array
    {
        $user = User::find($userId);
        $firstName = substr($user['fname_en'], 0, 1);
        $lastName = $user['lname_en'];

        $apiResponse = Http::get('https://api.elsevier.com/content/search/scopus?', [
                'query' => "AUTHOR-NAME($lastName,$firstName)",
                'apikey' => '6ab3c2a01c29f0e36b00c8fa1d013f83',
            ])->json();

        $papers = $apiResponse["search-results"]["entry"];
        $paginationLinks = $apiResponse["search-results"]["link"];

        do {
            $hasNextPage = false;
            foreach ($paginationLinks as $link) {
                if ($link['@ref'] == 'next') {
                    $nextPageResponse = Http::get($link['@href'])->json();
                    $paginationLinks = $nextPageResponse["search-results"]["link"];
                    $nextPagePapers = $nextPageResponse["search-results"]["entry"];

                    foreach ($nextPagePapers as $paper) {
                        $papers[] = $paper;
                    }
                    $hasNextPage = true;
                }
            }
        } while ($hasNextPage);

        return $this->processPapers($papers);
    }

    private function processPapers($papers): array
    {
        $processedPapers = [];

        foreach ($papers as $paper) {
            if (array_key_exists('error', $paper)) {
                continue;
            }

            $scopusId = explode(":", $paper['dc:identifier'])[1];
            $abstractResponse = Http::get("https://api.elsevier.com/content/abstract/scopus_id/$scopusId?filed=authors&apiKey=$this->apiKey&httpAccept=application%2Fjson")->json();

            $processedPapers[] = [
                'title' => $paper['dc:title'],
                'type' => $paper['prism:aggregationType'],
                'subtype' => $paper['subtypeDescription'],
                'sourceTitle' => $paper['prism:publicationName'],
                'url' => $paper['link'][2]['@href'],
                'year' => Carbon::parse($paper['prism:coverDate'])->format('Y'),
                'volume' => $paper['prism:volume'] ?? null,
                'issue' => $paper['prism:issueIdentifier'] ?? null,
                'citationCount' => $paper['citedby-count'],
                'pageRange' => $paper['prism:pageRange'],
                'doi' => $paper['prism:doi'] ?? null,
                'abstract' => $abstractResponse['abstracts-retrieval-response']['item']['bibrecord']['head']['abstracts'] ?? null,
                'keywords' => $abstractResponse['abstracts-retrieval-response']['item']['bibrecord']['head']['citation-info']['author-keywords']['author-keyword'] ?? null,
                'funding' => $abstractResponse['abstracts-retrieval-response']['item']['xocs:meta']['xocs:funding-list']['xocs:funding-text'] ?? null,
                'authors' => $this->processAuthors($abstractResponse['abstracts-retrieval-response']['authors']['author'] ?? [])
            ];
        }

        return $processedPapers;
    }

    private function processAuthors($authors): array
    {
        $processedAuthors = [];

        foreach ($authors as $author) {
            $firstName = $author['ce:given-name'] ?? $author['preferred-name']['ce:given-name'] ?? null;
            $lastName = $author['ce:surname'] ?? null;

            if ($firstName && $lastName) {
                $processedAuthors[] = [
                    'firstName' => $firstName,
                    'lastName' => $lastName
                ];
            }
        }

        return $processedAuthors;
    }

    public function saveScopusPublications(array $papers, string $userId): void
    {
        foreach ($papers as $paper) {
            if(Paper::Where('paper_name', $paper['title'])->first() == null) {
                $paperModel = new Paper();
                $paperModel->paper_name = $paper['title'];
                $paperModel->paper_type = $paper['type'];
                $paperModel->paper_subtype = $paper['subtype'];
                $paperModel->paper_sourcetitle = $paper['sourceTitle'];
                $paperModel->paper_url = $paper['url'];
                $paperModel->paper_yearpub = $paper['year'];
                $paperModel->paper_volume = $paper['volume'];
                $paperModel->paper_issue = $paper['issue'];
                $paperModel->paper_citation = $paper['citationCount'];
                $paperModel->paper_page = $paper['pageRange'];
                $paperModel->paper_doi = $paper['doi'];
                $paperModel->paper_funder = json_encode($paper['funding']);
                $paperModel->abstract = $paper['abstract'];
                $paperModel->keyword = json_encode($paper['keywords']);
                $paperModel->save();

                $source = Source_data::findOrFail(1);
                $paperModel->source()->sync($source);

                /* I want fName lName */
                $authors = $paper['authors'];
                $authorCount = count($authors);

                foreach ($authors as $index => $authorData) {
                    $user = User::where([
                        ['fname_en', '=', $authorData['firstName']],
                        ['lname_en', '=', $authorData['lastName']]
                    ])
                        ->orWhere([
                            [DB::raw("concat(left(fname_en,1),'.')"), '=', $authorData['firstName']],
                            ['lname_en', '=', $authorData['lastName']]
                        ])
                        ->orWhere([
                            [DB::raw("left(fname_en,1)"), '=', $authorData['firstName']],
                            ['lname_en', '=', $authorData['lastName']]
                        ])
                        ->first();

                    /* Author_type (1 = first, 2 = middle, 3 = last) */
                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($user) {
                        $paperModel->teacher()->attach($user->id, ['author_type' => $authorType]);
                    } else {
                        $author = Author::where([['author_fname', '=', $authorData['firstName']],
                                                ['author_lname', '=', $authorData['lastName']]]
                                                )->first();
                        if(!$author){
                            $author = new Author;
                            $author->author_fname = $authorData['firstName'];
                            $author->author_lname = $authorData['lastName'];
                            $author->save();
                        }
                        $paperModel->author()->attach($author->id, ['author_type' => $authorType]);
                    }
                }
            }
            else{
                $paper = Paper::Where('paper_name', $paper['title'])->first();
                $user = User::findOrFail($userId);
                if (!$user->paper()->where('paper_id', $paper->id)->exists()) {
                    $author = Author::where([
                        ['author_fname', $user->fname_en],
                        ['author_lname', $user->lname_en]
                    ])->first();

                    if ($author) {
                        $paper->author()->detach($author->id);
                    }
                    $paper->teacher()->attach($user->id);
                }
            }
        }
    }

}
