@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ $title }}</h1>
            <a href="{{ route('create-seminar') }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-plus fa-sm text-white"></i> Tambah</a>
        </div>


        <div class="row">

            <div class="col-12">
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Table Data </h6>
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
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Tanggal</th>
                                        <th>Pembicara</th>
                                        <th>Judul</th>
                                        <th>Ruangan</th>
                                        <th>Peserta</th>
                                        <th>Max</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($seminar as $key => $item)
                                        <tr>
                                            <td>{{date('d-M-Y', strtotime($item->date))}}</td>
                                            <td class="text-capitalize">{{ SpeakerSeminar($item->speaker) }} </td>
                                            <td>{{ $item->title }}</td>
                                            <td>{{ $item->ruangan }}</td>
                                            <td><a href="#">{{ 54 }} Peserta</a></td>
                                            <td>{{ $item->max }}</td>
                                            <td>
                                                <a href="{{ route('edit-seminar', $item->id)}}" class="badge badge-warning"><i class="fas fa-edit"></i> Edit</a>
                                                <a href="{{route('destroy-seminar', $item->id)}}" class="badge badge-danger"><i class="fas fa-trash"></i> Hapus</a>
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
    </div>
    <!-- /.container-fluid -->
@endsection
