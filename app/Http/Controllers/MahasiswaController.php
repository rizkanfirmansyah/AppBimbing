<?php

namespace App\Http\Controllers;

use App\Models\Guidance;
use App\Models\Mahasiswa;
use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mahasiswa = Mahasiswa::where('user_id', auth()->user()->id)->get();
        $bimbingan = Guidance::where('mahasiswa_id', $mahasiswa[0]->id)->get();
        $title = 'Dashboard Mahasiswa';
        return view('mahasiswa/dashboardMahasiswa', compact('title', 'mahasiswa', 'bimbingan'));
    }


    public function profile()
    {
        $mahasiswa = Mahasiswa::where('user_id', auth()->user()->id)->get();
        return view('mahasiswa.profile', ['title' => 'Profile Mahasiswa', 'data' => $mahasiswa]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        //
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'formFile' => 'required',
        ]);
        // dd(request()->file('file'));
        $filename = round(microtime(true) * 1000).'-'.str_replace(' ','-',$request->file('formFile')->getClientOriginalName());
        $request->file('formFile')->move(public_path('files'), $filename);
        $request->request->add(['mahasiswa_id' => Mahasiswa::where('user_id', auth()->user()->id)->get()[0]->id, 'file' => $filename]);
        $guidance = Guidance::create($request->all());
        Notification(auth()->user()->name, 'admin', ['title' => 'Pengajuan Bimbingan Mahasiswa Baru', 'description' => 'Pengajuan Bimbingan Mahasiswa Baru', 'status' => 'action', 'role' => 'personal', 'type' => 'notification', 'link' => 'admin/result?data='. $request->title .'&id='. $guidance->id]);
        $request->session()->flash('success', 'Pengajuan telah dibuat, tunggu hasil bimbingan!');
        return redirect()->route('pengajuan-bimbingan');
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
}
