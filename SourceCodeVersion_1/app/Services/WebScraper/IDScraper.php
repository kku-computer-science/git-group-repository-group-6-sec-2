<?php
namespace App\Services\WebScraper;

require /** @lang text */
'vendor/autoload.php';

use DOMDocument;
use DOMXPath;
use Exception;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use InvalidArgumentException;

class IDScraper
{
    private const BASE_URL = 'https://scholar.google.com';
    private const SEARCH_PATH = '/scholar?hl=en&as_sdt=0%2C5&q=';
    private const XPATH = ['profile_link' => '//h4[@class="gs_rt2"]/a'];
    private Client $client;
    private int $minDelay;
    private int $maxDelay;

    public function __construct(Client $client, int $minDelay = 1, int $maxDelay = 2)
    {
        if ($minDelay < 0 || $maxDelay < 0 || $minDelay > $maxDelay) {
            throw new InvalidArgumentException("Invalid delay values: minDelay and maxDelay must be non-negative, and minDelay must be less than or equal to maxDelay.");
        }
        $this->client = $client;
        $this->minDelay = $minDelay;
        $this->maxDelay = $maxDelay;
    }

    private function getRandomUserAgent(): string
    {
        $userAgents = [
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36',
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0',
            'Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0',
            'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Edge/120.0.0.0 Safari/537.36',
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36'
        ];
        return $userAgents[array_rand($userAgents)];
    }

    /**
     * @throws Exception
     */
    public function search(array $authorNames): array
    {
        $authorScholarId = [];
        foreach ($authorNames as $name) {
            $url = self::BASE_URL . self::SEARCH_PATH . urlencode($name);
            $this->delay();
            $html = $this->fetchHtml($url);
            $profileLink = $this->getProfileLink($html);
            if ($profileLink) {
                $parsedUrl = parse_url($profileLink);
                parse_str($parsedUrl['query'], $queryParams);
                if (isset($queryParams['user'])) {
                    $authorScholarId[] = $queryParams['user'];
                }
            }
        }
        return  $authorScholarId;
    }

    private function delay(): void
    {
        sleep(rand($this->minDelay, $this->maxDelay));
    }

    /**
     * @throws Exception
     */
    private function fetchHtml(string $url): string
    {
        try {
            $response = $this->client->request('GET', $url, [
                'verify' => false,
                'headers' => [
                    'User-Agent' => $this->getRandomUserAgent(),
                    'Accept-Language' => 'en-US,en;q=0.9',
                ]
            ]);
            return $response->getBody()->getContents();
        } catch (GuzzleException $e) {
            throw new Exception("HTTP request failed: " . $e->getMessage(), 0, $e);
        }
    }

    public function getProfileLink(string $html): ?string
    {
        $dom = $this->createDomDocument($html);
        $xpath = new DOMXPath($dom);
        $profileLink = $xpath->query(self::XPATH['profile_link'])->item(0);
        $dom = null;

        if ($profileLink) {
            return self::BASE_URL . $profileLink->getAttribute('href');
        } else {
            return null;
        }
    }
    private function createDomDocument(string $html): DOMDocument
    {
        $dom = new DOMDocument();
        libxml_use_internal_errors(true);
        $dom->loadHTML($html);
        libxml_clear_errors();
        return $dom;
    }
}


// Example usage:
// $client = new Client(['timeout' => 10, 'verify' => false]);
// $scraper = new IDScraper($client);
// $authorNames = array("Pusadee Seresangtakul");
// try {
//     $authorScholarId = $scraper->search($authorNames);
//     print_r($authorScholarId);
// } catch (Exception $e) {
//     echo $e->getMessage();
// }
