<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class ErrorController extends Controller
{
    public function apiScopusErrorHandling($statusCode, $apiName)
    {
        // บันทึกลง log file
        Log::error("API Error: $apiName returned status code $statusCode");

        // ส่งอีเมลแจ้งเตือน
        Mail::raw("API Error: $apiName returned status code $statusCode", function ($message) {
            $message->to('keerati.d@kkumail.com')
                    ->subject('API Error Notification');
        });
        return response()->json(['message' => 'Error logged and email sent'], 500);
    }
}
