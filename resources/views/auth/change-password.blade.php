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

                        <form method="post" action="{{ route('password') }}">
                            @csrf
                            <div class="mb-3">
                                <label for="title" class="form-label">Password Lama</label>
                                <input class="form-control @error('password_old') is-invalid @enderror" id="password_old"
                                    name="password_old">
                                @error('password_old')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="password_new" class="form-label">Password Baru</label>
                                <input class="form-control @error('password_new') is-invalid @enderror" id="password_new"
                                    rows="5" name="password_new">
                                @error('password_new')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="repeat_password" class="form-label">Konfirmasi Password Baru</label>
                                <input class="form-control @error('repeat_password') is-invalid @enderror"
                                    id="repeat_password" rows="5" name="repeat_password">
                                @error('repeat_password')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <button type="reset" class=" mx-2 btn btn-secondary float-right">Reset</button>
                            <button type="submit" class=" mx-2 btn btn-primary float-right">Submit</button>
                        </form>

                    </div>
                </div>
            </div>

        </div>


    </div>
    <!-- /.container-fluid -->
@endsection
