<?php

use App\Models\Mahasiswa;

function hello()
{
    return 'hello';
}

function whatRoutes()
{
    $id = auth()->user()->role;
    if ($id == 3) {
        return route('dashboard-mahasiswa');
    } else if ($id == 2) {
        return route('dashboard-dosen');
    } else {
        return route('dashboard-admin');
    }
}

function whatRoutesActive()
{
    if (request()->routeIs('dashboard-mahasiswa') || request()->routeIs('dashboard-dosen') || route('dashboard-admin')) return 1;

    return 0;
}

function CheckRole($id)
{
    if ($id == 1) return 'Admin';
    else if ($id == 2) return 'Dosen';
    else if ($id == 3) return 'Mahasiswa';
}

function CheckMahasiswa($id, $array)
{
    $mahasiswa = Mahasiswa::find($id);

    if ($mahasiswa) {
        return $array->mahasiswa->nama;
    } else {
        return 'Mahasiswa tidak terdaftar';
    }
}

function CheckMahasiswaNPM($id, $array)
{
    $mahasiswa = Mahasiswa::find($id);

    if ($mahasiswa) {
        return $array->mahasiswa->npm;
    } else {
        return '-';
    }
}

function CheckMahasiswaJurusan($id, $array)
{
    $mahasiswa = Mahasiswa::find($id);

    if ($mahasiswa) {
        return $array->mahasiswa->jurusan;
    } else {
        return '-';
    }
}

// function status($id)
// {
//     if ($id === 2) return `<a class="badge badge-warning"><i class="fas fa-clock"></i> Waiting</a>`;
//     else if ($id === 2) return  '<a class="badge badge-success"><i class="fas fa-check"></i> Approved</a>';
//     else return  '<a class="badge badge-danger"><i class="fas fa-times"></i> Reject</a>';
// }
