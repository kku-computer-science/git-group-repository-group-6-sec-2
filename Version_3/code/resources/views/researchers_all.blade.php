@extends('layouts.layout')

@section('content')
<div class="container card-2">
    <p class="title">All Researchers</p>
    <div class="row row-cols-1 row-cols-md-2 g-0">
        @foreach($researchers as $researcher)
        <a href="{{ route('detail', Crypt::encrypt($researcher->id)) }}">
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-sm-4">
                        <img class="card-image" src="{{ $researcher->picture }}" alt="">
                    </div>
                    <div class="col-sm-8 overflow-hidden" style="text-overflow: clip; @if(app()->getLocale() == 'en') max-height: 220px; @else max-height: 210px;@endif">
                        <div class="card-body">
                            @if(app()->getLocale() == 'en')
                                @if($researcher->doctoral_degree == 'Ph.D.')
                                <h5 class="card-title">{{ $researcher->{'fname_'.app()->getLocale()} }} {{ $researcher->{'lname_'.app()->getLocale()} }}, {{$researcher->doctoral_degree}}</h5>
                                @else
                                <h5 class="card-title">{{ $researcher->{'fname_'.app()->getLocale()} }} {{ $researcher->{'lname_'.app()->getLocale()} }}</h5>
                                @endif
                                <h5 class="card-title-2">{{ $researcher->{'academic_ranks_'.app()->getLocale()} }}</h5>
                            @else
                                <h5 class="card-title">{{ $researcher->{'position_'.app()->getLocale()} }} {{ $researcher->{'fname_'.app()->getLocale()} }} {{ $researcher->{'lname_'.app()->getLocale()} }}</h5>
                            @endif
                            <p class="card-text-1">{{ trans('message.expertise') }}</p>
                            <div class="card-expertise">
                                @foreach($researcher->expertise->sortBy('expert_name') as $expertise)
                                <p class="card-text"> {{$expertise->expert_name}}</p>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        @endforeach
    </div>
</div>
@endsection