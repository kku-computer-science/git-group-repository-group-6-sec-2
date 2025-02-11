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

    public function insertData(array $papers): void
    {
        foreach ($papers as $paper) {
            $paperModel = new Paper;
            $paperModel->paper_name = $paper['title'];
            $paperModel->paper_type = json_encode($paper['types'][0]); // convert to JSON for get array
            $paperModel->paper_subtype = json_encode($paper['sourceTypes'][0]);
            $paperModel->paper_sourcetitle = $paper['source']['sourceTitle'] ?? null;
            $paperModel->paper_url = $paper['links']['record'] ?? null;
            $paperModel->paper_yearpub = $paper['source']['publishYear'] ?? null;
            'paper_volume',
            'paper_issue',
            'paper_citation',
            $paperModel->paper_page = $paper['source']['pages']['count'] ?? null;
            'paper_doi',
            'paper_funder',
            'patent_date',
            'abstract',
            $paperModel->keyword = json_encode($paper['keywords']['authorKeywords'] ?? []);
            'publication'

            $paperModel->save();

            // ดึงแหล่งที่มา (Source_data) แล้วเชื่อมความสัมพันธ์
            $source = Source_data::findOrFail(1);
            $paperModel->source()->sync($source);

            // ดึงรายชื่อผู้แต่ง
            $totalAuthors = count($paper['names']['authors']);
            foreach ($paper['names']['authors'] as $index => $author) {
                $authorModel = Author::firstOrCreate(
                    ['full_name' => $author['displayName']],
                    ['standard_name' => $author['wosStandard']]
                );

                // กำหนดบทบาทผู้แต่ง
                if ($index === 0) {
                    $role = 1; // First Author
                } elseif ($index === $totalAuthors - 1) {
                    $role = 2; // Last Author
                } else {
                    $role = 3; // Middle Author
                }

                $paperModel->authors()->attach($authorModel, ['role' => $role]);
            }
        }
    }
}

$wos = new WosAPIService('4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3');
$jsonData = json_encode($wos->getResearcherPublications('Kokaew Urachart'));
print_r($wos->extractPuclicationsData($jsonData));


