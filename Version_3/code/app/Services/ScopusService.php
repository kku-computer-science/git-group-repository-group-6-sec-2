<?php

namespace App\Services;
require 'vendor/autoload.php';

use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Exception\RequestException;

class ScopusService
{
    protected Client $client;
    protected $apiKey;

    public function __construct(Client $client)
    {
        $this->client = $client;
        $this->apiKey = '6ab3c2a01c29f0e36b00c8fa1d013f83';
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
        } catch (GuzzleException $e) {
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

$sc = new ScopusService(new Client());
$data = $sc->searchByAuthor('Horata', 'Punyaphol');
print_r($data);

