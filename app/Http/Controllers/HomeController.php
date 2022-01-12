<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Mahasiswa;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $role = Auth::user()->role;

        if ($role = '0') {
            return view('admin/loginMahasiswa', ['title' => 'Login Mahasiswa']);
        }

        if ($role = '1') {
            return view('admin/loginDosen', ['title' => 'Login Dosen']);
        }

        if ($role = '0') {
            return view('admin/loginAdmin', ['title' => 'Login Admin']);
        } else {
            return view('/');
        }
    }

    public function changeprofile(Request $request)
    {
        $request->validate([
            'files' => 'mimes:jpg,bmp,png'
        ]);
        if ($request->file('files') !== null) {
            $filename = round(microtime(true) * 1000) . '-' . str_replace(' ', '-', $request->file('files')->getClientOriginalName());
            $request->file('files')->move(public_path('files'), $filename);
            $request->request->add(['photo' => $filename]);
        }
        if ($request->type == 'mahasiswa') {
            Mahasiswa::find($request->id)->update($request->all());
        } else {
            Dosen::find($request->id)->update($request->all());
        }

        return redirect()->route('profile-mahasiswa');
    }
}
