@extends('layouts.layout')
@section('content')
<div class="container card-2">
    <p class="title"> All Researchers </p>
    @if($allResearchers->isEmpty())
    <p>No researchers found.</p>
    @else
    <div class="row row-cols-1 row-cols-md-2 g-0">
        @foreach($allResearchers as $r)
        <a href=" {{ route('detail',Crypt::encrypt($r->id))}}">
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-sm-4">
                        <img class="card-image" src="{{ $r->picture}}" alt="">
                    </div>
                    <div class="col-sm-8 overflow-hidden" style="text-overflow: clip; @if(app()->getLocale() == 'en') max-height: 220px; @else max-height: 210px;@endif">
                        <div class="card-body">
                            @if(app()->getLocale() == 'en')

                                @if($r->doctoral_degree == 'Ph.D.')
                                <h5 class="card-title">{{ $r->{'fname_'.app()->getLocale()} }} {{ $r->{'lname_'.app()->getLocale()} }}, {{$r->doctoral_degree}}
                                @else
                                <h5 class="card-title">{{ $r->{'fname_'.app()->getLocale()} }} {{ $r->{'lname_'.app()->getLocale()} }}</h5>
                                @endif


                                <!-- <h5 class="card-title">{{ $r->{'fname_'.app()->getLocale()} }} {{ $r->{'lname_'.app()->getLocale()} }}</h5> -->
                                <h5 class="card-title-2">{{ $r->{'academic_ranks_'.app()->getLocale()} }}</h5>
                                @else
                                <h5 class="card-title">{{ $r->{'position_'.app()->getLocale()} }}
                                    {{ $r->{'fname_'.app()->getLocale()} }} {{ $r->{'lname_'.app()->getLocale()} }}
                                </h5>
                                @endif
                                <p class="card-text-1">{{ trans('message.expertise') }}</p>
                                <div class="card-expertise">
                                    @foreach($r->expertise->sortBy('expert_name') as $exper)
                                    <p class="card-text"> {{$exper->expert_name}}</p>
                                    @endforeach
                                </div>
                        </div>
                    </diV>
                </div>
            </div>
        </a>
        @endforeach
    </div>
    @endif
</div>
@stop
