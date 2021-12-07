@extends('layouts.main')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Form Pengajuan Bimbingan</h1>
            {{-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> --}}
        </div>


        <div class="row">

            <!-- Pengajuan Form -->
            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <!-- Card Body -->
                    <div class="card-body">

                        <form method="POST" action="{{ route('insert-bimbingan') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-3">
                                <label for="title" class="form-label">Judul Bimbingan</label>
                                <textarea class="form-control @error('title') is-invalid @enderror" id="title" name="title"></textarea>
                                @error('title')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Topik Pembahasan</label>
                                <textarea class="form-control @error('description') is-invalid @enderror" id="description" rows="5" name="description"></textarea>
                                @error('description')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Upload File </label>
                                <input class="form-control @error('file') is-invalid @enderror" type="file" id="formFile" name="file">
                                @error('file')
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
