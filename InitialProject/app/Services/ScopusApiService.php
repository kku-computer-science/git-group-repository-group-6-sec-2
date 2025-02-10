<?php

namespace App\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

class ScopusApiService
{
    private Client $client;
    private string $apiKey;

    public function __construct(Client $client, string $apiKey)
    {
        $this->client = $client;
        $this->apiKey = $apiKey;
    }

    public function searchArticles(string $query): array
    {
        try {
            $response = $this->client->request('GET', 'https://api.elsevier.com/content/search/scopus', [
                'query' => ['query' => $query],
                'headers' => ['X-ELS-APIKey' => $this->apiKey]
            ]);

            return json_decode($response->getBody()->getContents(), true);
        } catch (RequestException $e) {
            return ['error' => 'API request failed'];
        }
    }
}
