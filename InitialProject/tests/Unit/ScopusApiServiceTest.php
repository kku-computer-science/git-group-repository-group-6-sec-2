<?php

use App\Services\ScopusApiService;
use GuzzleHttp\Client;
use GuzzleHttp\Handler\MockHandler;
use GuzzleHttp\HandlerStack;
use GuzzleHttp\Psr7\Response;
use PHPUnit\Framework\TestCase;

class ScopusApiServiceTest extends TestCase
{
    public function testSearchArticlesReturnsMockedResponse()
    {
        // สร้าง Mock Response
        $mock = new MockHandler([
            new Response(200, [], json_encode([
                'search-results' => [
                    'entry' => [['title' => 'Mocked Research Paper']]
                ]
            ]))
        ]);

        // สร้าง Client โดยใช้ MockHandler
        $handlerStack = HandlerStack::create($mock);
        $client = new Client(['handler' => $handlerStack]);

        // Mock API Key
        $apiKey = 'mock-api-key';

        // สร้าง Service Instance
        $service = new ScopusApiService($client, $apiKey);

        // เรียกใช้งานเมธอดและตรวจสอบผลลัพธ์
        $result = $service->searchArticles('AI Research');

        $this->assertArrayHasKey('search-results', $result);
        $this->assertEquals('Mocked Research Paper', $result['search-results']['entry'][0]['title']);
    }
}
