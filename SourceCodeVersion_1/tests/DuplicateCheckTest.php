<?php
use PHPUnit\Framework\TestCase;

class DuplicateCheckTest extends TestCase
{
    private $pdo;

    protected function setUp(): void
    {
        
        $host = '192.185.83.226';
        $dbname = 'cssegrou_academic_project';
        $username = 'cssegrou_root';
        $password = 'Es^0MASZs?n5';
        

        try {
            $this->pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            $this->fail("Database connection failed: " . $e->getMessage());
        }
    }

    public function testDuplicatePapers()
    {
        $query = "
            SELECT LOWER(TRIM(paper_name)) AS normalized_paper_name, 
                   COUNT(*) AS duplicate_count
            FROM papers
            GROUP BY normalized_paper_name
            HAVING duplicate_count > 1
            ORDER BY duplicate_count DESC;
        ";

        $stmt = $this->pdo->query($query);
        $duplicates = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // ✅ เพิ่ม Debug ให้แสดงค่าก่อนตรวจสอบ
        echo "\n===== ตรวจสอบ Paper ที่ซ้ำกัน (Case Insensitive) =====\n";
        print_r($duplicates);

        $this->assertEmpty($duplicates, "พบข้อมูล Paper ซ้ำในฐานข้อมูล (ตรวจจากชื่อ Paper เท่านั้น)");
    }

    public function testDatabaseConnection()
    {
        $query = "SELECT COUNT(*) FROM papers;";
        $stmt = $this->pdo->query($query);
        $count = $stmt->fetchColumn();

        echo "\n===== จำนวน Paper ในฐานข้อมูล =====\n";
        echo "Paper Count: " . $count . "\n";

        $this->assertGreaterThan(0, $count, "ฐานข้อมูลอาจไม่มีข้อมูล");
    }
}
