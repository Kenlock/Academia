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
    <li class="breadcrumb-item"><a href="{{ route('instructor.quiz.list') }}">Quizzes</a></li>
    <li class="breadcrumb-item active">Choices</li>
  </ol>
  <h1 class="page-title">Quizzes</h1>
</div>
<div class="page-content">
  <div class="panel">
    <div class="panel-body">
      <!-- <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#addChoiceModal" >Add Choices</button> -->
      <button type="button" class="btn btn-warning mb-2" data-toggle="modal" data-target="#editAnswerModal" >Change Correct Answer</button>
      <span><b id="current_answer">The correct answer was set to: {{$correct_answer}}</b></span>
      <table id="choices" class="table table-striped table-bordered" style="width:100%">
        <thead>
              <tr>
                  <th>ID</th>
                  <th>Choice A</th>
                  <th>Choice B</th>
                  <th>Choice C</th>
                  <th>Choice D</th>
                  <th>Actions</th>
              </tr>
          </thead>
      </table>
    </div>
  </div>
</div>
<!-- edit choice modal -->
<div class="modal fade" id="editChoiceModal" tabindex="-1" role="dialog" aria-labelledby="lblEditChoicenModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="lblEditQuestionModal">Edit Question</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="choice-edit-validate" novalidate>

          <div class="form-row">
            <label for="Choice">Choice A</label>
            <input type="text" class="form-control" id="edit_choice_a" placeholder="Choice A" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <div class="form-row">
            <label for="Choice">Choice B</label>
            <input type="text" class="form-control" id="edit_choice_b" placeholder="Choice B" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <div class="form-row">
            <label for="Choice">Choice C</label>
            <input type="text" class="form-control" id="edit_choice_c" placeholder="Choice C" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <div class="form-row">
            <label for="Choice">Choice D</label>
            <input type="text" class="form-control" id="edit_choice_d" placeholder="Choice D" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
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
<!-- edit choice modal -->

<!-- edit answer modal -->
<div class="modal fade" id="editAnswerModal" tabindex="-1" role="dialog" aria-labelledby="lblEditAnswerModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="lblEditAnswerModal">Edit Answer</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="answer-edit-validate" novalidate>
          <input type="text" id="quiz_id" class="hidden" value="{{$id}}" />
          <div class="form-row">
            <label for="Choice">Choice</label>
            <input type="text" class="form-control" id="edit_answer" placeholder="Correct Answer" maxlength="1" value="{{$correct_answer}}" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
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
<!-- edit answer modal -->

@endsection

@section('javascript')
<script type="text/javascript">
  $(document).ready(function() {

    var link = "#";
    var table = $('#choices').DataTable( {
        "ordering": false,
        ajax: {
            url: '/fetch-choices',
            dataSrc: ''
        },
        columns: [
            { data: 'id' },
            { data: 'choice_a' },
            { data: 'choice_b' },
            { data: 'choice_c' },
            { data: 'choice_d' },
        ],
        "columnDefs": [
          {
            "targets": 5,
            "data": null,
            "defaultContent": '<button class="btn btn-success" id="edit_choices" data-toggle="modal" data-target="#editChoiceModal">Edit Choice</button>',
            "searchable": false,
          },
          {
            "targets": 0,
            "visible" : false,
            "searchable" : false,
          }
        ],
    });

    $('#choices tbody').on( 'click', '.btn-success', function () {
        var e = table.row( $(this).parents('tr') ).data();
        window.value=e['id'];
        $('#edit_choice_a').val(e['choice_a']);
        $('#edit_choice_b').val(e['choice_b']);
        $('#edit_choice_c').val(e['choice_c']);
        $('#edit_choice_d').val(e['choice_d']);
        // alert(e['id']);
    } );
    //
    (function() {
        'use strict';
        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('choice-edit-validate');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{
                var edit_id = window.value; //goods
                var edit_choice_a = $("#edit_choice_a").val();
                var edit_choice_b = $("#edit_choice_b").val();
                var edit_choice_c = $("#edit_choice_c").val();
                var edit_choice_d = $("#edit_choice_d").val();
                $.ajax({
                  url: '/edit-choice',
                  type: 'GET',
                  dataType: "json",
                  data: {
                    id: edit_id,
                    choice_a: edit_choice_a,
                    choice_b: edit_choice_b,
                    choice_c: edit_choice_c,
                    choice_d: edit_choice_d,
                  },
                  success: function(response){
                    toastr.options = {
                    "closeButton": true,
                    "newestOnTop": true,
                    "positionClass": "toast-top-right",
                    "timeout": "2000"
                  };

                    toastr.success('Choice is updated!');
                    $('#editChoiceModal').modal('hide');
                    table.ajax.reload();
                  }
                });
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });

          var forms1 = document.getElementsByClassName('answer-edit-validate');
          // Loop over them and prevent submission
          var validation2 = Array.prototype.filter.call(forms1, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{
                var new_answer = $('#edit_answer').val();
                var quiz_id = $('#quiz_id').val();

                $.ajax({
                  url: '/edit-answer',
                  type: 'GET',
                  dataTypes: "json",
                  data: {
                    new_answer : new_answer,
                    quiz_id : quiz_id,
                  },
                  success: function(response){
                    toastr.options = {
                    "closeButton": true,
                    "newestOnTop": true,
                    "positionClass": "toast-top-right",
                    "timeout": "2000"
                  };

                    toastr.success('Correct answer is updated!');
                    $('#editAnswerModal').modal('hide');
                    document.getElementById('current_answer').innerHTML = "The correct answer was set to: "+ new_answer;
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
    //
    //
    // $('#confirm_delete').click(function(){
    //   var value = window.value;
    //       // alert("This will delete the course with ID: "+e['id']);
    //       $.ajax({
    //           url: '/remove-quiz',
    //           type: 'GET',
    //           dataType: "json",
    //           data: { id: value },
    //           success: function(response){
    //             toastr.options = {
    //             "closeButton": true,
    //             "newestOnTop": true,
    //             "positionClass": "toast-top-right",
    //             "timeout": "2000"
    //           };
    //             toastr.success('Record successfully removed.');
    //             $('#deleteModal').modal('hide');
    //             table.ajax.reload();
    //           }
    //       });
    // });
    //
    // $('#quizzes tbody').on( 'click', '.btn-success', function (){
    //   var e = table.row( $(this).parents('tr') ).data();
    //   var id = e['id'];
    //   var url = "{{route('quiz.quizInfo', ':id')}}";
    //   url = url.replace(':id', id);
    //   window.location.href = url;
    // });


  } );
</script>
@endsection
