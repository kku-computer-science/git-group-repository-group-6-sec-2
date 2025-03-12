<?php

namespace App\Http\Controllers;

use App\Services\APIFetcher\GoogleScholarAPIService;
use App\Services\APIFetcher\ScopusAPIService;
use App\Services\APIFetcher\TciAPIService;
use App\Services\APIFetcher\WosAPIService;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Crypt;

class CallPublicationController extends Controller
{
    /**
     * @throws Exception
     */
    public function callPublications($userId): \Illuminate\Http\RedirectResponse
    {
        $userId = Crypt::decrypt($userId);
        $user = User::where('id', $userId)->first();
        $lName_fName = $user->lname_en . ' ' . $user->fname_en;
        $fName_lName = $user->fname_en . ' ' . $user->lname_en;

        $fname_thai = $user->fname_th;
        $lname_thai = $user->lname_th;

        /* Scopus API */
        $scopusAPI = new ScopusAPIService();
        $scopusPublications = $scopusAPI->fetchData($userId);
        $scopusAPI->saveScopusPublications($scopusPublications, $userId);

        /* WOS API */
        $wosAPI = new WosAPIService('17edd46abea64599993f929a865e6bc9c36b3a2a');
        $wosPublications = $wosAPI->getResearcherPublications($lName_fName);
        $wosAPI->saveWOSPublications($wosPublications, $userId);

        if($fname_thai && $lname_thai){
            /* TCI web scraper in Thai Name*/
            $tciPublication = TciAPIService::extractRelevantData($fname_thai.' '.$lname_thai);
            TciAPIService::saveTciPublications($tciPublication, $userId);
        }

        /* Google Scholar API */
        $googleScholarAPI = new GoogleScholarAPIService('6b2865ac4c28b16a9e0b76c9306d8ff0689620635b9923c5d90e63609218dc26');
        $scholarId = $googleScholarAPI->getIdAuthorScholar($fName_lName);
        if($scholarId){
            $googleScholarPublications = $googleScholarAPI->getResearcherPublications($scholarId);
            $googleScholarAPI->saveGoogleScholarPublications($googleScholarPublications, $userId);
        }
        return redirect()->back();
    }

}
