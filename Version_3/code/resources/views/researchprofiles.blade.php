@extends('layouts.layout')
<style>
    .count {
        background-color: #fff;
        padding: 2px 0;
        border-radius: 5px;
    }

    .count-title {
        font-size: 25px;
        font-weight: normal;
        margin-top: 10px;
        margin-bottom: 0;
        text-align: center;
        line-height: 1.8;
        font-weight: 800;
    }

    .count-text {
        font-size: 13px;
        font-weight: normal;
        margin-top: 5px;
        margin-bottom: 0;
        text-align: center;
        color: #000;
    }

    .fa-2x {
        margin: 0 auto;
        float: none;
        display: table;
        color: #4ad1e5;
    }

    .chart-container {
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .bt {
        text-align: left;
        /* จัดตำแหน่งไปทางซ้าย */
    }

    .chart-wrapper {
        position: relative;
    }

    .chart-wrapper canvas {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    /* เพิ่มความสูงให้กับกราฟ */
    #publicationChart,
    #citationChart {
        height: 180px;
    }

    /* เพิ่มสไตล์สำหรับปุ่ม */
    .toggle-btn {
        position: absolute;
        bottom: 10px;
        /* ปรับให้ปุ่มอยู่ด้านล่าง */
        left: 50%;
        /* กำหนดให้ปุ่มอยู่กลาง */
        transform: translateX(-50%);
        /* ทำให้ปุ่มอยู่ตรงกลาง */
        font-size: 20px;
        cursor: pointer;
        background: none;
        border: none;
        color: #000;
    }
</style>

@section('content')

    <div class="container cardprofile mt-5">
        <div class="card">
            <div class="row g-0">
                <div class="col-md-2">
                    <img class="card-image" src="{{$res->picture}}" alt="">
                </div>
                <div class="col-md-5">
                    <div class="card-body">
                        <h6 class="card-text"><b>{{$res->position_th}} {{$res->fname_th}} {{$res->lname_th}}</b></h6>
                        @if($res->doctoral_degree == 'Ph.D.')
                            <h6 class="card-text"><b>{{$res->fname_en}} {{$res->lname_en}}, {{$res->doctoral_degree}} </b>
                        @else
                            <h6 class="card-text"><b>{{$res->fname_en}} {{$res->lname_en}}</b>
                        @endif</h6>
                            <h6 class="card-text1"><b>{{$res->academic_ranks_en}}</b></h6>
                            <h6 class="card-text1">E-mail: {{$res->email}}</h6>
                            <h6 class="card-title">{{ trans('message.education') }}</h6>
                            @foreach($res->education as $edu)
                                <h6 class="card-text2 col-sm-10"> {{$edu->year}} {{$edu->qua_name}} {{$edu->uname}}</h6>
                            @endforeach

                    </div>
                </div>

                <div class="col-md-5">
                    <div class="d-flex align-items-end">
                        <h6 class="title-pub mb-0 mr-5" style="font-size: 16px;">{{ trans('message.publications2') }}</h6>
                        <h6 class="mb-0 ml-3" style="font-size: 16px;">h-index: <span
                                id="h-index-result">กำลังคำนวณ...</span></h6>
                        <h6 class="mb-0 ml-3" style="font-size: 16px;">i10-index: <span
                                id="i10-index-result">กำลังคำนวณ...</span></h6>
                        <h6 class="mb-0 ml-3" style="font-size: 16px;">Total Citations: <span
                                id="total-citations-result">กำลังคำนวณ...</span></h6>
                    </div>

                    <div class="">
                        <div class="clearfix"></div>
                        <div class="row text-cente mr-5">
                            <div class="col">
                                <div class="count" id="all" style="cursor: pointer;"></div>
                            </div>
                            <div class="col">
                                <div class="count" id="scopus_sum" style="cursor: pointer;"></div>
                            </div>
                            <div class="col">
                                <div class="count" id="wos_sum" style="cursor: pointer;"></div>
                            </div>
                            <div class="col">
                                <div class="count" id="tci_sum" style="cursor: pointer;"></div>
                            </div>
                            <div class="col">
                                <div class="count" id="google_scholar" style="cursor: pointer;"></div>
                            </div>
                            <div class="mt-0 position-relative">
                                <canvas id="publicationChart" style="cursor: pointer;"></canvas>
                                <canvas id="citationChart" style="display: none;"></canvas>
                                <!-- ปุ่มสำหรับสลับกราฟ -->
                                <br>
                                <button id="toggle-chart" class="toggle-btn">></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- กราฟ -->
        <!-- <div class="chart-container position-relative"
                                                                    style="overflow: hidden; width: 100%; max-width: 1000px; margin: auto; padding: 20px;">
                                                                    <div class="chart-wrapper d-flex justify-content-center align-items-center"
                                                                        style="gap: 20px; width: 100%;"> -->
        <!-- กราฟการตีพิมพ์ -->
        <!-- <canvas id="publicationChart" class="chart-item"
                                                                            style="cursor: pointer;"></canvas> -->
        <!-- กราฟ Citations -->
        <!-- <canvas id="citationChart" class="chart-item"
                                                                            style="display: none; cursor: pointer; width: 100%; height: 100%; max-height: 500px;"></canvas> -->
        <!-- </div> -->
        <!-- <span id="toggle-chart"
                                                                        style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); font-size: 20px; cursor: pointer;">&gt;</span> -->
        <!-- </div> -->

        <br>



        <div class="d-flex justify-content-between align-items-center">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button"
                        role="tab" aria-controls="home" aria-selected="true">Summary</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="scopus-tab" data-bs-toggle="tab" data-bs-target="#scopus" type="button"
                        role="tab" aria-controls="scopus" aria-selected="false">SCOPUS</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="wos-tab" data-bs-toggle="tab" data-bs-target="#wos" type="button"
                        role="tab" aria-controls="wos" aria-selected="false">Web of Science</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tci-tab" data-bs-toggle="tab" data-bs-target="#tci" type="button"
                        role="tab" aria-controls="tci" aria-selected="false">TCI</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="scholar-tab" data-bs-toggle="tab" data-bs-target="#scholar" type="button"
                        role="tab" aria-controls="scholar" aria-selected="false">
                        Google Scholar
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="book-tab" data-bs-toggle="tab" data-bs-target="#book" type="button"
                        role="tab" aria-controls="book" aria-selected="false">หนังสือ</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="patent-tab" data-bs-toggle="tab" data-bs-target="#patent" type="button"
                        role="tab" aria-controls="patent" aria-selected="false">ผลงานวิชาการด้านอื่นๆ</button>
                </li>
            </ul>
            <a class="btn btn-success" href="{{ route('excel', ['id' => $res->id]) }}" target="_blank">Export To Excel</a>
        </div>
        <br>
        <div class="tab-content" id="myTabContent">

            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="table-responsive">
                    <table id="papersTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Paper Name</th>
                                <th>Citations</th>
                                <th>Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($papers as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {!! html_entity_decode(preg_replace('<inf>', 'sub', $paper->paper_name)) !!}
                                        <div id="collapse-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->teacher as $author)
                                                    <span>
                                                        <a href="{{ route('detail', Crypt::encrypt($author->id))}}">
                                                            <teacher>{{$author->fname_en}} {{$author->lname_en}}</teacher>
                                                        </a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>Document Type: {{$paper->paper_type}}</p>
                                            <p>Page: {{$paper->paper_page}}</p>
                                            <p>Journals/Transactions: {{$paper->paper_sourcetitle}}</p>
                                            <p>Doi: {{$paper->paper_doi}}</p>
                                            <p>Source:
                                                @foreach ($paper->source as $s)
                                                    <span>
                                                        <a>{{$s->source_name}}@if (!$loop->last) , @endif</a>
                                                    </span>
                                                @endforeach
                                            </p>
                                        </div>
                                    </td>
                                    <td>{{ $paper->paper_citation }}</td>
                                    <td>{{ $paper->paper_yearpub }}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="scopus" role="tabpanel" aria-labelledby="scopus-tab">
                <div class="table-responsive">
                    <table id="scopusTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Paper Name</th>
                                <th>Citations</th>
                                <th>Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($papers_scopus as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {!! html_entity_decode(preg_replace('<inf>', 'sub', $paper->paper_name)) !!}
                                        <div id="collapse-scopus-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->teacher as $author)
                                                    <span>
                                                        <a href="{{ route('detail', Crypt::encrypt($author->id))}}">
                                                            <teacher>{{$author->fname_en}} {{$author->lname_en}}</teacher>
                                                        </a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>Document Type: {{$paper->paper_type}}</p>
                                            <p>Page: {{$paper->paper_page}}</p>
                                            <p>Journals/Transactions: {{$paper->paper_sourcetitle}}</p>
                                            <p>Doi: {{$paper->paper_doi}}</p>
                                            <p>Source:
                                                @foreach ($paper->source as $s)
                                                    <span>
                                                        <a>{{$s->source_name}}@if (!$loop->last) , @endif</a>
                                                    </span>
                                                @endforeach
                                            </p>
                                        </div>
                                    </td>
                                    <td>{{ $paper->paper_citation }}</td>
                                    <td>{{ $paper->paper_yearpub }}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-scopus-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="wos" role="tabpanel" aria-labelledby="wos-tab">
                <div class="table-responsive">
                    <table id="wosTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Paper Name</th>
                                <th>Citations</th>
                                <th>Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($papers_wos as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {!! html_entity_decode(preg_replace('<inf>', 'sub', $paper->paper_name)) !!}
                                        <div id="collapse-wos-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->teacher as $author)
                                                    <span>
                                                        <a href="{{ route('detail', Crypt::encrypt($author->id))}}">
                                                            <teacher>{{$author->fname_en}} {{$author->lname_en}}</teacher>
                                                        </a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>Document Type: {{$paper->paper_type}}</p>
                                            <p>Page: {{$paper->paper_page}}</p>
                                            <p>Journals/Transactions: {{$paper->paper_sourcetitle}}</p>
                                            <p>Doi: {{$paper->paper_doi}}</p>
                                            <p>Source:
                                                @foreach ($paper->source as $s)
                                                    <span>
                                                        <a>{{$s->source_name}}@if (!$loop->last) , @endif</a>
                                                    </span>
                                                @endforeach
                                            </p>
                                        </div>
                                    </td>
                                    <td>{{ $paper->paper_citation }}</td>
                                    <td>{{ $paper->paper_yearpub }}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-wos-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="tci" role="tabpanel" aria-labelledby="tci-tab">
                <div class="table-responsive">
                    <table id="tciTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Paper Name</th>
                                <th>Citations</th>
                                <th>Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($papers_tci as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {!! html_entity_decode(preg_replace('<inf>', 'sub', $paper->paper_name)) !!}
                                        <div id="collapse-tci-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->teacher as $author)
                                                    <span>
                                                        <a href="{{ route('detail', Crypt::encrypt($author->id))}}">
                                                            <teacher>{{$author->fname_en}} {{$author->lname_en}}</teacher>
                                                        </a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>Document Type: {{$paper->paper_type}}</p>
                                            <p>Page: {{$paper->paper_page}}</p>
                                            <p>Journals/Transactions: {{$paper->paper_sourcetitle}}</p>
                                            <p>Doi: {{$paper->paper_doi}}</p>
                                            <p>Source:
                                                @foreach ($paper->source as $s)
                                                    <span>
                                                        <a>{{$s->source_name}}@if (!$loop->last) , @endif</a>
                                                    </span>
                                                @endforeach
                                            </p>
                                        </div>
                                    </td>
                                    <td>{{ $paper->paper_citation }}</td>
                                    <td>{{ $paper->paper_yearpub }}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-tci-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="scholar" role="tabpanel" aria-labelledby="scholar-tab">
                <div class="table-responsive">
                    <table id="scholarTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Paper Name</th>
                                <th>Citations</th>
                                <th>Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($papers_google as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {!! html_entity_decode(preg_replace('<inf>', 'sub', $paper->paper_name)) !!}
                                        <div id="collapse-scholar-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->teacher as $author)
                                                    <span>
                                                        <a href="{{ route('detail', Crypt::encrypt($author->id))}}">
                                                            <teacher>{{$author->fname_en}} {{$author->lname_en}}</teacher>
                                                        </a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>Document Type: {{$paper->paper_type}}</p>
                                            <p>Page: {{$paper->paper_page}}</p>
                                            <p>Journals/Transactions: {{$paper->paper_sourcetitle}}</p>
                                            <p>Ciations: {{$paper->paper_citation}}</p>
                                            <p>Doi: {{$paper->paper_doi}}</p>
                                            <p>Source:
                                                @foreach ($paper->source as $s)
                                                    <span>
                                                        <a>{{$s->source_name}}@if (!$loop->last) , @endif</a>
                                                    </span>
                                                @endforeach
                                            </p>
                                        </div>
                                    </td>
                                    <td>{{ $paper->paper_citation }}</td>
                                    <td>{{ $paper->paper_yearpub }}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-scholar-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="book" role="tabpanel" aria-labelledby="book-tab">
                <div class="table-responsive">
                    <table id="bookTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Year</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($book_chapter as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {{$paper->ac_name}}
                                        <div id="collapse-book-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->user as $author)
                                                    <span>
                                                        <a> {{$author->fname_en}} {{$author->lname_en}}</a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>สถานที่พิมพ์: {{$paper->ac_sourcetitle}}</p>
                                            <p>Page: {{$paper->ac_page}}</p>
                                        </div>
                                    </td>
                                    <td>{{ date('Y', strtotime($paper->ac_year)) + 543 }}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-book-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="patent" role="tabpanel" aria-labelledby="patent-tab">
                <div class="table-responsive">
                    <table id="patentTable" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>ประเภท</th>
                                <th>วันที่จดทะเบียน</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($patent as $paper)
                                <tr>
                                    <td style="width:50%;">
                                        {{$paper->ac_name}}
                                        <div id="collapse-patent-{{ $paper->id }}" class="collapse">
                                            <!-- ข้อมูลที่เหลือที่ต้องการแสดง -->
                                            <p>Author:
                                                @foreach ($paper->author as $author)
                                                    <span>
                                                        <a>{{$author->author_fname}} {{$author->author_lname}}</a>
                                                    </span>
                                                @endforeach
                                                @foreach ($paper->user as $author)
                                                    <span>
                                                        <a href="{{ route('detail', Crypt::encrypt($author->id))}}">
                                                            <teacher>{{$author->fname_en}} {{$author->lname_en}}</teacher>
                                                        </a>
                                                    </span>
                                                @endforeach
                                            </p>
                                            <p>ประเภท: {{$paper->ac_type}}</p>
                                            <p>หมายเลขทะเบียน: {{$paper->ac_refnumber }}</p>
                                        </div>
                                    </td>
                                    <td>{{$paper->ac_type}}</td>
                                    <td>{{$paper->ac_year}}</td>
                                    <td>
                                        <a href="#" class="show-more" data-target="#collapse-patent-{{ $paper->id }}"
                                            data-id="{{ $paper->id }}">Show more ▼</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#papersTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false,
                    order: [2, 'desc']
                });

                $('#scholarTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false
                });

                $('#scopusTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false,
                    order: [2, 'desc']
                });

                $('#wosTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false,
                    order: [2, 'desc']
                });

                $('#tciTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false,
                    order: [2, 'desc']
                });

                $('#bookTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false,
                    order: [2, 'desc']
                });

                $('#patentTable').DataTable({
                    paging: true,
                    lengthChange: true,
                    searching: true,
                    ordering: true,
                    info: true,
                    autoWidth: false,
                    order: [2, 'desc']
                });

                $(document).on("click", ".show-more", function (e) {
                    e.preventDefault();
                    let target = $(this).data("target");
                    $(target).collapse('toggle');
                    $(target).on('shown.bs.collapse', function () {
                        $(`a[data-target="${target}"]`).text('Show less ▲');
                    });
                    $(target).on('hidden.bs.collapse', function () {
                        $(`a[data-target="${target}"]`).text('Show more ▼');
                    });
                });
            });
        </script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.js"></script>
        <script type="text/javascript"
            src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.js"></script>
        <script type="text/javascript"
            src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap5.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

        <script>
            $(document).ready(function () {

                var table1 = $('#example1').DataTable({
                    responsive: true,
                });

                var table2 = $('#example2').DataTable({
                    responsive: true,
                });
                var table3 = $('#example3').DataTable({
                    responsive: true,
                });
                var table4 = $('#example4').DataTable({
                    responsive: true,
                });
                var table5 = $('#example5').DataTable({
                    responsive: true,
                });
                var table6 = $('#example6').DataTable({
                    responsive: true,
                });


                $('button[data-bs-toggle="tab"]').on('shown.bs.tab', function (event) {
                    var tabID = $(event.target).attr('data-bs-target');
                    if (tabID === '#scopus') {
                        table2.columns.adjust().draw()
                    }
                    if (tabID === '#wos') {
                        table3.columns.adjust().draw()
                    }
                    if (tabID === '#tci') {
                        table4.columns.adjust().draw()
                    }
                    if (tabID === '#book') {
                        table5.columns.adjust().draw()
                    }
                    if (tabID === '#patent') {
                        table6.columns.adjust().draw()
                    }

                });

            });
        </script>

    </div>
    <script>
        var paper_tci_s = <?php echo $paper_tci_s; ?>;
        var paper_scopus_s = <?php echo $paper_scopus_s; ?>;
        var paper_wos_s = <?php echo $paper_wos_s; ?>;
        var paper_book_s = <?php echo $paper_book_s; ?>;
        var paper_patent_s = <?php echo $paper_patent_s; ?>;
        var paper_scholar_s = <?php echo $papers_google; ?>;
        //console.log(paper_book_s);
        let sumtci = 0;
        let sumsco = 0;
        let sumwos = 0;
        let sumbook = 0;
        let sumpatent = 0;
        let sumScholar = 0;
        (function ($) {
            for (let i = 0; i < paper_scopus_s.length; i++) {
                sumsco += paper_scopus_s[i];
            }
            for (let i = 0; i < paper_tci_s.length; i++) {
                sumtci += paper_tci_s[i];
            }
            for (let i = 0; i < paper_wos_s.length; i++) {
                sumwos += paper_wos_s[i];
            }
            for (let i = 0; i < paper_book_s.length; i++) {
                sumbook += paper_book_s[i];
            }
            for (let i = 0; i < paper_patent_s.length; i++) {
                sumpatent += paper_patent_s[i];
            }
            for (let i = 0; i < paper_scholar_s.length; i++) {
                sumScholar += 1;
            }

            let sum = sumScholar + sumsco + sumwos + sumtci;

            //$("#scopus").append('data-to="100"');
            document.getElementById("all").innerHTML += `
                                                            <h2 class="timer count-title count-number" data-to="${sum}" data-speed="1500"></h2>
                                                            <p class="count-text ">SUMMARY</p>`

            document.getElementById("scopus_sum").innerHTML += `
                                                            <h2 class="timer count-title count-number" data-to="${sumsco}" data-speed="1500"></h2>
                                                            <p class="count-text">SCOPUS</p>`

            document.getElementById("wos_sum").innerHTML += `
                                                            <h2 class="timer count-title count-number" data-to="${sumwos}" data-speed="1500"></h2>
                                                            <p class="count-text ">WOS</p>`

            document.getElementById("tci_sum").innerHTML += `
                                                            <h2 class="timer count-title count-number" data-to="${sumtci}" data-speed="1500"></h2>
                                                            <p class="count-text ">TCI</p>`

            document.getElementById("google_scholar").innerHTML += `
                                                            <h2 class="timer count-title count-number" data-to="${sumScholar}" data-speed="1500"></h2>
                                                            <p class="count-text ">Google Scholar</p>`

            //document.getElementById("scopus").appendChild('data-to="100"');
            $.fn.countTo = function (options) {
                options = options || {};

                return $(this).each(function () {
                    // set options for current element
                    var settings = $.extend({}, $.fn.countTo.defaults, {
                        from: $(this).data('from'),
                        to: $(this).data('to'),
                        speed: $(this).data('speed'),
                        refreshInterval: $(this).data('refresh-interval'),
                        decimals: $(this).data('decimals')
                    }, options);

                    // how many times to update the value, and how much to increment the value on each update
                    var loops = Math.ceil(settings.speed / settings.refreshInterval),
                        increment = (settings.to - settings.from) / loops;

                    // references & variables that will change with each update
                    var self = this,
                        $self = $(this),
                        loopCount = 0,
                        value = settings.from,
                        data = $self.data('countTo') || {};

                    $self.data('countTo', data);

                    // if an existing interval can be found, clear it first
                    if (data.interval) {
                        clearInterval(data.interval);
                    }
                    data.interval = setInterval(updateTimer, settings.refreshInterval);

                    // initialize the element with the starting value
                    render(value);

                    function updateTimer() {
                        value += increment;
                        loopCount++;

                        render(value);

                        if (typeof (settings.onUpdate) == 'function') {
                            settings.onUpdate.call(self, value);
                        }

                        if (loopCount >= loops) {
                            // remove the interval
                            $self.removeData('countTo');
                            clearInterval(data.interval);
                            value = settings.to;

                            if (typeof (settings.onComplete) == 'function') {
                                settings.onComplete.call(self, value);
                            }
                        }
                    }

                    function render(value) {
                        var formattedValue = settings.formatter.call(self, value, settings);
                        $self.html(formattedValue);
                    }
                });
            };

            $.fn.countTo.defaults = {
                from: 0, // the number the element should start at
                to: 0, // the number the element should end at
                speed: 1000, // how long it should take to count between the target numbers
                refreshInterval: 100, // how often the element should be updated
                decimals: 0, // the number of decimal places to show
                formatter: formatter, // handler for formatting the value before rendering
                onUpdate: null, // callback method for every time the element is updated
                onComplete: null // callback method for when the element finishes updating
            };

            function formatter(value, settings) {
                return value.toFixed(settings.decimals);
            }
        }(jQuery));

        jQuery(function ($) {
            // custom formatting example
            $('.count-number').data('countToOptions', {
                formatter: function (value, options) {
                    return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
                }
            });

            // start all the timers
            $('.timer').each(count);

            function count(options) {
                var $this = $(this);
                options = $.extend({}, options || {}, $this.data('countToOptions') || {});
                $this.countTo(options);
            }
        });

        // h-index i10-index
        document.addEventListener("DOMContentLoaded", function () {
            function calculateHIndex() {
                let citations = [];
                // ดึงค่าจำนวน Citation จากคอลัมน์ที่ 8 (Citations)
                document.querySelectorAll("#papersTable  tbody tr").forEach(row => {
                    let citationCell = row.cells[1]; // คอลัมน์ที่ 8 (Citations)
                    if (citationCell) {
                        let citation = parseInt(citationCell.textContent.trim()) || 0;
                        citations.push(citation);
                    }
                });
                // เรียงลำดับ Citation จากมากไปน้อย
                citations.sort((a, b) => b - a);
                // คำนวณค่า H-Index
                let h_index = 0;
                for (let i = 0; i < citations.length; i++) {
                    if (citations[i] >= i + 1) {
                        h_index = i + 1;
                    } else {
                        break;
                    }
                }
                // แสดงผลลัพธ์ H-Index บนหน้าเว็บ
                document.getElementById("h-index-result").textContent = h_index;
            }

            function calculateI10Index() {
                let i10_index = 0;
                document.querySelectorAll("#papersTable tbody tr").forEach(row => {
                    let citationCell = row.cells[1]; // คอลัมน์ที่ 1 (Citations)
                    if (citationCell) {
                        let citation = parseInt(citationCell.textContent.trim()) || 0;
                        if (citation >= 10) {
                            i10_index++;
                        }
                    }
                });

                // แสดงผลลัพธ์ i10-Index บนหน้าเว็บ
                document.getElementById("i10-index-result").textContent = i10_index;
            }

            // เรียกใช้ฟังก์ชันเมื่อโหลดหน้าเว็บ
            calculateHIndex();
            calculateI10Index();
        });

    </script>

    <!-- เพิ่มโค้ด JavaScript สำหรับสร้างกราฟ -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

    <script>
        if (typeof Chart !== 'undefined') {
            Chart.defaults.scale.ticks.precision = -1;
            Chart.defaults.scale.ticks.stepSize = 0;
        }

        document.addEventListener("DOMContentLoaded", function () {
            let googleScholarData = {};
            let scopusData = {};
            let wosData = {};
            let tciData = {};
            let publicationsPerYear = {};
            let citationsPerYear = {};
            let currentFilterType = "summary"; // เก็บประเภทฟิลเตอร์ปัจจุบัน

            // เพิ่ม CSS สำหรับ Modal
            const styleElement = document.createElement('style');
            styleElement.textContent = `
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 999;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0,0,0,0.5);
                    opacity: 0;
                    transition: opacity 0.3s ease;
                }

                .modal-content {
                    background-color: white;
                    margin: 10% auto;
                    padding: 20px;
                    width: 60%;
                    border-radius: 10px;
                    text-align: center;
                    max-width: 700px;
                }

                .close {
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                    cursor: pointer;
                }
            `;
            document.head.appendChild(styleElement);

            // เพิ่ม Modal HTML ใน DOM
            const modalHTML = `
                <div id="chartPopup" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h3>รายละเอียดข้อมูลทั้งหมด</h3>
                        <canvas id="popupCanvas"></canvas>
                    </div>
                </div>`;

            // เพิ่ม Modal ไปที่ body
            document.body.insertAdjacentHTML('beforeend', modalHTML);

            function updateChart(filterType) {
                // ตรวจสอบว่ากราฟ Citation ถูกแสดงอยู่หรือไม่
                if (document.getElementById("citationChart").style.display !== "none") {
                    console.warn(`⚠️ ไม่สามารถเปลี่ยนกราฟได้ขณะนี้`);
                    return;
                }

                currentFilterType = filterType; // บันทึกฟิลเตอร์ปัจจุบัน
                let data = {};

                if (filterType === "summary") {
                    data = publicationsPerYear;
                } else if (filterType === "google_scholar") {
                    data = googleScholarData;
                } else if (filterType === "scopus") {
                    data = scopusData;
                } else if (filterType === "tci") {
                    data = tciData;
                } else if (filterType === "wos") {
                    data = wosData;
                }

                let years = Object.keys(data).map(y => parseInt(y)).sort((a, b) => a - b);
                let counts = years.map(y => data[y]);

                if (counts.length === 0) {
                    console.warn(`⚠️ ไม่มีข้อมูลสำหรับ ${filterType}`);
                    return;
                }

                // กรณีแสดงเฉพาะ 5 ปีล่าสุด (สำหรับกราฟหลัก)
                let displayYears = years;
                let displayCounts = counts;

                if (years.length > 5) {
                    // แสดงเฉพาะ 5 ปีล่าสุด
                    displayYears = years.slice(-5);
                    displayCounts = counts.slice(-5);
                }

                console.log(`📊 Data for Chart (recent 5 years):`, { years: displayYears, counts: displayCounts });
                console.log(`📊 All Data:`, { years, counts });

                // เลือกว่าจะอัพเดทกราฟไหน
                if (window.myChart) {
                    window.myChart.destroy();
                }

                var ctx = document.getElementById("publicationChart").getContext("2d");
                let backgroundColor, borderColor;

                switch (filterType) {
                    case "summary":
                        backgroundColor = "rgba(91, 237, 140, 0.6)";
                        borderColor = "rgb(75, 192, 93)";
                        break;
                    case "google_scholar":
                        backgroundColor = "rgba(255, 142, 142, 0.82)";
                        borderColor = "rgba(220, 12, 12, 0.6)";
                        break;
                    case "scopus":
                        backgroundColor = "rgba(255, 141, 41, 0.6)";
                        borderColor = "rgb(248, 131, 41)";
                        break;
                    case "wos":
                        backgroundColor = "rgba(41, 137, 255, 0.6)";
                        borderColor = "rgb(29, 109, 206)";
                        break;
                    case "tci":
                        backgroundColor = "rgba(112, 102, 255, 0.6)";
                        borderColor = "rgba(153, 102, 255, 1)";
                        break;
                    default:
                        backgroundColor = "rgba(150, 150, 150, 0.6)";
                        borderColor = "rgba(150, 150, 150, 1)";
                        break;
                }

                window.myChart = new Chart(ctx, {
                    type: "bar",
                    data: {
                        labels: displayYears,
                        datasets: [{
                            label: filterType.toUpperCase(),
                            backgroundColor: backgroundColor,
                            borderColor: borderColor,
                            borderWidth: 2,
                            hoverBorderWidth: 3,
                            data: displayCounts,
                            maxBarThickness: 40,
                            barPercentage: 0.8,
                            categoryPercentage: 0.9
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        layout: { padding: { top: 20, bottom: 20 } },
                        plugins: {
                            legend: { display: false },
                            tooltip: { enabled: true }
                        },
                        scales: {
                            y: {
                                type: 'linear',
                                beginAtZero: true,
                                min: 0,
                                max: function (context) {
                                    const max = Math.max(...context.chart.data.datasets[0].data);
                                    return Math.ceil(max) + 1;
                                },
                                ticks: {
                                    precision: -1,
                                    callback: function (value) {
                                        return Math.floor(value);
                                    },
                                    stepSize: 3,
                                    autoSkip: false
                                },
                                grid: {
                                    drawTicks: true,
                                    drawBorder: true
                                }
                            },
                            x: {
                                ticks: { autoSkip: false, align: 'center', maxRotation: 45, minRotation: 45 },
                                grid: { drawTicks: true, drawBorder: true }
                            },

                        },
                        legend: { display: true, onClick: (e) => e.stopPropagation() },

                    }
                });

                // กำหนดความสูงของกราฟใหม่
                document.getElementById("publicationChart").style.height = "180px";

                // เก็บข้อมูลทั้งหมดไว้ใช้ใน popup
                window.allYears = years;
                window.allCounts = counts;
            }

            function showPopupChart(filterType) {
                let modal = document.getElementById("chartPopup");
                modal.style.display = "block";

                setTimeout(() => {
                    let canvas = document.getElementById("popupCanvas");
                    let ctx = canvas.getContext("2d");

                    if (window.popupChart instanceof Chart) {
                        window.popupChart.destroy();
                    }

                    let backgroundColor, borderColor;

                    switch (filterType) {
                        case "summary":
                            backgroundColor = "rgba(91, 237, 140, 0.6)";
                            borderColor = "rgb(75, 192, 93)";
                            break;
                        case "google_scholar":
                            backgroundColor = "rgba(255, 142, 142, 0.82)";
                            borderColor = "rgba(220, 12, 12, 0.6)";
                            break;
                        case "scopus":
                            backgroundColor = "rgba(255, 141, 41, 0.6)";
                            borderColor = "rgb(248, 131, 41)";
                            break;
                        case "wos":
                            backgroundColor = "rgba(41, 137, 255, 0.6)";
                            borderColor = "rgb(29, 109, 206)";
                            break;
                        case "tci":
                            backgroundColor = "rgba(112, 102, 255, 0.6)";
                            borderColor = "rgba(153, 102, 255, 1)";
                            break;
                        default:
                            backgroundColor = "rgba(150, 150, 150, 0.6)";
                            borderColor = "rgba(150, 150, 150, 1)";
                            break;
                    }

                    // ใช้ข้อมูลทั้งหมด (ไม่ใช่แค่ 5 ปีล่าสุด)
                    window.popupChart = new Chart(ctx, {
                        type: "bar",
                        data: {
                            labels: window.allYears,
                            datasets: [{
                                label: `ข้อมูลทั้งหมด (${filterType.toUpperCase()})`,
                                backgroundColor: backgroundColor,
                                borderColor: borderColor,
                                borderWidth: 2,
                                hoverBorderWidth: 3,
                                data: window.allCounts,
                                maxBarThickness: 40,
                                barPercentage: 0.8,
                                categoryPercentage: 0.9
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: true,
                            layout: { padding: { top: 20, bottom: 20 } },
                            plugins: {
                                legend: { display: false },
                                tooltip: { enabled: true }
                            },
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    min: 0,
                                    max: Math.ceil(Math.max(...window.allCounts) + 2),
                                    ticks: { stepSize: 1, precision: -1 },
                                    grid: { drawTicks: true, drawBorder: true }
                                },
                                x: {
                                    ticks: { autoSkip: false, align: 'center', maxRotation: 45, minRotation: 45 },
                                    grid: { drawTicks: true, drawBorder: true }
                                }
                            },
                            legend: { display: true, onClick: (e) => e.stopPropagation() },
                        }
                    });

                    modal.style.opacity = "1";
                }, 100);
            }

            function processTableData() {
                publicationsPerYear = {};
                googleScholarData = {};
                scopusData = {};
                wosData = {};
                tciData = {};
                citationsPerYear = {};

                document.querySelectorAll("#papersTable tbody tr").forEach(row => {
                    let yearCell = row.cells[2];
                    let citationCell = row.cells[1];
                    let showMoreLink = row.querySelector(".show-more");
                    let sourceText = "";

                    if (!yearCell || !yearCell.textContent) {
                        console.warn("⚠️ Missing year data in row:", row);
                        return;
                    }

                    let year = parseInt(yearCell.textContent.trim()) || 0;
                    let citation = parseInt(citationCell.textContent.trim()) || 0;

                    console.log("🟢 Year Found:", year);

                    if (year) {
                        publicationsPerYear[year] = (publicationsPerYear[year] || 0) + 1;
                        citationsPerYear[year] = (citationsPerYear[year] || 0) + citation;
                    }

                    if (showMoreLink) {
                        let targetDiv = document.querySelector(showMoreLink.getAttribute("data-target"));
                        if (targetDiv) {
                            let sourceElement = Array.from(targetDiv.querySelectorAll("p")).find(p => p.textContent.includes("Source:"));
                            if (sourceElement) {
                                sourceText = sourceElement.textContent.replace("Source:", "").trim().toLowerCase();
                            }
                        }
                    }

                    console.log(`🔹 Year: ${year}, Source: ${sourceText}`);

                    if (year) {
                        if (sourceText.includes("google scholar")) {
                            googleScholarData[year] = (googleScholarData[year] || 0) + 1;
                        } else if (sourceText.includes("scopus")) {
                            scopusData[year] = (scopusData[year] || 0) + 1;
                        } else if (sourceText.includes("web of science")) {
                            wosData[year] = (wosData[year] || 0) + 1;
                        } else if (sourceText.includes("tci")) {
                            tciData[year] = (tciData[year] || 0) + 1;
                        }
                    }
                });

                console.log("📊 Debug: WOS Data ก่อนส่งเข้า Chart", wosData);

                if (Object.keys(publicationsPerYear).length === 0) {
                    console.warn("⚠️ ไม่มีข้อมูลใน publicationsPerYear");
                } else {
                    updateChart("summary");
                }

                // คำนวณผลรวม citation ทุกปี
                let totalCitations = Object.values(citationsPerYear).reduce((acc, curr) => acc + curr, 0);

                // แสดงผลรวม citation บนหน้าเว็บ
                document.getElementById("total-citations-result").textContent = totalCitations;

                // วาดกราฟ Citation Chart
                var ctxCitation = document.getElementById("citationChart").getContext("2d");
                window.citationChart = new Chart(ctxCitation, {
                    type: "bar",
                    data: {
                        labels: Object.keys(citationsPerYear).map(y => parseInt(y)).sort((a, b) => a - b),
                        datasets: [{
                            label: "Citations",
                            backgroundColor: "rgba(153, 102, 255, 0.2)",
                            borderColor: "rgba(153, 102, 255, 1)",
                            borderWidth: 2,
                            hoverBorderWidth: 3,
                            data: Object.keys(citationsPerYear).map(y => citationsPerYear[y]),
                            fill: true
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        layout: {
                            padding: {
                                top: 20,
                                bottom: 20
                            }
                        },
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: "Year"
                                },
                                ticks: {
                                    autoSkip: true,
                                    maxRotation: 30,
                                    minRotation: 30
                                }
                            },
                            y: {
                                beginAtZero: true,
                                min: 0,
                                suggestedMax: Math.max(...Object.values(citationsPerYear)) + 10,
                                title: {
                                    display: true,
                                    text: "Number of Citations"
                                },
                                ticks: {
                                    stepSize: 1,
                                    precision: 0
                                },
                                grid: {
                                    color: "rgba(0, 0, 0, 0.1)"
                                }
                            }
                        },
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: function (tooltipItem) {
                                        return tooltipItem.dataset.label + ": " + tooltipItem.raw;
                                    }
                                }
                            }
                        }
                    }
                });

                // กำหนดความสูงของกราฟใหม่
                document.getElementById("citationChart").style.height = "180px";
            }

            // ✅ เรียกใช้เพื่อดึงข้อมูลตารางและวาดกราฟ summary
            processTableData();

            // ✅ ตั้งค่า Event ให้ปุ่มเปลี่ยนกราฟเมื่อกด
            document.getElementById("google_scholar").addEventListener("click", function () {
                updateChart("google_scholar");
            });

            document.getElementById("scopus_sum").addEventListener("click", function () {
                updateChart("scopus");
            });

            document.getElementById("wos_sum").addEventListener("click", function () {
                updateChart("wos");
            });

            document.getElementById("tci_sum").addEventListener("click", function () {
                updateChart("tci");
            });

            document.getElementById("all").addEventListener("click", function () {
                updateChart("summary");
            });

            // เพิ่มฟังก์ชันสลับกราฟ
            document.getElementById("toggle-chart").addEventListener("click", function () {
                var barChartElement = document.getElementById("publicationChart");
                var citationChartElement = document.getElementById("citationChart");

                if (barChartElement.style.display === "none") {
                    barChartElement.style.display = "block";
                    citationChartElement.style.display = "none";
                    this.innerHTML = "&gt;"; // เปลี่ยนปุ่มไปทางขวา
                } else {
                    barChartElement.style.display = "none";
                    citationChartElement.style.display = "block";
                    this.innerHTML = "&lt;"; // เปลี่ยนปุ่มไปทางซ้าย
                }

                // กำหนดความสูงของกราฟใหม่
                barChartElement.style.height = "180px";
                citationChartElement.style.height = "180px";
            });

            // เพิ่ม event listener สำหรับการคลิกที่กราฟ (เปิด popup)
            document.getElementById("publicationChart").addEventListener("click", function () {
                showPopupChart(currentFilterType);
            });

            // ปิด Modal เมื่อคลิกที่ปุ่มปิด
            document.querySelector(".close").addEventListener("click", function () {
                let modal = document.getElementById("chartPopup");
                modal.style.opacity = "0";
                setTimeout(() => {
                    modal.style.display = "none";
                }, 300);

                if (window.popupChart instanceof Chart) {
                    window.popupChart.destroy();
                }
            });

            // ปิด Modal เมื่อคลิกนอกพื้นที่ Modal
            document.getElementById("chartPopup").addEventListener("click", function (event) {
                if (event.target === this) {
                    this.style.opacity = "0";
                    setTimeout(() => {
                        this.style.display = "none";
                    }, 300);

                    if (window.popupChart instanceof Chart) {
                        window.popupChart.destroy();
                    }
                }
            });

            // นำฟังก์ชัน showPopupChart มาไว้ใน window เพื่อให้เรียกใช้ได้จากภายนอก
            window.showPopupChart = showPopupChart;
        });
    </script>

@endsection