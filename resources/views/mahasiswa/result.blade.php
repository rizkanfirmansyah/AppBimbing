@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Hasil Bimbingan</h1>
            <a href="{{ URL::previous() }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-sign-in-alt fa-sm text-white-50"></i> Kembali </a>
        </div>


        <div class="row">

            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <!-- Card Body -->
                    <div class="card-body">

                        <form>
                            <div class="mb-3">
                                <div class="form-row my-3">
                                    <div class="col-2">
                                        <label for="title" class="form-label text-dark"><strong>Nama
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        {{ $bimbingan->mahasiswa->nama }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-2">
                                        <label for="title" class="form-label text-dark"><strong>Judul
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        {{ $bimbingan->title }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-2">
                                        <label for="title" class="form-label text-dark"><strong>Topik
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        {{ $bimbingan->description }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-2">
                                        <label for="title" class="form-label text-dark"><strong>Dosen Pembimbing
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        @if ($bimbingan->dosen_id > 0)
                                            {{ $bimbingan->dosen->nama }}
                                        @else
                                            Dosen Belum Ada
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-2">
                                        <label for="title" class="form-label text-dark"><strong>Keterangan Dosen Bimbingan
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        @if ($bimbingan->description_dosen)
                                            {{ $bimbingan->description_dosen }}
                                        @else
                                            Belum ada tanggapan
                                        @endif
                                    </div>
                                </div>
                            </div>
                            {{-- <button type="reset" class=" mx-2 btn btn-secondary float-right">Reset</button>
                            <button type="submit" class=" mx-2 btn btn-primary float-right">Submit</button> --}}
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /.container-fluid -->
@endsection
