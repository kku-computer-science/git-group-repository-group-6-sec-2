<?php

namespace Http\Controllers;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\File;

class WosApiController extends Controller
{
    public function getResearcherData($id): JsonResponse
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
                    'limit' => 10,
                    'page' => 1,
                ],
            ]);

            $data = json_decode($response->getBody()->getContents(), true);
            File::put(storage_path('app/public/researcher_data.json'), json_encode($data, JSON_PRETTY_PRINT));

            return response()->json($data);

        } catch (\Exception $e) {
            return response()->json(['error' => 'Unable to fetch data from WOS'], 500);
        }
    }
}
