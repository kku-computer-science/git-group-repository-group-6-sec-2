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

    

</style>

@section('content')

<div class="container cardprofile mt-5">
    <div class="card">
        <div class="row g-0">
            <div class="col-md-2">
                <img class="card-image" src="{{$res->picture}}" alt="">
            </div>
            <div class="col-md-6">
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
                        @foreach( $res->education as $edu)
                        <h6 class="card-text2 col-sm-10"> {{$edu->year}} {{$edu->qua_name}} {{$edu->uname}}</h6>
                        @endforeach

                </div>
            </div>

            <div class="col-md-4">
                <div class="d-flex align-items-end">
                    <h6 class="title-pub mb-0 mr-5" style="font-size: 16px;">{{ trans('message.publications2') }}</h6>
                    <h6 class="mb-0 ml-3" style="font-size: 16px;">h-index: <span id="h-index-result">กำลังคำนวณ...</span></h6>
                </div>

                <div class="col-xs-12 text-center bt">
                    <div class="clearfix"></div>
                    <div class="row text-center">
                        <div class="col">
                            <div class="count" id="all"></div>
                        </div>
                        <div class="col">
                            <div class="count" id="scopus_sum"></div>
                        </div>
                        <div class="col">
                            <div class="count" id="wos_sum"></div>
                        </div>
                        <div class="col">
                            <div class="count" id="tci_sum"></div>
                        </div>
                        <div class="col">
                            <div class="count" id="google_scholar"></div>
                        </div>
                    </div>
                    <!-- กราฟ -->
                    <div class="chart-container position-relative" style="overflow: hidden; width: 100%;">
                        <div class="chart-wrapper d-flex">
                            <!-- กราฟการตีพิมพ์ -->
                            <canvas id="barChart" class="chart-item" style="cursor: pointer;"></canvas>
                            <!-- กราฟ Citations -->
                            <canvas id="citationChart" class="chart-item" style="display: none; cursor: pointer;"></canvas>
                        </div>
                        <span id="toggle-chart" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); font-size: 20px; cursor: pointer;">&gt;</span>
                    </div>
                </div>
            </div>
            
                    <!-- <div class="text-center mt-3">
                        <a href="{{ route('history.chart', ['userId' => $res->id]) }}" class="btn btn-dark btn-lg shadow rounded-pill px-4 py-3">
                            <i class="fas fa-chart-line me-2"></i>แสดงกราฟการตีพิมพ์ทั้งหมด
                        </a>
                    </div>
                    <div class="text-center mt-4">
                        <a href="{{ route('citation-h-index', ['userId' => $res->id]) }}" class="btn btn-primary btn-lg shadow rounded-pill px-4 py-3">
                            <i class="fas fa-chart-line me-2"></i> แสดงกราฟ Citations
                        </a>
                    </div> -->
        </div>
    </div>
    <br>
    


    <div class="d-flex justify-content-between align-items-center">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
             <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Summary</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="scopus-tab" data-bs-toggle="tab" data-bs-target="#scopus" type="button" role="tab" aria-controls="scopus" aria-selected="false">SCOPUS</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="wos-tab" data-bs-toggle="tab" data-bs-target="#wos" type="button" role="tab" aria-controls="wos" aria-selected="false">Web of Science</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tci-tab" data-bs-toggle="tab" data-bs-target="#tci" type="button" role="tab" aria-controls="tci" aria-selected="false">TCI</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="book-tab" data-bs-toggle="tab" data-bs-target="#book" type="button" role="tab" aria-controls="book" aria-selected="false">หนังสือ</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="patent-tab" data-bs-toggle="tab" data-bs-target="#patent" type="button" role="tab" aria-controls="patent" aria-selected="false">ผลงานวิชาการด้านอื่นๆ</button>
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
                                    <a>{{$author -> author_fname}} {{$author -> author_lname}}</a>
                                </span>
                                @endforeach
                                @foreach ($paper->teacher as $author)
                                <span >
                                    <a href="{{ route('detail',Crypt::encrypt($author->id))}}">
                                        <teacher>{{$author -> fname_en}} {{$author -> lname_en}}</teacher></a>
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
                                    <a>{{$s -> source_name}}@if (!$loop->last) , @endif</a>
                                </span>
                                @endforeach
                            </p>
                        </div>
                    </td>
                    <td>{{ $paper->paper_citation }}</td>
                    <td>{{ $paper->paper_yearpub }}</td>
                    <td>
                        <a href="#" class="show-more" data-target="#collapse-{{ $paper->id }}" data-id="{{ $paper->id }}">Show more ▼</a>
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
                                    <a>{{$author -> author_fname}} {{$author -> author_lname}}</a>
                                </span>
                                @endforeach
                                @foreach ($paper->teacher as $author)
                                <span >
                                    <a href="{{ route('detail',Crypt::encrypt($author->id))}}">
                                        <teacher>{{$author -> fname_en}} {{$author -> lname_en}}</teacher></a>
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
                                    <a>{{$s -> source_name}}@if (!$loop->last) , @endif</a>
                                </span>
                                @endforeach
                            </p>
                        </div>
                    </td>
                    <td>{{ $paper->paper_citation }}</td>
                    <td>{{ $paper->paper_yearpub }}</td>
                    <td>
                        <a href="#" class="show-more" data-target="#collapse-scopus-{{ $paper->id }}" data-id="{{ $paper->id }}">Show more ▼</a>
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
                                    <a>{{$author -> author_fname}} {{$author -> author_lname}}</a>
                                </span>
                                @endforeach
                                @foreach ($paper->teacher as $author)
                                <span >
                                    <a href="{{ route('detail',Crypt::encrypt($author->id))}}">
                                        <teacher>{{$author -> fname_en}} {{$author -> lname_en}}</teacher></a>
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
                                    <a>{{$s -> source_name}}@if (!$loop->last) , @endif</a>
                                </span>
                                @endforeach
                            </p>
                        </div>
                    </td>
                    <td>{{ $paper->paper_citation }}</td>
                    <td>{{ $paper->paper_yearpub }}</td>
                    <td>
                        <a href="#" class="show-more" data-target="#collapse-wos-{{ $paper->id }}" data-id="{{ $paper->id }}">Show more ▼</a>
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
                                    <a>{{$author -> author_fname}} {{$author -> author_lname}}</a>
                                </span>
                                @endforeach
                                @foreach ($paper->teacher as $author)
                                <span >
                                    <a href="{{ route('detail',Crypt::encrypt($author->id))}}">
                                        <teacher>{{$author -> fname_en}} {{$author -> lname_en}}</teacher></a>
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
                                    <a>{{$s -> source_name}}@if (!$loop->last) , @endif</a>
                                </span>
                                @endforeach
                            </p>
                        </div>
                    </td>
                    <td>{{ $paper->paper_citation }}</td>
                    <td>{{ $paper->paper_yearpub }}</td>
                    <td>
                        <a href="#" class="show-more" data-target="#collapse-tci-{{ $paper->id }}" data-id="{{ $paper->id }}">Show more ▼</a>
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
                                    <a>{{$author -> author_fname}} {{$author -> author_lname}}</a>
                                </span>
                                @endforeach
                                @foreach ($paper->user as $author)
                                <span>
                                    <a> {{$author -> fname_en}} {{$author -> lname_en}}</a>
                                </span>
                                @endforeach
                            </p>
                            <p>สถานที่พิมพ์: {{$paper->ac_sourcetitle}}</p>
                            <p>Page: {{$paper->ac_page}}</p>
                        </div>
                    </td>
                    <td>{{ date('Y', strtotime($paper->ac_year)) + 543 }}</td>
                    <td>
                        <a href="#" class="show-more" data-target="#collapse-book-{{ $paper->id }}" data-id="{{ $paper->id }}">Show more ▼</a>
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
                                    <a>{{$author -> author_fname}} {{$author -> author_lname}}</a>
                                </span>
                                @endforeach
                                @foreach ($paper->user as $author)
                                <span>
                                    <a href="{{ route('detail',Crypt::encrypt($author->id))}}">
                                        <teacher>{{$author -> fname_en}} {{$author -> lname_en}}</teacher></a>
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
                        <a href="#" class="show-more" data-target="#collapse-patent-{{ $paper->id }}" data-id="{{ $paper->id }}">Show more ▼</a>
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
    $(document).ready(function() {
        $('#papersTable').DataTable({
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
            autoWidth: false
        });

        $('#wosTable').DataTable({
            paging: true,
            lengthChange: true,
            searching: true,
            ordering: true,
            info: true,
            autoWidth: false
        });

        $('#tciTable').DataTable({
            paging: true,
            lengthChange: true,
            searching: true,
            ordering: true,
            info: true,
            autoWidth: false
        });

        $('#bookTable').DataTable({
            paging: true,
            lengthChange: true,
            searching: true,
            ordering: true,
            info: true,
            autoWidth: false
        });

        $('#patentTable').DataTable({
            paging: true,
            lengthChange: true,
            searching: true,
            ordering: true,
            info: true,
            autoWidth: false
        });

        $(document).on("click", ".show-more", function(e) {
            e.preventDefault();
            let target = $(this).data("target");
            $(target).collapse('toggle');
            $(target).on('shown.bs.collapse', function() {
                $(`a[data-target="${target}"]`).text('Show less ▲');
            });
            $(target).on('hidden.bs.collapse', function() {
                $(`a[data-target="${target}"]`).text('Show more ▼');
            });
        });
    });
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

