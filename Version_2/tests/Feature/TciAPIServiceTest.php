<?php

namespace Tests\Feature;

use App\Services\APIFetcher\TciAPIService;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\Models\Paper;
use App\Models\Author;

class TciAPIServiceTest extends TestCase
{
    
     // สร้าง User ใน setUp()
    public function setUp(): void
    {
        parent::setUp();

        // สร้างผู้ใช้สำหรับการทดสอบและกำหนดค่าให้กับ $user
        $this->user = User::updateOrCreate(
            ['email' => 'jackie@example.com'], // ค้นหาผู้ใช้ที่มีอีเมลนี้อยู่แล้ว
            [
                'fname_en' => 'Jackie',
                'lname_en' => 'Mayer',
                'password' => bcrypt('123456789'),
            ]
        );
        
        
        
        // เพิ่ม Log เพื่อตรวจสอบว่า User ถูกสร้างขึ้นหรือไม่
        Log::info('Created User: ', ['user' => $this->user]);
    }

    // ทดสอบฟังก์ชัน getArticles
    public function testGetArticles()
    {
        // กำหนดค่า parameter สำหรับทดสอบ
        //$keyword = 'Hierarchical Extreme Learning Machine';  // คำค้นหาที่ใช้ในการค้นหาบทความ
        $criteria = 'Punyaphol Horata';  // ค้นหาตามผู้เขียน

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
        Log::info('Extracting data for researcher:', ['researcherName' => $researcherName]);
        // เรียกฟังก์ชันเพื่อดึงข้อมูล
        $data = TciAPIService::extractRelevantData($researcherName);
        Log::info('Data extracted:', ['data' => $data]);
        // ตรวจสอบว่าข้อมูลที่ส่งกลับมามี 'author_name' และ 'articles'
        $this->assertEquals($researcherName, $data['author_name']);
        $this->assertIsArray($data['articles']);
        $this->assertGreaterThan(0, count($data['articles']));  // ตรวจสอบว่ามีบทความในผลลัพธ์
    }



    // ทดสอบฟังก์ชัน saveTCIPublications
    public function testSaveTCIPublications()
    {
    // เตรียมข้อมูลที่ต้องการทดสอบ
    $papers = [
        'author_name' => 'Jackie Mayer',
        'articles' => [
            [
                'article_eng' => 'Sample Paper Title',
                'document_type' => 'Journal',
                'journal_eng' => 'Sample Journal',
                'year' => '2021',
                'volume' => '12',
                'page_number' => '100-110',
                'cited' => 15,
                'authors' => 'Jackie Mayer, John Doe, Jane Smith',
            ],
        ],
    ];

    // ทดสอบการบันทึกข้อมูลโดยใช้ฟังก์ชัน saveTCIPublications
    TciAPIService::saveTCIPublications($papers, $this->user->id);

    // ตรวจสอบว่า Paper ถูกบันทึกลงฐานข้อมูลแล้ว
    $this->assertDatabaseHas('papers', [
        'paper_name' => 'Sample Paper Title',
        'paper_yearpub' => '2021',
    ]);
}
    public function testUpdateExistingPaperCitation()
    {
        $this->assertDatabaseHas('papers', [
            'paper_name' => 'Sample Paper Title',
            'paper_citation' => 15,
        ]);

        $updatedPapers = [
            'author_name' => 'Jackie Mayer',
            'articles' => [
                [
                    'article_eng' => 'Sample Paper Title',
                    'document_type' => 'Journal',
                    'journal_eng' => 'Sample Journal',
                    'year' => '2021',
                    'volume' => '12',
                    'page_number' => '100-110',
                    'cited' => 20,
                    'authors' => 'Jackie Mayer, John Doe, Jane Smith',
                ],
            ],
        ];

        // Call the function to update the paper
        TciAPIService::saveTCIPublications($updatedPapers, $this->user->id);

            // ดึงข้อมูล Paper ที่ได้รับการอัปเดตจากฐานข้อมูล
        $updatedPaper = Paper::where('paper_name', 'Sample Paper Title')->first();
    
         // ตรวจสอบว่า Paper ที่มีชื่อ Sample Paper Title ได้รับการอัปเดต citation จาก 10 เป็น 20
        $this->assertNotNull($updatedPaper);  // ตรวจสอบว่า Paper ถูกบันทึก
        $this->assertEquals(20, $updatedPaper->paper_citation);  // คาดหวังว่า citation จะถูกอัปเดตเป็น 20
    }

