@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ $title }}</h1>
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
                            <table class="table table-bordered" id="dataTableCustom" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama</th>
                                        <th>NPM</th>
                                        <th>Jurusan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i=1 ?>
                                    @foreach ($bimbingan as $item)
                                        <tr>
                                            <td>{{$i}}</td>
                                            <td>{{ CheckMahasiswa($item->mahasiswa_id, $item) }}</td>
                                            <td>{{ CheckMahasiswaNPM($item->mahasiswa_id, $item) }}</td>
                                            <td>{{ CheckMahasiswaJurusan($item->mahasiswa_id, $item) }}</td>
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
