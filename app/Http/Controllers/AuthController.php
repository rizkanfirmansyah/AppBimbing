<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redis;

class AuthController extends Controller
{
    //
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|min:4|max:255|unique:users',
            'password' => 'required|min:5|max:255',
            'nama' => 'required',
        ]);

        $user = ['name' => $request->name, 'password' => Hash::make($request->password)];
        $data = User::create($user);

        $mahasiswa = ['nama' => $request->nama, 'npm' => $request->name,  'jurusan' => $request->jurusan, 'user_id' => $data->id];
        Mahasiswa::create($mahasiswa);

        $request->session()->flash('success', 'User has been created! You can login now');
        return redirect()->route('login-mahasiswa');
    }

    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);
        $fieldType = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'name';
        $user = User::where($fieldType, $request->username);
        if ($user->count() > 0) {
            if (Auth::attempt([$fieldType => $request->username, 'password' => $request->password])) {
                $id = auth()->user()->role;
                if ($id == 3)
                    return redirect()->route('dashboard-mahasiswa');
                else if ($id == 2)
                    return redirect()->route('dashboard-dosen');
                else
                    return redirect()->route('dashboard-admin');
            } else {
                $request->session()->flash('error', 'Username or password wrong, try again!');
                return redirect()->back();
            }
        } else {
            $request->session()->flash('error', 'User not registered, please register!');
            return redirect()->back();
        }
    }

    public function logout()
    {
        $id = auth()->user()->role;
        Auth::logout();
        if ($id == 3)
            return redirect()->route('login-mahasiswa');
        else if ($id == 2)
            return redirect()->route('login-dosen');
        else
            return redirect()->route('login-admin');
    }

    public function password(Request $request)
    {
        $user = User::find(auth()->user()->id);
        $request->validate([
            'password_old' => 'required',
            'password_new' => 'required|min:5|max:255|different:password_old',
            'repeat_password' => 'required|same:password_new',
        ]);

        $user->update(['password' => bcrypt($request->password_new)]);
        $request->session()->flash('success', 'Password changed');
        return redirect('/change/password');
    }

    public function changepassword()
    {
        return view('auth.change-password', ['title' => 'Change Password User']);
    }
}
