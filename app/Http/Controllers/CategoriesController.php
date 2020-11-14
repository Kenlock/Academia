<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;

class CategoriesController extends Controller
{
    //
    public function index(){
      return view('instructor.categories.index');
    }

    public function getCategories(){
      $requests = Category::get();
      $container = [];

      $i = 0;

      foreach($requests as $req){
        $data = [];

        if($req->is_active == 1){
          $status = "active";
        }else{
          $status = "not active";
        }

        $data = [
          "id" => (string)$req->id,
          "name" => (string)$req->name
        ];

        $container[] = $data;
      }
      return $container;
    }

    public function editCategories(){
      $id = $_GET['id'];
      $cat_name = $_GET['name'];

      $slug = $cat_name;
      $slug = str_slug($slug, '-');

      $category = Category::where('id' , $id)->first();

      $category->name = $cat_name;
      $category->slug = $slug;
      $category->save();
      return response()->json(['success' => 'Record edit succeeded.']);
    }

    public function addCategories(){
      $cat_name = $_GET['name'];
      $icon = "fas fa-tags";

      $count = Category::where('name', $cat_name)->count();

      if($count == 0){
        $slug = $cat_name;
        $slug = str_slug($slug, '-');

        $category = new Category();
        $category->name = $cat_name;
        $category->slug = $slug;
        $category->icon_class = $icon;
        $category->is_active = 1;
        $category->save();

        return response()->json(['data' => 'success']);
      }else{
        return response()->json(['data' => 'error']);
      }
    }

    public function removeCategories(){
      $id = $_GET['id'];

      $deletecat = Category::where('id', $id)->first();
      $deletecat->delete();
      return 1;
    }
}
