@extends('layouts.frontend.index')
@section('content')
<!-- content start -->
<div class="container-fluid p-0 home-content">
    <!-- banner start -->
    <div class="subpage-slide-blue">
        <div class="container">
            <h1>Course</h1>
        </div>
    </div>
    <!-- banner end -->

    <!-- breadcrumb start -->
        <div class="breadcrumb-container">
            <div class="container">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                <?php //<li class="breadcrumb-item"><a href="@if($quiz_breadcrumb) {{ $quiz_breadcrumb }} @else {{ route('course.list') }} @endif">Course List</a></li> ?>
                <li class="breadcrumb-item active" aria-current="page">{{ $quiz->title }}</li>
              </ol>
            </div>
        </div>

    <!-- breadcrumb end -->

    <div class="container">
        <div class="row mt-4">
            <!-- course block start -->
            <div class="col-xl-9 col-lg-9 col-md-8">
                    <div class="cv-course-container">
                    <h4>{{ $quiz->title }}</h4>
                    <div class="instructor-clist m-0">
                        <div class="col-md-12 p-0 m-0">
                            <i class="fa fa-chalkboard-teacher"></i>&nbsp;
                            <span>Created by <b>{{ $instructor->first_name.' '.$instructor->last_name }}</b></span>
                        </div>
                    </div>
                    <div class="row cv-header">

                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6  col-6">
                            <div class="cv-category-icon">
                                <i class="far fa-bookmark"></i>
                            </div>
                            <div class="cv-category-detail">
                                <span>Category</span>
                                <br>
                                {{ $category->name }}
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-3 col-md-6 float-md-right col-sm-6 float-sm-right col-6">
                            <div class="btn-group" role="group" aria-label="Basic example">
                              <div class="hidden" id="course_id">{{$quiz->id}}</div>
                              @if(\Auth::user())
                                @if($quiz->price > 0)
                                    <button id="addtocart" class="btn btn-success">ADD TO CART</button>
                                    <?php //<a href="{{ route('course.checkout', $quiz->course_slug) }}" class="btn btn-primary">BUY NOW</a> ?>
                                @else
                                    <?php //<a href="{{ route('course.checkout', $quiz->course_slug) }}" class="btn btn-primary">ENROLL COURSE</a> ?>
                                @endif
                              @else
                                <p>Please login or register first, to enroll or buy the courses.</p>
                              @endif
                            </div>
                        </div>
                    </div>

                    <div class="course-image mt-2">
                        <img src="@if(Storage::exists($quiz->quiz_image)){{ Storage::url($quiz->quiz_image) }}@else{{ asset('backend/assets/images/course_detail.jpg') }}@endif">
                    </div>
                </div>
            </div>
            <!-- course block end -->
        </div>
    </div>

<!-- content end -->
@endsection

@section('javascript')
<script type="text/javascript">
function toggleIcon(e)
{
    $(e.target)
        .prev('.card-header')
        .find(".accordian-icon")
        .toggleClass('fa-plus fa-minus');
}
$('.accordion').on('hidden.bs.collapse', toggleIcon);
$('.accordion').on('shown.bs.collapse', toggleIcon);

// lightbox init
function initFancybox() {
"use strict";

$('a.lightbox, [data-fancybox]').fancybox({
  parentEl: 'body',
  margin: [50, 0]
});
}
  $(function(){
    var course_id = document.getElementById('course_id').innerHTML;
       $('#addtocart').click(function() {
            $.ajax({
                url: '/cart/{course_id}',
                type: 'GET',
                data: { id: course_id },
                success: function(response)
                {
                  $.ajax({
                    url: '/cartcount',
                    type: 'GET',
                    success: function(result){
                      $('.badge').text(result);
                    }
                  });
                  toastr.options = {
                  "closeButton": true,
                  "newestOnTop": true,
                  "positionClass": "toast-top-right",
                  "timeout": "2000"
                };
                  toastr.success('Added to cart.');
                }
            });
       });
    });
</script>
@endsection
