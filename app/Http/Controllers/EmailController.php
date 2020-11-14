<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMail;
use App\Models\Instructor;

class EmailController extends Controller
{
    //
    public function send(){
      $message = $_GET['message'];
      $total = $_GET['total'];
      $id = \Auth::user()->id;

      $instructor = Instructor::where('user_id', $id)->first();
      $last_name = $instructor->last_name;
      $first_name = $instructor->first_name;
      $email = $instructor->contact_email;
      $data = array(
        'name' => $first_name . " " . $last_name,
        'message' => $message,
        'total' => $total,
        'email' => $email
      );

      $to_mail = env('MAIL_USERNAME');
      Mail::to($to_mail)->send(new SendMail($data));

      return 1;
    }
}
