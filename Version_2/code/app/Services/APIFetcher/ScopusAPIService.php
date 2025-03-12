<?php
namespace App\Services\APIFetcher;

use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use Illuminate\Support\Carbon;
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
            DB::transaction(function () use ($paper, $userId) {
                // ทำความสะอาดข้อมูลพื้นฐาน
                $title = strtolower(trim($paper['title']));
                $doi = !empty($paper['doi']) ? strtolower(trim($paper['doi'])) : null;
                $paperModel = null;

                // 🔍 1. ค้นหาด้วย DOI (Exact Match)
                if ($doi) {
                    $paperModel = Paper::whereRaw('LOWER(paper_doi) = ?', [$doi])->first();
                }
                else{
                    // ถ้าไม่มี DOI ให้ค้นหาด้วยชื่อเรื่อง
                    $paperModel = Paper::whereRaw('LOWER(paper_name) = ?', [$title])->first();
                }

                // 🔍 2. ถ้าไม่เจอด้วย DOI, ใช้ Full-Text Search
                if(!$paperModel) {
                    $papers = Paper::all(); //  Get all papers for comparison
                    foreach ($papers as $existingPaper) {
                        $existingTitle = strtolower(trim($existingPaper->paper_name));
                        similar_text($title, $existingTitle, $percent); // Calculate similarity

                        if ($percent > 90) {
                            $paperModel = $existingPaper;  //  Consider it the same paper
                            break; // Exit the loop once a match is found
                        }
                    }
                }

                if (!$paperModel) {
                    // 🆕 สร้าง Paper ใหม่
                    $paperModel = new Paper();
                    $paperModel->paper_name = trim($paper['title']);
                    $paperModel->paper_doi = $doi;
                    $paperModel->paper_type = !empty($paper['type']) ? $paper['type'] : null;
                    $paperModel->paper_subtype = !empty($paper['subtype']) ? $paper['subtype'] : null;
                    $paperModel->paper_sourcetitle = !empty($paper['sourceTitle']) ? $paper['sourceTitle'] : null;
                    $paperModel->paper_url = !empty($paper['url']) ? $paper['url'] : null;
                    $paperModel->paper_yearpub = !empty($paper['year']) ? (int)$paper['year'] : null;
                    $paperModel->paper_volume = !empty($paper['volume']) ? (int)$paper['volume'] : null;
                    $paperModel->paper_issue = !empty($paper['issue']) ? $paper['issue'] : null;
                    $paperModel->paper_citation = !empty($paper['citationCount']) ? (int)$paper['citationCount'] : 0;
                    $paperModel->paper_page = !empty($paper['pageRange']) ? $paper['pageRange'] : null;
                    $paperModel->paper_funder = !empty($paper['funding']) ? json_encode($paper['funding']) : null;
                    $paperModel->abstract = !empty($paper['abstract']) ? $paper['abstract'] : null;
                    $paperModel->keyword = !empty($paper['keywords']) ? json_encode($paper['keywords']) : null;
                    $paperModel->save();

                    // เชื่อมโยงกับ Source_data (ในที่นี้ใช้ source id 1)
                    $source = Source_data::findOrFail(1);
                    $paperModel->source()->sync([$source->id]);
                } else {
                    // 🔄 อัปเดต Citation หากข้อมูลใหม่มีค่าสูงกว่า
                    if ($paperModel->paper_citation < (int)$paper['citationCount']) {
                        $paperModel->update(['paper_citation' => (int)$paper['citationCount']]);
                    }
                }

                // 🔗 เชื่อมโยง Authors (ใช้ syncWithoutDetaching เพื่อป้องกันความซ้ำ)
                $authors = $paper['authors']; // คาดว่าข้อมูล authors เป็น array ของข้อมูลผู้แต่ง
                $authorCount = count($authors);
                foreach ($authors as $index => $authorData) {
                    // ค้นหา User โดยตรวจสอบทั้งชื่อเต็มและตัวย่อ
                    $user = User::where(function ($query) use ($authorData) {
                        $query->where([
                            ['fname_en', '=', $authorData['firstName']],
                            ['lname_en', '=', $authorData['lastName']]
                        ])
                            ->orWhere(function ($query) use ($authorData) {
                                $query->where(DB::raw("concat(left(fname_en,1),'.')"), '=', $authorData['firstName'])
                                    ->where('lname_en', '=', $authorData['lastName']);
                            })
                            ->orWhere(function ($query) use ($authorData) {
                                $query->where(DB::raw("left(fname_en,1)"), '=', $authorData['firstName'])
                                    ->where('lname_en', '=', $authorData['lastName']);
                            });
                    })->first();

                    // กำหนด author_type: คนแรก = 1, คนสุดท้าย = 3, คนกลาง = 2
                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($user) {
                        $paperModel->teacher()->syncWithoutDetaching([$user->id => ['author_type' => $authorType]]);
                    }
                    else {
                        $authorModel = Author::where([
                            ['author_lname', $authorData['lastName']],
                            ['author_fname', $authorData['firstName']]
                        ])->first();

                        if(!$authorModel) {
                            $authorModel = new Author();
                            $authorModel->author_fname = $authorData['firstName'];
                            $authorModel->author_lname = $authorData['lastName'];
                            $authorModel->save();
                        }

                        $paperModel->author()->syncWithoutDetaching([$authorModel->id => ['author_type' => $authorType]]);
                    }
                }

                // 🔗 เชื่อมโยง Paper กับ User (Owner) - โดยใช้ syncWithoutDetaching
                $owner = User::findOrFail($userId);
                if (!$paperModel->teacher->contains($owner->id)) {
                    $paperModel->teacher()->syncWithoutDetaching([$owner->id]);
                }
            });
        }
    }

}
