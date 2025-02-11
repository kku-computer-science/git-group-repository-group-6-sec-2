<?php

namespace App\Http\Controllers;

use App\Services\APIFetcher\GoogleScholarAPIService;
use App\Services\APIFetcher\ScopusAPIService;
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
//        $wosAPI = new WosAPIService('4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3');
//        $wosPublications = $wosAPI->getResearcherPublications($lName_fName);
//        $wosAPI->saveWOSPublications($wosPublications, $userId);

        $scopusAPI = new ScopusAPIService();
        $scopusPublications = $scopusAPI->fetchData($userId);
        $scopusAPI->saveScopusPublications($scopusPublications, $userId);

//        $idScraper = new IDScraper(new Client());
//        $authorNames = [$lName_fName];
//        $authorScholarId = $idScraper->search($authorNames);
//        $googleScholarAPI = new GoogleScholarAPIService('6b2865ac4c28b16a9e0b76c9306d8ff0689620635b9923c5d90e63609218dc26');
//        $googleScholarPublications = $googleScholarAPI->getResearcherPublications($authorScholarId[0]);
//        $googleScholarAPI->saveGoogleScholarPublications($googleScholarPublications, $userId);

        return redirect()->back();
    }


}
