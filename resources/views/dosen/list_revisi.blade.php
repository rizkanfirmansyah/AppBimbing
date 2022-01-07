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
                        <h3>Daftar Revisi</h3>
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
                                    @foreach ($data as $item)
                                        <tr>
                                            <td>{{ date('d-M-Y', strtotime($item->created_at)) }}</td>
                                            <td>{{ searchMahasiswa($item->user_id)->nama }}</td>
                                            <td>
                                                @if ($item->status == 1)
                                                    <a class="badge badge-success">Selesai</a>
                                                @elseif ($item->status == 0)
                                                    <a class="badge badge-warning">Revisi</a>
                                                @endif
                                            </td>
                                            <td><a href="{{ route('download') }}?id={{$item->file}}" class="badge badge-primary"><i class="fas fa-download"></i>
                                                    Download</a></td>
                                            <td>{{ $item->description }}</td>
                                            <td><a href="{{ route('revisi') }}?id={{$_GET['id']}}&type=revisi" class="badge badge-secondary"><i class="fas fa-edit"></i> Revisi</a></td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- /.container-fluid -->
@endsection
