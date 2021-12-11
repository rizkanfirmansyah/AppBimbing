@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ $title }}</h1>
            {{-- <a href="{{ route('admin-dosen-tambah') }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-plus fa-sm text-white-50"></i> Tambah Dosen</a> --}}
        </div>


        <div class="row">

            <div class="col-12">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Table Data </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Username</th>
                                        <th>Nama</th>
                                        <th>Jurusan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i=1 ?>
                                    @foreach ($dosen as $item)
                                        <tr>
                                            <td>{{$i}}</td>
                                            <td>{{$item->user->name}}</td>
                                            <td>{{$item->nama}}</td>
                                            <td>{{$item->jurusan}}</td>
                                            {{-- <td>
                                                <a href="{{ route('admin-dosen-edit') }}?id={{$item->id}}" class="badge badge-warning">Edit</a>
                                                <a href="{{ route('admin-dosen-hapus') }}?id={{$item->id}}" class="badge badge-danger">Hapus</a>
                                            </td> --}}
                                        </tr>
                                        <?php $i++ ?>
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
