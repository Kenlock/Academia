@extends('layouts.backend.index')
@section('content')
<style type="text/css">

    label.cabinet{
    display: block;
    cursor: pointer;
}
.selected{
  color: #90caf9;
}
.hidden{
  display: none;
}
td{
  text-align: center;
}
label.cabinet input.file{
    position: relative;
    height: 100%;
    width: auto;
    opacity: 0;
    -moz-opacity: 0;
  filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);
  margin-top:-30px;
}

.cabinet.center-block{
    margin-bottom: -1rem;
}

#upload-demo{
    width: 558px;
    height: 372px;
  padding-bottom:25px;
}
figure figcaption {
    position: absolute;
    bottom: 0;
    color: #fff;
    width: 100%;
    padding-left: 9px;
    padding-bottom: 5px;
    text-shadow: 0 0 10px #000;
}
.course-image-container{
    width: 300px;
    height: 200px;
    border: 1px solid #e4eaec;;
    position: relative;
}
.course-image-container img{
    width: 258px;
    height: 172px;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
}
.remove-lp{
    font-size: 16px;
    color: red;
    float: right;
    padding-right: 2px;
}
</style>
<div class="page-header">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{ route('instructor.dashboard') }}">Dashboard</a></li>
    <li class="breadcrumb-item active">Check Profit</li>
  </ol>
  <h1 class="page-title">Profit</h1>
</div>

<div class="page-content">
  <div class="panel">
    <div class="panel-body">
      <table id="transactions" class="table table-striped table-bordered" style="width:100%">
        <thead class="thead-dark">
              <tr>
                  <th class="text-center">ID</th>
                  <th class="text-center">Profit (70% of sale)</th>
                  <th class="text-center">Date</th>
              </tr>
          </thead>
      </table>
      <div class="hidden" id="total">{{$total}}</div>
      <h3>Total Profit: {{$total}}</h3>
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#email_form">Send Withdraw Instructions</button>

      <!-- start of email modal -->
      <div class="modal fade" id="email_form" tabindex="-1" role="dialog" aria-labelledby="email_tosend" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="email_tosend">Send Withdraw Instructions</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form class="emailForm" novalidate>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Instructions</label>
                   <footer class="blockquote-footer">(Please include here if we are going to send your money using GCash or Bank Transfer)</footer>
                  <textarea class="form-control" id="message" rows="6" value=""></textarea>
                  <div class="invalid-feedback">
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary">Proceed</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- end of email form -->

    </div>
  </div>
</div>
@endsection
@section('javascript')
<script type="text/javascript">
  $(document).ready(function() {

    (function() {
        'use strict';
        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('emailForm');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{

                var message = $('#message').val();
                var total = document.getElementById('total').innerHTML

                $.ajax({
                    url: '/send-email',
                    type: 'GET',
                    dataType: "json",
                    data: {
                      message: message,
                      total : total
                    },
                    success: function(response){
                      toastr.options = {
                      "closeButton": true,
                      "newestOnTop": true,
                      "positionClass": "toast-top-right",
                      "timeout": "2000"
                    };
                      toastr.success('Email successfully sent.');
                      $('#email_form').modal('hide');
                    }
                });

                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    var link = "#";
    var table = $('#transactions').DataTable( {
        "ordering": false,
        ajax: {
            url: '/get-transactions',
            dataSrc: ''
        },
        columns: [
            { data: 'id' },
            { data: 'amount' },
            { data : 'date'}
        ]
    });

  });
  </script>
@endsection
