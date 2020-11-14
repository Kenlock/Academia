@extends('layouts.backend.index')
@section('content')
<div class="page-header">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{ route('instructor.dashboard') }}">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="{{ route('instructor.quiz.list') }}">Quizzes</a></li>
    <li class="breadcrumb-item active">Info</li>
  </ol>
  <h1 class="page-title">Quiz Contents</h1>
</div>

<div class="page-content">

<div class="panel">
  <div class="panel-body">


    @include('instructor/quiz/tabs')
    <div class="tab-content" id="pills-tabContent">
      @include('instructor/quiz/quiz-info')
      @include('instructor/quiz/quiz-image')
      @include('instructor/quiz/questions/mcquestions')
      @include('instructor/quiz/questions/excelImport')
      @include('instructor/quiz/questions/makeSet')
    </div>

  </div>
</div>


      <!-- End Panel Basic -->
</div>

@endsection

@section('javascript')
<script type="text/javascript">

    $(document).ready(function()
    {
      var max_fields      = 3; //maximum input boxes allowed
    	var wrapper   		= $(".input_fields_wrap"); //Fields wrapper
    	var add_button      = $(".add_field_button"); //Add button ID

    	var x = 1; //initlal text box count
      var t = 4; //for the radio value
    	$("#add_field_button").click(function(e){ //on add input button click
    		e.preventDefault();
    		if(x <= max_fields){ //max input box allowed
    			x++; //text box increment
    			$(wrapper).append('<div><input type="radio" name="options" value="'+ t +'" >&nbsp&nbsp&nbsp&nbsp<input type="text" name="mytext[]" style="width: 70%"/><a href="#" class="remove_field">&nbsp<i class="far fa-trash-alt"></i></a></div>'); //add input box
          t++;
    		}
    	});

    	$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
    		e.preventDefault(); $(this).parent('div').remove(); x--;
    	})


        var table = $('#mcquestions').DataTable( {
            "order" : [[1, "asc"]],
            ajax: {
                url: '/get-mcquestions',
                dataSrc: ''
            },
            columns: [
                { data: 'id'},
                { data: 'item_number' },
                { data: 'question' },
                { data: 'correct_answer' },
                { data: 'points' },
            ],
            "columnDefs": [
              {
                "targets": 5,
                "data": null,
                "defaultContent": '<button class="btn btn-warning" id="view_choices" ><i class="far fa-eye"></i></button>&nbsp&nbsp&nbsp<button class="btn btn-success" id="edit_question" data-toggle="modal" data-target="#editQuestionModal"><i class="far fa-edit"></i></button>&nbsp&nbsp&nbsp<button class="btn btn-danger" data-toggle="modal" data-target="#delQuestionModal"><i class="far fa-trash-alt"></i></button>',
                "searchable": false,
              },
              {
                "targets" : 0,
                "searchable": false,
                "visible" : false,
              }
            ],
        });

        $('#mcquestions tbody').on( 'click', '.btn-info', function () {
            // var e = table.row( $(this).parents('tr') ).data();
            // window.value=e['id'];
        } );

        $('#makeSet').click(function(){
          var url = "{{route('question.makeSet')}}";
          window.location.href = url;
        });

        $('#mcquestions tbody').on( 'click', '.btn-warning', function (){
          var e = table.row( $(this).parents('tr') ).data();
          var id = e['id'];
          var url = "{{route('question.choicesView', ':id')}}";
          url = url.replace(':id', id);
          window.location.href = url;
        });

        $('#download_template').click(function(){
          var url = "{{route('csv.download')}}";
          window.location.href = url;
        });

        $('#submit_choices').click(function(){

          var choices = $('input[name^=mytext]').map(function(idx, elem) {
            return $(elem).val();
          }).get();

          window.value = choices;
        });

        $('#mcquestions tbody').on( 'click', '.btn-success', function () {
            var e = table.row( $(this).parents('tr') ).data();
            window.value=e['id'];

            $('#edit_question_content').val(e['question']);
            $('#edit_correct_answer').val(e['correct_answer']);
            $('#edit_points').val(e['points']);

            // alert('editing question..');
        } );

        $('#mcquestions tbody').on( 'click', '.btn-danger', function () {
            var e = table.row( $(this).parents('tr') ).data();
            window.value=e['id'];

        } );

        //image crop start
        $(".gambar").attr("src", @if(Storage::exists($quiz->quiz_image))"{{ Storage::url($quiz->quiz_image) }}" @else "{{ asset('backend/assets/images/course_detail.jpg') }}" @endif);

        var $uploadCrop,
        tempFilename,
        rawImg,
        imageId;


        function readFile(input, id) {

            var file_name = input.files[0].name;
            var extension = (input.files[0].name).split('.').pop();
            var allowed_extensions = ["jpg", "jpeg", "png"];
            var fsize = input.files[0].size;
            toastr.options.closeButton = true;
            toastr.options.timeOut = 5000;

            if (input.files && input.files[0]) {

                if ($.inArray(extension, allowed_extensions) == -1) {
                    toastr.error("Image format mismatch");
                    return false;
                } else if(fsize > 1048576*10) {
                    toastr.error("Image size exceeds");
                    return false;
                }
                $('.input-group-file input').attr('value', file_name);
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('.upload-demo').addClass('ready');

                    $('#cropImageBtn').attr('data-id', id);

                    $('#cropImagePop').modal('show');
                    rawImg = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $uploadCrop = $('#upload-demo').croppie({
            viewport: {
                width: 558,
                height: 372,
            },
            enforceBoundary: true,
            enableExif: true
        });

        $('#cropImagePop').on('shown.bs.modal', function(){
            // alert('Shown pop');
            $uploadCrop.croppie('bind', {
                url: rawImg
            }).then(function(){
                console.log('jQuery bind complete');
            });
        });

        $('.item-img').on('change', function () { imageId = $(this).data('id'); tempFilename = $(this).val();
         readFile(this, $(this).attr('id')); });
        $('#cropImageBtn').on('click', function (ev) {
            var data_id = $(this).attr('data-id');
            $uploadCrop.croppie('result', {
                type: 'base64',
                format: 'jpeg',
                size: {width: 825, height: 550}
            }).then(function (resp) {
                $("#"+data_id+"_base64").val(resp);
                $("#"+data_id+"-output").attr("src", resp);
                $("#cropImagePop").modal("hide");
            });
        });
        //image crop end

        $(".tagsinput").tagsinput();


        $('.remove-lp').click(function(event)
        {
            event.preventDefault();
            var this_id = $(this);
            var current_id = $(this).attr('data-id');

            alertify.confirm('Are you sure want to delete this image?', function () {
                var url = "{{ url('delete-quiz-photo') }}";
                var data_content = this_id.attr('data-content');
                 $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                      data_content: data_content,
                      _token: "{{ csrf_token() }}"
                    },
                    success: function (data) {
                        $("#"+current_id+"-output").attr("src", "{{ asset('backend/assets/images/course_detail.jpg') }}");
                        this_id.hide();
                    }
                });
            }, function () {
                return false;
            });
        });

        $("#quizForm").validate({
            rules: {
                quiz_title: {
                    required: true
                },
                price: {
                    min: 0,
                    required: true
                },
                passing_rate: {
                    min: 50,
                    required: true
                },
                time_limit: {
                    min: 0,
                    required: true
                },
            },
            messages: {
                quiz_title: {
                    required: 'The quiz title field is required.'
                },
                price: {
                    required: 'The price is required and it should be positive number or 0.'
                },
                passing_rate: {
                    required: 'The instruction level field is required.'
                },
                time_limit: {
                    required: 'The instruction level field is required.'
                }
            }
        });

        (function() {
            'use strict';
            window.addEventListener('load', function() {
              // Fetch all the forms we want to apply custom Bootstrap validation styles to
              var forms = document.getElementsByClassName('mcquestion-validate');
              // Loop over them and prevent submission
              var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                  if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                  }else{

                    var question = $('#question').val();
                    var points = $('#points').val();
                    var quiz_id = $('#quiz_name').val();
                    var choices_text = [];
                    var radios = document.getElementsByName('options');

                    for (var i = 0, length = radios.length; i < length; i++) {
                      if (radios[i].checked) {
                        var option = radios[i].value;
                        break;
                      }
                    }

                    for (var i = 0, length = radios.length; i < length; i++) {
                        choices_text.push(radios[i].value);
                    }

                    var choices = $('input[name^=mytext]').map(function(idx, elem) {
                      return $(elem).val();
                    }).get();

                    // alert(question + correct_answer + points);

                    $.ajax({
                      url: '/add-question',
                      type: 'GET',
                      dataTypes: "json",
                      data: {
                        question : question,
                        points : points,
                        quiz_id : quiz_id,
                        option : option,
                        choices : choices,
                      },
                      success: function(response){
                        toastr.options = {
                          "closeButton": true,
                          "newestOnTop": true,
                          "positionClass": "toast-top-right",
                          "timeout": "2000"
                        };
                            toastr.success("Question with Choices were added successfully!");
                            $('#addQuestionModal').modal('hide');
                            table.ajax.reload();

                      }
                    });


                    $( '.mcquestion-validate' ).each(function(){
                        this.reset();
                    });
                    event.preventDefault();
                    event.stopPropagation();
                  }
                  form.classList.add('was-validated');
                }, false);
              });

              //mcquestion-edit-validate
              var forms1 = document.getElementsByClassName('mcquestion-edit-validate');
              // Loop over them and prevent submission
              var validation1 = Array.prototype.filter.call(forms1, function(form) {
                form.addEventListener('submit', function(event) {
                  if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                  }else{

                    var n_question = $('#edit_question_content').val();
                    // var n_correct_answer = $('#edit_correct_answer').val();
                    var n_points = $('#edit_points').val();
                    var n_quiz_id = $('#quiz_name').val(); //the quiz id
                    var n_id = window.value; //the question id

                    // alert(question + correct_answer + points);

                    // alert(n_question);

                    $.ajax({
                      url: '/edit-question',
                      type: 'GET',
                      dataTypes: "json",
                      data: {
                        question : n_question,
                        // correct_answer : n_correct_answer,
                        points : n_points,
                        id : n_id,
                      },
                      success: function(response){
                        toastr.options = {
                          "closeButton": true,
                          "newestOnTop": true,
                          "positionClass": "toast-top-right",
                          "timeout": "2000"
                        };

                        toastr.success("Question was edited successfully!");
                        $('#editQuestionModal').modal('hide');
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
                    url: '/remove-question',
                    type: 'GET',
                    dataType: "json",
                    data: {
                      id: value,
                    },
                    success: function(response){
                      toastr.options = {
                      "closeButton": true,
                      "newestOnTop": true,
                      "positionClass": "toast-top-right",
                      "timeout": "2000"
                    };
                      toastr.success('Question successfully removed.');
                      $('#delQuestionModal').modal('hide');
                      table.ajax.reload();
                    }
                });
          });
    });
</script>
@endsection
