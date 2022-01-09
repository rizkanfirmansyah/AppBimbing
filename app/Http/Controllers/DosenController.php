<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Guidance;
use App\Models\Mahasiswa;
use App\Models\Revisions;
use App\Models\User;
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
        if ($request->type == 'guidance') {
            if ($request->file_upload) {
                $filename = round(microtime(true) * 1000) . '-' . str_replace(' ', '-', $request->file('file_upload')->getClientOriginalName());
                $request->file('file_upload')->move(public_path('files'), $filename);
            }
            if ($request->status == '4') {
                $data = [
                    'status' => '0',
                    'user_id' => auth()->user()->name,
                    'guidance_id' => $request->id,
                    'description' => $request->keterangan,
                    'file' => $filename,
                ];
                Revisions::create($data);
            }
            $request->request->add(['status' => $request->status, 'description_dosen' => $request->keterangan]);
            Guidance::find($request->id)->update($request->all());
            $guidance = Guidance::find($request->id);
            $mahasiswa = Mahasiswa::find($guidance->mahasiswa_id);
            $user = User::find($mahasiswa->user_id);
            if ($request->status == 1) {
                $title = 'Selamat bimbingan berhasil di Setujui';
            } else {
                $title = 'Maaf, bimbingan ditolak. Coba lagi!';
            }
            Notification(auth()->user()->name, $user->name, ['title' => $title, 'description' => $request->keterangan ? $request->keterangan : 'tidak ada keterangan', 'status' => 'action', 'role' => 'personal', 'type' => 'notification', 'link' => '/bimbingan/hasil?data=' . $guidance->title . '&id=' . $guidance->id]);
        } else {
            $filename = null;
            if ($request->file_upload) {
                $filename = round(microtime(true) * 1000) . '-' . str_replace(' ', '-', $request->file('file_upload')->getClientOriginalName());
                $request->file('file_upload')->move(public_path('files'), $filename);
            }
            $data = [
                'status' => $request->status,
                'user_id' => auth()->user()->name,
                'guidance_id' => $request->id,
                'description' => $request->keterangan,
                'file' => $filename,
            ];
            Revisions::create($data);
            if ($request->status == 1) {
                $request->request->add(['status' => $request->status, 'description_dosen' => $request->keterangan]);
                Guidance::find($request->id)->update($request->all());
            }
            $guidance = Guidance::find($request->id);
            $mahasiswa = Mahasiswa::find($guidance->mahasiswa_id);
            $user = User::find($mahasiswa->user_id);
            if ($request->status == 1) {
                $title = 'Selamat bimbingan berhasil di Setujui';
            } else {
                $title = 'Maaf, bimbingan direvisi. Coba lagi!';
            }
            Notification(auth()->user()->name, $user->name, ['title' => $title, 'description' => $request->keterangan ? $request->keterangan : 'tidak ada keterangan', 'status' => 'action', 'role' => 'personal', 'type' => 'notification', 'link' => '/bimbingan/hasil?data=' . $guidance->title . '&id=' . $guidance->id]);
        }
        return redirect()->route('list-bimbingan');
    }

    public function list()
    {
        $dosen = Dosen::where('user_id', auth()->user()->id)->get()[0];
        $data = Guidance::where('dosen_id', $dosen->id)->where('status', '!=', '3')->get();
        $mahasiswa = Guidance::where('dosen_id', $dosen->id)->groupBy('mahasiswa_id')->get();
        $title = 'Daftar Bimbingan';
        return view('dosen.list', compact('title', 'data', 'mahasiswa', 'dosen'));
    }

    public function mahasiswa()
    {
        $dosen = Dosen::where('user_id', auth()->user()->id)->get()[0];
        $data = Guidance::where('dosen_id', $dosen->id)->where('status', '!=', '3')->get();
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

    public function revisi()
    {
        if ($_GET['type'] == 'guidance') {
            $data = Guidance::find($_GET['id']);
        } else {
            $guidance = Guidance::find($_GET['id']);
            $revisi = Revisions::find($_GET['id'] );
            $data['bimbingan'] = $guidance;
            $data['revisi'] = $revisi;
        }
        $title = 'Daftar Revisi';
        return view('dosen.revisi', compact('title', 'data'));
    }

    public function list_revisi()
    {
        $data = Revisions::where('guidance_id', $_GET['id'])->where('user_id', '!=', auth()->user()->name)->get();
        $title = 'Daftar Revisi';
        return view('dosen.list_revisi', compact('title', 'data'));
    }
}
