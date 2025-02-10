<?php

namespace Tests\Unit;

use App\Services\ScopusService;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Response;
use Mockery;
use Tests\TestCase;

class ScopusServiceTest extends TestCase
{
    public function testSearchByAuthor()
    {
        $mockClient = Mockery::mock(Client::class);
        $mockResponse = new Response(200, [], json_encode([
            'search-results' => [
                'entry' => [
                    [
                        'dc:title' => 'Sample Research Paper',
                        'prism:url' => 'https://example.com/research',
                        'prism:publicationName' => 'Science Journal',
                        'prism:volume' => '10',
                        'prism:issueIdentifier' => '2',
                        'prism:pageRange' => '15-20',
                        'prism:coverDate' => '2023',
                        'prism:doi' => '10.1234/example.doi',
                        'citedby-count' => '5',
                        'prism:aggregationType' => 'Journal',
                        'subtypeDescription' => 'Review',
                        'dc:identifier' => 'SCOPUS_ID:85100800224',
                    ]
                ]
            ]
        ]));

        $mockClient->shouldReceive('get')
            ->once()
            ->andReturn($mockResponse);

        $service = new ScopusService($mockClient);
        $result = $service->searchByAuthor('Seresangtakul', 'P');

        $this->assertEquals('Sample Research Paper', $result['search-results']['entry'][0]['dc:title']);
    }

    public function testFetchAbstractByScopusId()
    {
        $mockClient = Mockery::mock(Client::class);
        $mockResponse = new Response(200, [], json_encode([
            'abstracts-retrieval-response' => [
                'coredata' => [
                    'dc:title' => 'Another Research Paper',
                ],
                'authors' => [
                    'author' => [
                        ['name' => 'John Doe'],
                    ]
                ],
                'keywords' => [
                    'keyword' => ['Machine Learning', 'AI'],
                ],
                'funders' => [
                    'funder' => ['NSF'],
                ],
            ]
        ]));

        $mockClient->shouldReceive('get')
            ->once()
            ->andReturn($mockResponse);

        $service = new ScopusService($mockClient);
        $result = $service->fetchAbstractByScopusId('85100800224');

        $this->assertEquals('Another Research Paper', $result['abstracts-retrieval-response']['coredata']['dc:title']);
        $this->assertContains('Machine Learning', $result['abstracts-retrieval-response']['keywords']['keyword']);
    }
}
