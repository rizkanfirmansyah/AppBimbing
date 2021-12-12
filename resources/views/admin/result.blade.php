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

                        <form method="post" action="{{ route('result-post') }}">
                            @csrf
                            <div class="mb-3">
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Nama
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        {{ CheckMahasiswa($data->mahasiswa_id, $data) }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>NPM
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        <td>
                                            {{ CheckMahasiswaNPM($data->mahasiswa_id, $data) }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Judul
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        {{ $data->title }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Topik
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        {{ $data->description }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Keterangan
                                            </strong></label>
                                    </div>
                                    <div class="col-1">:
                                    </div>
                                    <div class="col-8">
                                        <select name="dosen" id="dosen" class="form-control">
                                            <option value disabled selected>Pilih Dosen Pembimbing</option>
                                            @foreach ($dosen as $item)
                                                <option {{ $data->dosen_id == $item->id ? 'selected' : ' ' }}
                                                    value="{{ $item->id }}">{{ $item->nama }}</option>
                                            @endforeach
                                        </select>
                                        <input type="hidden" name="id" value="{{ $_GET['id'] }}">
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
