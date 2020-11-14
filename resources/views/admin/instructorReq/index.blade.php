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
    <li class="breadcrumb-item active">Requests</li>
  </ol>
  <h1 class="page-title">Become Instructor Requests</h1>
</div>

<div class="page-content">

<div class="panel">
  <div class="panel-body">
    <table id="reqs" class="table table-striped table-bordered" style="width:100%">
      <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email Address</th>
                <th>Actions</th>
                <th>User ID</th>
            </tr>
        </thead>
    </table>
  </div>
</div>

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
</div>
@endsection

@section('javascript')
<script type="text/javascript">
  $(document).ready(function() {
    var link = "#";
    var table = $('#reqs').DataTable( {
        "ordering": false,
        ajax: {
            url: '/get-requests',
            dataSrc: ''
        },
        columns: [
            { data: 'id' },
            { data: 'name' },
            { data: 'email' },
        ],
        "columnDefs": [
          {
            "targets": 3,
            "data": null,
            "defaultContent": '<button class="btn btn-success">Approve</button>&nbsp&nbsp&nbsp<button class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Remove</button>',
            "searchable": false,
          },
          {
            "targets": 4,
            "visible": false,
            "searchable": false,
            "data": 'user_id'
          }
        ],
    });

    $('#reqs tbody').on( 'click', '.btn-success', function () {
      var e = table.row( $(this).parents('tr') ).data();
      var stud_id = e['user_id'];

      $.ajax({
        url: '/accept-requests',
        type: 'GET',
        dataType: "json",
        data: { id: stud_id },
        success: function(response){
          toastr.options = {
          "closeButton": true,
          "newestOnTop": true,
          "positionClass": "toast-top-right",
          "timeout": "2000"
        };

          toastr.success(response.success);
          // swal("Enrollment Success!", "You have successfully enrolled the student to your course.", "success");
          table.ajax.reload();
        }
      });
    } );

    $('#reqs tbody').on( 'click', '.btn-danger', function () {
        var e = table.row( $(this).parents('tr') ).data();
        window.value=e['id'];
    } );

    $('#confirm_delete').click(function(){
      var value = window.value;
          // alert("This will delete the course with ID: "+e['id']);
          $.ajax({
              url: '/remove-requests',
              type: 'GET',
              dataType: "json",
              data: { id: value },
              success: function(response){
                $('#deleteModal').modal('hide');
                table.ajax.reload();
              }
          });

    })
  } );
</script>
@endsection
