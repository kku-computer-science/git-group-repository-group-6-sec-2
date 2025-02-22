@extends('dashboards.users.layouts.user-dash-layout')
<link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.3/css/fixedHeader.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css">
@section('title','Dashboard')
@section('content')
<div class="container">
    @if ($message = Session::get('success'))
    <div class="alert alert-success">
        <p>{{ $message }}</p>
    </div>
    @endif
    <div class="card" style="padding: 16px;">
        <div class="card-body">
            <h4 class="card-title">Published research</h4>
            <a class="btn btn-primary btn-menu btn-icon-text btn-sm mb-3" href="{{ route('papers.create') }}"><i class="mdi mdi-plus btn-icon-prepend"></i> ADD </a>
            @if(Auth::user()->hasRole('teacher'))
            <a class="btn btn-primary btn-icon-text btn-sm mb-3" id="call-paper-btn" href="{{ route('callscopus',Crypt::encrypt(Auth::user()->id)) }}"><i class="mdi mdi-refresh btn-icon-prepend icon-sm"></i> Call Paper</a>
            @endif
            <div id="loading" style="display: none; text-align: center;">
                <i class="mdi mdi-loading mdi-spin" style="font-size: 24px;"></i> Loading data...
            </div>
            <table id="example1" class="table table-striped">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>ชื่อเรื่อง</th>
                        <th>ประเภท</th>
                        <th>ปีที่ตีพิมพ์</th>
                        <th width="280px">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($papers->sortByDesc('paper_yearpub') as $i=>$paper)
                    <tr>
                        <td>{{ $i+1 }}</td>
                        <td>{{ Str::limit($paper->paper_name,50) }}</td>
                        <td>{{ Str::limit($paper->paper_type,50) }}</td>
                        <td>{{ $paper->paper_yearpub }}</td>
                        <td>
                            <form action="{{ route('papers.destroy',$paper->id) }}" method="POST">
                                <li class="list-inline-item">
                                    <a class="btn btn-outline-primary btn-sm" type="button" data-toggle="tooltip" data-placement="top" title="view" href="{{ route('papers.show',$paper->id) }}"><i class="mdi mdi-eye"></i></a>
                                </li>
                                @if(Auth::user()->can('update',$paper))
                                <li class="list-inline-item">
                                    <a class="btn btn-outline-success btn-sm" type="button" data-toggle="tooltip" data-placement="top" title="Edit" href="{{ route('papers.edit',Crypt::encrypt($paper->id)) }}"><i class="mdi mdi-pencil"></i></a>
                                </li>
                                @endif
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <br>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" defer></script>
<script src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.min.js" defer></script>
<script src="https://cdn.datatables.net/fixedheader/3.2.3/js/dataTables.fixedHeader.min.js" defer></script>
<script>
    $(document).ready(function() {
        var table1 = $('#example1').DataTable({
            responsive: true,
        });

        $('#call-paper-btn').click(function(event) {
            event.preventDefault();
            $('#loading').show();
            $.ajax({
                url: $(this).attr('href'),
                type: 'GET',
                success: function(response) {
                    $('#loading').hide();
                    swal({
                        title: 'Success!',
                        text: 'Paper data retrieved successfully.',
                        icon: 'success',
                    }).then(function() {
                        location.reload();
                    });
                },
                error: function(xhr) {
                    $('#loading').hide();
                    swal({
                        title: 'Error!',
                        text: xhr.responseJSON.message || 'Failed to retrieve paper data.',
                        icon: 'error',
                    });
                }
            });
        });
    });
</script>
@stop
