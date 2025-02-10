<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\File;

class WosApiController extends Controller
{
   // app/Http/Controllers/WosApiController.php

    public function getResearcherData($id)
    {
        // ในกรณีนี้, คุณจะต้องใช้ $id เพื่อดึงข้อมูลที่เกี่ยวข้องจากฐานข้อมูลหรือ API
        //$user = User::findOrFail(Crypt::decrypt($id));  // ค้นหาผู้ใช้จาก id ที่ได้รับ

        // สมมุติว่าเราใช้ข้อมูล $user เพื่อดึงข้อมูลจาก Web of Science API
        $client = new Client();
        try {
            $response = $client->request('GET', 'https://api.clarivate.com/apis/wos-starter/v1/documents', [
                'headers' => [
                    'X-ApiKey' => '4e58ee08d1f6ba5b493b7dc227cc59d21c84e8f3',  // แทนที่ด้วย API Key ของคุณ
                    'Accept' => 'application/json',
                ],
                'query' => [
                    'db' => 'WOS',
                    'q' => 'AU=' . $id,  // ใช้ข้อมูลจากฐานข้อมูล
                    'limit' => 10,
                    'page' => 1,
                ],
            ]);

            $data = json_decode($response->getBody()->getContents(), true);
            // คุณสามารถส่งข้อมูลนี้ไปแสดงใน modal หรือใช้แสดงข้อมูลตามที่ต้องการ
            File::put(storage_path('app/public/researcher_data.json'), json_encode($data, JSON_PRETTY_PRINT));

            return response()->json($data);  // ส่งข้อมูลกลับในรูปแบบ JSON

        } catch (\Exception $e) {
            return response()->json(['error' => 'Unable to fetch data from WOS'], 500);
        }
    }

}
