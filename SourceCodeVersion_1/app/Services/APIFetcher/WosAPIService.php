<?php
namespace App\Services\APIFetcher;

use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Illuminate\Support\Facades\DB;

class WosAPIService
{
    private string $apiKey;
    public function __construct(string $apiKey){
        $this->apiKey = $apiKey;
    }

    public function getResearcherPublications($lName_fName): array
    {
        $client = new Client();
        try {
            $response = $client->request('GET', 'https://api.clarivate.com/apis/wos-starter/v1/documents', [
                'headers' => [
                    'X-ApiKey' => $this->apiKey,
                    'Accept' => 'application/json',
                ],
                'query' => [
                    'db' => 'WOS',
                    'q' => 'AU=' . $lName_fName,
                    'limit' => 50,
                    'page' => 1,
                ],
            ]);

            $jsonData = $response->getBody()->getContents();
            return json_decode($jsonData, true);

        } catch (GuzzleException $e) {
            error_log("Error while fetching Web of Science publication: " . $e->getMessage());
            return [] ;
        }
    }

    /**
     * @throws \Exception
     */
    public function saveWOSPublications(array $papers, string $userId): void
    {
        foreach ($papers['hits'] as $paper) {
            DB::beginTransaction();
            try {
                // ทำความสะอาดข้อมูลพื้นฐาน
                $title = strtolower(trim($paper['title']));
                $doi = !empty($paper['identifiers']['doi']) ? strtolower(trim($paper['identifiers']['doi'])) : null;
                $paperModel = null;

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
                    $paperModel->paper_name = trim($paper['title']);
                    $paperModel->paper_doi = $doi;
                    $paperModel->paper_type = !empty($paper['types'][0]) ? $paper['types'][0] : null;
                    $paperModel->paper_subtype = !empty($paper['sourceTypes'][0]) ? $paper['sourceTypes'][0] : null;
                    $paperModel->paper_sourcetitle = !empty($paper['source']['sourceTitle']) ? $paper['source']['sourceTitle'] : null;
                    $paperModel->paper_url = !empty($paper['links']['record']) ? $paper['links']['record'] : null;
                    $paperModel->paper_yearpub = !empty($paper['source']['publishYear']) ? (int)$paper['source']['publishYear'] : null;
                    $paperModel->paper_volume = !empty($paper['source']['volume']) ? (int)$paper['source']['volume'] : null;
                    $paperModel->paper_issue = !empty($paper['source']['issue']) ? (int)$paper['source']['issue'] : null;
                    $paperModel->paper_citation = !empty($paper['citations'][0]['count']) ? (int)$paper['citations'][0]['count'] : 0;
                    $paperModel->paper_page = !empty($paper['source']['pages']['range']) ? $paper['source']['pages']['range'] : null;
                    $paperModel->paper_funder = !empty($paper['names']['sponsors']['displayName']) ? $paper['names']['sponsors']['displayName'] : null;
                    $paperModel->keyword = !empty($paper['keywords']['authorKeywords']) ? json_encode($paper['keywords']['authorKeywords']) : null;
                    $paperModel->save();

                    // กำหนดความสัมพันธ์กับ Source_data (ในที่นี้ใช้ source id 2)
                    $source = Source_data::findOrFail(2);
                    $paperModel->source()->sync([$source->id]);
                } else {
                    // 🔄 อัปเดต Citation (เฉพาะเมื่อจำนวนใหม่มากกว่า)
                    if (!empty($paper['citations']) && isset($paper['citations'][0]['count'])) {
                        $citationCount = (int)$paper['citations'][0]['count'];
                        if ($paperModel->paper_citation < $citationCount) {
                            $paperModel->update(['paper_citation' => $citationCount]);
                        }
                    }
                }

                // 🔗 เชื่อมโยง Authors (ใช้ syncWithoutDetaching เพื่อป้องกันการซ้ำ)
                $authorsArray = [];
                foreach ($paper['names']['authors'] as $author) {
                    // แยกข้อมูลชื่อผู้แต่ง โดยใช้เครื่องหมายจุลภาค
                    $authorData = explode(', ', $author['displayName']);
                    $fname = isset($authorData[1]) ? trim($authorData[1]) : '';
                    $lname = isset($authorData[0]) ? trim($authorData[0]) : '';
                    $authorsArray[] = ['fname' => $fname, 'lname' => $lname];
                }

                $authorCount = count($authorsArray);
                foreach ($authorsArray as $index => $authorData) {
                    // ค้นหา User ที่ตรงกัน โดยตรวจสอบทั้งชื่อเต็มและตัวย่อ
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
                        $paperModel->teacher()->syncWithoutDetaching([$user->id => ['author_type' => $authorType]]);
                    } else {
                        $authorModel = Author::where('author_fname', $authorData['fname'])
                            ->where('author_lname', $authorData['lname'])
                            ->first();
                        if (!$authorModel) {
                            $authorModel = new Author();
                            $authorModel->author_fname = $authorData['fname'];
                            $authorModel->author_lname = $authorData['lname'];
                            // บันทึก Author ใหม่และเชื่อมโยงกับ Paper ผ่าน Eloquent Relationship
                            $paperModel->author()->save($authorModel, ['author_type' => $authorType]);
                        } else {
                            $paperModel->author()->syncWithoutDetaching([$authorModel->id => ['author_type' => $authorType]]);
                        }
                    }
                }

                // 🔗 เชื่อมโยง Paper กับ User (Owner)
                $user = User::findOrFail($userId);
                if (!$paperModel->teacher->contains($user->id)) {
                    $paperModel->teacher()->syncWithoutDetaching([$user->id]);
                }

                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
                // สามารถ log error เพิ่มเติมได้ที่นี่ก่อนที่จะ rethrow exception
                throw $e;
            }
        }
    }

}
