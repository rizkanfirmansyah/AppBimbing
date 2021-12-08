<?php

namespace App\Http\Controllers;

use App\Models\Guidance;
use App\Models\Mahasiswa;
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
        $mahasiswa = Mahasiswa::where('user_id', auth()->user()->id)->get();
        $bimbingan = Guidance::where('mahasiswa_id', $mahasiswa[0]->id)->get();
        $title = 'Hasil Bimbingan';
        return view('mahasiswa.list', compact('title', 'mahasiswa', 'bimbingan'));
    }

    public function result()
    {
        return view('mahasiswa.result', ['title' => 'Detail Hasil Bimbingan']);
    }
}
