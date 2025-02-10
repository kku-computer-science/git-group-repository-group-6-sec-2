<?php
namespace APIFetcher;
use Exception;
use GoogleSearchResults;
use Dotenv\Dotenv;
use GuzzleHttp\Client;
use WebScraper\IDScraper;

require 'app/WebScraper/IDScraper.php';

require /** @lang text */
'vendor/autoload.php';

class GoogleScholarAPI {
    private string $apiKey;
    private string $authorId;

    public function __construct(string $apiKey, string $authorId) {
        $this->apiKey = $apiKey;
        $this->authorId = $authorId;
    }

    public function fetch(): array {
        try {
            $search = new GoogleSearchResults($this->apiKey);
            $query = [
                "engine" => "google_scholar_author",
                "author_id" => $this->authorId,
                "hl" => "en",
                "num" => "100",
            ];

            $result = $search->get_json($query);
            return $this->extractRelevantData(json_decode(json_encode($result), true));
        } catch (Exception $e) {
            error_log("Error fetching data: " . $e->getMessage());
            return [];
        }
    }

    private function extractRelevantData(array $data): array {

        $authorName = $data['author']['name'] ?? 'Unknown Author';

        $interests = array_column($data['author']['interests'] ?? [], 'title');
        $articles = $data['articles'] ?? [];
        $filteredArticles = [];

        foreach ($articles as $article) {
            $filteredArticles[] = [
                'title' => $article['title'] ?? null,
                'link' => $article['link'] ?? null,
                'citation_id' => $article['citation_id'] ?? null,
                'authors' => $article['authors'] ?? null,
                'publication' => $article['publication'] ?? null,
                'cited_by' => $article['cited_by']['value'] ?? 0,
                'year' => $article['year'] ?? null
            ];
        }

        return [
            'author_name' => $authorName,
            'interests' => $interests,
            'articles' => $filteredArticles
        ];
    }
}


//$dotenv = Dotenv::createImmutable(__DIR__);
//$dotenv->load();
//$apiKey = $_ENV['GS_API_KEY'];
//
//$client = new Client(['timeout' => 10, 'verify' => false]);
//$id_scraper = new IDScraper($client);
//$names = array("Ngamnij Arch-int",
//    "Chakchai So-In",
//    "Somjit Arch-int",
//    "Chaiyapon Keeratikasikorn",
//    "Punyaphol Horata",
//    "Sartra Wongthanavasu",
//    "Sirapat Chiewchanwattana",
//    "Khamron Sunat",
//    "Chitsutha Soomlek",
//    "Nagon Watanakij",
//    "Boonsup Waikham",
//    "Paweena Wanchai",
//    "Pipat Reungsang",
//    "Pusadee Seresangtakul",
//    "Monlica Wattana",
//    "Wararat Songpan",
//    "Sunti Tintanai",
//    "Saiyan Saiyod",
//    "Silada Intarasothonchun",
//    "Urachart Kokaew",
//    "Urawan Chanket",
//    "Phet Aimtongkham",
//    "Wachirawut Thamviset",
//    "Warunya Wunnasri",
//    "Rapassit Chinnapatjee",
//    "Sakpod Tongleamnak",
//    "Thanaphon Tangchoopong",
//    "Sarun Apichontrakul",
//    "Rasamee Suwanwerakamtorn",
//    "Chanon Dechsupa",
//    "Praisan Padungweang",
//    "Sumonta Kasemvilas",
//    "Pakarat Musikawan",
//    "Yanika Kongsorot");
//
//try {
//    $authorIdList = $id_scraper->search($names);
//    print_r($authorIdList);
//    foreach ($authorIdList as $authorId) {
//        $fetcher = new GoogleScholarAPI($apiKey, $authorId);
//        $data = $fetcher->fetch();
//        file_put_contents($authorId.'.json', json_encode($data, JSON_PRETTY_PRINT |
//            JSON_UNESCAPED_UNICODE |
//            JSON_UNESCAPED_SLASHES
//        ));
//    }
//} catch (Exception $e) {
//    error_log("Error fetching author ID: " . $e->getMessage());
//    exit(1);
//}
