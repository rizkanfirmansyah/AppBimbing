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
                    <!-- Card Body -->
                    <div class="card-body">

                        <form action="{{ route('approved-guidance') }}" method="post" enctype="multipart/form-data">
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
                                        @if ($_GET['type'] == 'guidance')
                                            {{ CheckMahasiswa($data->mahasiswa_id, $data) }}
                                        @else
                                            {{ CheckMahasiswa($data['bimbingan']->mahasiswa_id, $data['bimbingan']) }}
                                        @endif
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
                                        @if ($_GET['type'] == 'guidance')
                                            {{ CheckMahasiswaNPM($data->mahasiswa_id, $data) }}
                                        @else
                                            {{ CheckMahasiswaNPM($data['bimbingan']->mahasiswa_id, $data['bimbingan']) }}
                                        @endif
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
                                        @if ($_GET['type'] == 'guidance')
                                            {{ $data->title }}
                                        @else
                                            {{ $data['bimbingan']->title }}
                                        @endif
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
                                        @if ($_GET['type'] == 'guidance')
                                            {{ $data->description }}
                                        @else
                                            {{ $data['revisi']->description }}
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Status
                                            </strong></label>
                                    </div>
                                    <div class="col-1">:
                                    </div>
                                    <div class="col-10">
                                        @if ($_GET['type'] == 'guidance')
                                            <select name="status" id="status" class="form-control"
                                                {{ $data->status != '2' && $_GET['type'] == 'guidance' ? 'disabled' : ' ' }}>
                                                <option value disabled selected>==Pilih Status==</option>
                                                <option value="1" {{ $data->status == '1' ? 'selected' : ' ' }}>Approve
                                                </option>
                                                <option value="4" {{ $data->status == '4' ? 'selected' : ' ' }}>Revisi
                                                </option>
                                                <option value="0">Reject</option>
                                            @else
                                                <select name="status" id="status" class="form-control">
                                                    <option value disabled selected>==Pilih Status==</option>
                                                    <option value="1"
                                                        {{ $data['revisi']->status == '1' ? 'selected' : ' ' }}>Approve
                                                    </option>
                                                    <option value="0"
                                                        {{ $data['revisi']->status == '0' ? 'selected' : ' ' }}>Revisi
                                                    </option>
                                        @endif
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Upload
                                            </strong></label>
                                    </div>
                                    <div class="col-1">:
                                    </div>
                                    <div class="col-10">
                                        @if ($_GET['type'] == 'guidance')
                                            <input type="file" name="file_upload" class="form-control"
                                                {{ $data->status != '2' && $_GET['type'] == 'guidance' ? 'disabled' : ' ' }}>
                                        @else
                                            <input type="file" name="file_upload" class="form-control">
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>Keterangan
                                            </strong></label>
                                    </div>
                                    <div class="col-2">:
                                    </div>
                                    <div class="col-12">
                                        @if ($_GET['type'] == 'guidance')
                                            <textarea name="keterangan" id="keterangan" cols="30" rows="5"
                                                class="form-control"
                                                {{ $data->status != '2' && $_GET['type'] == 'guidance' ? 'disabled' : ' ' }}>{{ $data->description_dosen }}</textarea>
                                        @else
                                            <textarea name="keterangan" id="keterangan" cols="30" rows="5"
                                                class="form-control"></textarea>
                                        @endif
                                        <input type="hidden" name="id" value="{{ $_GET['type']== 'revisi' ? $data['bimbingan']->id : $data->id  }}">
                                        <input type="hidden" name="type" value="{{ $_GET['type'] }}">
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
