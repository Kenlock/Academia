<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use DB;
use Image;
use SiteHelpers;
use Crypt;
use App\Library\VideoHelpers;
use URL;
use Session;

use App\Http\Controllers\Controller;

use App\Models\Quiz;
use App\Models\Category;
use App\Models\Instructor;
use App\Models\MultiChoice;
use App\Models\Choices;

class QuizController extends Controller
{
    //
    public function index(){
      $quizzes = Category::get();
      return view('instructor.quiz.list')->with(['quizzes' => $quizzes]);
    }

    public function quizInfo($id){
      $quiz = Quiz::find($id);
      $categories = Category::get();
      session(['quiz_id'=>$id]);
      return view('instructor.quiz.info', compact('quiz', 'categories'));
    }

    public function getQuizzes(){
      $user_id = \Auth::user()->id;
      $instructor_id = Instructor::where('user_id', $user_id)->first();

      $requests = Quiz::where('instructor_id' , $instructor_id->id)->get();
      $container = [];

      $i = 0;

      foreach($requests as $req){
        $data = [];

        if($req->status == 1){
          $status = "active";
        }else{
          $status = "not active";
        }

        $cat = Category::where('id', $req->category)->first();
        $cat_name = $cat->name;
        $data = [
          "id" => (string)$req->id,
          "name" => (string)$req->title,
          "category" => (string)$cat_name,
          "price" => (string)$req->price,
          "passing_rate" => (string)$req->passing_rate,
          "time_limit" => (string)$req->time_limit,
          "status" => (string)$status
        ];

        $container[] = $data;
      }
      return $container;
    }

    public function addQuiz(){
      $user_id = \Auth::user()->id;
      $instructor_id = Instructor::where('user_id', $user_id)->first();
      $ins_id = $instructor_id->id;

      $quiz_name = $_GET['quiz_name'];
      $cat_select = $_GET['cat_select'];
      $price = $_GET['price'];
      $passing_rate = $_GET['passing_rate'];
      $time_limit = $_GET['time_limit'];

      $quiz = new Quiz();
      $quiz->title = $quiz_name;
      $quiz->instructor_id = $ins_id;
      $quiz->category = $cat_select;
      $quiz->price = $price;
      $quiz->status = 1;
      $quiz->passing_rate = $passing_rate;
      $quiz->time_limit = $time_limit;

      $quiz->save();

      return 1;
    }

    public function editQuiz(){
      $quiz_name = $_GET['n_quiz_name'];
      $cat_select = $_GET['n_cat_select'];
      $price = $_GET['n_price'];
      $passing_rate = $_GET['n_passing_rate'];
      $time_limit = $_GET['n_time_limit'];
      $id = $_GET['id'];

      $quiz = Quiz::where('id', $id)->first();
      $quiz->title = $quiz_name;
      $quiz->category = $cat_select;
      $quiz->price = $price;
      $quiz->passing_rate = $passing_rate;
      $quiz->time_limit = $time_limit;

      $quiz->save();

      return 1;
    }

    public function removeQuiz(){
      $id = $_GET['id'];
      //remove also the files if the files are in somewhere in the storage again
      $path = "quiz/".$id;
      Storage::deleteDirectory($path);

      $delete = MultiChoice::where('quiz_id', $id)->delete();
      $delete = Quiz::where('id', $id)->delete();

      return 1;
    }

    public function quizImageSave(Request $request){
      $quiz_id = $request->input('quiz_id');
      $input = $request->all();
      if (Input::hasFile('quiz_image') && Input::has('quiz_image_base64')) {
          //delete old file
          if (Storage::exists($input['old_quiz_image'])) {
              Storage::delete($input['old_quiz_image']);
          }

          if (Storage::exists($input['old_thumb_image'])) {
              Storage::delete($input['old_thumb_image']);
          }

          //get filename
          $file_name   = $request->file('quiz_image')->getClientOriginalName();

          // returns Intervention\Image\Image
          $image_make = Image::make($request->input('quiz_image_base64'))->encode('jpg');

          // create path
          $path = "quiz/".$quiz_id;

          //check if the file name is already exists
          $new_file_name = SiteHelpers::checkFileName($path, $file_name);

          //save the image using storage
          Storage::put($path."/".$new_file_name, $image_make->__toString(), 'public');
          //resize image for thumbnail
          $thumb_image = "thumb_".$new_file_name;
          $resize = Image::make($request->input('quiz_image_base64'))->resize(258, 172)->encode('jpg');
          Storage::put($path."/".$thumb_image, $resize->__toString(), 'public');

          $quiz = Quiz::find($quiz_id);
          $quiz->quiz_image = $path."/".$new_file_name;
          $quiz->thumb_image = $path."/".$thumb_image;

          $quiz->save();

          return $this->return_output('flash', 'success', 'Quiz image updated successfully', 'quiz-content/'.$quiz_id, '200');
      }
    }

