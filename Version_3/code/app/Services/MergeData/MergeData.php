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
                $found = false;
                foreach ($mergedData as $existingPaper) {
                    similar_text(strtolower($existingPaper->paper_name), strtolower($paper->paper_name), $percent);
                    if ($percent >= 90) {
                        $found = true;
                        break;
                    }
                }
                if (!$found) {
                    $mergedData[] = $paper;
                }
            }
        }

        return $mergedData;
    }

}
