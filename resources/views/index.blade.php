<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App Bimbingan</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/assets/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

    <div class="main">

        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
              <a class="navbar-brand" href="#">Aplikasi Bimbingan</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                  <a class="nav-link mx-3 active" id="active" aria-current="page" href="#">Home</a>
                  <a class="nav-link mx-3" href="#">Tutorial</a>
                  <a class="nav-link mx-3" href="#">Services</a>
                  <a class="nav-link mx-3">About Us</a>
                  <a href="{{ route('login') }}" class="nav-link mx-3 active" id="active">Login <img class="img-fluid img-nav" src="/assets/img/login-svgrepo-com 1.png" alt=""></a>
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

                        <h2 class="subtitle-jumbotron mb-3">App Bimbing</h2>
                        <h1 class="title-jumbotron mb-3">MUDAH BIMBINGAN LEWAT APLIKASI SECARA ONLINE</h1>
                        <p class="paragraph-jumbotron mb-4">Buathlah laporan bimbingan mu dengan mudah bersama app bimbing kami secara online. Hubungi dosen dan bagian admin kampus dengan mudah lewat virtual dan data digital</p>

                        <form class="d-flex me-5">
                            <!-- <input class="form-control me-5" type="search" placeholder="Search" aria-label="Search">
                            <button class=" btn-icon" type="submit"><img class="img-icon-search" src="/assets/img/search-svgrepo-com 1.png" alt=""></button> -->

                            <a href="{{ route('login') }}" class="py-2 px-4 btn btn-primary me-3">Daftar Sekarang</a>
                            <button class="py-2 px-4 btn btn-outline-primary">Informasi lanjut</button>
                          </form>

                    </div>
                    <div class="col-md-6">

                        <!-- <img src="/assets/img/police-badge-svgrepo-com 1.png" alt="images" class="img-fluid ms-5"> -->
                        <i class="fa fa-school img-fluid ms-1 md-ms-5 lg-ms-5 text-white" ></i>

                    </div>

                </div>
            </div>
        </div>

    </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
