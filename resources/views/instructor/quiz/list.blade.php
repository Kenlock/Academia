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
    <li class="breadcrumb-item active">Quizzes</li>
  </ol>
  <h1 class="page-title">Quizzes</h1>
</div>
<div class="page-content">
  <div class="panel">
    <div class="panel-body">
      <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#addModal" >Add a Quiz</button>
      <table id="quizzes" class="table table-striped table-bordered" style="width:100%">
        <thead>
              <tr>
                  <th>ID</th>
                  <th>Quiz Name</th>
                  <th>Category</th>
                  <th>Price</th>
                  <th>Status</th>
                  <th>Actions</th>
              </tr>
          </thead>
      </table>
    </div>
  </div>
</div>
<!-- start of addModal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="lblAddModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="lblAddModal">Add Quiz</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="add-validation" novalidate>
          <div class="form-row">
            <label for="quiz_name">Quiz Name</label>
            <input type="text" class="form-control" id="quiz_name" placeholder="Quiz Name" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <div class="form-row">
            <label for="exampleFormControlSelect1">Category</label>
            <select class="form-control" id="cat_select">
              @foreach($quizzes as $quiz)
                <option value="{{$quiz->id}}">{{$quiz->name}}</option>
              @endforeach
            </select>
          </div>
          <div class="form-row">
            <label for="price">Price</label>
            <input type="number" min="0" class="form-control" id="price" placeholder="Price" required>
            <div class="invalid-feedback">
              Please don't leave this blank and use positive numbers only.
            </div>
          </div>
          <div class="form-row">
            <label for="passing_rate">Passing Rate</label>
            <input type="number" min="50" class="form-control" id="passing_rate" placeholder="Passing Rate" required>
            <div class="invalid-feedback">
              Please don't leave this blank and the minimum passing rate is 50.
            </div>
          </div>
          <div class="form-row">
            <label for="time_limit">Time Limit (in minutes)</label>
            <input type="number" min="0" class="form-control" id="time_limit" placeholder="Time Limit" required>
            <div class="invalid-feedback">
              Please don't leave this blank. Put 0 if the quiz has no time limit
            </div>
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" type="submit">Submit form</button>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
<!-- End of modal -->


<!-- start of deletemodal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmModal">Delete Confirmation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are you sure you want to delete this record? <strong>Deleting this record, removes it in our database permanently.</strong>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" id="confirm_delete">Proceed</button>
      </div>
    </div>
  </div>
</div>
<!-- End of modal -->

<!-- start of editmodal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="editModalLabel">Edit Category</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="edit-validation" novalidate>
          <div class="form-row">
            <label for="quiz_name">Quiz Name</label>
            <input type="text" class="form-control" id="edit_quiz_name" placeholder="Quiz Name" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <div class="form-row">
            <label for="exampleFormControlSelect1">Category</label>
            <select class="form-control" id="edit_cat_select">
              @foreach($quizzes as $quiz)
                <option value="{{$quiz->id}}">{{$quiz->name}}</option>
              @endforeach
            </select>
          </div>
          <div class="form-row">
            <label for="price">Price</label>
            <input type="number" min="0" class="form-control" id="edit_price" placeholder="Price" required>
            <div class="invalid-feedback">
              Please don't leave this blank and use positive numbers only.
            </div>
          </div>
          <div class="form-row">
            <label for="passing_rate">Passing Rate</label>
            <input type="number" min="50" class="form-control" id="edit_passing_rate" placeholder="Passing Rate" required>
            <div class="invalid-feedback">
              Please don't leave this blank and the minimum passing rate is 50.
            </div>
          </div>
          <div class="form-row">
            <label for="time_limit">Time Limit (in minutes)</label>
            <input type="number" min="0" class="form-control" id="edit_time_limit" placeholder="Time Limit" required>
            <div class="invalid-feedback">
              Please don't leave this blank. Put 0 if the quiz has no time limit
            </div>
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" type="submit">Submit form</button>
        </form>
  </div>
</div>
</div>
<!-- end of editmodal -->
@endsection

