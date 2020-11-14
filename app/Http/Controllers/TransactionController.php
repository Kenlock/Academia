<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
Use App\Models\Transaction;
use App\Models\Instructor;

class TransactionController extends Controller
{
    //
    public function getTransactions(){

      $id = \Auth::user()->id;
      $instructor = Instructor::where('user_id', $id)->first();
      $requests = Transaction::where('instructor_id', $instructor->id)->get();
      $container = [];
      $total = 0;
      $i = 0;

      foreach($requests as $req){
        $data = [];

        $date = date('M d, Y', strtotime($req->created_at));
        $amount = $req->amount_paid * .7;
        $data = [
          "id" => (string)$req->id,
          "amount" => (string)$amount,
          "date" => (string)$date
        ];

        $container[] = $data;
      }
      return $container;
    }
}
