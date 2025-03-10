<?php

namespace App\Http\Controllers;

use App\Services\APIFetcher\GoogleScholarAPIService;
use App\Services\APIFetcher\ScopusAPIService;
use App\Services\APIFetcher\TciAPIService;
use App\Services\APIFetcher\WosAPIService;
use App\Services\MergeData\MergeData;
use Illuminate\Support\Facades\Auth;

class ApiDatabaseController extends Controller
{
    public function compareData()
    {
        $user = Auth::user();
        if (!$user) {
            return redirect('/login')->with('error', 'Please login first');
        }

        // 🔹 ดึงข้อมูลจาก API
        $scopusAPI = new ScopusAPIService();
        $dataScopus = $scopusAPI->extractDataToObject($scopusAPI->fetchData($user->id)) ?? [];

        $wosAPI = new WosAPIService('7d9e7568f12e2dabad135498b3b429fc8b57c71e');
        $dataWOS = $wosAPI->extractDataToObject($wosAPI->getResearcherPublications($user->lname_en . ' ' . $user->fname_en)) ?? [];

        $dataTCI = [];
        if ($user->fname_th && $user->lname_th) {
            $dataTCI = TciAPIService::extractDataToObject(
                TciAPIService::extractRelevantData("{$user->fname_th} {$user->lname_th}")
            ) ?? [];
        }

        $dataScholar = [];
        $googleScholarAPI = new GoogleScholarAPIService('6b2865ac4c28b16a9e0b76c9306d8ff0689620635b9923c5d90e63609218dc26');
        if ($scholarId = $googleScholarAPI->getIdAuthorScholar($user->fname_en . ' ' . $user->lname_en)) {
            $dataScholar = $googleScholarAPI->extractDataToObject(
                $googleScholarAPI->getResearcherPublications($scholarId)
            ) ?? [];
        }

        // 🔹 รวมข้อมูลจากทุก API
        $publicationsAPI = (new MergeData())->mergeData($dataScopus, $dataWOS, $dataTCI, $dataScholar);

        // 🔹 ดึงข้อมูลจาก Database
        $publicationsDB = $user->paper->map(fn($paper) => collect($paper)->except(['id', 'pivot'])->toArray());

        // 🔹 เปรียบเทียบข้อมูลทั้งหมด
        $apiCollection = collect($publicationsAPI)->map(fn($paper) => collect($paper)->toArray());

        $missingInDB = $apiCollection->filter(fn($apiPaper) =>
        !$publicationsDB->contains(fn($dbPaper) => $this->comparePapers($apiPaper, $dbPaper))
        );

        $missingInAPI = $publicationsDB->filter(fn($dbPaper) =>
        !$apiCollection->contains(fn($apiPaper) => $this->comparePapers($dbPaper, $apiPaper))
        );

        return view('compare', compact('user', 'apiCollection', 'publicationsDB', 'missingInDB', 'missingInAPI'));
    }

    private function comparePapers(array $paperA, array $paperB): bool
    {
        unset($paperA['created_at'], $paperA['updated_at'], $paperA['id'], $paperA['pivot'], $paperB['created_at'], $paperB['updated_at'], $paperB['id'], $paperB['pivot']);

        // ปรับค่าทั้งหมดเป็น String เพื่อเปรียบเทียบแบบ Case-Insensitive
        $normalizedA = collect($paperA)->map(fn($value) => strtolower(trim((string) $value)));
        $normalizedB = collect($paperB)->map(fn($value) => strtolower(trim((string) $value)));

        $diff = $normalizedA->diffAssoc($normalizedB);

        return $diff->isEmpty();
    }

}
