<?php

namespace App\Services\APIFetcher;
require 'vendor/autoload.php';

use GuzzleHttp\Client;

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
                    'X-ApiKey' => $this->apiKey | '4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3',
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

        } catch (\Exception $e) {
            error_log("Error while fetching Web of Science publication: " . $e->getMessage());
            return [] ;
        }
    }

    public function extractPuclicationsData($jsonData)
    {
        $data = json_decode($jsonData, true);
        if (!isset($data['hits']) || !is_array($data['hits'])) {
            die("Invalid JSON structure");
        }

        $result = [];

        foreach ($data['hits'] as $entry) {
            $result[] = [
                'paper_name' => $entry['title'] ?? null,
                'abstract' => null,
                'paper_type' => $entry['types'][0] ?? null,
                'paper_subtype' => $entry['sourceTypes'][0] ?? null,
                'paper_sourcetitle' => $entry['source']['sourceTitle'] ?? null,
                'keyword' => isset($entry['keywords']['authorKeywords']) ?
                            implode(", ",
                                $entry['keywords']['authorKeywords']
                            ) : null,
                'paper_url' => $entry['links']['record'] ?? null,
                'publication' => $entry['source']['sourceTitle'] ?? null,
                'paper_yearpub' => $entry['source']['publishYear'] ?? null,
                'paper_volume' => $entry['source']['volume'] ?? null,
                'paper_issue' => $entry['source']['issue'] ?? null,
                'paper_citation' => $entry['citations'][0]['count'] ?? 0,
                'paper_page' => $entry['source']['pages']['range'] ?? null,
                'paper_doi' => $entry['identifiers']['doi'] ?? null,
                'paper_funder' => $entry['names']['sponsors'] ??null,
                'reference_number' => null,
                'created_at' => null,
                'updated_at' => null
            ];
        }

        return $result;
    }

    public function saveWOSPublications(array $papers, string $userId): void
    {
        foreach ($papers as $paper) {$existingPaper = Paper::where('paper_name', $paper['title'])->first();
            if ($existingPaper === null) {
                $paperModel = new Paper;
                $paperModel->paper_name = $paper['title'];
                $paperModel->paper_type = json_encode($paper['types'][0]); // convert to JSON for get array
                $paperModel->paper_subtype = json_encode($paper['sourceTypes'][0]);
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

                $source = Source_data::findOrFail(1);
                $paperModel->source()->sync($source);

                $authorsArray = $paper['names']['authors'];
                $authorCount = count($authorsArray);
                $authors = array_map(function($author) {
                    $parts = explode(', ', $author, 2);
                    return [
                        'fname' => $parts[1] ?? '',
                        'lname' => $parts[0] ?? ''
                    ];
                }, $authorsArray);

                foreach ($authorsArray as $index => $author) {
                    $authorModel = Author::firstOrCreate(
                        ['full_name' => $author['displayName']],
                        ['standard_name' => $author['wosStandard']]
                    );

                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);
                    $paperModel->authors()->attach($authorModel, ['role' => $authorType]);
                }
            } else {
                $user = User::findOrFail($userId);
                if (!$user->papers()->where('paper_id', $existingPaper->id)->exists()) {
                    $author = Author::where([
                        ['full_name', '=', $user->fname_en . ' ' . $user->lname_en],
                        ['paper_id', '=', $existingPaper->id]
                    ])->first();

                    if ($author) {
                        $existingPaper->authors()->detach($author->id);
                    }

                    $existingPaper->teachers()->attach($user->id);
                }
            }
        }
    }
}

$wos = new WosAPIService('4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3');
$jsonData = json_encode($wos->getResearcherPublications('Kokaew Urachart'));
print_r(json_decode($jsonData, true));


