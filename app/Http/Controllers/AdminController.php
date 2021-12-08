<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Guidance;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return view('admin.dashboard', ['title' => 'Dashboard Admin']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function mahasiswa()
    {
        return view('admin.mahasiswa', ['title' => 'Data Mahasiswa Bimbingan']);
    }

    public function bimbingan()
    {
        $bimbingan = Guidance::all();
        $dosen = Dosen::all();
        $title = 'Data Pengajuan Bimbingan';
        return view('admin.list', compact('title', 'bimbingan', 'dosen'));
    }

    public function seminar()
    {
        return view('admin.seminar', ['title' => 'Data Seminar']);
    }

    public function result()
    {
        $dosen = Dosen::all();
        $title = 'Data Hasil Bimbingan';
        return view('admin.result', compact('title', 'dosen'));
    }
}