    // ทดสอบการเชื่อมโยง Paper กับผู้เขียนที่มีอยู่แล้วในฐานข้อมูล
    public function testLinkPaperWithExistingAuthors()
    {
        $johnDoe = Author::where('author_fname', 'John')->where('author_lname', 'Doe')->first();
        $janeSmith = Author::where('author_fname', 'Jane')->where('author_lname', 'Smith')->first();
        // ตรวจสอบว่าผู้เขียนมีอยู่ในฐานข้อมูล
        $this->assertDatabaseHas('Authors', [
            'author_fname' => 'John',
            'author_lname' => 'Doe',
        ]);

        $this->assertDatabaseHas('Authors', [
            'author_fname' => 'Jane',
            'author_lname' => 'Smith',
        ]);
        
        // ดึง Paper ที่มีชื่อ 'Sample Paper Title'
        $paper = Paper::where('paper_name', 'Sample Paper Title')->first();
        
        // โหลดความสัมพันธ์ author
        $paper->load('author');  // โหลดความสัมพันธ์

        $this->assertNotNull($paper, 'Paper not found');
        $this->assertTrue($paper->author->contains($johnDoe), 'Paper is not linked with John Doe');
        $this->assertTrue($paper->author->contains($janeSmith), 'Paper is not linked with Jane Smith');
    }
    public function testCreateNewAuthor()
    {
        $this->assertNull(Author::where('author_fname', 'Jay')->where('author_lname', 'Ley')->first());
        $this->assertNull(Author::where('author_fname', 'Jame')->where('author_lname', 'Ji')->first());
        
        $papers2 = [
            'author_name' => 'Jackie Mayer',
            'articles' => [
                [
                    'article_eng' => 'Sample Paper',
                    'document_type' => 'Journal',
                    'journal_eng' => 'Sample Journal',
                    'year' => '2021',
                    'volume' => '12',
                    'page_number' => '100-110',
                    'cited' => 15,
                    'authors' => 'Jay Ley, Jame Ji', // ผู้เขียนที่ไม่มีในฐานข้อมูล
                ],
            ],
        ];

        TciAPIService::saveTCIPublications($papers2, $this->user->id);

        $jayLey = Author::where('author_fname', 'Jay')->where('author_lname', 'Ley')->first();
        $jameJi = Author::where('author_fname', 'Jame')->where('author_lname', 'Ji')->first();
        
        $this->assertNotNull($jayLey, 'Jay Ley should be created');
        $this->assertNotNull($jameJi, 'Jame Ji should be created');

        
        //ตรวจสอบว่า Paper เชื่อมโยงกับ Author ที่ถูกสร้าง
        $paper2 = Paper::where('paper_name', 'Sample Paper')->first();
        $this->assertNotNull($paper2, 'Paper not found');

        // ตรวจสอบว่า Paper เชื่อมโยงกับ Author ใหม่
        $paper2->load('author');  // โหลดความสัมพันธ์ author
        $this->assertTrue($paper2->author->contains($jayLey), 'Paper is not linked with Jay Ley');
        $this->assertTrue($paper2->author->contains($jameJi), 'Paper is not linked with Jame Ji');
    }
    public function testLinkPaperWithUser()
    {
        $jackieMayer = User::where('fname_en', 'Jackie')->where('lname_en', 'Mayer')->first();
        $this->assertNotNull($jackieMayer, 'Jackie Mayer does not exist in the database');
    
        $paper = Paper::where('paper_name', 'Sample Paper Title')->first();
        $this->assertNotNull($paper, 'Paper not found');

        $this->assertTrue($paper->teacher->contains($jackieMayer), 'Paper is not linked with Jackie Mayer');
    }
}
       
       

       
        

