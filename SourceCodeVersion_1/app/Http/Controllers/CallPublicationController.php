<?php

namespace App\Http\Controllers;

use App\Services\APIFetcher\GoogleScholarAPIService;
use App\Services\APIFetcher\ScopusAPIService;
use App\Services\APIFetcher\TciAPIService;
use App\Services\APIFetcher\WosAPIService;
use App\Models\User;
use App\Services\WebScraper\IDScraper;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Crypt;

class CallPublicationController extends Controller
{
    /**
     * @throws Exception
     */
    public function callPublications($userId): \Illuminate\Http\RedirectResponse
    {
        $userId = Crypt::decrypt($userId);
        $user = User::find($userId);
        $lName_fName = $user->lname_en . ' ' . $user->fname_en;
        $fName_lName = $user->fname_en . ' ' . $user->lname_en;

        /* WOS API */
        $wosAPI = new WosAPIService('17edd46abea64599993f929a865e6bc9c36b3a2a');
        $wosPublications = $wosAPI->getResearcherPublications($lName_fName);
        $wosAPI->saveWOSPublications($wosPublications, $userId);

        /* Scopus API */
        $scopusAPI = new ScopusAPIService();
        $scopusPublications = $scopusAPI->fetchData($userId);
        $scopusAPI->saveScopusPublications($scopusPublications, $userId);

        /* TCI web scraper */
        $tciPublication = TciAPIService::extractRelevantData($fName_lName);
        TciAPIService::saveTciPublications($tciPublication, $userId);


        // /* Google Scholar API and web scraper */
        // $idScraper = new IDScraper(new Client());
        // $authorNames = [$fName_lName];
        // $authorScholarId = $idScraper->search($authorNames);
        // $googleScholarAPI = new GoogleScholarAPIService('6b2865ac4c28b16a9e0b76c9306d8ff0689620635b9923c5d90e63609218dc26');
        // $googleScholarPublications = $googleScholarAPI->getResearcherPublications($authorScholarId[0]);
        // $googleScholarAPI->saveGoogleScholarPublications($googleScholarPublications, $userId);

        return redirect()->back();
    }


}
