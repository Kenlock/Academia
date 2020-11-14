<style type="text/css">

    label.cabinet{
    display: block;
    cursor: pointer;
}

/*label.cabinet input.file{
    position: relative;
    height: 100%;
    width: auto;
    opacity: 0;
    -moz-opacity: 0;
  filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);
  margin-top:-30px;
}*/
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
    width: 435px;
    height: 290px;
    border: 1px solid #e4eaec;;
    position: relative;
}
.course-image-container img{
    width: 399px;
    height: 266px;
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

<div class="tab-pane fade" id="pills-quizImage" role="tabpanel" aria-labelledby="pills-quizImage-tab">
  <form method="POST" action="{{ route('instructor.quiz.image.save') }}" id="quizImageForm" enctype="multipart/form-data">
    {{ csrf_field() }}
    <input type="hidden" name="quiz_id" value="{{ $quiz->id }}">
    <input type="hidden" name="old_quiz_image" value="{{ $quiz->quiz_image }}">
    <input type="hidden" name="old_thumb_image" value="{{ $quiz->thumb_image }}">
    <div class="row">

      <div class="form-group col-md-6">
          <!-- <label class="form-control-label">Course Image</label> -->

          <label class="cabinet center-block">
              <figure class="course-image-container">
                  <i data-toggle="tooltip" data-original-title="Delete" data-id="quiz_image" class="fa fa-trash remove-lp" data-content="{{  Crypt::encryptString(json_encode(array('model'=>'quizzes', 'field2'=>'thumb_image','field'=>'quiz_image', 'pid' => 'id', 'id' => $quiz->id, 'photo'=>$quiz->quiz_image, 'thumb'=>$quiz->thumb_image))) }}" style="display: @if(Storage::exists($quiz->quiz_image)){{ 'block' }} @else {{ 'none' }} @endif"></i>
                  <img src="@if(Storage::exists($quiz->quiz_image)){{ Storage::url($quiz->quiz_image) }}@else{{ asset('backend/assets/images/course_detail.jpg') }}@endif" class="gambar img-responsive" id="quiz_image-output" name="quiz_image-output" />
                  <input type="hidden" name="quiz_id" value="{{ $quiz->id }}">
              </figure>
          </label>
      </div>

      <div class="form-group col-md-6 pt-4">
          <span style="font-size: 10px;">
              Supported File Formats: jpg,jpeg,png
              <br>Dimesnion: 825px X 550px
              <br> Max File Size: 1MB
          </span>
          <hr class="my-4">
          <div class="row">
              <div class="col-md-6">
                  <div class="input-group input-group-file" data-plugin="inputGroupFile">
                      <input type="text" class="form-control" readonly="">
                      <span class="input-group-btn">
                        <span class="btn btn-success btn-file">
                          <i class="icon wb-upload" aria-hidden="true"></i>
                          <input type="file" class="item-img file center-block" name="quiz_image" id="quiz_image" />
                          <input type="hidden" name="quiz_image_base64" id="quiz_image_base64">
                        </span>
                      </span>
                  </div>
              </div>

              <div class="col-md-6">
                  <button type="submit" class="btn btn-primary">Submit</button>
              </div>
          </div>
      </div>

    </div>
  </form>
</div>

<div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Photo</h4>
            </div>
            <div class="modal-body">
                <div id="upload-demo" class="center-block"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="cropImageBtn" class="btn btn-primary">Crop</button>
            </div>
        </div>
    </div>
</div>
