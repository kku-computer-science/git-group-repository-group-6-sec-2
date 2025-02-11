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

    public static function extractRelevantData(string $profName): array
    {
        $articles = self::getArticles($profName);
        $formattedArticles = [];
        $i=0;
        foreach ($articles as $articleId) {
            $articleInfo = self::getArticleInfo($articleId, $profName);
            $authors = self::getAllAuthorsName($articleId);

            $authorNames = array_map(fn($author) => $author['name'], $authors ?? []);
            $articleInfo['authors'] = implode(', ', $authorNames);

            if ($articleInfo[$i]['document_type_id'] == 1) {
                $articleInfo[$i]['document_type'] = 'Journal';
            }

            $formattedArticles[] = [
                'authors' => $articleInfo['authors'] ?? '',
                'article_loc' => $articleInfo[$i]['article_loc'] ?? 'Unknown Title', // Title in Thai (empty in the response)
                'article_eng' => $articleInfo[$i]['article_eng'] ?? 'Unknown Title', // Fallback to title_eng
                'journal_loc' => $articleInfo[$i]['journal_loc'] ?? '', // Journal in Thai (empty in the response)
                'journal_eng' => $articleInfo[$i]['journal_eng'] ?? '', // Journal in English
                'volume' => $articleInfo[$i]['volume'] ?? 'N/A', // Volume number
                'page_number' => $articleInfo[$i]['page_number'] ?? 'N/A', // Page numbers
                'year' => $articleInfo[$i]['year'] ?? 'Unknown Year', // Year of publication
                'cited' => $articleInfo[$i]['cited'] ?? 0, // Number of citations
                'document_type' => $articleInfo[$i]['document_type'] ?? ''
            ];

        // Return the final formatted result
        return [
            'author_name' => $profName,
            'articles' => $formattedArticles
            ];
            $i++;
        }
    }
}

// // Example Usage
// $profName = "Santi t";
// $result = TciFetcher::extractRelevantData($profName);
// echo json_encode($result, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

?>
