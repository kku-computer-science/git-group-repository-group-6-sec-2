<?php

namespace App\Http\Controllers;

use App\Services\APIFetcher\GoogleScholarAPIService;
use App\Services\APIFetcher\WosAPIService;
use App\Models\User;

class CallPublicationController extends Controller
{
    public function callPublications($userId)
    {
        $user = User::find($userId);
        $lName_fName = $user->lname . ' ' . $user->fname;
        $wosAPI = new WosAPIService('4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3');
        $wosPublications = $wosAPI->getResearcherPublications($lName_fName);
        $wosAPI->saveWOSPublications($wosPublications, $userId);

    }


}
