<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

use App\Imports\QuestionImport;

use App\Http\Controllers\Controller;

use App\Models\MultiChoice;
use App\Models\Choices;

class MultiChoiceController extends Controller
{
  public function getQuestions(){
    $quiz_id = session('quiz_id');

    $requests = MultiChoice::where('quiz_id' , $quiz_id )->get();

    $container = [];

    $i = 0;

    foreach($requests as $req){
      $data = [];
      //0 for multiple choices, 1 for true or false and 2 for identification

      $data = [
        "id" => (string)$req->id,
        "item_number" => (string)$req->item_number,
        "question" => (string)$req->question,
        "correct_answer" => (string)$req->correct_answer,
        "points" => (string)$req->points,
      ];

      $container[] = $data;
    }
    // session()->forget('quiz_id');
    return $container;
  }

  public function addQuestion(){

    $alph = array('A', 'B', 'C', 'D', 'E', 'F', 'G');

    $question = $_GET['question'];
    // $correct_answer = strtoupper($_GET['correct_answer']);
    $points = $_GET['points'];
    $quiz_id = $_GET['quiz_id'];
    $option = $_GET['option'];
    $choices_text = $_GET['choices'];

    $option = $alph[$option];

    $get = MultiChoice::where('quiz_id' , $quiz_id)->latest('item_number')->first();

    // return $get;

    if($get != null){
      $item_number = (int)$get->item_number;
      $item_number++;
    }else{
      $item_number = 1;
    }


    $multichoice = new MultiChoice();

    $multichoice->item_number = $item_number;
    $multichoice->quiz_id = $quiz_id;
    $multichoice->question = $question;
    $multichoice->correct_answer = $option;
    $multichoice->choice_A = $choices_text[0];
    $multichoice->choice_B = $choices_text[1];
    $multichoice->choice_C = $choices_text[2];
    $multichoice->choice_D = $choices_text[3];
    $multichoice->points = $points;

    $multichoice->save();

    return $multichoice->id;
  }

  public function removeQuestion(){
    $id = $_GET['id'];
    $delete = MultiChoice::where('id', $id)->delete();

    return 1;
  }

  public function editQuestion(){

    $question = $_GET['question'];
    // $correct_answer = $_GET['correct_answer'];
    $points = $_GET['points'];
    $id = $_GET['id'];

    $edit = MultiChoice::where('id', $id)->first();

    // dd($question);
    $edit->question = $question;
    // $edit->correct_answer = $correct_answer;
    $edit->points = $points;

    $edit->save();

    return 1;
  }

  public function testGet(){
    $question_id = $_GET['id'];

    $requests = Choices::where('question_id' , $question_id )->get();

    if($requests->isEmpty()){
      return "nothing happened" ;
    }else{
      return "something happened ";
    }
    //goods na

    $container = [];

    $i = 0;

    foreach($requests as $req){
      $data = [];
      //0 for multiple choices, 1 for true or false and 2 for identification

      $data = [
        "id" => (string)$req->id,
        "choices" => (string)$req->choices,
      ];

      $container[] = $data;
    }
    // session()->forget('quiz_id');
    return $container;
  }

  public function download_template(){
    return response()->download(storage_path('app\public\\' . 'template_file.xlsx'));
  }

  public function importQuestions(){

    $import1 = new QuestionImport();
    Excel::import($import1, request()->file('file'));
    return back();
  }

  public function makeSet(){
    //maxzimum of 120 ( 4 sets )
    $ques = MultiChoice::where('quiz_id', session('quiz_id'))->get();
    $count = MultiChoice::where('quiz_id', session('quiz_id'))->count();

    if($count <= 30){
      // return "less than or equal to 30";
    }elseif ($count <= 60 && $count >= 31) {
      //get all 1-30 item number then put set_number to 1, the rest put set_number = 2
      foreach($ques as $q){
        if($q->item_number <= 30){
          // echo "<pre>question number " . $q->item_number . " is affected</pre></br>";
        }else{
          // echo "<pre>question number " . $q->item_number . " was not affected</pre></br>";
        }
      }
      // return "more than 30";
    }elseif($count <= 90 && $count >= 61){
      // return "more than 60";
    }elseif($count <= 120 && $count >= 91){
      // return "more than 90";
    }
    // return $ques;
  }
}
