@extends('layouts.frontend.index')
@section('content')
 <!-- content start -->
    <div class="container-fluid p-0 home-content">
        <!-- banner start -->
        <div class="subpage-slide-blue">
            <div class="container">
                <h1>Checkout</h1>
            </div>
        </div>
        <!-- banner end -->
        <!-- breadcrumb start -->
            <div class="breadcrumb-container">
                <div class="container">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="@if($course_breadcrumb) {{ $course_breadcrumb }} @else {{ route('course.list') }} @endif">Course List</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('course.view', $course->course_slug) }}">Course</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                  </ol>
                </div>
            </div>
            @if(Session::has('notif'))
              <div class="alert alert-danger">
                Your previous paymenth order is cancelled. Please check other payment methods here and contact your card provider for details.
              </div>
              <?php
                session()->forget('notif');
              ?>
            @endif

        <article class="container mt-4">
            <div class="row">
               <div class="col-xl-7 offset-xl-3 col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                    <h6 class="underline-heading mb-4">Confirm Purchase</h6>


                    <div class="row mb-1">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-4">
                            <img src="@if(Storage::exists($course->thumb_image)){{ Storage::url($course->thumb_image) }}@else{{ asset('backend/assets/images/course_detail_thumb.jpg') }}@endif" width="120" height="90">
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9 col-8">
                            <h6 class="mb-xl-0">{{ $course->course_title }}</h6>
                            <div class="instructor-clist mb-0 mt-1 d-sm-block d-none">
                                <div class="ml-1">
                                    <i class="far fa-bookmark"></i>&nbsp;&nbsp;
                                    <span>Category <b>{{ $course->category->name }}</b></span>
                                </div>
                            </div>
                            <div class="instructor-clist mb-0 mt-1">
                                <div>
                                    <i class="fa fa-chalkboard-teacher"></i>&nbsp;
                                    <span>Created by <b>{{ $course->instructor->first_name.' '.$course->instructor->last_name }}</b></span>
                                </div>
                            </div>
                            @php $course_price = $course->price == 0.00 ? 'Free' : config('config.default_currency').$course->price; @endphp
                            <h6 class="c-price-checkout">{{  $course_price }}&nbsp;<s>{{ $course->strike_out_price ? $course->strike_out_price : '' }}</s></h6>
                        </div>

                    </div>

                    <div class="col-xl-7 offset-xl-2 col-lg-8 offset-lg-2 col-md-9 offset-md-2 col-sm-9 offset-sm-2 col-11 offset-1">
                      @if($course->price == 0.00)
                          <form method="POST" action="{{ route('payment.takeCourse') }}" enctype="multipart/form-data">
                          {{ csrf_field() }}

                          <input type="hidden" name="course_id" value="{{ $course->id }}">
                          <input type="hidden" name="payment_method" value="free_subcription">
                          <input type="hidden" name="course_title" value="{{ $course->course_title }}">

                          <div class="form-group mt-4">
                              <button type="submit" class="btn btn-lg btn-block social-btn facebook-btn">
                                  <div class="row">
                                      <div class="col-3">
                                          <i class="fas fa-cart-arrow-down float-right"></i>
                                      </div>
                                      <div class="col-9">
                                          <span>
                                          Subscribe to the course
                                          </span>
                                      </div>
                                  </div>
                              </button>
                          </div>
                          <b>Note: After subscribing to a course or quiz, you are going to be redirected to homepage. Wait for your adviser to approve your enrollment.</b>
                          </form>
                      @else
                            <form method="POST" action="{{ route('payment.form') }}" enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <input type="hidden" name="course_id" value="{{ $course->id }}">
                            <div class="form-group mt-4">
                                <button type="submit" class="btn btn-lg btn-block social-btn facebook-btn">
                                    <div class="row">
                                        <div class="col-3">
                                            <i class="far fa-credit-card float-right"></i>
                                        </div>
                                        <div id="card-button-container">Pay with Card</div>
                                    </div>
                                </button>
                            </div>

                            </form>
                            <form method="POST" action="{{ route('payment.gcashForm') }}" enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <input type="hidden" name="course_id" value="{{ $course->id }}">
                            <div id = "amount_hid" class="hidden">{{$course->price}}</div>
                            <div id = "course_id" class="hidden">{{$course->id}}</div>
                            <div class="form-group mt-4">
                                <button type="submit" class="btn btn-lg btn-block social-btn facebook-btn">
                                    <div class="row">
                                        <div class="col-3">
                                            <i class="fas fa-wallet float-right"></i>
                                        </div>
                                        <div id="gcash-button-container">Pay with GCash</div>
                                    </div>
                                </button>
                            </div>



                            </form>


                                                                    <div id="paypal-button-container"></div>
                    @endif
                  </div>
               </div>
            </div>



        </article>


    <!-- content end -->
@endsection

@section('javascript')
<script type="text/javascript">
var redirect = "{{route('my.courses')}}";
var amount = document.getElementById('amount_hid').innerHTML;
var course_id = document.getElementById('course_id').innerHTML;
paypal.Buttons({
createOrder: function(data, actions) {
  // This function sets up the details of the transaction, including the amount and line item details.
  return actions.order.create({
    purchase_units: [{
      amount: {
        value: amount
      }
    }]
  });
},
onApprove: function(data, actions) {
  // This function captures the funds from the transaction.
  return actions.order.capture().then(function(details) {
    // This function shows a transaction success message to your buyer.
    $.ajax({
        url: '/enroll',
        type: 'GET',
        data: { id: course_id },
        success: function(response)
        {
            alert(response);
            document.location.href=redirect;
        }
    });
  });
}
}).render('#paypal-button-container');
//This function displays Smart Payment Buttons on your web page.
</script>
@endsection
