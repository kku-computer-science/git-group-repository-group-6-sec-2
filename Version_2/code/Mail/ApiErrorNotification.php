<?php

// app/Mail/ApiErrorNotification.php

namespace App\Mail;

use Illuminate\Mail\Mailable;

class ApiErrorNotification extends Mailable
{
    public $message;

    public function __construct($message)
    {
        $this->message = $message;
    }

    public function build()
    {
        return $this->subject('API Error Notification')
                    ->view('emails.api_error')  // Make sure to create the email view file
                    ->with([
                        'message' => $this->message,
                    ]);
    }
}
