<?php
namespace App\Services\APIFetcher;

use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Support\Facades\DB;

class WosAPIService
{
    private string $apiKey;
    public function __construct(string $apiKey){
        $this->apiKey = $apiKey;
    }

    public function getResearcherPublications($lName_fName): array
    {
        $client = new Client();
        try {
            $response = $client->request('GET', 'https://api.clarivate.com/apis/wos-starter/v1/documents', [
                'headers' => [
                    'X-ApiKey' => $this->apiKey,
                    'Accept' => 'application/json',
                ],
                'query' => [
                    'db' => 'WOS',
                    'q' => 'AU=' . $lName_fName,
                    'limit' => 50,
                    'page' => 1,
                ],
            ]);

            $jsonData = $response->getBody()->getContents();
            return json_decode($jsonData, true);

        } catch (GuzzleException $e) {
            error_log("Error while fetching Web of Science publication: " . $e->getMessage());
            return [] ;
        }
    }

    public function saveWOSPublications(array $papers, string $userId): void
    {
        foreach ($papers['hits'] as $paper) {
            $existingPaper = Paper::where('paper_name', $paper['title'])->first();
            if ($existingPaper === null) {
                $paperModel = new Paper();
                $paperModel->paper_name = $paper['title'];
                $paperModel->paper_type = $paper['types'][0];
                $paperModel->paper_subtype = $paper['sourceTypes'][0];
                $paperModel->paper_sourcetitle = $paper['source']['sourceTitle'] ?? null;
                $paperModel->paper_url = $paper['links']['record'] ?? null;
                $paperModel->paper_yearpub = $paper['source']['publishYear'] ?? null;
                $paperModel->paper_volume = $paper['source']['volume'] ?? null;
                $paperModel->paper_issue = $paper['source']['issue'] ?? null;
                $paperModel->paper_citation = $paper['citations'][0]['count'] ?? 0;
                $paperModel->paper_page = $paper['source']['pages']['range'] ?? null;
                $paperModel->paper_doi = $paper['identifiers']['doi'] ?? null;
                $paperModel->paper_funder = $paper['names']['sponsors']['displayName'] ?? null;
                $paperModel->keyword = json_encode($paper['keywords']['authorKeywords'] ?? []);
                $paperModel->save();

                $source = Source_data::findOrFail(2);
                $paperModel->source()->sync($source);

                $authorsArray = [];
                foreach ($paper['names']['authors'] as $author) {
                    $authorData = explode(', ', $author['displayName']);
                    $fname = isset($authorData[1]) ? trim($authorData[1]) : '';
                    $lname = isset($authorData[0]) ? trim($authorData[0]) : '';
                    $authorsArray[] = ['fname' => $fname, 'lname' => $lname];
                }

                $authorCount = count($authorsArray);
                foreach ($authorsArray as $index => $authorData) {
                    $user = User::where([
                        ['fname_en', '=', $authorData['fname']],
                        ['lname_en', '=', $authorData['lname']]
                    ])
                        ->orWhere([
                            [DB::raw("concat(left(fname_en,1),'.')"), '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                        ->orWhere([
                            [DB::raw("left(fname_en,1)"), '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                        ->first();

                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($user) {
                        $paperModel->teacher()->attach($user->id, ['author_type' => $authorType]);
                    } else {
                        $author = Author::where('author_fname', $authorData['fname'])
                                    ->where('author_lname', $authorData['lname'])
                                    ->first();
                        if (!$author) {
                            $author = new Author();
                            $author->author_fname = $authorData['fname'];
                            $author->author_lname = $authorData['lname'];
                            $author->save();
                        }
                        $paperModel->author()->attach($author->id, ['author_type' => $authorType]);
                    }
                }
            } else {
                $paperModel = $existingPaper;
                $user = User::findOrFail($userId);

                if (!$user->paper()->where('paper_id', $paperModel->id)->exists()) {
                    $author = Author::where([
                        ['author_fname', '=', $user->fname_en],
                        ['author_lname', '=', $user->lname_en]
                    ])->first();

                    if ($author) {
                        $paperModel->author()->detach($author->id);
                    }
                    $paperModel->teacher()->attach($user->id);
                }
            }
        }
    }

}


