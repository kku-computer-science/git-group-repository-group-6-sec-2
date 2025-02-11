<?php

namespace App\Services\APIFetcher;

use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\DB;

class TciAPIService
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

    public static function extractRelevantData(string $researcherName): array
    {
        $articles = self::getArticles($researcherName);
        if (empty($articles)) {
            return [
                'author_name' => $researcherName,
                'articles' => []
            ];
        }

        $formattedArticles = [];
        foreach ($articles as $articleId) {
            $articleInfo = self::getArticleInfo($articleId, $researcherName);
            $authors = self::getAllAuthorsName($articleId);

            // print_r($articleInfo);

            $authorNames = array_map(fn($author) => $author['name'], $authors ?? []);
            $articleInfo['authors'] = implode(', ', $authorNames);

            if ($articleInfo[0]['document_type_id'] == 1) {
                $articleInfo[0]['document_type'] = 'Journal';
            }

            $formattedArticles[] = [
                'authors' => $articleInfo['authors'] ?? '',
                'article_loc' => $articleInfo[0]['article_loc'] ?? 'Unknown Title',
                'article_eng' => $articleInfo[0]['article_eng'] ?? 'Unknown Title',
                'journal_loc' => $articleInfo[0]['journal_loc'] ?? '',
                'journal_eng' => $articleInfo[0]['journal_eng'] ?? '',
                'volume' => $articleInfo[0]['volume'] ?? 'N/A',
                'page_number' => $articleInfo[0]['page_number'] ?? 'N/A',
                'year' => $articleInfo[0]['year'] ?? 'Unknown Year',
                'cited' => $articleInfo[0]['cited'] ?? 0,
                'document_type' => $articleInfo[0]['document_type'] ?? ''
            ];
    }
    return [
        'author_name' => $researcherName,
        'articles' => $formattedArticles
        ];
    }

    public static function saveTCIPublications(array $papers, string $userId): void
    {
        foreach ($papers['articles'] as $paper){
            if(Paper::Where('paper_name', $paper['article_eng'])->first() == null){
                $paperModel = new Paper();
                $paperModel->paper_name = $paper['article_eng'];
                $paperModel->paper_type = $paper['document_type'];
                $paperModel->paper_subtype = $paper['journal_eng'];
                $paperModel->paper_yearpub = $paper['year'];
                $paperModel->paper_volume = $paper['volume'];
                $paperModel->paper_citation = $paper['cited'];
                $paperModel->paper_page = $paper['page_number'];
                $paperModel->save();

                $source = Source_data::findOrFail(3);
                $paperModel->source()->sync($source);

                $authorsArray = explode(', ', $paper['authors']);
                $authors = array_map(function($author) {
                    $parts = explode(' ', $author, 2);
                    return [
                        'fname' => $parts[0] ?? '',
                        'lname' => $parts[1] ?? ''
                    ];
                }, $authorsArray);

                $authorCount = count($authorsArray);
                foreach ($authors as $index => $authorData) {
                    $user = User::where([
                        ['fname_en', '=', $authorData['fname']],
                        ['lname_en', '=', $authorData['lname']]
                    ])
                        ->orWhere([
                            [DB::raw("concat(left(fname_en,1),'.')"), '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                        ->orWhere([
                            [DB::raw("left(fname_en,1)"), '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                        ->first();

                    /* Author_type (1 = first, 2 = middle, 3 = last) */
                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($user) {
                        $paperModel->teacher()->attach($user, ['author_type' => $authorType]);
                    } else {
                        $author = TciAPIService::findOrCreateAuthor($authorData['fname'], $authorData['lname']);
                        $paperModel->author()->attach($author, ['author_type' => $authorType]);
                    }
                }

            }
            else{
                $findPaper = Paper::where('paper_name', $paper['article_eng'])->firstOrFail();
                $user = User::findOrFail($userId);
                if (!$user->paper()->where('paper_id', $findPaper->id)->exists()) {
                    $author = Author::where([
                        ['author_fname', $user->fname_en],
                        ['author_lname', $user->lname_en]
                    ])->first();
                    if ($author) {
                        $findPaper->authors()->detach($author->id);
                    }
                    $findPaper->teacher()->attach($user->id);
                }
            }

        }
    }

    private static function findOrCreateAuthor($fname, $lname) {
        return Author::firstOrCreate(
            ['author_fname' => $fname, 'author_lname' => $lname],
            ['author_fname' => $fname, 'author_lname' => $lname]
        );
    }
}
