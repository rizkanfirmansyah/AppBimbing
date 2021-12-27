@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ $title }}</h1>
            <a href="{{ URL::previous() }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-sign-in-alt fa-sm text-white-50"></i> Kembali </a>
        </div>


        <div class="row">

            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <div class="card-header">
                        @if (session()->has('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('success') }}
                            </div>
                        @endif
                        @if (session()->has('error'))

                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('error') }}
                            </div>
                        @endif
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">

                        <form method="post" action="{{ route('store-seminar') }}">
                            @csrf
                            <div class="mb-3">
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Judul
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        <input type="text" name="title"
                                            class="form-control @error('title') is-invalid @enderror" />
                                        @error('title')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="speaker" class="form-label text-dark"><strong>Pembicara
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        <input type="text" name="speaker" class="form-control @error('speaker') is-invalid @enderror" />
                                        @error('speaker')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                        <small class="text-danger">* pisahkan dengan koma ( , ). Jika pembicara lebih
                                            dari 1
                                        </small>
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Deskripsi
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        <textarea type="text" name="description" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Ruangan
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-4">
                                        <input type="text" name="ruangan" class="form-control @error('ruangan') is-invalid @enderror" />
                                        @error('ruangan')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Max Peserta
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-4">
                                        <input type="number" name="max" class="form-control @error('max') is-invalid @enderror" />
                                        @error('max')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Tanggal
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col-1">:
                                    </div>
                                    <div class="col-4">
                                        <input type="date" name="date" id="date" class="form-control">

                                    </div>
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Status
                                            </strong>
                                        </label>
                                    </div>
                                    <div class="col-1">:
                                    </div>
                                    <div class="col-4">
                                        <select name="status" id="status" class="form-control">
                                            <option value disabled selected>Pilih Status</option>
                                            <option value="2">Draft</option>
                                            <option value="1">Done</option>
                                            <option value="0">Reject</option>
                                        </select>

                                    </div>
                                </div>
                            </div>
                            <button type="reset" class=" mx-2 btn btn-secondary float-left">Reset</button>
                            <button type="submit" class=" mx-2 btn btn-primary float-left">Submit</button>
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /.container-fluid -->
@endsection
