<?php

namespace App\Http\Controllers;

use App\Models\Academicwork;
use App\Models\User;
use App\Models\Paper;
use Carbon\Carbon;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProfileController extends Controller
{
    public function request($id)
    {
        // ถอดรหัส ID
        $id = Crypt::decrypt($id);

        // ดึงข้อมูลผู้ใช้และอาจารย์ทั้งหมด
        $res = User::findOrFail($id);
        $teachers = User::role('teacher')->get();

        // ดึงข้อมูลจำนวนการอ้างอิงทั้งหมด
        $userCited = $res->user_cited_year;

        Log :: info("Cited Data ---------> ".$userCited);

        // ดึงข้อมูลงานวิจัย
        $papers = $this->getPapersByTeacher($id);
        $papers_scopus = $this->getPapersBySource($id, 1);
        $papers_wos = $this->getPapersBySource($id, 2);
        $papers_tci = $this->getPapersBySource($id, 3);
        $papers_google = $this->getPapersBySource($id, 4);

        // ดึงข้อมูลหนังสือและสิทธิบัตร
        $book_chapter = $this->getAcademicWorks($id, 'book');
        $patent = $this->getAcademicWorks($id, 'patent');

        // ดึงสถิติย้อนหลัง 5 ปี และ 20 ปี
        $year = range(Carbon::now()->year - 5, Carbon::now()->year);
        $year2 = range(Carbon::now()->year - 100, Carbon::now()->year);

        $paper_scopus = $this->getPaperStats($id, $year, 1);
        $paper_tci = $this->getPaperStats($id, $year, 3);
        $paper_wos = $this->getPaperStats($id, $year, 2);
        $paper_google = $this->getPaperStats($id, $year, 4);

        $paper_scopus_s = $this->getPaperStats($id, $year2, 1);
        $paper_tci_s = $this->getPaperStats($id, $year2, 3);
        $paper_wos_s = $this->getPaperStats($id, $year2, 2);
        $paper_google_s = $this->getPaperStats($id, $year2, 4);

        $paper_book_s = $this->getAcademicStats($id, $year2, 'book');
        $paper_patent_s = $this->getAcademicStats($id, $year2, 'patent');

        return view('researchprofiles', [
            'year' => json_encode($year, JSON_NUMERIC_CHECK),
            'year2' => json_encode($year2, JSON_NUMERIC_CHECK),
            'paper_tci' => json_encode($paper_tci, JSON_NUMERIC_CHECK),
            'paper_scopus' => json_encode($paper_scopus, JSON_NUMERIC_CHECK),
            'paper_google' => json_encode($paper_google, JSON_NUMERIC_CHECK),
            'paper_wos' => json_encode($paper_wos, JSON_NUMERIC_CHECK),
            'paper_tci_s' => json_encode($paper_tci_s, JSON_NUMERIC_CHECK),
            'paper_scopus_s' => json_encode($paper_scopus_s, JSON_NUMERIC_CHECK),
            'paper_wos_s' => json_encode($paper_wos_s, JSON_NUMERIC_CHECK),
            'paper_google_s' => json_encode($paper_google_s, JSON_NUMERIC_CHECK),
            'paper_book_s' => json_encode($paper_book_s, JSON_NUMERIC_CHECK),
            'paper_patent_s' => json_encode($paper_patent_s, JSON_NUMERIC_CHECK),
            'res' => $res,
            'teachers' => $teachers,
            'papers' => $papers,
            'papers_tci' => $papers_tci,
            'papers_scopus' => $papers_scopus,
            'papers_google' => $papers_google,
            'papers_wos' => $papers_wos,
            'book_chapter' => $book_chapter,
            'patent' => $patent,
            'userCited' => $userCited
        ]);
    }

    /**
     * ดึงข้อมูลงานวิจัยทั้งหมดของอาจารย์ที่ระบุ
     */
    private function getPapersByTeacher($id)
    {
        return Paper::with(['teacher', 'author', 'source'])
            ->whereHas('teacher', fn($q) => $q->where('users.id', $id))
            ->orderBy('paper_yearpub', 'desc')
            ->get();
    }

    /**
     * ดึงข้อมูลงานวิจัยตามแหล่งที่มา (Scopus, TCI, WOS)
     */
    private function getPapersBySource($id, $sourceId)
    {
        return Paper::with(['teacher', 'author', 'source'])
            ->whereHas('teacher', fn($q) => $q->where('users.id', $id))
            ->whereHas('source', fn($q) => $q->where('source_data_id', $sourceId))
            ->orderBy('paper_yearpub', 'desc')
            ->get();
    }

    /**
     * ดึงข้อมูล Academic Work (หนังสือ, สิทธิบัตร ฯลฯ)
     */
    private function getAcademicWorks($id, $type)
    {
        return Academicwork::with(['user', 'author'])
            ->whereHas('user', fn($q) => $q->where('users.id', $id))
            ->where('ac_type', $type)
            ->get();
    }

    /**
     * ดึงจำนวนงานวิจัยที่ตีพิมพ์ในแต่ละปี (ย้อนหลัง 5 ปี หรือ 20 ปี)
     */
    private function getPaperStats($id, $years, $sourceId)
    {
        return array_map(fn($year) =>
            Paper::whereHas('teacher', fn($q) => $q->where('users.id', $id))
                ->whereHas('source', fn($q) => $q->where('source_data_id', $sourceId))
                ->where('paper_yearpub', $year)
                ->count(),
            $years
        );
    }

    /**
     * ดึงจำนวน Academic Work (หนังสือ, สิทธิบัตร ฯลฯ) ในแต่ละปี
     */
    private function getAcademicStats($id, $years, $type)
    {
        return array_map(fn($year) =>
            Academicwork::whereHas('user', fn($q) => $q->where('users.id', $id))
                ->where('ac_type', $type)
                ->whereYear('ac_year', $year)
                ->count(),
            $years
        );
    }

    public function showHistoryChart($id)
    {
        // ดึงข้อมูลปีทั้งหมดจากฐานข้อมูล
        $years = DB::table('papers')->select('paper_yearpub')->distinct()->get()->pluck('paper_yearpub');

        // ดึงข้อมูล publication ตาม user_id และ source_data_id พร้อมกับปีที่มีข้อมูล
        $papers = DB::table('papers')
            ->join('user_papers', 'papers.id', '=', 'user_papers.paper_id')
            ->leftJoin('source_papers', 'papers.id', '=', 'source_papers.paper_id')
            ->where('user_papers.user_id', $id)
            ->select('papers.paper_yearpub', 'source_papers.source_data_id', DB::raw('count(*) as aggregate'))
            ->groupBy('papers.paper_yearpub', 'source_papers.source_data_id')
            ->orderBy('papers.paper_yearpub')
            ->get();

        // เตรียมข้อมูลเพื่อส่งให้ Blade
        $paper_scopus_s = [];
        $paper_wos_s = [];
        $paper_google_s = [];
        $paper_tci_s = [];

        // เตรียมข้อมูลให้พร้อมในรูปแบบที่ใช้งานง่าย (ถ้าข้อมูลไม่มีในบางปีให้ใส่ 0)
        foreach ($years as $year) {
            $scopus = $papers->where('paper_yearpub', $year)->where('source_data_id', 1)->sum('aggregate');
            $wos = $papers->where('paper_yearpub', $year)->where('source_data_id', 2)->sum('aggregate');
            $google = $papers->where('paper_yearpub', $year)->where('source_data_id', 4)->sum('aggregate');
            $tci = $papers->where('paper_yearpub', $year)->where('source_data_id', 3)->sum('aggregate');

            // ใส่ค่าใน array
            $paper_scopus_s[] = $scopus ?: 0;
            $paper_wos_s[] = $wos ?: 0;
            $paper_google_s[] = $google ?: 0;
            $paper_tci_s[] = $tci ?: 0;
        }

        return view('history-chart', compact('years', 'paper_scopus_s', 'paper_wos_s', 'paper_google_s', 'paper_tci_s'));
    }

    public function citationchart($id)
    {
        // ดึงข้อมูลปีทั้งหมดจากฐานข้อมูล
        $years = DB::table('papers')->select('paper_yearpub')->distinct()->get()->pluck('paper_yearpub');

        // ดึงข้อมูล publication ตาม user_id และ source_data_id
        $papers = DB::table('papers')
            ->join('user_papers', 'papers.id', '=', 'user_papers.paper_id')
            ->leftJoin('source_papers', 'papers.id', '=', 'source_papers.paper_id')
            ->where('user_papers.user_id', $id)
            ->select('papers.paper_yearpub', 'source_papers.source_data_id', 'papers.paper_citation')
            ->get();

        // เตรียมข้อมูลเพื่อส่งให้ Blade
        $paper_scopus_s = [];
        $paper_wos_s = [];
        $paper_google_s = [];
        $paper_tci_s = [];
        $citations = [];
        $h_index = [];

        // ค่าหนักของแต่ละแหล่งข้อมูล
        $source_weights = [
            1 => 2, // Scopus
            2 => 3, // WoS
            3 => 2, // TCI
            4 => 1  // Google Scholar
        ];

        // คำนวณ h-index
        function calculateHIndex($citations_per_paper) {
            rsort($citations_per_paper); // เรียงลำดับ citations จากมากไปน้อย

            $h_index_value = 0;
            foreach ($citations_per_paper as $index => $citation_count) {
                if ($citation_count >= $index + 1) {
                    $h_index_value = $index + 1;
                }
            }
            return $h_index_value;
        }

        // เตรียมข้อมูลให้พร้อมในรูปแบบที่ใช้งานง่าย (ถ้าข้อมูลไม่มีในบางปีให้ใส่ 0)
        foreach ($years as $year) {
            // คำนวณจำนวน publication สำหรับแต่ละ source
            $scopus = $papers->where('paper_yearpub', $year)->where('source_data_id', 1)->sum('paper_citation');
            $wos = $papers->where('paper_yearpub', $year)->where('source_data_id', 2)->sum('paper_citation');
            $google = $papers->where('paper_yearpub', $year)->where('source_data_id', 4)->sum('paper_citation');
            $tci = $papers->where('paper_yearpub', $year)->where('source_data_id', 3)->sum('paper_citation');

            // ดึงการอ้างอิงของแต่ละ paper ในปีนั้น
            $citations_per_paper = $papers->where('paper_yearpub', $year)->pluck('paper_citation')->toArray();

            // คำนวณ h-index จาก citations ของแต่ละ paper
            $h_index_value = calculateHIndex($citations_per_paper);

            // รวม citation ทั้งหมด
            $total_citations = $scopus + $wos + $google + $tci;

            // ใส่ค่าใน array
            $paper_scopus_s[] = $scopus ?: 0;
            $paper_wos_s[] = $wos ?: 0;
            $paper_google_s[] = $google ?: 0;
            $paper_tci_s[] = $tci ?: 0;
            $citations[] = $total_citations ?: 0;
            $h_index[] = $h_index_value;
        }

        // ส่งข้อมูลไปที่ Blade
        return view('citation_chart', compact('years', 'paper_scopus_s', 'paper_wos_s', 'paper_google_s', 'paper_tci_s', 'citations', 'h_index'));
    }
}
