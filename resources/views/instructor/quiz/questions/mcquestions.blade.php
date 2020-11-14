<br>

<div class="tab-pane fade" id="pills-mcquestions" role="tabpanel" aria-labelledby="pills-mcquestions-tab">
  <!-- this is for the questions part rendered here {{$quiz->id}} -->
  <!-- {{session('quiz_id')}} -->
  <input type="hidden" name="quiz_id" id="quiz_name" value="{{session('quiz_id')}}" />
  <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#addQuestionModal" >Add Question</button>
        <table id="mcquestions" class="table table-striped table-bordered" style="width:100%">
          <thead>
                <tr>
                    <th>ID</th>
                    <th>Item Number</th>
                    <th>Question</th>
                    <th>Correct Answer</th>
                    <th>Point(s)</th>
                    <th>Actions</th>
                </tr>
            </thead>
        </table>
</div>
<!-- add question modal -->
<div class="modal fade" id="addQuestionModal" tabindex="-1" role="dialog" aria-labelledby="lblAddQuestionModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="lblAddQuestionModal">Add Question</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="mcquestion-validate" novalidate>

          <div class="form-row">
            <label for="question">Question</label>
            <input type="text" class="form-control" id="question" placeholder="Question" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <div class="form-row">
            <label for="points">Point(s)</label>
            <input type="number" min="1" class="form-control" id="points" placeholder="Point(s)" required>
            <div class="invalid-feedback">
              Please don't leave this blank and use positive numbers only.
            </div>
          </div><br>
          <p>Please fill in the multiple choices below. Don't leave any fields here empty.</p>
          <div class="input_fields_wrap">
              <div><input type="radio" name="options" value="0" checked>&nbsp&nbsp&nbsp&nbsp<input type="text" name="mytext[]" style="width: 70%"></div>
              <div><input type="radio" name="options" value="1" >&nbsp&nbsp&nbsp&nbsp<input type="text" name="mytext[]" style="width: 70%"></div>
              <div><input type="radio" name="options" value="2" >&nbsp&nbsp&nbsp&nbsp<input type="text" name="mytext[]" style="width: 70%"></div>
              <div><input type="radio" name="options" value="3" >&nbsp&nbsp&nbsp&nbsp<input type="text" name="mytext[]" style="width: 70%"></div>
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class="btn btn-primary" type="submit" id="submit_choices">Submit form</button>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
<!-- add question modal -->

<!-- edit question modal -->
<div class="modal fade" id="editQuestionModal" tabindex="-1" role="dialog" aria-labelledby="lblEditQuestionModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="lblEditQuestionModal">Edit Question</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="mcquestion-edit-validate" novalidate>

          <div class="form-row">
            <label for="question">Question</label>
            <input type="text" class="form-control" id="edit_question_content" placeholder="Question" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div>
          </div>
          <!-- <div class="form-row">
            <label for="correct_answer">Correct Answer</label>
            <input type="text" class="form-control" id="edit_correct_answer" placeholder="Correct Answer" maxlength="1" required>
            <div class="invalid-feedback">
              Please don't leave this blank.
            </div> -->
          <!-- </div> -->
          <div class="form-row">
            <label for="points">Point(s)</label>
            <input type="number" min="1" class="form-control" id="edit_points" placeholder="Point(s)" required>
            <div class="invalid-feedback">
              Please don't leave this blank and use positive numbers only.
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
<!-- edit question modal -->

<!-- delete question modal -->

<div class="modal fade" id="delQuestionModal" tabindex="-1" role="dialog" aria-labelledby="lblDelQuestionModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lblDelQuestionModal">Delete Confirmation</h5>
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
<!-- delete question modal -->
