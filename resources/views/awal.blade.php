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
                <center>Login Sebagai :</center>
            </h1>
        </div>

        <div class="container mt-4">
            <div class="row align-items-start">
                <div class="col">
                    <div class="card" style="width: 12rem;">
                        <img src="{{ URL::asset('/images/mahasiswaLoginIcon.png') }}" class="card-img-top"
                            alt="admin.png">
                        <div class="card-body">
                            <h5 class="card-title">
                                <center>Mahasiswa</center>
                            </h5>
                            <center>
                                <a href="/loginMahasiswa" class="btn btn-primary">Login Mahasiswa</a>
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card" style="width: 12rem;">
                        <img src="{{ URL::asset('/images/dosenLoginIcon.png') }}" class="card-img-top"
                            alt="admin.png">
                        <div class="card-body">
                            <h5 class="card-title">
                                <center>Dosen</center>
                            </h5>
                            <center>
                                <a href="/loginDosen" class="btn btn-primary">Login Dosen</a>
                            </center>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card" style="width: 12rem;">
                        <img src="{{ URL::asset('/images/adminLoginIcon.png') }}" class="card-img-top"
                            alt="admin.png">
                        <div class="card-body">
                            <h5 class="card-title">
                                <center>Admin</center>
                            </h5>
                            <center>
                                <a href="/loginAdmin" class="btn btn-primary">Login Admin</a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>