@section('javascript')
<script type="text/javascript">
  $(document).ready(function() {

    var link = "#";
    var table = $('#quizzes').DataTable( {
        "ordering": false,
        ajax: {
            url: '/get-quizzes',
            dataSrc: ''
        },
        columns: [
            { data: 'id' },
            { data: 'name' },
            { data: 'category' },
            { data: 'price' },
            { data: 'status' },
        ],
        "columnDefs": [
          {
            "targets": 5,
            "data": null,
            "defaultContent": '<button class="btn btn-success" id="quiz_add_question">Edit Content</button>&nbsp&nbsp&nbsp<button class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Remove</button>',
            "searchable": false,
          }
        ],
    });

    $("select#cat_select").change(function(){
        var cat_select = $(this).children("option:selected").val();
        window.value = cat_select;
    });

    $('#quizzes tbody').on( 'click', '.btn-danger', function () {
        var e = table.row( $(this).parents('tr') ).data();
        window.value=e['id'];
    } );

    $('#quizzes tbody').on( 'click', '.btn-primary', function () {
        var e = table.row( $(this).parents('tr') ).data();
        window.value = e['id'];
        $('#edit_quiz_name').val(e['name']);
        $('#edit_price').val(e['price']);
        $('#edit_passing_rate').val(e['passing_rate']);
        $('#edit_time_limit').val(e['time_limit']);
    } );

    (function() {
        'use strict';
        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{
                var edit_id = window.value; //goods
                var cat_name = $("#cat_name").val();
                $.ajax({
                  url: '/edit-categories',
                  type: 'GET',
                  dataType: "json",
                  data: {
                    id: edit_id,
                    name: cat_name
                  },
                  success: function(response){
                    toastr.options = {
                    "closeButton": true,
                    "newestOnTop": true,
                    "positionClass": "toast-top-right",
                    "timeout": "2000"
                  };

                    toastr.success(response.success);
                    $('#editModal').modal('hide');
                    table.ajax.reload();
                  }
                });
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });

          var forms3 = document.getElementsByClassName('add-validation');
          // Loop over them and prevent submission
          var validation3 = Array.prototype.filter.call(forms3, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{

                var quiz_name = $('#quiz_name').val();
                var cat_select = $('#cat_select').val();
                var price = $('#price').val();
                var passing_rate = $('#passing_rate').val();
                var time_limit = $('#time_limit').val();

                $.ajax({
                  url: '/add-quiz',
                  type: 'GET',
                  dataTypes: "json",
                  data: {
                    quiz_name : quiz_name,
                    cat_select : cat_select,
                    price : price,
                    passing_rate : passing_rate,
                    time_limit : time_limit
                  },
                  success: function(response){
                    toastr.options = {
                      "closeButton": true,
                      "newestOnTop": true,
                      "positionClass": "toast-top-right",
                      "timeout": "2000"
                    };

                    toastr.success("Quiz successfully added");
                    $('#addModal').modal('hide');
                    table.ajax.reload();
                  }
                });
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });

          var forms4 = document.getElementsByClassName('edit-validation');
          // Loop over them and prevent submission
          var validation4 = Array.prototype.filter.call(forms4, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{
                //goods now do the process here then ajax, create route first and controller function then do it here
                var n_quiz_name = $('#edit_quiz_name').val();
                var n_cat_select = $('#edit_cat_select').val();
                var n_price = $('#edit_price').val();
                var n_passing_rate = $('#edit_passing_rate').val();
                var n_time_limit = $('#edit_time_limit').val();
                var id = window.value;

                // alert("" + n_quiz_name + n_cat_select + n_price + n_passing_rate + n_time_limit);

                $.ajax({
                  url: '/edit-quiz',
                  type: 'GET',
                  dataTypes: "json",
                  data: {
                    n_quiz_name : n_quiz_name,
                    n_cat_select : n_cat_select,
                    n_price: n_price,
                    n_passing_rate : n_passing_rate,
                    n_time_limit : n_time_limit,
                    id : id,
                  },
                  success: function(response){
                    toastr.options = {
                      "closeButton": true,
                      "newestOnTop": true,
                      "positionClass": "toast-top-right",
                      "timeout": "2000"
                    };

                    toastr.success("Quiz successfully edited");
                    $('#editModal').modal('hide');
                    table.ajax.reload();
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


    $('#confirm_delete').click(function(){
      var value = window.value;
          // alert("This will delete the course with ID: "+e['id']);
          $.ajax({
              url: '/remove-quiz',
              type: 'GET',
              dataType: "json",
              data: { id: value },
              success: function(response){
                toastr.options = {
                "closeButton": true,
                "newestOnTop": true,
                "positionClass": "toast-top-right",
                "timeout": "2000"
              };
                toastr.success('Record successfully removed.');
                $('#deleteModal').modal('hide');
                table.ajax.reload();
              }
          });
    });

    $('#quizzes tbody').on( 'click', '.btn-success', function (){
      var e = table.row( $(this).parents('tr') ).data();
      var id = e['id'];
      var url = "{{route('quiz.quizInfo', ':id')}}";
      url = url.replace(':id', id);
      window.location.href = url;
    });


  } );
</script>
@endsection
