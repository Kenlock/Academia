<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SG Academy</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="{{ asset('frontend/css/bootstrap.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend/css/style.css') }}">
        <link rel="stylesheet" href="{{ asset('frontend/css/fancybox.css') }}">

        <link rel="stylesheet" href="{{ asset('frontend/css/font-awesome.css') }}">

        <link rel="stylesheet" href="{{ asset('backend/fonts/web-icons/web-icons.min599c.css?v4.0.2') }}">
        <link rel="stylesheet" href="{{ asset('backend/vendor/toastr/toastr.min599c.css?v4.0.2') }}">
        <!-- <script
          src="https://www.paypal.com/sdk/js?client-id=Af3EbbP185pGPneuoFJwPGbTDs7q69Sx9dh0nPNYl_Xo3zqPoerD9aVqgQ9v-HxnyqmAaMZIMu43a4kW&disable-funding=credit,card&currency=PHP"> // this is the live
        </script> -->
        <script
          src="https://www.paypal.com/sdk/js?client-id=AZFF8yoPp-1rKeVcHnTrFTO-guso-HWq8WOJcHeYyYZMZCBHIsqJj-P3hNngyC90HkcmrBU4OAgXTHPv&disable-funding=credit,card&currency=PHP"> // this is the sandbox
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <script defer src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script defer src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

        <script defer src="https://unpkg.com/ziggy-js@0.9.x/dist/js/route.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <style>
          #dropdownMenuButtonRight{
            color: white;
          }
          .hidden{
            display: none;
          }
        </style>
    </head>
    <body>
    <div class="se-pre-con"></div>
    <!-- Header -->
    <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="/">
        <img src="{{url('storage/sglogo.png')}}" width="170" height="50" alt="" loading="lazy">
      </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{{url('/browse-courses')}}">Browse Courses</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{{url('/browse-quizzes')}}">Browse Quizzes</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <?php
              $categories = SiteHelpers::active_categories();
          ?>
           @foreach ($categories as $category)
               <a class="dropdown-item" href="{{ route('course.list','category_id[]='.$category->id) }}">
                   <i class="fa {{ $category->icon_class }} category-menu-icon"></i>
                   {{ $category->name}}
               </a>
           @endforeach
         </div>
       </div>
      </li>
    </ul>
    <div class="col-sm-5 col-md-3 col-lg-2 col-xl-2 d-none d-sm-block">
        @if(Auth::check() && !Auth::user()->hasRole('instructor') && !Auth::user()->hasRole('admin'))
        <!-- <span class="become-instructor" href="{{ route('login') }}" data-toggle="modal" data-target="#myModal">Become Instructor</span> -->
         <span class="become-instructor">Become Instructor</span>
        @endif
    </div>

    <div class="col-6 col-sm-3 col-md-3 col-lg-2 col-xl-2">
        @guest
        <a class="btn btn-info" href="{{ route('login') }}">Login / Sign Up</a>
        @else
        <div class="dropdown float-xl-left float-sm-right float-right">
          <span id="dropdownMenuButtonRight" data-toggle="dropdown">{{ Auth::user()->first_name }} &nbsp;<i class="fa fa-caret-down"></i></span>&nbsp;&nbsp;&nbsp;
          <span id="dropdownMenuButtonRight"><a href="{{ route('cart.view')}}">View Cart<a/>&nbsp;<span class="badge badge-primary">{{Cart::count()}}</span></span>

         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButtonRight">

            @if(Auth::user()->hasRole('instructor'))
            <a class="dropdown-item" href="{{ route('instructor.dashboard') }}" >
                <i class="fa fa-sign-out-alt"></i> Instructor
            </a>
            @endif

            <a class="dropdown-item" href="{{ route('my.courses') }}" >
                <i class="fa fa-sign-out-alt"></i> My Courses
            </a>

            <a class="dropdown-item" href="{{ route('logOut') }}" >
                <i class="fa fa-sign-out-alt"></i> Logout
            </a>

          </div>
        </div>

        @endguest
    </div>
  </div>
