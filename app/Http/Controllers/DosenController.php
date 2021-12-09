<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Guidance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DosenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dosen = Dosen::where('user_id', auth()->user()->id)->get()[0];
        $data = Guidance::where('dosen_id', $dosen->id)->where('status', '2')->get();
        $mahasiswa = Guidance::where('dosen_id', $dosen->id)->groupBy('mahasiswa_id')->get();
        $title = 'Dashboard Dosen';
        return view('dosen.dashboard', compact('title', 'data', 'mahasiswa'));
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
    public function approved(Request $request)
    {
        //
        $request->request->add(['status' => 1, 'description_dosen' => $request->keterangan]);
        Guidance::find($request->id)->update($request->all());
        return redirect()->route('list-bimbingan');
    }

    public function list()
    {
        $dosen = Dosen::where('user_id', auth()->user()->id)->get()[0];
        $data = Guidance::where('dosen_id', $dosen->id)->where('status', '!=' ,'3')->get();
        $mahasiswa = Guidance::where('dosen_id', $dosen->id)->groupBy('mahasiswa_id')->get();
        $title = 'Daftar Bimbingan';
        return view('dosen.list', compact('title', 'data', 'mahasiswa', 'dosen'));
    }

    public function mahasiswa()
    {
        $dosen = Dosen::where('user_id', auth()->user()->id)->get()[0];
        $data = Guidance::where('dosen_id', $dosen->id)->where('status', '!=' ,'3')->get();
        $mahasiswa = Guidance::where('dosen_id', $dosen->id)->groupBy('mahasiswa_id')->get();
        $title = 'Daftar Mahasiswa';
        return view('dosen.mahasiswa', compact('title', 'data', 'mahasiswa', 'dosen'));
    }

    public function proses()
    {
        $data = Guidance::find($_GET['id']);
        $title = 'Proses Hasil Bimbingan';
        return view('dosen.proses', compact('title', 'data'));
    }
}
