@extends('dashboards.users.layouts.user-dash-layout')

@section('title', 'Dashboard')

@section('content')
    <!-- Meta tag สำหรับ CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

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
                    <a class="btn btn-primary btn-icon-text btn-sm mb-3" id="call-paper-btn" href="{{ route('callscopus', Crypt::encrypt(Auth::user()->id)) }}"><i class="mdi mdi-refresh btn-icon-prepend icon-sm"></i> Call Paper</a>
                @endif
                <div id="loading" style="display: none; text-align: center; padding: 20px;">
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
                    @foreach ($papers->sortByDesc('paper_yearpub') as $i => $paper)
                        <tr>
                            <td>{{ $i + 1 }}</td>
                            <td>{{ Str::limit($paper->paper_name, 50) }}</td>
                            <td>{{ Str::limit($paper->paper_type, 50) }}</td>
                            <td>{{ $paper->paper_yearpub }}</td>
                            <td>
                                <form action="{{ route('papers.destroy', $paper->id) }}" method="POST">
                                    <li class="list-inline-item">
                                        <a class="btn btn-outline-primary btn-sm" type="button" data-toggle="tooltip" data-placement="top" title="view" href="{{ route('papers.show', $paper->id) }}"><i class="mdi mdi-eye"></i></a>
                                    </li>
                                    @if(Auth::user()->can('update', $paper))
                                        <li class="list-inline-item">
                                            <a class="btn btn-outline-success btn-sm" type="button" data-toggle="tooltip" data-placement="top" title="Edit" href="{{ route('papers.edit', Crypt::encrypt($paper->id)) }}"><i class="mdi mdi-pencil"></i></a>
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

    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.3/css/fixedHeader.bootstrap4.min.css">

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/fixedheader/3.2.3/js/dataTables.fixedHeader.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        // ตรวจสอบว่า jQuery และ DataTables โหลดสำเร็จหรือไม่
        if (typeof jQuery === 'undefined') {
            console.error('jQuery failed to load');
        } else {
            console.log('jQuery loaded successfully');
        }

        if (typeof $.fn.DataTable === 'undefined') {
            console.error('DataTables failed to load');
        } else {
            console.log('DataTables loaded successfully');
        }

        $(document).ready(function() {
            try {
                // เริ่มต้น DataTable
                var table1 = $('#example1').DataTable({
                    responsive: true,
                    fixedHeader: true
                });
                console.log('DataTable initialized successfully');
            } catch (e) {
                console.error('Error initializing DataTable: ', e);
            }

            // จัดการการคลิกปุ่ม Call Paper
            $('#call-paper-btn').on('click', function(event) {
                event.preventDefault();
                var url = $(this).attr('href');
                console.log('Calling URL: ', url);

                // แสดง Loading
                $('#loading').css('display', 'block');

                // ส่งคำขอ AJAX
                $.ajax({
                    url: url,
                    type: 'GET',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(response) {
                        $('#loading').css('display', 'none');
                        Swal.fire({
                            title: 'Success!',
                            text: 'Paper data retrieved successfully.',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then(function() {
                            location.reload();
                        });
                    },
                    error: function(xhr) {
                        $('#loading').css('display', 'none');
                        var errorMessage = xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : 'Failed to retrieve paper data.';
                        Swal.fire({
                            title: 'Error!',
                            text: errorMessage,
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            });
        });
    </script>
@stop
