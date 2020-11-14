<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\BecomeInstructor;
use App\Models\User;
use App\Models\Instructor;
use App\Models\Role;
use DB;

class InstructorController extends Controller
{
    //
    public function view(){
      return view('admin.instructorReq.index');
    }

    public function getRequests(){

      $requests = BecomeInstructor::get();
      $container = [];

      $i = 0;

      foreach($requests as $req){
        $data = [];
        $user = User::where('id', $req->user_id)->first();

        $name = $user->first_name . " " . $user->last_name;
        $data = [
          "id" => (string)$req->id,
          "name" => $name,
          "email" => (string)$user->email,
          "user_id" => (string)$user->id
        ];

        $container[] = $data;
      }
      return $container;
    }

    public function removeRequests(){
      $id = $_GET['id'];
      $deletedRows = BecomeInstructor::where('id', $id)->first();
      $deletedRows->delete();
      return 1;
    }

    public function acceptRequests(){
      $id = $_GET['id'];
      $instructor = new Instructor();

      $user = User::where('id', $id)->first();

      $instructor->user_id = $id;
      $instructor->first_name = $user->first_name;
      $instructor->last_name = $user->last_name;
      $instructor->contact_email = $user->email;

      $first_name = $user->first_name;
      $last_name = $user->last_name;

      //create slug only while add
      $slug = $first_name.'-'.$last_name;
      $slug = str_slug($slug, '-');

      $results = DB::select(DB::raw("SELECT count(*) as total from instructors where instructor_slug REGEXP '^{$slug}(-[0-9]+)?$' "));

      $finalSlug = strtolower($user->first_name) . "-" . strtolower($user->last_name);
      $instructor->instructor_slug = $finalSlug;

      $instructor->paypal_id = $user->email;
      $instructor->save();

      $user = User::find($id);

      $role = Role::where('name', 'instructor')->first();
      $user->roles()->attach($role);

      $delete = BecomeInstructor::where('user_id', $id)->first();
      $delete->delete();
      return response()->json(['success' => 'Application was accepted!']);
    }
}
