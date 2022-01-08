@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Hasil Bimbingan</h1>
            {{-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> --}}
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
                                        <th>Tanggal</th>
                                        <th>Judul</th>
                                        <th>Topik</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($bimbingan as $item)
                                        <tr>
                                            <td>{{ $item->created_at }}</td>
                                            <td>{{ $item->title }}</td>
                                            <td>{{ $item->description }}</td>
                                            <td><?php
                                            if ($item->status == 3) {
                                                echo '<a class="badge badge-secondary"><i class="fas fa-user"></i> Waiting</a>';
                                            } elseif ($item->status == 2) {
                                                echo '<a class="badge badge-warning"><i class="fas fa-clock"></i> process</a>';
                                            } elseif ($item->status == 1) {
                                                echo '<a class="badge badge-success"><i class="fas fa-check"></i> Approved</a>';
                                            } elseif ($item->status == 4) {
                                                echo '<a class="badge badge-warning"><i class="fas fa-check"></i> Revisi</a>';
                                            } else {
                                                echo '<a class="badge badge-danger"><i class="fas fa-times"></i> Reject</a>';
                                            } ?>
                                            </td>
                                            <td><a href="{{route('hasil-bimbingan')}}?q={{ $item->title }}&id={{$item->id}}" class="badge badge-primary"><i class="fas fa-eye"></i> Lihat Data</a></td>
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
