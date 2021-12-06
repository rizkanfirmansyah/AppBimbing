<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon">
            <i class="fab fa-bimobject"></i>
        </div>
        <div class="sidebar-brand-text mx-3">App Bimbing <sup></sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item {{ whatRoutesActive() > 0 ? 'active' : ' ' }}">
        <a class="nav-link" href="{{ whatRoutes() }}">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    {{-- Mahasiswa --}}
    @if (auth()->user()->role == 3)
        <!-- Heading -->
        <div class="sidebar-heading">
            Bimbingan
        </div>

        <!-- Nav Item - Charts -->
        <li class="nav-item {{ request()->routeIs('pengajuan-bimbingan') ? 'active' : ' ' }}">
            <a class="nav-link" href="{{ route('pengajuan-bimbingan') }}">
                <i class="fas fa-fw fa-file-alt"></i>
                <span>Pengajuan Bimbingan</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item {{ request()->routeIs('data-bimbingan') ? 'active' : ' ' }}">
            <a class="nav-link" href="{{ route('data-bimbingan') }}">
                <i class="fas fa-fw fa-table"></i>
                <span>Data Hasil Bimbingan</span></a>
        </li>
    @endif


    {{-- Dosen --}}
    @if (auth()->user()->role == 2)
        <!-- Heading -->
        <div class="sidebar-heading">
            Bimbingan
        </div>

        <!-- Nav Item - Charts -->
        <li class="nav-item {{ request()->routeIs('list-bimbingan') ? 'active' : ' ' }}">
            <a class="nav-link" href="{{ route('list-bimbingan') }}">
                <i class="fas fa-fw fa-clipboard-list"></i>
                <span>Daftar Bimbingan</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item {{ request()->routeIs('mahasiswa-bimbingan') ? 'active' : ' ' }}">
            <a class="nav-link" href="{{ route('mahasiswa-bimbingan') }}">
                <i class="fas fa-fw fa-users"></i>
                <span>Data Mahasiswa Bimbingan</span></a>
        </li>
    @endif

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <li class="nav-item {{ request()->routeIs('logout') ? 'active' : ' ' }}">
        <a class="nav-link" href="{{ route('logout') }}">
            <i class="fas fa-fw fa-sign-out-alt"></i>
            <span>Logout</span></a>
    </li>
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>
<!-- End of Sidebar -->
