<div class="tab-pane fade show active" id="pills-quizInfo" role="tabpanel" aria-labelledby="pills-quizInfo-tab">
  <form method="POST" action="{{ route('instructor.quiz.info.save') }}" id="quizForm">
    {{ csrf_field() }}
    <input type="hidden" name="quiz_id" value="{{ $quiz->id }}">
    <div class="row">

      <div class="form-group col-md-4">
          <label class="form-control-label">Quiz Title <span class="required">*</span></label>
          <input type="text" class="form-control" name="quiz_title"
              placeholder="Quiz Title" value="{{ $quiz->title }}" />
              @if ($errors->has('quiz_title'))
                  <label class="error" for="course_title">{{ $errors->first('quiz_title') }}</label>
              @endif
      </div>

      <div class="form-group col-md-4">
          <label class="form-control-label">Category <span class="required">*</span></label>
          <select class="form-control" name="category">
              @foreach($categories as $category)
                  <option value="{{ $category->id }}"
                  @if($category->id == $quiz->category_id){{ 'selected' }}@endif >
                      {{ $category->name }}
                  </option>
              @endforeach
          </select>

          @if ($errors->has('category_id'))
              <label class="error" for="category_id">{{ $errors->first('category_id') }}</label>
          @endif
      </div>

      <div class="form-group col-md-4">
          <label class="form-control-label">Price* <i class="fa fa-info-circle" data-toggle="tooltip" data-original-title="Put 0 if the quiz is free"></i></label>
          <input type="number" class="form-control" name="price"
              placeholder="Course Price" value="{{ $quiz->price }}" />
      </div>

      <div class="form-group col-md-4">
          <label class="form-control-label">Passing Rate <span class="required">*</span></label>
          <input type="number" class="form-control" name="passing_rate"
              placeholder="Passing Rate" value="{{ $quiz->passing_rate }}" />
              @if ($errors->has('passing_rate'))
                  <label class="error" for="passing_rate">{{ $errors->first('passing_rate') }}</label>
              @endif
      </div>

      <div class="form-group col-md-4">
          <label class="form-control-label">Time Limit <span class="required">*</span></label>
          <input type="number" class="form-control" name="time_limit"
              placeholder="Time Limit" value="{{ $quiz->time_limit }}" />
              @if ($errors->has('time_limit'))
                  <label class="error" for="passing_rate">{{ $errors->first('time_limit') }}</label>
              @endif
      </div>

    </div>
    <hr>
    <div class="form-group row">
      <div class="col-md-4">
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-default btn-outline">Reset</button>
      </div>
    </div>

  </form>
</div>
