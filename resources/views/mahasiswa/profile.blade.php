@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ $title }}</h1>
            {{-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> --}}
        </div>

        @if (auth()->user()->role == 3 && empty($_GET['type']))
            <div class="col-12 col-md-8 col-lg-8">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="{{ $data[0]->photo == null ? '/assets/img/undraw_profile.svg' : '/files/' . $data[0]->photo }}" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h6 class="card-title text-bold">Nama Lengkap : {{ $data[0]->nama }}</h6>
                                <h6 class="card-title text-bold">NPM Mahasiswa : {{ $data[0]->npm }}</h6>
                                <h6 class="card-title text-bold">Jurusan : {{ $data[0]->jurusan }}</h6>
                                <h6 class="card-title text-bold">Tanggal Lahir : {{ $data[0]->tanggal_lahir }}</h6>
                                <h6 class="card-title text-bold">Alamat : {{ $data[0]->alamat }}</h6>
                                <p class="card-text"><small class="text-muted">Last login
                                        {{ auth()->user()->updated_at }}</small> <a
                                        href="?type=edit&id={{ $data[0]->id }}&role=mahasiswa"
                                        class="float-right badge badge-warning"> <i>
                                            <i class="fas fa-edit"></i> Edit</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @elseif (auth()->user()->role == 2 && empty($_GET['type']))

            <div class="col-12 col-md-8 col-lg-8">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="/assets/img/undraw_profile.svg" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h6 class="card-title text-bold">Nama Lengkap : {{ $data[0]->nama }}</h6>
                                <h6 class="card-title text-bold">NID Dosen : {{ $data[0]->nid }}</h6>
                                <h6 class="card-title text-bold">Jurusan : {{ $data[0]->jurusan }}</h6>
                                <h6 class="card-title text-bold">Tanggal Lahir : {{ $data[0]->tanggal_lahir }}</h6>
                                <h6 class="card-title text-bold">Alamat : {{ $data[0]->alamat }}</h6>
                                <p class="card-text"><small class="text-muted">Last login
                                        {{ auth()->user()->updated_at }}</small> <a
                                        href="?type=edit&id={{ $data[0]->id }}&role=dosen"
                                        class="float-right badge badge-warning"> <i>
                                            <i class="fas fa-edit"></i> Edit</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        @elseif (auth()->user()->role == 1 && empty($_GET['type']))

            <div class="col-12 col-md-8 col-lg-8">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="/assets/img/undraw_profile.svg" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h6 class="card-title text-bold">Username : {{ auth()->user()->name }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        @else
            <div class="row">

                <!-- Pengajuan Form -->
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4">
                        <!-- Card Body -->
                        <div class="card-body">
                            @if (session()->has('success'))
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    {{ session('success') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                                </div>
                            @endif
                            @if (session()->has('error'))

                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    {{ session('error') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                                </div>
                            @endif

                            <form method="post" action="{{ route('changeprofile') }}" enctype="multipart/form-data">
                                @csrf
                                <div class="mb-3">
                                    <label for="title" class="form-label">Foto</label>
                                    <input type="file" class="form-control @error('files') is-invalid @enderror"
                                        id="files" name="files">
                                    @error('files')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="title" class="form-label">Tanggal Lahir</label>
                                    <input type="date" class="form-control @error('tanggal_lahir') is-invalid @enderror"
                                        id="tanggal_lahir" name="tanggal_lahir">
                                    @error('tanggal_lahir')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="alamat" class="form-label">Alamat</label>
                                    <textarea type="text" class="form-control @error('alamat') is-invalid @enderror"
                                        id="alamat" rows="5" name="alamat"></textarea>
                                    @error('alamat')
                                        <div class="invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <input type="hidden" name="type" value="{{ $_GET['role'] }}">
                                <input type="hidden" name="id" value="{{ $_GET['id'] }}">
                                <button type="reset" class=" mx-2 btn btn-secondary float-right">Reset</button>
                                <button type="submit" class=" mx-2 btn btn-primary float-right">Submit</button>
                            </form>

                        </div>
                    </div>
                </div>

            </div>
        @endif


    </div>
    <!-- /.container-fluid -->
@endsection
