<?php

namespace App\Console\Commands;

use App\Models\Author;
use App\Models\Book;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class DemoCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'demo:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */

     /**
     * Handle API errors by logging the error and sending an email notification.
     *
     * @param  int  $statusCode
     * @param  string  $apiName
     * @return void
     */

    public function apiScopusErrorHandling($statusCode, $apiName)
    {
        // บันทึกข้อผิดพลาดลง log file
        Log::error("API Error: $apiName returned status code $statusCode");

        // กำหนดอีเมลผู้ดูแลระบบ
        $adminEmail = 'keerati.d@kkumail.com';

        // หัวข้ออีเมล
        $subject = "🚨 API Error Notification: {$apiName}";

        // เนื้อหาข้อความอีเมล
        $message = "An error occurred while calling the API: {$apiName}.\n\n"
                . "Status Code: {$statusCode}\n"
                . "Timestamp: " . now()->toDateTimeString() . "\n\n"
                . "Please check the system logs for more details.";

        // ส่งอีเมลแจ้งเตือน
        Mail::raw($message, function ($mail) use ($adminEmail, $subject) {
            $mail->to($adminEmail)
                ->subject($subject);
        });
    }


    public function handle()
    {
        #Log::info("Cron is working fine!");


        #Write your database logic we bellow:
        //$data = User::role(['teacher', 'student'])->get();
        $data = User::find(16);
        //$data = User::role('teacher')->get();
        foreach ($data as $name) {

            $fname = substr($name['fname_en'], 0, 1);
            $lname = $name['lname_en'];
            $id    = $name['id'];

            $url = Http::get('https://api.elsevier.com/content/search/scopus?', [
                'query' => "AUTHOR-NAME(" . "$lname" . "," . "$fname" . ")",
                'apikey' => '41b94ea1f9dd77ae38c5a383e3e79950',
            ])->json();


            //$check=$url["search-results"]["entry"];
            $content = $url["search-results"]["entry"];


            $links = $url["search-results"]["link"];
            //print_r($links);
            do {
                $ref = 'prev';
                foreach ($links as $link) {
                    if ($link['@ref'] == 'next') {
                        $link2 = $link['@href'];
                        $link2 = Http::get("$link2")->json();
                        $links = $link2["search-results"]["link"];
                        $nextcontent = $link2["search-results"]["entry"];
                        foreach ($nextcontent as $item) {
                            array_push($content, $item);
                        }
                    }
                }
            } while ($ref != 'prev');

            foreach ($content as $item) {
                if (array_key_exists('error', $item)) {
                    continue;
                } else {
                    if (Paper::where('paper_name', '=', $item['dc:title'])->first() == null) { //เช็คว่ามี paper นี้ในฐานข้อมูลหรือยัง ถ้ามี
                        $scoid = $item['dc:identifier'];
                        $scoid = explode(":", $scoid);
                        $scoid = $scoid[1];
    
                        $all = Http::get("https://api.elsevier.com/content/abstract/scopus_id/" . $scoid . "?filed=authors&apiKey=41b94ea1f9dd77ae38c5a383e3e79950&httpAccept=application%2Fjson");
                        //$all = Http::get("https://api.crossref.org/works/"."");
                        //$all = Http::get("https://api.crossref.org/works?query.title=" . $item['dc:title'] . "&rows=2");
                        $paper = new Paper;
                        $paper->paper_name = $item['dc:title'];
                        $paper->paper_type = $item['prism:aggregationType'];
                        $paper->paper_subtype = $item['subtypeDescription'];
                        $paper->paper_sourcetitle = $item['prism:publicationName'];
    
                        //$date = Carbon::createFromFormat('m/d/Y', $item['prism:issueIdentifier'])->format('Y');
                        //$paper->paper_issue=$date;
                        //$paper->paper_issue=$item['prism:issueIdentifier'];
                        $paper->paper_url = $item['link'][2]['@href'];
                        //$paper->paper_yearpub = $item['prism:coverDate'];
    
                        $date = Carbon::parse($item['prism:coverDate'])->format('Y');
                        //return $date;
                        //$date = $item['prism:coverDate']->format('Y');
                        $paper->paper_yearpub = $date;
                        if (array_key_exists('prism:volume', $item)) {
                            $paper->paper_volume = $item['prism:volume'];
                        } else {
                            $paper->paper_volume = null;
                        }
                        if (array_key_exists('prism:issueIdentifier', $item)) {
                            $paper->paper_issue = $item['prism:issueIdentifier'];
                        } else {
                            $paper->paper_issue = null;
                        }


                        $paper->paper_citation = $item['citedby-count'];
                        $paper->paper_page = $item['prism:pageRange'];
    
                        if (array_key_exists('prism:doi', $item)) {
                            $paper->paper_doi = $item['prism:doi'];
                        } else {
                            $paper->paper_doi = null;
                        }
                        
                        if (array_key_exists('item', $all['abstracts-retrieval-response'])) {
                            if (array_key_exists('xocs:meta', $all['abstracts-retrieval-response']['item'])) {
                                if (array_key_exists('xocs:funding-text', $all['abstracts-retrieval-response']['item']['xocs:meta']['xocs:funding-list'])) {
                                    $funder = $all['abstracts-retrieval-response']['item']['xocs:meta']['xocs:funding-list']['xocs:funding-text'];
                                    $paper->paper_funder = json_encode($funder);
                                }else{
                                    $paper->paper_funder = null;
                                }
                            }else{
                                $paper->paper_funder = null;
                            }
                            
                            //$paper->paper_funder = $all['abstracts-retrieval-response']['item']['xocs:meta']['xocs:funding-list']['xocs:funding-text'];
                            $paper->abstract = $all['abstracts-retrieval-response']['item']['bibrecord']['head']['abstracts'];
                            //$key = $all['abstracts-retrieval-response']['item']['bibrecord']['head']['citation-info']['author-keywords']['author-keyword'];
                            
                            if (array_key_exists('author-keywords', $all['abstracts-retrieval-response']['item']['bibrecord']['head']['citation-info'])) {
                                $key = $all['abstracts-retrieval-response']['item']['bibrecord']['head']['citation-info']['author-keywords']['author-keyword'];
                                $paper->keyword = json_encode($key);
                                
                            }else{
                                $paper->keyword = null;
                            }
                            
                        } else {
                            $paper->paper_funder = null;
                            $paper->abstract = null;
                            $paper->keyword = null;
                        }
    
    
                        $paper->save();
                        //$user = User::findOrFail($id);
                        //$paper->teacher()->sync($id);
    
                        $source = Source_data::findOrFail(1);
                        $paper->source()->sync($source);
    
                        $all_au = $all['abstracts-retrieval-response']['authors']['author'];
                        // if (array_key_exists('author', $all['message']['items'][0])) {
                        //     //$all_au = $all['message']['items'][0]['author'];
                        //     if (array_key_exists('ce:given-name', $all['message']['items'][0]['author'][0])) {
                        //         $all_au = $all['message']['items'][0]['author'];
                        //     } else {
                        //         $all_au = $all['message']['items'][1]['author'];
                        //     }
                        // } else {
                        //     $all_au = $all['message']['items'][1]['author'];
                        // }
    
                        //return $all_au;
                        // foreach ($all as $i) {
                        //     $all_au = $i['author'];
                        // }
                        //return $all_au[0]['ce:given-name'];

                        $x = 1;
                        $length = count($all_au);
                        foreach ($all_au as $i) {
                            if (User::where([['fname_en', '=', $i['ce:given-name']], ['lname_en', '=', $i['ce:surname']]])->orWhere([[DB::raw("concat(left(fname_en,1),'.')"), '=', $i['ce:given-name']], ['lname_en', '=', $i['ce:surname']]])->first() == null) {  //เช็คว่าคนนี้อยู่ใน user ไหม ถ้าไม่มี 
    
                                if (Author::where([['author_fname', '=', $i['ce:given-name']], ['author_lname', '=', $i['ce:surname']]])->first() == null) { //เช็คว่ามีชื่อผู้แต่งคนนี้มีหรือยังในฐานข้อมูล ถ้ายังให้
                                    //$comp = User::select(DB::raw("concat(left(fname_en,1),'.') as name"))->get();
                                    //return $comp;
                                    $author = new Author;
                                    $author->author_fname = $i['ce:given-name'];
                                    $author->author_lname = $i['ce:surname'];
                                    $author->save();
                                    if ($x === 1) {
                                        $paper->author()->attach($author, ['author_type' => 1]);
                                    } else if ($x === $length) {
                                        $paper->author()->attach($author, ['author_type' => 3]);
                                    } else {
                                        $paper->author()->attach($author, ['author_type' => 2]);
                                    }
                                } else { //ถ้ามีแล้ว
                                    $author = Author::where([['author_fname', '=', $i['ce:given-name']], ['author_lname', '=', $i['ce:surname']]])->first();
                                    $authorid = $author->id;
                                    if ($x === 1) {
                                        $paper->author()->attach($authorid, ['author_type' => 1]);
                                    } else if ($x === $length) {
                                        $paper->author()->attach($authorid, ['author_type' => 3]);
                                    } else {
                                        $paper->author()->attach($authorid, ['author_type' => 2]);
                                    }
                                }
                            } else {
                                $us = User::where([['fname_en', '=', $i['ce:given-name']], ['lname_en', '=', $i['ce:surname']]])->orWhere([[DB::raw("concat(left(fname_en,1),'.')"), '=', $i['ce:given-name']], ['lname_en', '=', $i['ce:surname']]])->first();
                                //return $us->id;
                                //$usid = $us->id;
                                //return 
                                if ($x === 1) {
                                    $paper->teacher()->attach($us, ['author_type' => 1]);
                                } else if ($x === $length) {
                                    $paper->teacher()->attach($us, ['author_type' => 3]);
                                } else {
                                    $paper->teacher()->attach($us, ['author_type' => 2]);
                                }
                            }
                            $x++;
                        }
                    } else {
                        $paper = Paper::where('paper_name', '=', $item['dc:title'])->first();
                        $paper->paper_citation = $item['citedby-count'];
                        $paper->update();
                        
                        //         $paperid = $paper->id;
                        //         $user = User::find($id);

                        //         $hasTask = $user->paper()->where('paper_id', $paperid)->exists();
                        //         if ($hasTask != $paperid) {

                        //             $paper = Paper::find($paperid);
                        //             $paper->teacher()->attach($id);
                        //         } else {
                        //             continue;
                        //         }
                    }
                }
            }
        }
    }
}