</nav>
    <div id="sidebar">
        <ul>
           <li><a href="javascript:void(0)" class="sidebar-title">Categories</a></li>
           @foreach ($categories as $category)
           <li>
                <a href="{{ $category->slug }}">
                    <i class="fa {{ $category->icon_class }} category-menu-icon"></i>
                    {{ $category->name}}
                </a>
           </li>
           @endforeach
        </ul>
    </div>
    @yield('content')

    <!-- footer start -->
    <footer id="main-footer">
        <div class="row m-0">
            <div class="col-lg-2 col-md-4 col-sm-4 col-6 mt-3">
                <ul>
                    <li class="mb-1"><b>Quick Links</b></li>
                    <li><a href="{{ route('home') }}">Home Page</a></li>
                    <li><a href="{{ route('course.list') }}">Courses List</a></li>
                    <li><a href="{{ route('instructor.list') }}">Instructors List</a></li>
                    <li><a href="{{ route('blogs') }}">Blogs List</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 col-6 mt-3">
                <ul>
                    <li class="mb-1"><b>Connect with Us</b></li>
                    <li><a href="{{ route('page.about') }}">About Us</a></li>
                    <li><a href="{{ route('page.contact') }}">Contact Us</a></li>
                    <!-- <li><a href="{{ route('register') }}">Register Page</a></li>
                    <li><a href="{{ route('login') }}">Login Page</a></li> -->
                </ul>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-4 mt-3 d-none d-sm-block">
                <!-- This is for spacing -->
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12 text-center mt-4">
                <img src="{{ asset('frontend/img/logo_footer.png') }}" class="img-fluid" width="210" height="48">
                <br>
                <span id="c-copyright">
                    Copyright © 2020, Powered by uLearn Pro
                </span>
            </div>
        </div>
    </footer>
    </body>
    <script src="{{ asset('frontend/js/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('frontend/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('frontend/js/fancybox.min.js') }}"></script>
    <script src="{{ asset('frontend/js/modernizr.js') }}"></script>
    <script src="{{ asset('frontend/js/jquery.validate.js') }}"></script>

    <!-- Toastr -->
    <script src="{{ asset('backend/vendor/toastr/toastr.min599c.js?v4.0.2') }}"></script>



    <script>
    $(window).on("load", function (e){
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });
    </script>
    <script type="text/javascript">
        $(document).ready(function()
        {
            /* Delete record */
            $('.delete-record').click(function(event)
            {
                var url = $(this).attr('href');
                event.preventDefault();

                if(confirm('Are you sure want to delete this record?'))
                {
                    window.location.href = url;
                } else {
                    return false;
                }

            });

            /* Toastr messages */
            toastr.options.closeButton = true;
            toastr.options.timeOut = 5000;
            @if(session()->has('success'))
                toastr.success("{{ session('success') }}");
            @endif
            @if(session()->has('status'))
                toastr.success("{{ session('status') }}");
            @endif
            @if(session()->has('error'))
                toastr.error("{{ session('error') }}");
            @endif
            @if(session()->has('info'))
                toastr.info("{{ session('info') }}");
            @endif

            $('.mobile-nav').click(function()
            {
                $('#sidebar').toggleClass('active');

                $(this).toggleClass('fa-bars');
                $(this).toggleClass('fa-times');
            });
            $('.become-instructor').click(function (){
              // alert('yamette');
              $.ajax({
                url: '/become-instructor',
                type: 'GET',
                success: function(response){
                  toastr.options = {
                  "closeButton": true,
                  "newestOnTop": true,
                  "positionClass": "toast-top-right",
                  "timeout": "2000"
                };

                  toastr.success(response);
                }
              });
            });
            // $("#becomeInstructorForm").validate({
            //     rules: {
            //         first_name: {
            //             required: true
            //         },
            //         last_name: {
            //             required: true
            //         },
            //         contact_email:{
            //             required: true,
            //             email:true
            //         },
            //         telephone: {
            //             required: true
            //         },
            //         paypal_id:{
            //             required: true,
            //             email:true
            //         },
            //         biography: {
            //             required: true
            //         },
            //     },
            //     messages: {
            //         first_name: {
            //             required: 'The first name field is required.'
            //         },
            //         last_name: {
            //             required: 'The last name field is required.'
            //         },
            //         contact_email: {
            //             required: 'The contact email field is required.',
            //             email: 'The contact email must be a valid email address.'
            //         },
            //         telephone: {
            //             required: 'The telephone field is required.'
            //         },
            //         paypal_id: {
            //             required: 'The paypal id field is required.',
            //             email: 'The paypal id must be a valid email address.'
            //         },
            //         biography: {
            //             required: 'The biography field is required.'
            //         },
            //     }
            // });
        });
    </script>
    @yield('javascript')
</html>
