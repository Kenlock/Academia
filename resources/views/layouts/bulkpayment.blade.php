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
                                <i class="fa fa-credit-card"></i>
                                Credit Card
                            </a>
          </li>
          <li class="nav-item">
            <a data-toggle="pill" href="#nav-tab-bank" class="nav-link rounded-pill">
                                <i class="fa fa-university"></i>
                                 Bank Transfer
                             </a>
          </li>
        </ul>
        <!-- End -->


        <!-- Credit card form content -->
        <div class="tab-content">

          <!-- credit card info-->
          <div id="nav-tab-card" class="tab-pane fade show active">
            <form role="form" method="POST" action="{{ route('payment.makeBulkPayment') }}">
              {{csrf_field()}}
              <input name="client_key" type="hidden" value="{{$client_key}}">
              <input name="pi_id" type="hidden" value="{{$pi_id}}">
              <div class="form-group">
                <label for="username">Full name (on the card)</label>
                <input type="text" name="fullanme" placeholder="Full name" required class="form-control">
              </div>
              <div class="form-group">
                <label for="cardNumber">Card number</label>
                <div class="input-group">
                  <input type="text" name="cardNumber" placeholder="Your card number" class="form-control" required>
                  <div class="input-group-append">
                    <span class="input-group-text text">
                                                <i class="fab fa-cc-visa mx-1"></i>
                                                <i class="fab fa-cc-amex mx-1"></i>
                                                <i class="fab fa-cc-mastercard mx-1"></i>
                                            </span>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-8">
                  <div class="form-group">
                    <label><span class="hidden-xs">Expiration</span></label>
                    <div class="input-group">
                      <input type="number" placeholder="MM" name="exp_month" class="form-control" required>
                      <input type="number" placeholder="YY" name="exp_year" class="form-control" required>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group mb-4">
                    <label data-toggle="tooltip" title="Three-digits code on the back of your card" placeholder="CVV number ">CVV
                                            </label>
                    <input type="text" name="cvv" required class="form-control">
                  </div>
                </div>



              </div>
              <button type="submit" class="btn btn-primary" name="submit">Submit Details</button>
            </form>
          </div>
          <!-- End -->

          <!-- bank transfer info -->
          <div id="nav-tab-bank" class="tab-pane fade">
            <h6>Bank account details</h6>
            <dl>
              <dt>Bank</dt>
              <dd>UCPB Bank</dd>
            </dl>
            <dl>
              <dt>Account number</dt>
              <dd>7775877975</dd>
            </dl>
            <dl>
              <dt>IBAN</dt>
              <dd>CZ7775877975656</dd>
            </dl>
            <p class="text-muted">After you completed your purchase, send us the receipt or transaction screenshot to this email, <strong>sgacademy@academy.realtymlp.com</strong> to confirm your purchase and enroll you. Enroll button lists you in the "pending" list of the courses by instructor. You are going to be automatically enrolled after payment is verified.
            </p>
            <form role="form" method="POST" action="{{ route('enroll.bankTransfer') }}">
              {{csrf_field()}}
              <button type="submit" class="btn btn-primary" name="submit">Enroll</button>
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

<!-- <script type="text/javascript" src="{{ asset('js/makePaymentIntent.js') }}"></script> -->
@endsection
