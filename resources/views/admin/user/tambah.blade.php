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

            <!-- Pengajuan Form -->
            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <!-- Card Body -->
                    <div class="card-body">

                        <form method="post" action="{{ route('user-add') }}">
                            @csrf
                            <div class="mb-3">
                                <label for="title" class="form-label"><span class="text-danger">*)</span> Masukkan Username (NPM untuk mahasiswa)</label>
                                <input value="{{old('name')}}" type="text" class="form-control @error('name') is-invalid @enderror" id="name"
                                    name="name">
                                @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="nama" class="form-label"><span class="text-danger">*)</span> Masukkan nama User </label>
                                <input value="{{old('nama')}}" type="text" class="form-control @error('nama') is-invalid @enderror" id="nama"
                                    name="nama">
                                @error('nama')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="password_new" class="form-label"><span class="text-danger">*)</span> Password</label>
                                <input type="password" class="form-control @error('password') is-invalid @enderror" id="password"
                                    rows="5" name="password">
                                @error('password')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="role" class="form-label"><span class="text-danger">*)</span> Pilih Role User</label>
                                <select name="role" id="role" class="form-control">
                                    <option value disabled selected>== Pilih Role ==</option>
                                    {{-- <option value="1">Admin</option> --}}
                                    <option value="2">Dosen</option>
                                    <option value="3">Mahasiswa</option>
                                </select>
                                @error('role')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="jurusan" class="form-label"><span class="text-danger">*)</span> Pilih Jurusan</label>
                                <select name="jurusan" id="jurusan" class="form-control">
                                    <option value disabled selected>== Pilih Jurusan ==</option>
                                    {{-- <option value="1">Admin</option> --}}
                                    <option value="Teknik Informatika">Teknik Informatika</option>
                                    <option value="Sistem Informasi">Sistem Informasi</option>
                                </select>
                                @error('jurusan')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <button type="reset" class=" mx-2 btn btn-secondary float-right">Reset</button>
                            <button type="submit" class=" mx-2 btn btn-primary float-right">Submit</button>
                        </form>

                    </div>
                </div>
            </div>

        </div>


    </div>
    <!-- /.container-fluid -->
@endsection
