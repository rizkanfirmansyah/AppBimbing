<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $role=Auth::user()->role;

        if($role='0'){
            return view('admin/loginMahasiswa', ['title' => 'Login Mahasiswa']);
        }

        if($role='1'){
            return view('admin/loginDosen', ['title' => 'Login Dosen']);
        }

        if($role='0'){
            return view('admin/loginAdmin', ['title' => 'Login Admin']);
        }

        else{
            return view ('/');
        }
    }
}
