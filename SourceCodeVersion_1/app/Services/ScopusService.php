<?php

namespace App\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

class ScopusService
{
    protected $client;
    protected $apiKey;

    public function __construct(Client $client)
    {
        $this->client = $client;
        $this->apiKey = config('services.scopus.api_key');
    }

    public function searchByAuthor($lastName, $firstInitial)
    {
        $query = "AUTHOR-NAME($lastName,$firstInitial)";
        $url = "https://api.elsevier.com/content/search/scopus";

        try {
            $response = $this->client->get($url, [
                'query' => [
                    'query' => $query,
                    'apikey' => $this->apiKey,
                    'httpAccept' => 'application/json',
                ]
            ]);

            return json_decode($response->getBody(), true);
        } catch (RequestException $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function fetchAbstractByScopusId($scopusId)
    {
        $url = "https://api.elsevier.com/content/abstract/scopus_id/{$scopusId}";

        try {
            $response = $this->client->get($url, [
                'query' => [
                    'filed' => 'authors',
                    'apikey' => $this->apiKey,
                    'httpAccept' => 'application/json',
                ]
            ]);

            return json_decode($response->getBody(), true);
        } catch (RequestException $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
