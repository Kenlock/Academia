<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Blog;
use DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactAdmin;
use App\Models\Config;
use App\Models\Course;
use App\Models\Category;
use App\Models\CourseRating;
use App\Models\InstructionLevel;
use Gloudemans\Shoppingcart\Facades\Cart;
use Validator, Input, Redirect;
use App\Models\Transaction;
use App\Models\CourseTaken;
use Luigel\Paymongo\Facades\Paymongo;
use App\Models\CartItems;

class CartController extends Controller
{
  public function add(){
    $id = $_GET['id'];
    $cart_content = Cart::content();

    foreach($cart_content as $cart){
      if($id == $cart->id){
        Cart::destroy();
        return "This item is already in your cart";
      }
    }

    $prod = Course::find($id);
    $title = $prod->course_title;
    $price = $prod->price;

    try{
      Cart::add($id, $title, 1, $price);
      $item = new CartItems;

  		$item->user_id = \Auth::user()->id;
  		$item->item_id = $id;
      $item->title = $title;
      $item->quantity = 1;
      $item->price = $price;

      $item->save();
    }catch(Exception $e){
      return $e;
    }
    // Cart::destroy();
    return "Successfully added to cart!";
  }

  public function view(){
    $cart_content = Cart::content();
    // dd($cart_content);
    return view('site.cart.view', compact('cart_content'));
  }

  public function count(){
    $count = Cart::count();
    return $count;
  }


  public function delete(Request $request){
    $id = $request->rowId;
    $item = Cart::get($id);
    $user_id = \Auth::user()->id;

    $deletedRows = CartItems::where('item_id', $item->id)
                            ->where('user_id', $user_id)
                            ->delete();

    Cart::remove($id);
    $route = route('cart.view');
    return Redirect($route);
  }

}
