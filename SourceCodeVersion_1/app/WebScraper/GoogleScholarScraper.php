<?php
 namespace WebScraper;

 require /** @lang text */
 'vendor/autoload.php';

 use DOMDocument;
 use DOMNode;
 use DOMXPath;
 use Exception;
 use GuzzleHttp\Client;
 use GuzzleHttp\Exception\GuzzleException;
 use InvalidArgumentException;

 class GoogleScholarScraper
 {
     private const BASE_URL = 'https://scholar.google.com';
     private const SEARCH_PATH = '/scholar?hl=en&as_sdt=0%2C5&q=';

     private const XPATH = [
         'title' => '//div[@id="gsc_oci_title"]',
         'field' => '//div[@class="gsc_oci_field"]',
         'value' => '//div[@class="gsc_oci_field"]/following-sibling::div[@class="gsc_oci_value"]',
         'profile_link' => '//h4[@class="gs_rt2"]/a',
         'publication_links' => "//table[@id='gsc_a_t']//td[@class='gsc_a_t']/a",
         'show_more_button' => '//button[@id="gsc_bpf_more"]',
     ];

     private const FIELD_AUTHORS = 'authors';
     private const FIELD_CITATIONS = 'total_citations';

     private Client $client;
     private int $minDelay;
     private int $maxDelay;

     public function __construct(Client $client, int $minDelay = 5, int $maxDelay = 8)
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
     public function search(string $query): array
     {
         $url = self::BASE_URL . self::SEARCH_PATH . urlencode($query);
         $html = $this->fetchHtml($url);
         $this->delay();
         $profileLink = $this->getProfileLink($html);
         $publications = $this->getPublicationLinks($profileLink);
         return $this->getResearcherPublications($publications);
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
         return $profileLink ? self::BASE_URL . $profileLink->getAttribute('href') : null;
     }

     /**
      * Gets publication links from a researcher's profile page, handling pagination.
      * @param string $url The initial profile URL.
      * @return array An array of publication links.
      * @throws Exception
      */
     public function getPublicationLinks(string $url): array
     {
         $allLinks = [];
         $startPage = 0;
         $pageSize = 100;
         $i = 0;

         do {
             $i++;
             print_r("Page: $i\n");
             $paginatedUrl = $url . "&cstart=$startPage&pagesize=$pageSize";
             $html = $this->fetchHtml($paginatedUrl);
             $dom = $this->createDomDocument($html);
             $xpath = new DOMXPath($dom);

             $rows = $xpath->query(self::XPATH['publication_links']);
             foreach ($rows as $row) {
                 $allLinks[] = self::BASE_URL . $row->getAttribute('href');
             }

             $showMoreButton = $xpath->query(self::XPATH['show_more_button'])->item(0);
             $isDisabled = !$showMoreButton || $showMoreButton->hasAttribute('disabled');

             $startPage += $pageSize;

             $dom = null;
             $this->delay();
         } while (!$isDisabled);

         return $allLinks;
     }

     /**
      * @throws Exception
      */
     public function getPublicationDetail(string $url): array
     {
         $html = $this->fetchHtml($url);
         $dom = $this->createDomDocument($html);
         $xpath = new DOMXPath($dom);

         $research = $this->extractTitleAndLink($xpath);
         $research = array_merge($research, $this->extractOtherFields($xpath));
         $dom = null;
         return $research;
     }

     private function createDomDocument(string $html): DOMDocument
     {
         $dom = new DOMDocument();
         libxml_use_internal_errors(true);
         $dom->loadHTML($html);
         libxml_clear_errors();
         return $dom;
     }

     private function extractTitleAndLink(DOMXPath $xpath): array
     {
         $research = ['title' => '', 'link' => ''];
         $titleElement = $xpath->query(self::XPATH['title'])->item(0);
         if ($titleElement) {
             $linkElement = $xpath->query('.//a', $titleElement)->item(0);
             if ($linkElement) {
                 $research['title'] = trim($linkElement->textContent);
                 $research['link'] = $linkElement->getAttribute('href');
             } else {
                 $research['title'] = trim($titleElement->textContent);
             }
         }
         return $research;
     }

     private function extractOtherFields(DOMXPath $xpath): array
     {
         $research = [];
         $fields = $xpath->query(self::XPATH['field']);
         $values = $xpath->query(self::XPATH['value']);

         foreach ($fields as $index => $field) {
             $key = $this->normalizeFieldName(trim($field->textContent));
             $valueNode = $values->item($index);

             if (!$valueNode) {
                 $research[$key] = "";
                 continue;
             }
             $value = $this->extractFieldValue($key, $valueNode);
             $research[$key] = $value;
         }

         return $research;
     }

     private function normalizeFieldName(string $fieldName): string
     {
         return strtolower(str_replace(" ", "_", $fieldName));
     }

     private function extractFieldValue(string $key, DOMNode $valueNode): string|array|int
     {
         if ($key === self::FIELD_CITATIONS) {
             return $this->extractCitations($valueNode);
         } elseif ($key === self::FIELD_AUTHORS) {
             return $this->extractAuthors($valueNode);
         }
         return trim($valueNode->textContent);
     }

     private function extractCitations(DOMNode $valueNode): int
     {
         $link = $valueNode->getElementsByTagName('a')->item(0);
         if ($link) {
             $citationsText = trim($link->textContent);
             return (int) preg_replace('/[^0-9]/', '', $citationsText);
         }
         return 0;
     }

     private function extractAuthors(DOMNode $valueNode): array
     {
         return array_map('trim', explode(",", $valueNode->textContent));
     }

     /**
      * @throws Exception
      */
     private function getResearcherPublications(array $links): array
     {
         $publications = [];
         foreach ($links as $link) {
             $publications[] = $this->getPublicationDetail($link);
             $this->delay();
         }
         return $publications;
     }
 }


 //Usage example:
// $client = new Client(['timeout' => 10, 'verify' => false]);
// $scraper = new GoogleScholarScraper($client);
// try {
//     $results = $scraper->search("Pusadee Seresangtakul");
//     file_put_contents('results.json', json_encode($results, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
// } catch (Exception | InvalidArgumentException $e) {
//     echo "Error: " . $e->getMessage() . "\n";
// }
