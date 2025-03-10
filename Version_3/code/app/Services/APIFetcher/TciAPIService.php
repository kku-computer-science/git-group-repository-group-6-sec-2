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
        curl_setopt($ch, CURLOPT_ENCODING, ""); // รองรับ gzip, deflate และ encoding อื่นๆ

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

        // ปรับการแสดงผลภาษาไทย
        $response = mb_convert_encoding($response, 'UTF-8');

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

            $authorNames = array_map(fn($author) => $author['name_loc'], $authors ?? []);
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
        foreach ($papers['articles'] as $paper) {
            DB::transaction(function () use ($paper, $userId) {
                // ทำความสะอาดข้อมูลพื้นฐาน
                $title = strtolower(trim($paper['article_eng']));
                $doi = !empty($paper['doi']) ? strtolower(trim($paper['doi'])) : null;

                // 🔍 1. ค้นหาด้วย DOI (Exact Match)
                if ($doi) {
                    $paperModel = Paper::whereRaw('LOWER(paper_doi) = ?', [$doi])->first();
                }
                else{
                    // ถ้าไม่มี DOI ให้ค้นหาด้วยชื่อเรื่อง
                    $paperModel = Paper::whereRaw('LOWER(paper_name) = ?', [$title])->first();
                }

                // 🔍 2. ถ้าไม่เจอด้วย DOI, ใช้ Full-Text Search
                if(!$paperModel) {
                    $papers = Paper::all(); //  Get all papers for comparison
                    foreach ($papers as $existingPaper) {
                        $existingTitle = strtolower(trim($existingPaper->paper_name));
                        similar_text($title, $existingTitle, $percent); // Calculate similarity

                        if ($percent > 90) {
                            $paperModel = $existingPaper;  //  Consider it the same paper
                            break; // Exit the loop once a match is found
                        }
                    }
                }

                if (!$paperModel) {
                    // 🆕 สร้าง Paper ใหม่
                    $paperModel = new Paper();
                    $paperModel->paper_name = trim($paper['article_eng']);
                    $paperModel->paper_doi = $doi;
                    $paperModel->paper_type = !empty($paper['document_type']) ? $paper['document_type'] : null;
                    $paperModel->paper_sourcetitle = !empty($paper['journal_eng']) ? $paper['journal_eng'] : null;
                    $paperModel->paper_yearpub = !empty($paper['year']) ? (int)$paper['year'] : null;
                    $paperModel->paper_volume = !empty($paper['volume']) ? (int)$paper['volume'] : null;
                    $paperModel->paper_citation = !empty($paper['cited']) ? (int)$paper['cited'] : 0;
                    $paperModel->paper_page = !empty($paper['page_number']) ? $paper['page_number'] : null;
                    $paperModel->save();

                    // เชื่อมโยงกับ Source_data (ในที่นี้ใช้ source id 3)
                    $source = Source_data::findOrFail(3);
                    $paperModel->source()->sync([$source->id]);
                } else {
                    // 🔄 อัปเดต Citation หากข้อมูลใหม่มีค่าสูงกว่า
                    if ($paperModel->paper_citation < (int)$paper['cited']) {
                        $paperModel->update(['paper_citation' => (int)$paper['cited']]);
                    }
                }

                // 🔗 เชื่อมโยง Authors
                $authorsArray = array_filter(explode(', ', $paper['authors']));
                $authors = array_map(function ($author) {
                    $parts = explode(' ', $author, 2);
                    if (count($parts) < 2) {
                        // กรณีมีชื่อเดียว (เช่น "Einstein") ให้เติมค่าว่างในส่วนนามสกุล
                        $parts = [$parts[0] ?? '', ''];
                    }
                    return [
                        'fname' => $parts[0],
                        'lname' => $parts[1]
                    ];
                }, $authorsArray);

                $authorCount = count($authors);
                foreach ($authors as $index => $authorData) {
                    // ค้นหา User โดยตรวจสอบทั้งชื่อเต็มและตัวย่อ
                    $user = User::where(function ($query) use ($authorData) {
                        $query->where([
                            ['fname_en', '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                            ->orWhere(function ($query) use ($authorData) {
                                $query->where(DB::raw("concat(left(fname_en,1),'.')"), '=', $authorData['fname'])
                                    ->where('lname_en', '=', $authorData['lname']);
                            })
                            ->orWhere(function ($query) use ($authorData) {
                                $query->where(DB::raw("left(fname_en,1)"), '=', $authorData['fname'])
                                    ->where('lname_en', '=', $authorData['lname']);
                            });
                    })->first();

                    // กำหนด author type: คนแรก = 1, คนสุดท้าย = 3, คนกลาง = 2
                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($user) {
                        // เชื่อมโยงกับ teacher (User) โดยใช้ syncWithoutDetaching เพื่อป้องกันความซ้ำ
                        $paperModel->teacher()->syncWithoutDetaching([$user->id => ['author_type' => $authorType]]);
                    } else {
                        $authorModel = Author::where([
                            ['author_fname', '=', $authorData['fname']],
                            ['author_lname', '=', $authorData['lname']]
                        ])->first();

                        if(!$authorModel) {
                            $authorModel = new Author();
                            $authorModel->author_fname = $authorData['fname'];
                            $authorModel->author_lname = $authorData['lname'];
                            $authorModel->save();
                        }

                        $paperModel->author()->syncWithoutDetaching([$authorModel->id => ['author_type' => $authorType]]);
                    }
                }

                // 🔗 เชื่อมโยง Paper กับ User (Owner) โดยใช้ syncWithoutDetaching
                $currentUser = User::findOrFail($userId);
                if (!$paperModel->teacher->contains($currentUser->id)) {
                    $paperModel->teacher()->syncWithoutDetaching([$currentUser->id]);
                }
            });
        }
    }

    public static function extractDataToObject(array $papers): array
    {
        $extractedData = [];
        foreach ($papers['articles'] as $paper) {
            $paperModel = new Paper();
            $paperModel->paper_name = trim($paper['article_eng']);
            $paperModel->paper_doi = !empty($paper['doi']) ? strtolower(trim($paper['doi'])) : null;
            $paperModel->paper_type = !empty($paper['document_type']) ? $paper['document_type'] : null;
            $paperModel->paper_sourcetitle = !empty($paper['journal_eng']) ? $paper['journal_eng'] : null;
            $paperModel->paper_yearpub = !empty($paper['year']) ? (int)$paper['year'] : null;
            $paperModel->paper_volume = !empty($paper['volume']) ? (int)$paper['volume'] : null;
            $paperModel->paper_citation = !empty($paper['cited']) ? (int)$paper['cited'] : 0;
            $paperModel->paper_page = !empty($paper['page_number']) ? $paper['page_number'] : null;
            $paperModel->publication = null;
            $paperModel->keyword = null;
            $paperModel->abstract = null;
            $paperModel->paper_funder = null;
            $paperModel->paper_issue = null;
            $paperModel->paper_subtype = null;
            $paperModel->paper_url = null;


            $extractedData[] = $paperModel;

        }
        return $extractedData;

    }
}
