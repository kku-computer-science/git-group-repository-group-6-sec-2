<?php

namespace App\Http\Controllers;
require 'vendor/autoload.php';
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\File;

class WosApiController
{
    public function getResearcherData($id)
    {
        $client = new Client();
        try {
            $response = $client->request('GET', 'https://api.clarivate.com/apis/wos-starter/v1/documents', [
                'headers' => [
                    'X-ApiKey' => '4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3',
                    'Accept' => 'application/json',
                ],
                'query' => [
                    'db' => 'WOS',
                    'q' => 'AU=' . $id,
                    'limit' => 50,
                    'page' => 1,
                ],
            ]);

            //            File::put(storage_path('app/public/researcher_data.json'), json_encode($data, JSON_PRETTY_PRINT));

            return json_decode($response->getBody()->getContents(), true);

        } catch (GuzzleException $e) {
            return ;
        }
    }
}

$wos = new WosApiController();
$data = $wos->getResearcherData('Kokaew Urachart');

print_r($data);