<script>
    $(document).ready(function() {

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


        $('button[data-bs-toggle="tab"]').on('shown.bs.tab', function(event) {
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

<script>
    var year = <?php echo $year; ?>;
    var paper_tci = <?php echo $paper_tci; ?>;
    var paper_scopus = <?php echo $paper_scopus; ?>;
    var paper_wos = <?php echo $paper_wos; ?>;
    var areaChartData = {

        labels: year,

        datasets: [{
                label: 'SCOPUS',
                backgroundColor: '#83E4B5',
                borderColor: 'rgba(255, 255, 255, 0.5)',
                pointRadius: false,
                pointColor: '#83E4B5',
                pointStrokeColor: '#3b8bba',
                pointHighlightFill: '#fff',
                pointHighlightStroke: '#83E4B5',
                data: paper_scopus
            },
            {
                label: 'TCI',
                backgroundColor: '#3994D6',
                borderColor: 'rgba(210, 214, 222, 1)',
                pointRadius: false,
                pointColor: '#3994D6',
                pointStrokeColor: '#c1c7d1',
                pointHighlightFill: '#fff',
                pointHighlightStroke: '#3994D6',
                data: paper_tci
            },
            {
                label: 'WOS',
                backgroundColor: '#FCC29A',
                borderColor: 'rgba(0, 0, 255, 1)',
                pointRadius: false,
                pointColor: '#FCC29A',
                pointStrokeColor: '#c1c7d1',
                pointHighlightFill: '#fff',
                pointHighlightStroke: '#FCC29A',
                data: paper_wos
            },
        ]
    }



    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = $.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    var temp1 = areaChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

    var barChartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        datasetFill: false,
        scales: {
            yAxes: [{
                ticks: {
                    stepSize: 1
                }
            }]
        }

    }

    new Chart(barChartCanvas, {
        type: 'bar',
        data: barChartData,
        options: barChartOptions
    })
</script>

<script type="text/javascript">
    function myDisplayer(some) {

        document.getElementById("citation").innerHTML = "Citation count : " + some['h-index'];
        document.getElementById("doc_count").innerHTML = "Document count : " + some['coredata']['citation-count'];
        document.getElementById("cite_count").innerHTML = "Cited By count : " + some['coredata']['cited-by-count'];
        document.getElementById("h-index").innerHTML = "H-index : " + some['h-index'];

    }
    async function myFunction() {
        var res = <?php echo $res; ?>;
        const response = await fetch('https://api.elsevier.com/content/search/author?query=authlast(' + res.lname_en +
            ')%20and%20authfirst(' + res.fname_en +
            ')%20&apiKey=6ab3c2a01c29f0e36b00c8fa1d013f83&httpAccept=application%2Fjson');
        //var a = got["search-results"];
        const got = await response.json();
        aid = got["search-results"]["entry"][0]['dc:identifier'];
        aid = aid.split(":");
        aid = aid[1];
        const resultC = await fetch('https://api.elsevier.com/content/author?author_id=' + aid +
            '&view=metrics&apiKey=6ab3c2a01c29f0e36b00c8fa1d013f83&httpAccept=application%2Fjson');
        const data = await resultC.json();
        auth = data['author-retrieval-response'][0];
        //data = data['h-index'];

        return auth

    }
    myFunction().then(
        function(value) {
            myDisplayer(value);
        },
        function(error) {
            myDisplayer(error);
        }
    );
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
    (function($) {
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
        $.fn.countTo = function(options) {
            options = options || {};

            return $(this).each(function() {
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

                    if (typeof(settings.onUpdate) == 'function') {
                        settings.onUpdate.call(self, value);
                    }

                    if (loopCount >= loops) {
                        // remove the interval
                        $self.removeData('countTo');
                        clearInterval(data.interval);
                        value = settings.to;

                        if (typeof(settings.onComplete) == 'function') {
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

    jQuery(function($) {
        // custom formatting example
        $('.count-number').data('countToOptions', {
            formatter: function(value, options) {
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
        // เรียกใช้ฟังก์ชันเมื่อโหลดหน้าเว็บ
        calculateHIndex();
    });

</script>



@endsection
