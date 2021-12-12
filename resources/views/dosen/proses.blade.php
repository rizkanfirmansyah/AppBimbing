@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{$title}}</h1>
            <a href="{{ URL::previous() }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-sign-in-alt fa-sm text-white-50"></i> Kembali </a>
        </div>


        <div class="row">

            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <!-- Card Body -->
                    <div class="card-body">

                        <form action="{{ route('approved-guidance') }}" method="post">
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
                                        {{$data->mahasiswa->nama}}
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
                                        {{$data->mahasiswa->npm}}
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
                                        {{$data->title}}
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
                                        {{$data->description}}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>File
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        <a href="{{ route('download') }}?q=files&id={{ $data->file }}" class="badge badge-primary p-2"><i class="fas fa-download"></i> Download</a>
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
                                        <select name="status" id="status" class="form-control">
                                            <option value disabled selected>==Pilih Status==</option>
                                            <option value="1">Approve</option>
                                            <option value="2">Reject</option>
                                        </select>
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
                                        <textarea name="keterangan" id="keterangan" cols="30" rows="5" class="form-control"></textarea>
                                        <input type="hidden" name="id" value="{{$data->id}}">
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
