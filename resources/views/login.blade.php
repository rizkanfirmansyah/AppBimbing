<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App Bimbingan</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/assets/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body>

    <div class="main">

        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="/">Aplikasi Bimbingan</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        {{-- <a class="nav-link mx-3" aria-current="page" href="/">Home</a> --}}
                        {{-- <a class="nav-link mx-3" href="#">Tutorial</a>
                  <a class="nav-link mx-3" href="#">Services</a>
                  <a class="nav-link mx-3">About Us</a>
                  <a href="{{ route('login') }}" class="nav-link mx-3 active" id="active">Login <img class="img-fluid img-nav" src="/assets/img/login-svgrepo-com 1.png" alt=""></a> --}}
                    </div>
                </div>
            </div>
        </nav>

    </div>

    <div class="section">

        <div class="jumbotron">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">

                        <h2 class="subtitle-jumbotron mb-3">Login App Bimbing</h2>
                        <h1 class="title-jumbotron mb-3">Bergabung bersama kami sekarang</h1>
                        <p class="paragraph-jumbotron mb-4">Buathlah laporan bimbingan mu dengan mudah bersama app
                            bimbing kami secara online. Hubungi dosen dan bagian admin kampus dengan mudah lewat virtual
                            dan data digital</p>

                        <form class="d-flex me-5">
                            <!-- <input class="form-control me-5" type="search" placeholder="Search" aria-label="Search">
                            <button class=" btn-icon" type="submit"><img class="img-icon-search" src="/assets/img/search-svgrepo-com 1.png" alt=""></button> -->

                            <a href="{{route('login')}}" class="py-2 px-4 btn btn-primary me-3">Mahasiswa</a>
                            <a href="{{route('login-dosen')}}" class="py-2 px-4 btn btn-outline-primary me-3">Dosen</a>
                            <a href="{{route('login-admin')}}" class="py-2 px-4 btn btn-outline-primary">Admin</a>
                        </form>

                    </div>
                    <div class="col-md-6">
                        <h2 class="text-white text-black text-center">Login Mahasiswa</h2>
                        <div class="tab-pane fade show active mt-4" id="mahasiswa-login" role="tabpanel"
                            aria-labelledby="mahasiswa-login">
                            <div class="card border bg-transparent text-white">
                                @if (session()->has('success'))
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        {{ session('success') }}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @endif
                                @if (session()->has('error'))

                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        {{ session('error') }}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @endif
                                <div class="card-body">
                                    <form action="{{ route('auth-login') }}" method="POST">
                                        @csrf
                                        <div class="mb-3">
                                            <label for="username" class="form-label">Username :</label>
                                            <input type="username"
                                                class="form-control @error('username') is-invalid @enderror"
                                                id="username" placeholder="Input NPM" name="username">
                                            @error('username')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">Password:</label>
                                            <input type="password"
                                                class="form-control  @error('password') is-invalid @enderror"
                                                id="password" placeholder="Enter password" name="password">
                                            @error('password')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        {{-- <a class="btn btn-primary" href="/dashboardMahasiswa" role="button">Login</a> --}}
                                        <button type="submit" class="btn btn-primary">Login</button>

                                        <a href="{{ route('register') }}"
                                            class="btn btn-link ms-auto text-end float-end"
                                            style="color: white !important">Belum Punya Akun?</a>
                                    </form>
                                </div>



                            </div>
                        </div>
                        <div class="tab-pane fade" id="dosen-login" role="tabpanel" aria-labelledby="dosen-login-tab">.
                            <div class="card border bg-transparent text-white">
                                @if (session()->has('success'))
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        {{ session('success') }}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @endif
                                @if (session()->has('error'))

                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        {{ session('error') }}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @endif
                                <div class="card-body">
                                    <form action="{{ route('auth-login') }}" method="POST">
                                        @csrf
                                        <div class="mb-3">
                                            <label for="username" class="form-label">Username :</label>
                                            <input type="username"
                                                class="form-control @error('username') is-invalid @enderror"
                                                id="username" placeholder="Input Username" name="username">
                                            @error('username')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">Password:</label>
                                            <input type="password"
                                                class="form-control  @error('password') is-invalid @enderror"
                                                id="password" placeholder="Enter password" name="password">
                                            @error('password')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                        {{-- <a class="btn btn-primary" href="/dashboardMahasiswa" role="button">Login</a> --}}
                                        <button type="submit" class="btn btn-primary">Login</button>

                                        {{-- <a href="/registerMahasiswa" class="btn btn-link">Belum Punya Akun?</a> --}}
                                    </form>
                                </div>



                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                            ...</div>


                    </div>

                </div>
            </div>
        </div>

    </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
