<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Choices;
use App\Models\MultiChoice;

class ChoicesController extends Controller
{
    //

    public function choicesView($id){
      session(['ques_id' => $id]);
      $answer = MultiChoice::where('id', $id)->first();
      $correct = $answer->correct_answer;
      //get the correct answer of the id then send it to the view
      return view('instructor.quiz.questions.choices.index')->with('id', $id)->with('correct_answer', $correct);
    }

    public function addChoices(){

      $alph = array('A', 'B', 'C', 'D', 'E', 'F', 'G');

      $choices = $_GET['ch_text']; //array of choices
      $ques_id = $_GET['question_id']; //question_id
      $option = $_GET['radios']; // array with options
      $len = $_GET['len']; //length of options and choices
      //remove loop i tihink

      // for($i = 0; $i < $len; $i++){
      //   $new = new Choices();
      //
      //   $new->question_id = $ques_id;
      //   $new->option_no = $alph[$i];
      //   $new->choices = $choices[$i];
      //
      //   $new->save();
      // }
      // return 1;

      $new = new Choices();

        $new->question_id = $ques_id;
        $new->choice_A = $choices[0];
        $new->choice_B = $choices[1];
        $new->choice_C = $choices[2];
        $new->choice_D = $choices[3];

        $new->save();
    }

    public function fetchChoices(){
      $ques_id = session('ques_id');

      $requests = MultiChoice::where('id' , $ques_id )->get();

      $container = [];

      $i = 0;

      foreach($requests as $req){
        $data = [];
        //0 for multiple choices, 1 for true or false and 2 for identification

        $data = [
          "id" => (string)$req->id,
          "choice_a" => (string)$req->choice_A,
          "choice_b" => (string)$req->choice_B,
          "choice_c" => (string)$req->choice_C,
          "choice_d" => (string)$req->choice_D,
        ];

        $container[] = $data;
      }
      // session()->forget('quiz_id');
      return $container;
    }

    public function editChoice(){
      $edit_id = $_GET['id'];
      $A = $_GET['choice_a'];
      $B = $_GET['choice_b'];
      $C = $_GET['choice_c'];
      $D = $_GET['choice_d'];

      $edit = MultiChoice::where('id', $edit_id)->first();
      $edit->choice_A = $A;
      $edit->choice_B = $B;
      $edit->choice_C = $C;
      $edit->choice_D = $D;

      $edit->save();

      return 1;
    }

    public function editAnswer(){
      $new_answer = strtoupper($_GET['new_answer']);
      $quiz_id = $_GET['quiz_id'];

      $edit_answer = MultiChoice::where('id', $quiz_id)->first();

      $edit_answer->correct_answer = $new_answer;
      $edit_answer->save();

      return 1;
    }
}
