<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Dream;
use App\Models\FriendRequest;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index()
    {
        $data = User::all();
        return view('index', compact('data'));
    }

    public function friends(Request $request)
    {
        $data = collect((new FriendRequest())->getFriendList($request->user_id));
        return view('index', compact('data'));
    }

    public function dreams()
    {
        $data = Dream::join('users', 'dreams.user_id', 'users.id')->join('plants', 'dreams.id', 'plants.dream_id')->select('dreams.*', 'plants.height', 'users.name')->orderBy('created_at', 'DESC')->get();
        return view('dreams', compact('data'));
    }

    public function comments()
    {
        $data = Comment::join('users', 'comments.user_id', 'users.id')->join('dreams', 'dreams.id', 'comments.dream_id')->select('comments.*', 'users.name', 'dreams.title')->orderBy('created_at', 'DESC')->get();
        return view('comments', compact('data'));
    }

    public function payments()
    {
        $data = Payment::join('users', 'payments.user_id', 'users.id')->select('payments.*', 'users.name')->orderBy('created_at', 'DESC')->get();
        return view('payments', compact('data'));
    }

    public function changeStatus(Request $request)
    {
        $currentStatus = getMetaValue('user_meta', ['user_id' => $request->user_id, 'meta_key' => 'banned']);
        if (empty($currentStatus)) {
            saveMetaData('user_meta', ['user_id' => $request->user_id, 'meta_key' => 'banned'], ['meta_value' => true]);
            $msg = 'User banned successfully';
        } else {
            deleteMetaValues('user_meta', ['user_id' => $request->user_id, 'meta_key' => 'banned']);
            $msg = 'User ban removed successfully';
        }
        $data = User::all();
        return back()->with(compact('data', 'msg'));
    }

    public function changeRatings(Request $request)
    {
        saveMetaData('user_meta', ['user_id' => $request->user_id, 'meta_key' => 'rating'], ['meta_value' => $request->ratings]);

        return back();
    }

    public function changeHoots(Request $request)
    {
        saveMetaData('user_meta', ['user_id' => $request->user_id, 'meta_key' => 'hoots'], ['meta_value' => $request->hoots]);

        return back();
    }
}
