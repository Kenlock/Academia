<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Validator, Input, Redirect;
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

class PaymentController extends Controller {

	public function getPMinfo(Request $request){
		// return $request->course_id; , this works in getting course id

		$course_id = $request->course_id;
		$course = Course::where('id', $course_id)->first();
		$price = $course->price;
		$slug = $course->course_slug;
		session(['slug' => $slug]);
		$course_title = "This is a payment for the course: " . $course->course_title;

		$paymentIntent = Paymongo::paymentIntent()->create([
		    'amount' => $price,
		    'payment_method_allowed' => [
		        'card'
		    ],
		    'payment_method_options' => [
		        'card' => [
		            'request_three_d_secure' => 'automatic'
		        ]
		    ],
		    'description' => $course_title,
		    'statement_descriptor' => 'SG Academy',
		    'currency' => "PHP",
		]);

		$client_key = $paymentIntent->getClientKey();
		$pi_id = $paymentIntent->getId();
		$amount = $paymentIntent->getAmount();
		$data = array(
      'client_key' => $client_key,
      'amount' => $amount,
			'pi_id' => $pi_id,
			'course_id' => $course_id,
		);
		return view('layouts.payment')->with($data);
	}

	public function makePayment(Request $request){
		$c_number = $request->cardNumber;
		$expM = $request->exp_month + 0;
		$expY = $request->exp_year + 0;
		$cvv = $request->cvv ;
		$client_key = $request->client_key;
		$pi_id = $request->pi_id;
		$amount = $request->amount;
		$course_id = $request->course_id;
		$course_slug = session('slug');
			$paymentMethod = Paymongo::paymentMethod()->create([
			    'type' => 'card',
			    'details' => [
			        'card_number' => $c_number,
			        'exp_month' => $expM,
			        'exp_year' => $expY,
			        'cvc' => $cvv,
			    ],
			]);

			$pm_id = $paymentMethod->getId();
			$paymentIntent = Paymongo::paymentIntent()->find($pi_id);
			// $successfulPayment = $paymentIntent->attach($pm_id);
			try{
				$successfulPayment = $paymentIntent->attach($pm_id);
				$flag = 0;
			}catch(\Luigel\Paymongo\Exceptions\BadRequestException $e){
				$flag = 1;
				session(['notif' => "error"]);
				return redirect()->route('course.checkout', $course_slug);
			}
			if($flag == 0){
				$course_taken = new CourseTaken;

				$course_taken->user_id = \Auth::user()->id;
				$course_taken->course_id = $course_id;
				$course_taken->save();

				$course = Course::where('id', $course_id)->first();

				$transaction = new Transaction;
				$transaction->user_id = \Auth::user()->id;
				$transaction->instructor_id = $course->instructor_id;
				$transaction->amount_paid = $amount;
				$transaction->save();

				return redirect()->action('CourseController@myCourses');
			}else{
				return redirect()->route('course.checkout', $course_slug);
			}

	}
	public function getSuccess(){
		//dashboard or go to myCourses
		return "you have successfully purchased the course";
	}
	public function getFailure(){
		return "scammas XD;";
	}

	public function createSource(Request $request){
		$course_id = $request->course_id;
		$course = Course::where('id', $course_id)->first();
		$price = $course->price;
		session(['course_id' => $course_id]);
		session(['temp' => $price]);

		$gcashSource = Paymongo::source()->create([
		    'type' => 'gcash',
		    'amount' => $price,
		    'currency' => 'PHP',
		    'redirect' => [
		        'success' => 'http://localhost:8000/payment/gcash-payment-process',
		        'failed' => 'https://www.youtube.com'
    ]
		]);
		$link = $gcashSource->getCheckoutUrlRedirect();
		$p_id = $gcashSource->getId();
		session(['payment_id' => $p_id]);
		return Redirect::to($link);
		// return view("layouts.gcash_payment");

	}

