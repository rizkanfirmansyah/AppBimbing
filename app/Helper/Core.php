<?php

use App\Models\Mahasiswa;
use App\Models\Notification;
use App\Models\NotificationStatus;

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
    $notif = Notification::where('from', $data['from'])->where('to', $data['to'])->where('link', $data['link'])->get();
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
    return $notif - $status ;
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

// function status($id)
// {
//     if ($id === 2) return `<a class="badge badge-warning"><i class="fas fa-clock"></i> Waiting</a>`;
//     else if ($id === 2) return  '<a class="badge badge-success"><i class="fas fa-check"></i> Approved</a>';
//     else return  '<a class="badge badge-danger"><i class="fas fa-times"></i> Reject</a>';
// }
