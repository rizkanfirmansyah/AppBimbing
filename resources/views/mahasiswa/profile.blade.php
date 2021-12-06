@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Profile Mahasiswa</h1>
            {{-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> --}}
        </div>

        <div class="col-12 col-md-8 col-lg-8">
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="https://placeimg.com/640/480/tech" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h6 class="card-title text-bold">Nama Lengkap : {{$data[0]->nama}}</h6>
                            <h6 class="card-title text-bold">NPM Mahasiswa : 2142431</h6>
                            <h6 class="card-title text-bold">Jurusan : {{$data[0]->jurusan}}</h6>
                            <p class="card-text"><small class="text-muted">Last login {{auth()->user()->updated_at}}</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <!-- /.container-fluid -->
@endsection
