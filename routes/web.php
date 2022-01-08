<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\GuidanceController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\SeminarController;
use Facade\FlareClient\Http\Response;
use Laravel\Jetstream\Rules\Role;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index', [
        "title" => "Web Bimbingan Skripsi"
    ]);
})->name('/');

Route::get('/information', function () {
    return view('home.information', [
        "title" => "Information Web Bimbingan Skripsi"
    ]);
})->name('information');

Route::get('/about', function () {
    return view('home.about', [
        "title" => "About Us | Web Bimbingan Skripsi"
    ]);
})->name('about');

Route::get('/linkTo/{id}', [AdminController::class, 'linkTo'])->name('link-to');

Route::get('/login', function () {
    return view('login', [
        "title" => "Login App"
    ]);
})->name('login');

Route::get('/loginMahasiswa', function () {
    return view('mahasiswa/loginMahasiswa', ['title' => 'Login Mahasiswa']);
})->name('login-mahasiswa');

Route::get('/registerMahasiswa', function () {
    return view('mahasiswa/registerMahasiswa', ['title' => 'Register Mahasiswa']);
})->name('register');

Route::group(['prefix' => 'mahasiswa', 'middleware' => 'auth'], function () {
    Route::get('/dashboard', [MahasiswaController::class, 'index'])->name('dashboard-mahasiswa');
    Route::get('/profile', [MahasiswaController::class, 'profile'])->name('profile-mahasiswa');
    Route::get('/revisi', [MahasiswaController::class, 'revisi'])->name('revisi-mahasiswa');
    Route::post('/insert/revisi', [MahasiswaController::class, 'store'])->name('insert-revisi');
});

Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function () {
    Route::get('/dashboard', [AdminController::class, 'index'])->name('dashboard-admin');
    Route::get('/bimbingan', [AdminController::class, 'bimbingan'])->name('admin-bimbingan');
    Route::get('/mahasiswa', [AdminController::class, 'mahasiswa'])->name('admin-mahasiswa');
    Route::get('/seminar', [AdminController::class, 'seminar'])->name('admin-seminar');
    Route::get('/dosen', [AdminController::class, 'dosen'])->name('admin-dosen');
    Route::get('/dosen_tambah', [AdminController::class, 'dosen_tambah'])->name('admin-dosen-tambah');
    Route::get('/dosen_edit', [AdminController::class, 'dosen_edit'])->name('admin-dosen-edit');
    Route::get('/dosen_hapus', [AdminController::class, 'dosen_hapus'])->name('admin-dosen-hapus');
    Route::get('/user_tambah', [AdminController::class, 'user_tambah'])->name('admin-user-tambah');
    Route::get('/user_edit', [AdminController::class, 'user_edit'])->name('admin-user-edit');
    Route::get('/users', [AdminController::class, 'users'])->name('admin-users');
    Route::get('/result', [AdminController::class, 'result'])->name('admin-result');
    Route::post('/result_post', [AdminController::class, 'result_post'])->name('result-post');
});

Route::group(['prefix' => 'users', 'middleware' => 'auth'], function () {
    Route::post('/add', [AdminController::class, 'user_add'])->name('user-add');
    Route::get('/delete', [AdminController::class, 'user_delete'])->name('user-delete');
    Route::post('/edit', [AdminController::class, 'user_edit_confirm'])->name('user-edit');
});


Route::group(['prefix' => 'dosen', 'middleware' => 'auth'], function () {
    Route::get('/dashboard', [DosenController::class, 'index'])->name('dashboard-dosen');
    Route::get('/list/bimbingan', [DosenController::class, 'list'])->name('list-bimbingan');
    Route::get('/mahasiswa/bimbingan', [DosenController::class, 'mahasiswa'])->name('mahasiswa-bimbingan');
    Route::get('/proses/bimbingan', [DosenController::class, 'proses'])->name('proses-bimbingan');
    Route::post('/approved', [DosenController::class, 'approved'])->name('approved-guidance');
    Route::get('/list/revisi', [DosenController::class, 'list_revisi'])->name('list-revisi');
    Route::get('/revisi', [DosenController::class, 'revisi'])->name('revisi');
});


Route::group(['prefix' => 'bimbingan', 'middleware' => 'auth'], function () {
    Route::get('/pengajuan', [GuidanceController::class, 'submission'])->name('pengajuan-bimbingan');
    Route::get('/data', [GuidanceController::class, 'list'])->name('data-bimbingan');
    Route::get('/hasil', [GuidanceController::class, 'result'])->name('hasil-bimbingan');
    Route::post('/insert', [MahasiswaController::class, 'create'])->name('insert-bimbingan');
});

Route::group(['prefix' => 'seminar', 'middleware' => 'auth'], function () {
    Route::get('/create', [SeminarController::class, 'create'])->name('create-seminar');
    Route::get('/edit/{id}', [SeminarController::class, 'edit'])->name('edit-seminar');
    Route::post('/store', [SeminarController::class, 'store'])->name('store-seminar');
    Route::post('/update/{id}', [SeminarController::class, 'update'])->name('update-seminar');
    Route::get('/destroy/{id}', [SeminarController::class, 'destroy'])->name('destroy-seminar');
});

Route::group(['prefix' => 'kumpulan-seminar', 'middleware' => 'auth'], function () {
    Route::get('/', [SeminarController::class, 'index'])->name('seminar');
    Route::get('/join/{id}', [SeminarController::class, 'show'])->name('join-seminar');
    Route::post('/store', [SeminarController::class, 'join'])->name('create-peserta');
    Route::get('/participants{id}', [AdminController::class, 'detailPeserta'])->name('detail-peserta');
});


Route::get('/redirects',  [HomeController::class, "index"]);
Route::post('/change/profile',  [HomeController::class, "changeprofile"])->name('changeprofile');
Route::get('/download/file',  function () {
    $file =$_GET['id'];
    return response()->download(public_path("files/{$file}"));
})->name('download');


Route::get('/loginAdmin', function () {
    return view('admin/loginAdmin', ['title' => 'Login Admin']);
})->name('login-admin');


Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, "store"])->name('auth-register');
    Route::post('login', [AuthController::class, "login"])->name('auth-login');
    Route::post('password', [AuthController::class, "password"])->name('password');
});

Route::get('/change/password', [AuthController::class, "changepassword"])->middleware('auth')->name('change-password');

Route::get('/loginDosen', function () {
    return view('dosen/loginDosen', ['title' => 'Login Mahasiswa']);
})->name('login-dosen');

Route::get('/logout', [AuthController::class, "logout"])->name('logout');

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');
