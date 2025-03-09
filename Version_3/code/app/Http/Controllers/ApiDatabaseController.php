<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\APIFetcher\GoogleScholarAPIService;
use App\Services\APIFetcher\ScopusAPIService;
use App\Services\APIFetcher\TciAPIService;
use App\Services\APIFetcher\WosAPIService;
use App\Services\MergeData\MergeData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ApiDatabaseController extends Controller
{
    public function compareData()
    {
        // 🔹 1. ดึง userId ของผู้ใช้ที่ล็อกอินอยู่
        $user = Auth::user();
        if (!$user) {
            return redirect('/login')->with('error', 'Please login first');
        }

        // 🔹 2. ดึงข้อมูลจาก API
        $scopusAPI = new ScopusAPIService();
        $scopusPublications = $scopusAPI->fetchData($user->id);
        $dataScopus = $scopusAPI->extractDataToObject($scopusPublications) ?? [];

        $wosAPI = new WosAPIService('7d9e7568f12e2dabad135498b3b429fc8b57c71e');
        $wosPublications = $wosAPI->getResearcherPublications($user->lname_en . ' ' . $user->fname_en);
        $dataWOS = $wosAPI->extractDataToObject($wosPublications) ?? [];

        $dataTCI = [];
        if ($user->fname_th && $user->lname_th) {
            $tciPublication = TciAPIService::extractRelevantData("{$user->fname_th} {$user->lname_th}");
            $dataTCI = TciAPIService::extractDataToObject($tciPublication) ?? [];
        }

        $dataScholar = [];
        $googleScholarAPI = new GoogleScholarAPIService('6b2865ac4c28b16a9e0b76c9306d8ff0689620635b9923c5d90e63609218dc26');
        $scholarId = $googleScholarAPI->getIdAuthorScholar($user->fname_en . ' ' . $user->lname_en);
        if ($scholarId) {
            $googleScholarPublications = $googleScholarAPI->getResearcherPublications($scholarId);
            $dataScholar = $googleScholarAPI->extractDataToObject($googleScholarPublications) ?? [];
        }

        // 🔹 3. รวมข้อมูลจากทุก API
        $mergeData = new MergeData();
        $publicationsAPI = $mergeData->mergeData($dataScopus, $dataWOS, $dataTCI, $dataScholar);

        // 🔹 4. ดึงข้อมูลจาก Database
        $publicationsDB = $user->paper;

        // 🔹 5. แปลงเป็น Collection และใช้ 'paper_name' เป็นคีย์หลักในการเปรียบเทียบ
        $apiCollection = collect($publicationsAPI)->keyBy(fn($paper) => strtolower(trim($paper->paper_name)));
        $dbCollection = collect($publicationsDB)->keyBy(fn($paper) => strtolower(trim($paper->paper_name)));

        // 🔸 หาข้อมูลที่มีใน API แต่ไม่มีใน Database
        $missingInDB = $apiCollection->diffKeys($dbCollection);

        // 🔸 หาข้อมูลที่มีใน Database แต่ไม่มีใน API
        $missingInAPI = $dbCollection->diffKeys($apiCollection);

        // 🔹 6. ส่งข้อมูลไปแสดงผลใน View
        return view('compare', compact('user', 'publicationsAPI', 'publicationsDB', 'missingInDB', 'missingInAPI'));
    }
}
