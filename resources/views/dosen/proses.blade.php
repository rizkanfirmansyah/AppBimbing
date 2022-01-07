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
                                        <label for="title" class="form-label text-dark"><strong>File
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-10">
                                        <a href="{{ route('download') }}?q=files&id={{ $data->file }}"
                                            class="badge badge-primary p-2"><i class="fas fa-download"></i> Download</a>
                                    </div>
                                </div>
                            </div>
                            <a href="{{ route('list-revisi')  }}?id=<?= $_GET['id'] ?>" class=" mr-2 btn btn-secondary float-left">Daftar Revisi</a>
                            <a href="{{ route('revisi')  }}?id=<?= $_GET['id'] ?>&type=guidance" class=" mr-2 btn btn-primary float-left">Revisi</a>
                        </form>

                    </div>
                </div>
            </div>

        </div>



    </div>
    <!-- /.container-fluid -->
@endsection
