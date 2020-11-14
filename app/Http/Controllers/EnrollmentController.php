<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Course;
use App\Models\Transaction;
use App\Models\Credit;
use App\Models\Config;
use App\Models\CourseTaken;
use App\Models\Instructor;
use App\Models\CartItems;
use App\Models\Enrollment;
use App\Models\User;
use Luigel\Paymongo\Facades\Paymongo;
use Gloudemans\Shoppingcart\Facades\Cart;

class EnrollmentController extends Controller
{
    public function view(){

      return view('site.enrolment.view');
    }

    public function BTenroll(){

      $cart = Cart::content();
      $arr = [];
      $index = 0;
      $user_id = \Auth::user()->id;;
      //get the ids into an array
      foreach($cart as $c){
        $arr[$index] = $c->id;

        //get instructor
        $inst = Course::where('id', $arr[$index])->first();
        $student = User::where('id' , $user_id)->first();
        //put the entries inside the enrolments table
        $enrolments = new Enrollment;

        $enrolments->instructor_id = $inst->instructor_id;
        $enrolments->item_id = $arr[$index];
        $enrolments->student_id = $user_id;
        $enrolments->student_name = $student->first_name . " " . $student->last_name;
        $enrolments->email = $student->email;

        $deletedRows = CartItems::where('item_id', $arr[$index])
                                ->where('user_id', $user_id)
                                ->delete();
        //save query
        $enrolments->save();
        $index++;
      }
      Cart::destroy();
      return redirect()->route('course.list');
    }
}
