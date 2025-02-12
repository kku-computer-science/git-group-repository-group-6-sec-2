<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\ApiErrorNotification;

class ApiScopusErrorHandlingTest extends TestCase
{
    public function testApiErrorNotificationEmail()
    {
        // Fake the mail sending
        Mail::fake();

        $adminEmail = 'keerati.d@kkumail.com';

        // Trigger the code that sends the email
        $message = "API Error Occurred";
        Mail::to($adminEmail)->send(new ApiErrorNotification($message));

        // Assert that the email was sent
        Mail::assertSent(ApiErrorNotification::class, function ($mail) use ($message) {
            return $mail->message == $message; // You can assert specific details here
        });
    }
}
