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

                        <form method="post" action="/users/edit">
                            @csrf
                            <div class="mb-3">
                                <label for="title" class="form-label"><span class="text-danger">*)</span> Masukkan Username (NPM untuk mahasiswa)</label>
                                <input type="hidden" name="id" value="{{ $user->id }}">
                                <input value="{{$user->name}}" type="text" class="form-control @error('name') is-invalid @enderror" id="name"
                                    name="name">
                                @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="nama" class="form-label"><span class="text-danger">*)</span> Masukkan nama User </label>
                                <input value="{{$data->nama}}" type="text" class="form-control @error('nama') is-invalid @enderror" id="nama"
                                    name="nama">
                                @error('nama')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            {{-- <div class="mb-3">
                                <label for="password_new" class="form-label"><span class="text-danger">*)</span> Password</label>
                                <input type="password" class="form-control @error('password') is-invalid @enderror" id="password"
                                    rows="5" name="password">
                                @error('password')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div> --}}
                            <div class="mb-3">
                                <label for="role" class="form-label"><span class="text-danger">*)</span> Pilih Role User</label>
                                <input type="hidden" name="role" value="{{$user->role}}">
                                <select name="" id="role" disabled class="form-control">
                                    <option {{ $user->role == 2 ? 'selected' : ' ' }} value="2">Dosen</option>
                                    <option {{ $user->role == 3 ? 'selected' : ' ' }} value="3">Mahasiswa</option>
                                </select>
                                @error('role')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <label for="jurusan" class="form-label"><span class="text-danger">*)</span> Pilih Jurusan</label>
                                <select name="jurusan" id="jurusan" class="form-control" >
                                    <option {{ $data->jurusan == 'Teknik Informatika' ? 'selected'  : ' '}} value="Teknik Informatika">Teknik Informatika</option>
                                    <option {{ $data->jurusan == 'Sistem Informasi' ? 'selected' : ' ' }} value="Sistem Informasi">Sistem Informasi</option>
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