	public function makeGcashPayment(){
		$price = session()->pull('temp', 'default');
		$id = session()->pull('course_id', 'default');
		$p = (int)$price;
		$p_id = session()->pull('payment_id', 'default');

		$payment = Paymongo::payment()->create([
			'source' => [
				'id' => $p_id,
				'type' => 'source'
			],
			'attributes' => [
				'amount' => $p
			],
			'amount' => $p,
			'description' => "This is the payment from laravel",
			'currency' => "PHP"
		]);

		$course_taken = new CourseTaken;

		$course_taken->user_id = \Auth::user()->id;
		$course_taken->course_id = $id;
		$course_taken->save();

		$course = Course::where('id', $id)->first();

		$transaction = new Transaction;
		$transaction->user_id = \Auth::user()->id;
		$transaction->instructor_id = $course->instructor_id;
		$transaction->amount_paid = $p;
		$transaction->save();
		return redirect()->route('my.courses');
	}

	public function takeCourse(Request $request)
	{
		// get all values from form
		//what we need. instructor_id, course_id, student_id. student_name, email
		//lagyan lang error trapping dito

		$payment_method = $request->input('payment_method');
		$course_title = $request->input('course_title');
		$course_id = $request->input('course_id');
		$myId = \Auth::user()->id;

			//save the transaction details in DB
		$instructor = Course::where('id' , $course_id)->first();
		$student = User::where('id', $myId)->first();

		$student_name = $student->first_name . " " . $student->last_name;

		$enroll = new Enrollment;
		$enroll->instructor_id = $instructor->instructor_id;
		$enroll->item_id = $course_id;
		$enroll->student_id = $myId;
		$enroll->student_name = $student_name;
		$enroll->email = $student->email;

		$enroll->save();
		// $course_taken = new CourseTaken;
		//
		// $course_taken->user_id = \Auth::user()->id;
		// $course_taken->course_id = $course_id;
		// $course_taken->save();

		return redirect()->action('HomeController@index');
	}

	public function enroll(){
		$id = $_GET['id'];
		$course_taken = new CourseTaken;

		$course_taken->user_id = \Auth::user()->id;
		$course_taken->course_id = $id;
		$course_taken->save();

		$course = Course::where('id', $id)->first();

		$transaction = new Transaction;
		$transaction->user_id = \Auth::user()->id;
		$transaction->instructor_id = $course->instructor_id;
		$transaction->amount_paid = $course->price;
		$transaction->save();

		return "Transaction Completed;";
	}
	//----------------------------------------------------------------------------------this is for the cart processes-----------------------------------------------------------------------------------------------------//
	public function bulkenroll(){
		$items = Cart::content();
		$user_id = \Auth::user()->id;
		foreach($items as $i){
			$course_taken = new CourseTaken;

			$course_taken->user_id = $user_id;
			$course_taken->course_id = $i->id;
			$course_taken->save();

			$deletedRows = CartItems::where('item_id', $i->id)
															->where('user_id', $user_id)
															->delete();

			//get instructor of course and add it to the transation table
			$course = Course::where('id', $i->id)->first();

			$transaction = new Transaction;
			$transaction->user_id = \Auth::user()->id;
			$transaction->instructor_id = $course->instructor_id;
			$transaction->amount_paid = $i->price;
			$transaction->save();
		}
		Cart::destroy();
	}

	public function bulkPMinfo(){
		$price = Cart::total();
		$paymentIntent = Paymongo::paymentIntent()->create([
		    'amount' => $price,
		    'payment_method_allowed' => [
		        'card'
		    ],
		    'payment_method_options' => [
		        'card' => [
		            'request_three_d_secure' => 'automatic'
		        ]
		    ],
		    'description' => "SG Academy checkout",
		    'statement_descriptor' => 'SG Academy',
		    'currency' => "PHP",
		]);

		$client_key = $paymentIntent->getClientKey();
		$pi_id = $paymentIntent->getId();
		$amount = $paymentIntent->getAmount();
		$data = array(
      'client_key' => $client_key,
      'amount' => $amount,
			'pi_id' => $pi_id,
		);
		return view('layouts.bulkpayment')->with($data);
	}

