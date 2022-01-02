<?php

namespace App\Http\Controllers;

use App\Models\Seminar;
use Illuminate\Http\Request;

class SeminarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'Input Data Seminar';
        return view('admin.seminar.create', compact('title'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'speaker' => 'required',
            'ruangan' => 'required',
            'max' => 'required',
        ]);

        Seminar::create($request->all());
        Notification(auth()->user()->name, 'all', ['title' => 'Seminar Baru "'. $request->title .'"', 'description' => $request->title, 'status' => 'action', 'role' => 'broadcast', 'type' => 'notification', 'link' => '/dosen/proses/bimbingan']);
        $request->session()->flash('success', 'Seminar berhasil dibuat! ');
        return redirect()->route('admin-seminar');
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
        $seminar = Seminar::find($id);
        $title = 'Input Data Seminar';
        return view('admin.seminar.edit', compact('title', 'seminar', 'id'));
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
        $request->validate([
            'title' => 'required',
            'speaker' => 'required',
            'ruangan' => 'required',
            'max' => 'required',
        ]);
        if(!empty($id)){
            $data = Seminar::find($id);
            $data->update($request->all());
            return redirect()->route('admin-seminar')->with('success', 'Seminar berhasil diperbaharui! ');
        }else{
            return redirect()->route('admin-seminar')->with('error', 'Seminar gagal diperbaharui! ');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(!empty($id)){
            Seminar::find($id)->delete();
            return redirect()->route('admin-seminar')->with('success', 'Seminar berhasil dihapus! ');
        }else{
            return redirect()->route('admin-seminar')->with('error', 'Seminar gagal dihapus! ');
        }
    }
}