    public function quizImageDelete(Request $request){
      // get inputs from ajax call
      $content = $request->input('data_content');

      //unserialize and decrypt the values
      $input = json_decode(Crypt::decryptString($content));
      // echo '<pre>';print_r($input);exit;
      //clear the value in DB
      DB::table($input->model)
          ->where($input->pid, $input->id)
          ->update([$input->field => null]);
      $input->field = 'thumb_image';

      DB::table($input->model)
          ->where($input->pid, $input->id)
          ->update([$input->field => null]);
      //delete the image from storage folder
      Storage::delete($input->photo);
      Storage::delete($input->thumb);
    }

    public function quizInfoSave(Request $request){
      $quiz_id = $request->input('quiz_id');
      $quiz_title = $request->input('quiz_title');
      $category = $request->input('category');
      $price = $request->input('price');
      $passing_rate = $request->input('passing_rate');
      $time_limit = $request->input('time_limit');

      $quiz = Quiz::where('id', $quiz_id)->first();

      $quiz->title = $quiz_title;
      $quiz->category = $category;
      $quiz->price = $price;
      $quiz->passing_rate = $passing_rate;
      $quiz->time_limit = $time_limit;

      $quiz->save();

      // $data = [
      //   'quiz_title' => $quiz_title,
      //   'category' => $category,
      //   'price' => $price,
      //   'passing_rate' => $passing_rate,
      //   'time_limit' => $time_limit,
      // ];
      // dd($data);
      return $this->return_output('flash', 'success', 'Quiz info updated successfully', 'quiz-content/'.$quiz_id, '200');
    }

    public function quizList($quiz_slug = '', Request $request)
    {
        $paginate_count = 9;
        $categories = Category::where('is_active', 1)->get();

        $category_search = $request->input('category_id');
        // return $category_search . "this is it pancit";
        $prices = $request->input('price_id');
        $sort_price = $request->input('sort_price');
        $keyword = $request->input('keyword');

        $query = DB::table('quizzes')
                    ->select('quizzes.*', 'instructors.first_name', 'instructors.last_name')
                    ->join('instructors', 'instructors.id', '=', 'quizzes.instructor_id')
                    ->where('quizzes.status',1);
        //filter categories as per user selected
        if($category_search) {
            $query->whereIn('quizzes.category', $category_search);
        }
        //filter courses as per keyword
        if($keyword) {
            $query->where('quizzes.title', 'LIKE', '%' . $keyword . '%');
        }

        //filter price as per user selected
        if($prices)
        {
            $price_count = count($prices);
            $is_greater_500 = false;
            // echo $price_count;exit;
            foreach ($prices as $p => $price) {
                $p++;
                $price_split = explode('-', $price);

                if($price_count == 1)
                {
                    $from = $price_split[0];
                    if($price == 500)
                    {
                        $is_greater_500 = true;
                    }
                    else
                    {
                        $to = $price_split[1];
                    }

                }
                elseif($p==1)
                {
                    $from = $price_split[0];
                }
                elseif($p==$price_count)
                {

                    if($price == 500)
                    {
                        $is_greater_500 = true;
                    }
                    else
                    {
                        $to = $price_split[1];
                    }

                }

            }
            $query->where('quizzes.price', '>=', $from);
            if(!$is_greater_500)
            {
                $query->where('quizzes.price', '<=', $to);
            }
        }


        //filter categories as per user selected
        if($sort_price) {
            $query->orderBy('quizzes.price', $sort_price);
        }

        $quizzes = $query->groupBy('quizzes.id')->paginate($paginate_count);

        return view('site.quiz.list', compact('quizzes', 'categories'));
        // return "this page is under construction";
    }

    public function quizView($id){
      // return "site's under maintenance";
      // $course_breadcrumb = Session::get('course_breadcrumb');
      $quiz = Quiz::where('id', $id)->first();

      $instructor = Instructor::where('id', $quiz->instructor_id)->first();

      $category = Category::where('id', $quiz->category)->first();
      // $curriculum = $this->model->getcurriculum($course->id, $course_slug);
      // $count = CourseTaken::where('course_id', $course->id)->count();
      // dd($count);
      // $curriculum_sections = $curriculum['sections'];
      // $lectures_count = $curriculum['lectures_count'];
      // $videos_count = $curriculum['videos_count'];
      // $is_curriculum = $curriculum['is_curriculum'];
      // $video = null;
      // if($course->course_video)
      // {
      //     $video = $this->model->getvideoinfoFirst($course->course_video);
      // }

      return view('site.quiz.view', compact('quiz', 'instructor', 'category'));
    }
}
