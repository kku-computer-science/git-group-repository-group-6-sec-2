<?php
namespace App\Services\APIFetcher;

require "vendor/autoload.php";

use GoogleSearchResults;

$search = new GoogleSearchResults('6b2865ac4c28b16a9e0b76c9306d8ff0689620635b9923c5d90e63609218dc26');
$query = [
    "engine" => "google_scholar_author",
    "author_id" => "00JXDiUAAAAJ",
];

$result = $search->get_json($query);

print_r(json_encode($result, JSON_PRETTY_PRINT));

