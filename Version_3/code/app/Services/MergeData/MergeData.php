<?php

namespace App\Services\MergeData;

class MergeData
{
    public function __construct(){}

    public function mergeData(array $dataScopus, array $dataWOS, array $dataTCI, array $dataScholar): array
    {
        $mergedData = $dataScopus;

        foreach ([$dataWOS, $dataTCI, $dataScholar] as $dataSource) {
            foreach ($dataSource as $paper) {
                $foundIndex = null;
                $highestCitation = $paper->paper_citation; // ใช้ค่าเริ่มต้นของ paper

                foreach ($mergedData as $index => $existingPaper) {
                    similar_text(strtolower($existingPaper->paper_name), strtolower($paper->paper_name), $percent);
                    if ($percent >= 90) {
                        $foundIndex = $index;
                        $highestCitation = max($existingPaper->paper_citation, $paper->paper_citation);
                        break;
                    }
                }

                if ($foundIndex !== null) {
                    // อัปเดตค่าการอ้างอิงถ้ามากกว่า
                    $mergedData[$foundIndex]->paper_citation = $highestCitation;
                } else {
                    // ถ้าไม่เจอให้เพิ่มเข้าไป
                    $mergedData[] = $paper;
                }
            }
        }

        return $mergedData;
    }

}
