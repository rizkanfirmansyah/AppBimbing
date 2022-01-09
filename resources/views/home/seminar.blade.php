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

    <div class="main m-5 pb-5">

        @include('home.navbar')


        <div class="section mb-5">

            <div class="jumbotron">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6">

                            <h2 class="subtitle-jumbotron mb-3">App Bimbing</h2>
                            <h1 class="title-jumbotron mb-3">SEMINAR PAGE</h1>
                            <p class="paragraph-jumbotron mb-4" style="text-align: justify">Beberapa seminar yang sedang berlangsung di kampus STMIK AMIK Bandung</p>

                        </div>
                        <div class="col-md-6">

                            <img src="/images/logo.png" alt="images" class="img-fluid ms-5">
                            {{-- <i class="fa fa-school img-fluid ms-1 md-ms-5 lg-ms-5 text-white"></i> --}}

                        </div>

                    </div>
                </div>
            </div>

            <div class="container mb-5">
                <div class="row text-center text-white mb-5">
                    <h1>Kumpulan Seminar yang Berlangsung</h1>
                </div>
                <div class="row mb-5">
                    @foreach ($seminar as $item)
                    <div class="col-sm-4">
                        <div class="card bg-transparent text-white border-white border">
                            <div class="card-header bg-primary">
                              Featured
                            </div>
                            <div class="card-body">
                              <h5 class="card-title">{{$item->title}}</h5>
                              <p class="card-text">{{$item->description}}</p>
                              <a href="{{ route('join-seminar', $item->id) }}" class="btn btn-primary">Join Now</a>
                            </div>
                          </div>
                    </div>
                    @endforeach
                    {{-- <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header">
                              Featured
                            </div>
                            <div class="card-body">
                              <h5 class="card-title">Special title treatment</h5>
                              <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                              <a href="#" class="btn btn-primary">Join Now</a>
                            </div>
                          </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header">
                              Featured
                            </div>
                            <div class="card-body">
                              <h5 class="card-title">Special title treatment</h5>
                              <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                              <a href="#" class="btn btn-primary">Join Now</a>
                            </div>
                          </div>
                    </div> --}}
                </div>
            </div>

        </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
