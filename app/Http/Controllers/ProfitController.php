<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
Use App\Models\Transaction;
use App\Models\Instructor;

class ProfitController extends Controller
{
    //
    public function getProfit(){
      $id = \Auth::user()->id;
      $instructor = Instructor::where('user_id', $id)->first();

      $transaction = Transaction::where('instructor_id', $instructor->id)->get();
      $container = 0;
      foreach($transaction as $trans){
        $container = $container + ($trans->amount_paid * .7);
      }
      
      $total = (int)number_format($container);
      return view('instructor.profit.view')->with('total', $total);
    }
}
