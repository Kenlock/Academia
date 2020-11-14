<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Quiz;
use App\Models\Questions;
use App\Models\MultiChoice;

class QuestionsController extends Controller
{
    //
    public function getMCQuestions(){
      $quiz_id = session('quiz_id');

      $requests = Questions::where('quiz_id' , $quiz_id )->where('type', 0)->get();

      $container = [];

      $i = 0;

      foreach($requests as $req){
        $data = [];
        //0 for multiple choices, 1 for true or false and 2 for identification

        $data = [
          "id" => (string)$req->id,
          "item_number" => (string)$req->item_number,
          "questions" => (string)$req->questions,
          "correct_answer" => (string)$req->correct_answer,
          "points" => (string)$req->points,
        ];

        $container[] = $data;
      }
      session()->forget('quiz_id');
      return $container;
    }

    
}
