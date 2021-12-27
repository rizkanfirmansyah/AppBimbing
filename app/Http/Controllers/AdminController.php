<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Guidance;
use App\Models\Mahasiswa;
use App\Models\Seminar;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

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
        $user = User::all();
        $dosen = Dosen::all();
        $bimbingan = Guidance::all();
        $title = 'Dashboard Admin';
        return view('admin.dashboard', compact('user', 'dosen', 'bimbingan'));
    }

    public function users()
    {
        $user = User::all()->where('role', '!=', '1');
        $title = 'Data user';
        return view('admin.user', compact('title', 'user'));
    }

    public function user_tambah()
    {
        // $user = User::find($_GET['id']);
        $title = 'Data user';
        return view('admin.user.tambah', compact('title'));
    }

    public function user_add(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'name' => 'required|min:4|max:255|unique:users',
            'password' => 'required|min:5|max:255',
            'nama' => 'required',
            'role' => 'required',
            'jurusan' => 'required',
        ]);

        $user = ['name' => $request->name, 'role' => $request->role, 'password' => Hash::make($request->password)];
        $data = User::create($user);

        if ($request->role == 2) {
            $dosen = ['nama' => $request->nama, 'jurusan' => $request->jurusan, 'user_id' => $data->id];
            Dosen::create($dosen);
        } else {
            $mahasiswa = ['nama' => $request->nama, 'npm' => $request->name, 'jurusan' => $request->jurusan, 'user_id' => $data->id];
            mahasiswa::create($mahasiswa);
        }

        $request->session()->flash('success', 'User has been created! ');
        return redirect()->route('admin-users');
    }

    public function user_edit(Request $request)
    {
        $user = User::find($_GET['id']);
        if ($user->role == 2) {
            $data = Dosen::where('user_id', $user->id)->get()[0];
        } else {
            $data = Mahasiswa::where('user_id', $user->id)->get()[0];
        }
        $title = 'Data user';
        return view('admin.user.edit', compact('title', 'data', 'user'));
    }

    public function user_edit_confirm(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'nama' => 'required',
            'jurusan' => 'required',
        ]);

        $user = ['name' => $request->name, 'role' => $request->role];
        $data = User::find($request->id)->update($user);

        if ($request->role == 2) {
            $dosen = ['nama' => $request->nama, 'jurusan' => $request->jurusan];
            Dosen::where('user_id', $request->id)->update($dosen);
        } else {
            $mahasiswa = ['nama' => $request->nama, 'npm' => $request->name, 'jurusan' => $request->jurusan];
            mahasiswa::where('user_id', $request->id)->update($mahasiswa);
        }

        $request->session()->flash('success', 'User has been updated! ');
        return redirect()->route('admin-users');
    }

    public function user_delete(Request $request)
    {
        $id = $_GET['id'];
        $user = User::find($id);
        if ($user->role == 2) {
            Dosen::where('user_id', $user->id)->delete();
        } else {
            Mahasiswa::where('user_id', $user->id)->delete();
        }
        $user->delete();
        $request->session()->flash('success', 'User has been deleted! ');
        return redirect()->route('admin-users');
    }

    public function dosen()
    {
        $dosen = Dosen::all();
        $title = 'Data Dosen';
        return view('admin.dosen', compact('title', 'dosen'));
    }

    public function mahasiswa()
    {
        $bimbingan = Guidance::all();
        $dosen = Dosen::all();
        $title = 'Data Pengajuan Bimbingan';
        return view('admin.mahasiswa', compact('title', 'bimbingan', 'dosen'));
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
        $title = 'Data Seminar';
        $seminar = Seminar::all();
        return view('admin.seminar', compact('title', 'seminar'));
    }

    public function result()
    {
        $dosen = Dosen::all();
        $title = 'Data Hasil Bimbingan';
        $data = Guidance::find($_GET['id']);
        return view('admin.result', compact('title', 'dosen', 'data'));
    }

    public function result_post(Request $request)
    {
        if ($request->dosen) {
            $data = [
                'dosen_id' => $request->dosen,
                'status' => '2',
            ];
            Guidance::find($request->id)->update($data);
            $request->session()->flash('success', 'Pengajuan bimbingan sukses diperbaharui!');
            return redirect()->route('admin-bimbingan');
        }
        $request->session()->flash('error', 'Pengajuan bimbingan gagal diperbaharui, pilih dosen terlebih dahulu!');
        return redirect()->back();
    }
}
