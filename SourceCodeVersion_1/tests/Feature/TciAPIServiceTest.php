<?php

namespace Tests\Feature;

use App\Services\APIFetcher\TciAPIService;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Config;

use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class TciAPIServiceTest extends TestCase
{
    use DatabaseTransactions;

    // ทดสอบฟังก์ชัน getArticles
    public function testGetArticles()
    {
        // กำหนดค่า parameter สำหรับทดสอบ
        //$keyword = 'Hierarchical Extreme Learning Machine';  // คำค้นหาที่ใช้ในการค้นหาบทความ
        $criteria = 'Punyaphol Horataaa';  // ค้นหาตามผู้เขียน

        // เรียกฟังก์ชัน getArticles
        $articles = TciAPIService::getArticles(/*$keyword*/  $criteria, );

        // ตรวจสอบว่าผลลัพธ์ที่ได้เป็น array
        $this->assertIsArray($articles);

        $this->assertGreaterThan(0, count($articles), 'No articles found for the given author');
    }

    // ทดสอบฟังก์ชัน extractRelevantData
    public function testExtractRelevantData()
    {
        $researcherName = 'Punyaphol Horata';  // ชื่อผู้วิจัยที่ใช้ในการค้นหา

        // เรียกฟังก์ชันเพื่อดึงข้อมูล
        $data = TciAPIService::extractRelevantData($researcherName);

        // ตรวจสอบว่าข้อมูลที่ส่งกลับมามี 'author_name' และ 'articles'
        $this->assertEquals($researcherName, $data['author_name']);
        $this->assertIsArray($data['articles']);
        $this->assertGreaterThan(0, count($data['articles']));  // ตรวจสอบว่ามีบทความในผลลัพธ์
    }



    // ทดสอบฟังก์ชัน saveTCIPublications
    public function testSaveTCIPublications()
    {

        $user = User::create([
            'id' => 154,
            'fname_en' => 'Jackie',  // กำหนดชื่อ
            'lname_en' => 'Mayer',  // กำนดนามสกุล
            'email' => 'jackie@example.com',
            'password' => bcrypt('123456789'),
        ]);
        
        
        // เตรียมข้อมูลที่ต้องการทดสอบ
        $papers = [
            'author_name' => 'Loan Thi-Thuy Ho',
            'articles' => [
                [
                    'article_eng' => 'Sample Paper Title',
                    'document_type' => 'Journal',
                    'journal_eng' => 'Sample Journal',
                    'year' => '2021',
                    'volume' => '12',
                    'page_number' => '100-110',
                    'cited' => 15,
                    'authors' => 'John Doe, Jane Smith',
                ],
            ],
        ];

        // สร้างผู้ใช้งานเพื่อทดสอบ
        $user = User::where('fname_en', 'Jackie')
            ->where('lname_en', 'Mayer')
            ->first();  

        Log::info('User Info:', ['user' => $user]);

        // ทดสอบการบันทึก
        TciAPIService::saveTCIPublications($papers, $user);

       
        $this->assertDatabaseHas('papers', [
            'paper_name' => 'Sample Paper Title',
            'paper_yearpub' => '2021',
        ]);
     
    }

}