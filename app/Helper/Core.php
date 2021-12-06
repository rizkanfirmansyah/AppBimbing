<?php

function hello()
{
    return 'hello';
}

function whatRoutes()
{
    $id = auth()->user()->role;
    if ($id == 3) {
        return route('dashboard-mahasiswa');
    } else if($id == 2) {
        return route('dashboard-dosen');
    }
}

function whatRoutesActive()
{
    if(request()->routeIs('dashboard-mahasiswa') || request()->routeIs('dashboard-dosen')) return 1;

    return 0;
}
