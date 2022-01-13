<?php

use App\Models\Dosen;
use App\Models\Mahasiswa;
use App\Models\Notification;
use App\Models\NotificationStatus;
use App\Models\PesertaSeminar;
use App\Models\User;

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

function CheckMahasiswa($id, $array, $param = 'nama')
{
    $mahasiswa = Mahasiswa::find($id);

    if ($mahasiswa) {
        if ($param == 'nama') {
            return $array->mahasiswa->nama;
        } else if ($param == 'alamat') {
            return $array->mahasiswa->alamat;
        }
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

function SpeakerSeminar($data)
{
    $item = explode(',', $data);
    $speaker = '';

    foreach ($item as $key => $value) {
        $speaker .= '' . $value . ' ';
    }

    return $speaker;
}

function Notification($from, $to, $data)
{
    $data = [
        'to' => $to,
        'from' => $from,
        'role' => $data['role'] ? $data['role'] : null,
        'type' => $data['type'] ? $data['type'] : null,
        'title' => $data['title'] ? $data['title'] : null,
        'description' => $data['description'] ? $data['description'] : null,
        'status' => $data['status'] ? $data['status'] : 'acceptable',
        'link' => $data['link'] ? $data['link'] : null,
    ];
    $notif = Notification::where('from', $data['from'])->where('to', $data['to'])->where('link', $data['link'])->where('description', $data['description'])->get();
    if ($notif->count() < 1) {
        Notification::create($data);
    }
}

function NotifUsers()
{
    $data = Notification::where('to', auth()->user()->name)->orWhere('to', 'all')->get();
    return $data;
}

function NotifCount()
{
    $status = NotificationStatus::where('username', auth()->user()->name)->get()->count();
    $notif = Notification::where('to', auth()->user()->name)->orWhere('to', 'all')->count();
    return $notif - $status;
}

function CheckStatusNotif($id)
{
    $status = NotificationStatus::find($id);

    if ($status) {
        $status = 'text-muted';
    } else {
        $status = 'font-weight-bold';
    }

    return $status;
}

function linkTo($param, $id)
{
    if ($param == 'notification') {
        $notif = NotificationStatus::where('notification_id', $id)->where('username', auth()->user()->name)->get();
        if ($notif->count() < 1) {
            $data = ['notification_id' => $id, 'username' => auth()->user()->name, 'status' => 'read'];
            NotificationStatus::create($data);
        }
    }
    $link = Notification::find($id)->link;
    // dd($link);
    return $link;
}

function searchDosen($name)
{
    $user = User::where('name', $name)->get()[0];
    $data = Dosen::where('user_id', $user['id'])->get()[0];
    return $data;
}

function searchMahasiswa($name)
{
    $user = User::where('name', $name)->get()[0];
    $data = Mahasiswa::where('user_id', $user['id'])->get()[0];
    return $data;
}

function namaUser()
{
    $id = auth()->user()->id;
    $name = auth()->user()->name;
    if ($id == 2) $data = searchDosen($name);
    else $data = searchMahasiswa($name);

    return $data;
}

function checkPeserta($id)
{
    $peserta = PesertaSeminar::where('seminar_id', $id)->count();
    return $peserta;
}

// function status($id)
// {
//     if ($id === 2) return `<a class="badge badge-warning"><i class="fas fa-clock"></i> Waiting</a>`;
//     else if ($id === 2) return  '<a class="badge badge-success"><i class="fas fa-check"></i> Approved</a>';
//     else return  '<a class="badge badge-danger"><i class="fas fa-times"></i> Reject</a>';
// }
