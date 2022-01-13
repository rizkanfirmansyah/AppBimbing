<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="#">Aplikasi Bimbingan</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link mx-3 active" id="{{ request()->routeIs('/') ? 'active' : ' ' }}" aria-current="page"
                    href="{{ route('/') }}">Home</a>
                <a class="nav-link mx-3" href="{{ route('information') }}"
                    id="{{ request()->routeIs('information') ? 'active' : ' ' }}">Information</a>
                <a class="nav-link mx-3" href="{{ route('seminar') }}"
                    id="{{ request()->routeIs('seminar') ? 'active' : ' ' }}">Seminar</a>
                <a class="nav-link mx-3" href="{{ route('about') }}"
                    id="{{ request()->routeIs('about') ? 'active' : ' ' }}">About Us</a>
                @if (auth()->user())
                    <a href="{{ route('profile-mahasiswa') }}" class="nav-link mx-3 active" id="active"> {{ auth()->user()->role == 1 ? auth()->user()->name : namaUser()->nama }} <i class="fas fa-user"></i></a>
                @else
                    <a href="{{ route('login') }}" class="nav-link mx-3 active" id="active">Login <img
                            class="img-fluid img-nav" src="/assets/img/login-svgrepo-com 1.png" alt=""></a>
                @endif
            </div>
        </div>
    </div>
</nav>
