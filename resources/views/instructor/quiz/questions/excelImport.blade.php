<div class="tab-pane fade" id="pills-excelimport" role="tabpanel" aria-labelledby="pills-excelimport-tab">
  <button type="button" id="download_template" class="btn btn-secondary mb-2">Download Excel template</button><br>
  * After editing the excel file with the needed fields, you can upload it and import the question data from the file
  <form action="{{ route('importQuestions') }}" method="POST" enctype="multipart/form-data">
      @csrf
      <input type="file" name="file" class="form-control">
      <br>
      <button class="btn btn-success">Import Question Data</button>
  </form>
</div>
