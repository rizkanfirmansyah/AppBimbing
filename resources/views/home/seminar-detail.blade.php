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

                            <div class="card mt-3 bg-transparent text-white">
                                <div class="card-header">
                                    {{ $seminar->title }}
                                </div>
                                <div class="card-body">
                                    <p>{{ $seminar->description }}</p>
                                    <span>Tanggal : {{ date('d-M-Y', strtotime($seminar->date)) }}</span><br>
                                    <span>Peserta : {{ checkPeserta($seminar->id) }}</span><br>
                                    <span>Max Peserta : {{ $seminar->max }}</span>
                                    <footer class="blockquote-footer text-white text-small text-end">
                                        {{ $seminar->speaker }}
                                    </footer>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="card-body text-white">
                                <form action="{{ route('create-peserta') }}" method="POST">
                                    @csrf
                                    <div class="mb-3">
                                        <input type="hidden" value="{{ $seminar->id }}" name="seminar_id">
                                        <input type="hidden"
                                            value="{{ strtoupper(substr($seminar->title, 0, 1)) . '-' . $seminar->id . Auth::user()->id }}"
                                            name="ticket">
                                        <label for="nama" class="form-label">Nama :</label>
                                        <input type="text" class="form-control @error('nama') is-invalid text-white @enderror"
                                            id="nama" placeholder="Input Nama" name="nama">
                                        @error('nama')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="instansi" class="form-label">Instansi :</label>
                                        <input type="text" class="form-control  @error('instansi') is-invalid text-white @enderror"
                                            id="instansi" placeholder="Enter Instansi" name="instansi">
                                        @error('instansi')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label for="sosmed" class="form-label">Sosial Media :</label>
                                        <input type="text" class="form-control  @error('sosmed') is-invalid text-white @enderror"
                                            id="sosmed" placeholder="Enter Sosial Media" name="sosmed">
                                        @error('sosmed')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    @if (checkPeserta($seminar->id) > $seminar->max)
                                        <a class="btn btn-secondary text-white">Kuota Seminar Penuh</a>
                                    @else
                                        <button type="submit" class="btn btn-primary">Join</button>
                                    @endif
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
