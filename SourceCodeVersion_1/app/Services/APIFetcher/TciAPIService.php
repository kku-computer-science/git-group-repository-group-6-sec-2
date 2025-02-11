<?php

namespace App\Services\APIFetcher;

use Exception;

class TciFetcher
{
    private static function fetchData(string $url, array $payload = null, bool $isPost = false): ?array
    {
        $headers = [
            "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
            "Content-Type: application/x-www-form-urlencoded",
            "Referer: https://search.tci-thailand.org/advance_search.html"
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Temporary SSL ignore
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); // Temporary SSL ignore

        if ($isPost && $payload) {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload));
        }

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode !== 200) {
            throw new Exception("HTTP Error: Status Code $httpCode");
        }

        return json_decode($response, true);
    }

    public static function getArticles(string $keyword, string $criteria = "author", int $curPage = 1, int $pageSize = 100, string $yearFilter = "", string $countryFilter = "", int $yearNum = 30): array
    {
        $url = 'https://search.tci-thailand.org/php/search/advance_search.php';
        $payload = [
            "keyword[]" => $keyword,
            "criteria[]" => $criteria,
            "perform_advance_search" => "true",
            "cur_page" => $curPage,
            "page_size" => $pageSize,
            "year_filter[]" => $yearFilter,
            "country_filter" => $countryFilter,
            "get_all_article_id" => "true",
            "year_num" => $yearNum
        ];

        $data = self::fetchData($url, $payload, true);
        return $data['article_ids'] ?? [];
    }

    public static function getAllAuthorsName(int $articleId): ?array
    {
        $url = "https://search.tci-thailand.org/php/search/author_info.php?article_id=$articleId";
        return self::fetchData($url);
    }

    public static function getArticleInfo(int $articleId, string $keyword): ?array
    {
        $url = "https://search.tci-thailand.org/php/search/search_result.php?get_article_info=true&article_id=$articleId&advance_search%5B%5D=" . urlencode($keyword);
        return self::fetchData($url);
    }
}

// Example Usage
// try {
//     $profName = "S. Tintanai";
//     $articles = TciFetcher::getArticles($profName);

//     foreach ($articles as $articleId) {
//         $articleInfo = TciFetcher::getArticleInfo($articleId, $profName);
//         print_r(TciFetcher::getAllAuthorsName($articleId));
//         print_r($articleInfo);
//     }
// } catch (Exception $e) {
//     echo "Error: " . $e->getMessage();
// }

?>
