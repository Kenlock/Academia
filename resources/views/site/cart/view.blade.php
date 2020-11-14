@extends('layouts.frontend.index')
@section('content')
<!-- content start -->
    <div class="container-fluid p-0 home-content">
        <!-- banner start -->
        <div class="subpage-slide-blue">
            <div class="container">
                <h1>My Cart</h1>
            </div>
        </div>
        <!-- banner end -->

        <!-- breadcrumb start -->
        <div class="breadcrumb-container">
            <div class="container">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">My Cart</li>
              </ol>
            </div>
        </div>
      </div>
        <!-- breadcrumb end -->

        @if(Cart::count() > 0)
        <!-- Cart list start -->
        <article class="container mt-4">
          <div class="panel">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Product Name</th>
                  <th scope="col">Price</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                @foreach($cart_content as $cart)
                  <tr>
                    <th scope="row" id="course_id">{{$cart->id}}</th>
                    <td>{{$cart->name}}</td>
                    <td>{{$cart->price}}</td>
                    <td><a href="{{route('cart.delete', $cart->rowId)}}" class="btn btn-danger">Remove</button></td>
                  </tr>
                @endforeach
              </tbody>
            </table>
            <div class="col-xl-7 offset-xl-2 col-lg-8 offset-lg-2 col-md-9 offset-md-2 col-sm-9 offset-sm-2 col-11 offset-1">
              <form method="POST" action="{{ route('payment.card') }}" enctype="multipart/form-data">
              {{ csrf_field() }}
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
              <form method="POST" action="{{ route('payment.bulkgcash') }}" enctype="multipart/form-data">
              {{ csrf_field() }}
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
              <div class="float-center" id="paypal-button-container"></div>
            </div>
            <div class="hidden" id="amount_hid" >{{Cart::total()}}</div>
            <h5 class="float-right" >Total Amount: {{Cart::total()}}</h5>
          </div>
        </article>
        <!-- cart list end -->
        @else
        <article class="container mt-4">
          <div class="panel">
            <h1 style="text-align: center">There are no items in your cart</h1>
          </div>
        </article>
        @endif
@endsection
@section('javascript')
<script type="text/javascript">
var redirect = "{{route('my.courses')}}";
var amount = document.getElementById('amount_hid').innerHTML;
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
    var content = [];
    @foreach($cart_content as $c)
      content.push({{$c->id}});
    @endforeach
    $.ajax({
        url: '/bulk-enroll',
        type: 'GET',
        dataType: "json",
        data: { id: content }
    });
    alert("Transaction completed. You are going to be redirected to your enrolled courses page!");
    document.location.href=redirect;
  });
}
}).render('#paypal-button-container');
//This function displays Smart Payment Buttons on your web page.
</script>
@endsection
