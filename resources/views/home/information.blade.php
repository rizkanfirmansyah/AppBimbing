<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title }}</title>

    <link rel="stylesheet" href="/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/assets/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body>

    <div class="main">

        @include('home.navbar')


        <div class="section">

            <div class="jumbotron">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6">

                            <h2 class="subtitle-jumbotron mb-3">App Bimbing</h2>
                            <h1 class="title-jumbotron mb-3">INFORMATION PAGE</h1>
                            <p class="paragraph-jumbotron mb-4">Bagaimana cara menggunakan aplikasi bimbingan skripsi ini?</p>

                            <div class="accordion accordion-flush" id="accordionFlushExample">
                                <div class="accordion-item border-white border text-white bg-transparent">
                                  <h2 class="accordion-header bg-transparent" id="flush-headingOne">
                                    <button class="accordion-button collapsed bg-transparent text-white border-white border" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                      Buat akun
                                    </button>
                                  </h2>
                                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Pertama, buat akun dengan cara login lalu klik <i>Belum punya akun </i> untuk registrasi akun.</div>
                                  </div>
                                </div>
                                <div class="accordion-item border-white border text-white bg-transparent">
                                  <h2 class="accordion-header bg-transparent" id="flush-headingTwo">
                                    <button class="accordion-button collapsed bg-transparent text-white border-white border" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                      Buat aplikasi bimbingan
                                    </button>
                                  </h2>
                                  <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Tahap selanjutnya adalah buat aplikasi atau laporan bimbingan anda di dalam menu data bimbingan.</div>
                                  </div>
                                </div>
                                <div class="accordion-item border-white border text-white bg-transparent">
                                  <h2 class="accordion-header bg-transparent" id="flush-headingThree">
                                    <button class="accordion-button collapsed bg-transparent text-white border-white border" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                      Approval oleh BAK
                                    </button>
                                  </h2>
                                  <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Aplikasi yang telah di input selanjutnya akan di cek dan di approved oleh pihak BAK yang selanjutnya akan diserahkan ke masing-masing dosen pembimbing</div>
                                  </div>
                                </div>
                                <div class="accordion-item border-white border text-white bg-transparent">
                                  <h2 class="accordion-header bg-transparent" id="flush-headingFour">
                                    <button class="accordion-button collapsed bg-transparent text-white border-white border" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                                      Approved Bimbingan
                                    </button>
                                  </h2>
                                  <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">Terakhir data bimbingan yang sudah di approve ke masing-masing dosen akan dicek, dan diberi keterangan oleh masing-masing dosen. Apakah bimbingan di setujui atau di tolak.</div>
                                  </div>
                                </div>
                              </div>

                        </div>
                        <div class="col-md-6">

                            <img src="/images/logo.png" alt="images" class="img-fluid ms-5">
                            {{-- <i class="fa fa-school img-fluid ms-1 md-ms-5 lg-ms-5 text-white"></i> --}}

                        </div>

                    </div>
                </div>
            </div>

        </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
