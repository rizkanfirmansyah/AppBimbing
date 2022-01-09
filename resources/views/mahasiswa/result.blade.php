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
                                        {{ CheckMahasiswa($bimbingan->mahasiswa_id, $bimbingan) }}
                                    </div>
                                </div>
                                <div class="form-row my-3">
                                    <div class="col-1">
                                        <label for="title" class="form-label text-dark"><strong>NPM
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        <td>
                                            {{ CheckMahasiswaNPM($bimbingan->mahasiswa_id, $bimbingan) }}
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
                                        <label for="title" class="form-label text-dark"><strong>Status
                                            </strong></label>
                                    </div>
                                    <div class="col">:
                                    </div>
                                    <div class="col-9">
                                        @if ($bimbingan->status == 1)
                                            <a class="badge badge-success">Selesai</a>
                                        @elseif ($bimbingan->status == 0)
                                            <a class="badge badge-danger">Reject</a>
                                        @elseif ($bimbingan->status == 4)
                                            <a class="badge badge-warning">Revisi</a>
                                        @else
                                            <a class="badge badge-info">Proccess</a>
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

        <div class="row">
            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <!-- Card Body -->
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Tanggal</th>
                                        <th>Dosen</th>
                                        <th>Status</th>
                                        <th>File</th>
                                        <th>Keterangan</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($revisi as $item)
                                        <tr>
                                            <td>{{ date('d-M-Y', strtotime($item->created_at)) }}</td>
                                            <td>{{ searchDosen($item->user->name)->nama }}</td>
                                            <td>
                                                @if ($item->status == 1)
                                                    <a class="badge badge-success">Selesai</a>
                                                @elseif ($item->status == 0)
                                                    <a class="badge badge-warning">Revisi</a>
                                                @endif
                                            </td>
                                            <td><a href="{{ route('download') }}?id={{ $item->file }}"
                                                    class="badge badge-primary"><i class="fas fa-download"></i>
                                                    Download</a></td>
                                            <td>{{ $item->description }}</td>
                                            <td>
                                                @if ($bimbingan->status == 4)
                                                    <a href="{{ route('revisi-mahasiswa') }}?id={{ $_GET['id'] }}"
                                                        class="badge badge-secondary"><i class="fas fa-edit"></i>
                                                        Revisi</a>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    @endsection
