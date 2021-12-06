<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Web Bimbingan</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container ">
            <a class="navbar-brand" href="#">Web Bimbingan</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link {{ $title === 'Home' ? 'active' : '' }}" href="/">Home</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>


    <div class="position-absolute top-50 start-50 translate-middle">
        <div class="container mb-4">
            <h1>
                <center>Login Mahasiswa</center>
            </h1>
        </div>

        <div class="container mt-4">
            <div class="card border bg-light" style="width: 40rem;">
                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
                        <div class="mb-3 mt-3">
                            <label for="nama" class="form-label">Nama Lengkap :</label>
                            <input type="nama" class="form-control @error('nama') is-invalid @enderror" id="nama"
                                placeholder="Input Nama Lengkap" name="nama">
                            @error('nama')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="mb-3 mt-3">
                            <label for="nama" class="form-label">Jurusan :</label>
                            <select class="form-select" name="jurusan" aria-label="Default select example">
                                <option selected disabled>Pilih Jurusan Anda</option>
                                <option value="Teknik Informatika">IF</option>
                                <option value="Sistem Informasi">SI</option>
                            </select>
                        </div>

                        <div class="mb-3 mt-3">
                            <label for="username" class="form-label">Username :</label>
                            <input type="username" class="form-control @error('name') is-invalid @enderror"
                                id="username" placeholder="Input NPM" name="name">
                            @error('name')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="pwd" class="form-label">Password:</label>
                            <input type="password" class="form-control  @error('password') is-invalid @enderror"
                                id="pwd" placeholder="Enter password" name="password">
                            @error('password')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        {{-- <a class="btn btn-primary" href="#" role="button">Daftar</a> --}}
                        <button type="submit" class="btn btn-primary">Daftar</button>

                        <a href="/loginMahasiswa" class="btn btn-link">Sudah Punya Akun?</a>
                    </form>
                </div>



            </div>
        </div>




    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>