	public function makeBulkPayment(Request $request){
		$c_number = $request->cardNumber;
		$expM = $request->exp_month + 0;
		$expY = $request->exp_year + 0;
		$cvv = $request->cvv ;
		$client_key = $request->client_key;
		$pi_id = $request->pi_id;
		$amount = Cart::total();
		$course_id = $request->course_id;
		$course_slug = session('slug');
			$paymentMethod = Paymongo::paymentMethod()->create([
			    'type' => 'card',
			    'details' => [
			        'card_number' => $c_number,
			        'exp_month' => $expM,
			        'exp_year' => $expY,
			        'cvc' => $cvv,
			    ],
			]);

			$pm_id = $paymentMethod->getId();
			$paymentIntent = Paymongo::paymentIntent()->find($pi_id);
			// $successfulPayment = $paymentIntent->attach($pm_id);
			try{
				$successfulPayment = $paymentIntent->attach($pm_id);
				$flag = 0;
			}catch(\Luigel\Paymongo\Exceptions\BadRequestException $e){
				$flag = 1;
				return redirect()->route('cart.view');
			}
			if($flag == 0){
				$items = Cart::content();
				$user_id = \Auth::user()->id;
				foreach($items as $i){
					$course_taken = new CourseTaken;

					$course_taken->user_id = $user_id;
					$course_taken->course_id = $i->id;
					$course_taken->save();

					$deletedRows = CartItems::where('item_id', $i->id)
			                            ->where('user_id', $user_id)
			                            ->delete();

					//get instructor of course and add it to the transation table
					$course = Course::where('id', $i->id)->first();

					$transaction = new Transaction;
					$transaction->user_id = \Auth::user()->id;
					$transaction->instructor_id = $course->instructor_id;
					$transaction->amount_paid = $i->price;
					$transaction->save();
				}
				Cart::destroy();
				return redirect()->action('CourseController@myCourses');
			}else{
				return redirect()->route('cart.view');
			}
	}

	public function createBulkSource(Request $request){
		$price = Cart::total();

		$gcashSource = Paymongo::source()->create([
		    'type' => 'gcash',
		    'amount' => $price,
		    'currency' => 'PHP',
		    'redirect' => [
		        'success' => 'http://localhost:8000/gcaash-bulk-process',
		        'failed' => 'https://www.youtube.com'
    ]
		]);
		$link = $gcashSource->getCheckoutUrlRedirect();
		$p_id = $gcashSource->getId();
		session(['payment_id' => $p_id]);
		return Redirect::to($link);
		// return view("layouts.gcash_payment");
	}

	public function makeGcashBulkPayment(){
		$price = Cart::total();
		$p_id = session()->pull('payment_id', 'default');

		$payment = Paymongo::payment()->create([
			'source' => [
				'id' => $p_id,
				'type' => 'source'
			],
			'attributes' => [
				'amount' => $price
			],
			'amount' => $price,
			'description' => "SG Academy Checkout(Gcash)",
			'currency' => "PHP"
		]);

		$items = Cart::content();
		$user_id = \Auth::user()->id;
		foreach($items as $i){
			$course_taken = new CourseTaken;

			$course_taken->user_id = $user_id;
			$course_taken->course_id = $i->id;
			$course_taken->save();

			$deletedRows = CartItems::where('item_id', $i->id)
															->where('user_id', $user_id)
															->delete();
			//get instructor of course and add it to the transation table
			$course = Course::where('id', $i->id)->first();

			$transaction = new Transaction;
			$transaction->user_id = \Auth::user()->id;
			$transaction->instructor_id = $course->instructor_id;
			$transaction->amount_paid = $i->price;
			$transaction->save();
		}
		Cart::destroy();
		return redirect()->route('my.courses');
	}
}
