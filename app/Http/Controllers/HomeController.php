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
        if ($request->type == 'mahasiswa') {
            Mahasiswa::find($request->id)->update($request->all());
        }else{
            Dosen::find($request->id)->update($request->all());
        }

        return redirect()->route('profile-mahasiswa');
    }
}
