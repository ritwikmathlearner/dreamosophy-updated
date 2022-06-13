<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\FriendRequest;
use App\Models\Message;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    public function index(User $user)
    {
        try {
            $messages = Message::where([
                'sent_by' => auth()->id(),
                'received_by' => $user->id
            ])->orWhere([
                'sent_by' => $user->id,
                'received_by' => auth()->id()
            ])->orderBy('created_at', 'DESC')->get();

            foreach($messages as $message) {
                $message['sender_name'] = User::find($message->sent_by)->name;
                $message['recepient_name'] = User::find($message->received_by)->name;
            }

            return sendSuccessResponse("Stored message successfully", $messages);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to store messages");
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'user_id' => 'required|exists:users,id',
                'message' => 'required|string'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $friendIds = array_column((new FriendRequest())->getFriendList($request->user_id), 'id');

            if (!in_array(auth()->id(), $friendIds)) return sendFailResponse("You are not friend with this player", 403);

            $message = Message::create([
                'sent_by' => auth()->id(),
                'received_by' => $request->user_id,
                'message' => $request->message
            ]);

            $message['sender_name'] = auth()->user()->name;
            $message['recepient_name'] = User::find($request->user_id)->name;

            if (empty($message)) return sendFailResponse("Message storage failed");

            return sendSuccessResponse("Stored message successfully", $message);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to store messages");
        }
    }
}
