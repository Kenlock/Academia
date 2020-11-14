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
    <li class="breadcrumb-item active">Categories</li>
  </ol>
  <h1 class="page-title">Categories</h1>
</div>

<div class="page-content">
  <div class="panel">
    <div class="panel-body">
      <form class="form-inline vali" id="add_to_table" novalidate>
        <div class="form-group mb-2">
          <label for="staticEmail2">Category Name : </label>
        </div>
        <div class="form-group mx-sm-3 mb-2">
          <input type="text" class="form-control" id="add_catName" placeholder="Category Name" required>
        </div>
        <button type="submit" class="btn btn-primary mb-2">Add to Table</button>
      </form>
      <table id="categories" class="table table-striped table-bordered" style="width:100%">
        <thead>
              <tr>
                  <th>ID</th>
                  <th>Category Name</th>
                  <th>Actions</th>
              </tr>
          </thead>
      </table>
    </div>
  </div>
</div>
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
        <h5 class="modal-title" id="editModalLabel">Edit Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="needs-validation" novalidate>
  <div class="form-row">
      <label for="category_name">Category Name</label>
      <input type="text" class="form-control" id="cat_name" placeholder="Category Name" required>
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
<!-- end of editmodal -->
@endsection

@section('javascript')
<script type="text/javascript">
  $(document).ready(function() {
    var link = "#";
    var table = $('#categories').DataTable( {
        "ordering": false,
        ajax: {
            url: '/get-categories',
            dataSrc: ''
        },
        columns: [
            { data: 'id' },
            { data: 'name' },
        ],
        "columnDefs": [
          {
            "targets": 2,
            "data": null,
            "defaultContent": '<button class="btn btn-primary" data-toggle="modal" data-target="#editModal">Edit</button>&nbsp&nbsp&nbsp<button class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Remove</button>',
            "searchable": false,
          }
        ],
    });

    $('#categories tbody').on( 'click', '.btn-danger', function () {
        var e = table.row( $(this).parents('tr') ).data();
        window.value=e['id'];
    } );

    $('#categories tbody').on( 'click', '.btn-primary', function () {
        var e = table.row( $(this).parents('tr') ).data();
        window.value = e['id'];
        $('#cat_name').val(e['name']);
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

          var form2 = document.getElementsByClassName('vali');
          var validation2 = Array.prototype.filter.call(form2, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }else{
                var add_name = $("#add_catName").val();
                $.ajax({
                  url: '/add-categories',
                  type: 'GET',
                  dataType: "json",
                  data: {
                    name: add_name
                  },
                  success: function(response){
                    toastr.options = {
                    "closeButton": true,
                    "newestOnTop": true,
                    "positionClass": "toast-top-right",
                    "timeout": "2000"
                  };
                    if(response.data == "error"){
                      toastr.error("Record already exist!");
                    }else{
                      toastr.success('Record successfully added.');
                    }
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
              url: '/remove-categories',
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


  } );
</script>
@endsection
