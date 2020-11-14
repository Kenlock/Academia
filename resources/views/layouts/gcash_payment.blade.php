@extends('layouts.frontend.index')

@section('content')
{{-- Hidden divs with data passed from the PHP server --}}

<div id="payment-page">
  <div class="container">
    <div class="container py-5">
  <div class="row">
    <div class="col-lg-7 mx-auto">
      <div class="bg-white rounded-lg shadow-sm p-5">
        <!-- Credit card form tabs -->
        <ul role="tablist" class="nav bg-light nav-pills rounded-pill nav-fill mb-3">
          <li class="nav-item">
            <a data-toggle="pill" href="#nav-tab-card" class="nav-link active rounded-pill">
                                <i class="fas fa-wallet"></i>
                                GCash
                            </a>
          </li>
        </ul>
        <!-- End -->


        <!-- Credit card form content -->
        <div class="tab-content">

          <!-- credit card info-->
          <div id="nav-tab-card" class="tab-pane fade show active">
            <form role="form" method="POST" action="{{ route('payment.gcashmakePayment') }}">
              {{csrf_field()}}

              <div class="form-group">
                <label for="username">Full name</label>
                <input type="text" name="fullanme" placeholder="Full name" required class="form-control">
              </div>
              <div class="form-group">
                <label for="cardNumber">Phone Number</label>
                <div class="input-group">
                  <input type="text" name="cardNumber" placeholder="Gcash phone number" class="form-control" required>
                  <div class="input-group-append">
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-primary" name="submit">Submit Details</button>
            </form>
          </div>
          <!-- End -->
        </div>
        <!-- End -->

      </div>
    </div>
  </div>
  </div>
</div>

@endsection
