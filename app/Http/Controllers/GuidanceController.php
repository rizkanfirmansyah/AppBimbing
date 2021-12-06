<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GuidanceController extends Controller
{
    //
    public function submission()
    {
        return view('mahasiswa.submission', ['title' => 'Pengajuan Bimbingan']);
    }

    public function list()
    {
        return view('mahasiswa.list', ['title' => 'Hasil Bimbingan']);
    }

    public function result()
    {
        return view('mahasiswa.result', ['title' => 'Detail Hasil Bimbingan']);
    }
}
