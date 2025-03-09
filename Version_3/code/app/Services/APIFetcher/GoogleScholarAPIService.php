<?php
namespace App\Services\APIFetcher;

use App\Models\User_Cited_Year;
use App\Models\UserCited_year;
use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use Exception;
use GoogleSearchResults;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class GoogleScholarAPIService {
    private string $apiKey;

    public function __construct(string $apiKey) {
        $this->apiKey = $apiKey;
    }

    public function getResearcherPublications(string $idAuthorScholar): array {
        try {
            $search = new GoogleSearchResults($this->apiKey);
            $query = [
                "engine" => "google_scholar_author",
                "author_id" => $idAuthorScholar,
                "hl" => "en",
                "num" => "100",
            ];

            $result = $search->get_json($query);
            return $this->extractRelevantData(json_decode(json_encode($result), true));
        } catch (Exception $e) {
            error_log("Error while fetching Google Scholar publication: " . $e->getMessage());
            return [
                'status' => 'error',
                'code' => $e->getCode(),
                'message' => $e->getMessage()
            ];

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
                'year' => $article['year'] ?? null,
                'source' => 'Google Scholar',
            ];
        }

        return [
            'author_name' => $authorName,
            'interests' => $interests,
            'articles' => $filteredArticles,
            'graph' => $data['cited_by']['graph'] ?? [],
        ];
    }

    /**
     * @throws Exception
     */
    public function saveGoogleScholarPublications(array $data, string $userId): void
    {
        $insertData = [];

        foreach ($data['graph'] as $item) {
            $insertData[] = [
                'cited_year' => $item['year'],
                'cited_count' => $item['citations'],
                'user_id' => $userId,
            ];
        }

        // ใช้ Bulk Insert ลด Query หลายรอบ
        User_Cited_Year::insert($insertData);

        foreach ($data['articles'] as $article) {
            // ใช้ transaction เพื่อให้การบันทึกข้อมูลเป็น atomic operation
            DB::beginTransaction();
            try {
                // ทำความสะอาดข้อมูลพื้นฐาน
                $title = strtolower(trim($article['title']));
                $doi = !empty($article['doi']) ? strtolower(trim($article['doi'])) : null;
                $paper = null;

                // 🔍 1. ค้นหาด้วย DOI (Exact Match)
                if ($doi) {
                    $paper = Paper::whereRaw('LOWER(paper_doi) = ?', [$doi])->first();
                }
                else{
                    // ถ้าไม่มี DOI ให้ค้นหาด้วยชื่อเรื่อง
                    $paper = Paper::whereRaw('LOWER(paper_name) = ?', [$title])->first();
                }

                // 🔍 2. ถ้าไม่เจอด้วย DOI ให้ค้นหาด้วย ใช้ similar text
                if(!$paper){
                    $papers = Paper::all(); //  Get all papers for comparison
                    foreach ($papers as $existingPaper) {
                        $existingTitle = strtolower(trim($existingPaper->paper_name));
                        similar_text($title, $existingTitle, $percent); // Calculate similarity
                        if ($percent > 79) {
                            $paper = $existingPaper;  //  Consider it the same paper
                            break; // Exit the loop once a match is found
                        }
                    }
                }

                if (!$paper) {
                    // 🆕 สร้าง Paper ใหม่
                    $paper = new Paper();
                    $paper->paper_name = trim($article['title']);
                    $paper->paper_doi = $doi;
                    $paper->paper_url = !empty($article['link']) ? trim($article['link']) : null;
                    $paper->paper_citation = isset($article['cited_by']) ? (int)$article['cited_by'] : 0;
                    $paper->paper_yearpub = !empty($article['year']) ? (int)$article['year'] : null;
                    $paper->paper_sourcetitle = !empty($article['publication']) ? trim($article['publication']) : null;
                    $paper->save();

                    // กำหนดความสัมพันธ์กับ Source (ในที่นี้ใช้ Source_data id 4)
                    $source = Source_data::findOrFail(4);
                    $paper->source()->sync([$source->id]);

                    $paper->cited_year();
                } else {
                    // 🔄 อัปเดตจำนวน Citation หากข้อมูลใหม่มีค่าสูงกว่า
                    if ($paper->paper_citation < (int)$article['cited_by']) {
                        $paper->update(['paper_citation' => (int)$article['cited_by']]);
                    }
                }

                // --- จัดการข้อมูลผู้แต่ง (Authors) ---
                // แยกชื่อผู้แต่งด้วยเครื่องหมายจุลภาค และทำความสะอาดข้อมูล
                $authorsArray = array_filter(array_map('trim', explode(',', $article['authors'])));
                $authors = [];
                foreach ($authorsArray as $author) {
                    $parts = explode(' ', $author, 2);
                    if (count($parts) < 2) {
                        $parts[] = ''; // ให้แน่ใจว่ามีทั้ง fname และ lname
                    }
                    $authors[] = [
                        'fname' => $parts[0],
                        'lname' => $parts[1]
                    ];
                }

                $authorCount = count($authors);
                foreach ($authors as $index => $authorData) {
                    // ค้นหา User ที่ตรงกันจากฐานข้อมูล (ตรวจสอบทั้งชื่อเต็มและตัวย่อ)
                    $foundUser = User::where(function ($query) use ($authorData) {
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

                    // กำหนด author type: คนแรก=1, คนสุดท้าย=3, คนกลาง=2
                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($foundUser) {
                        // ผูก Paper กับ teacher (User) โดยไม่ลบความสัมพันธ์ที่มีอยู่แล้ว
                        $paper->teacher()->syncWithoutDetaching([$foundUser->id => ['author_type' => $authorType]]);
                    } else {
                        $authorModel = Author::where('author_lname', $authorData['lname'])
                            ->first();
                        if(!$authorModel) {
                            $authorModel = new Author();
                            $authorModel->author_fname = $authorData['fname'];
                            $authorModel->author_lname = $authorData['lname'];
                            $authorModel->save();
                        }
                        elseif (strlen($authorModel->author_fname) < strlen($authorData['fname'])) {
                            $authorModel->update(['author_fname' => $authorData['lname']]);
                        }

                        $paper->author()->syncWithoutDetaching([$authorModel->id => ['author_type' => $authorType]]);
                    }
                }

                // ผูก Paper กับผู้ใช้ที่ส่งคำขอ (ถ้ายังไม่มีความสัมพันธ์)
                $currentUser = User::findOrFail($userId);
                if (!$paper->teacher->contains($currentUser->id)) {
                    $paper->teacher()->syncWithoutDetaching([$currentUser->id]);
                }

                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
                // สามารถ log error เพิ่มเติมได้ที่นี่
                throw $e;
            }
        }
    }

    public function getIdAuthorScholar(string $authorName): ?string
    {
        $names = explode(" ", trim($authorName));
        $fname = $names[0] ?? '';
        $lname = $names[1] ?? '';

        $user = User::where('fname_en', $fname)
            ->where('lname_en', $lname)
            ->first();

        if ($user && !empty($user->user_scholar_id)) {
            Log::info("User scholar id already exists: " . $user->user_scholar_id);
            return $user->user_scholar_id;
        }
        try {
            $client = new Client();
            $url = "https://www.searchapi.io/api/v1/search";
            $params = [
                "engine" => "google_scholar_profiles",
                "mauthors" => $authorName,
                "api_key" => "TR95VohGTEDPRFEkGb78cKk8"
            ];

            $response = $client->request('GET', $url, ['query' => $params]);
            $data = json_decode($response->getBody(), true);
            foreach ($data['profiles'] ?? [] as $profile) {
                if (isset($profile['author_id']) && stripos($profile['name'], $authorName) !== false) {
                    $this->saveAuthorScholarId($profile['author_id'], $authorName);
                    return $profile['author_id'];
                }
            }
        } catch (GuzzleException $e) {
            Log::error("Error while fetching Google Scholar publication: " . $e->getMessage());
            return null;
        }
        return null;
    }

    private function saveAuthorScholarId($userScholarId, string $authorName): void
    {
        $names = explode(" ", trim($authorName));
        $fname = $names[0] ?? '';
        $lname = $names[1] ?? '';

        $user = User::where('fname_en', $fname)
            ->where('lname_en', $lname)
            ->first();

        if ($user && empty($user->user_scholar_id)) {
            $user->user_scholar_id = $userScholarId;
            if (!$user->save()) {
                Log::error("Failed to update user_scholar_id for user: " . $user->id);
            }
        }
    }

    public function extractDataToObject(array $papers): array
    {
        $extractedData = [];
        foreach ($papers['articles'] as $paper) {
            $paperm = new Paper();
            $paperm->paper_name = trim($paper['title']);
            $paperm->paper_url = !empty($paper['link']) ? trim($paper['link']) : null;
            $paperm->paper_citation = isset($paper['cited_by']) ? (int)$paper['cited_by'] : 0;
            $paperm->paper_yearpub = !empty($paper['year']) ? (int)$paper['year'] : null;
            $paperm->paper_sourcetitle = !empty($paper['publication']) ? trim($paper['publication']) : null;
            $extractedData[] = $paperm;
        }
        return $extractedData;
    }

}


