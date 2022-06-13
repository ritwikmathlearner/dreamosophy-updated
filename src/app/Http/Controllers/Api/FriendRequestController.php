<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\FriendRequest;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class FriendRequestController extends Controller
{
    public function send(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'received_by' => 'required|exists:users,id'
            ], [
                'received_by.required' => 'Friend\'s id is required',
                'received_by.exists' => 'Friend does not exist'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $exists = FriendRequest::where([
                'sent_by' => auth()->id(),
                'received_by' => $request->received_by,
            ])->orWhere(function ($query) use ($request) {
                $query->where('sent_by', $request->received_by)
                    ->where('received_by', auth()->id());
            })->get();

            if (count($exists) > 0) return sendFailResponse("Friend request already pending or accepted");

            $data = FriendRequest::create([
                'sent_by' => auth()->id(),
                'received_by' => $request->received_by,
                'status' => 'pending'
            ]);

            return sendSuccessResponse("Friend request sent", $data);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Friend request sent failed");
        }
    }

    public function accept(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'sent_by' => 'required|exists:users,id'
            ], [
                'sent_by.required' => 'Friend\'s id is required',
                'sent_by.exists' => 'Friend does not exist'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $exists = FriendRequest::where([
                'sent_by' => $request->sent_by,
                'received_by' => auth()->id(),
                'status' => 'pending'
            ])->first();

            if (!$exists) return sendFailResponse("No pending friend request found", 404);
            $exists->status = 'accepted';
            $exists->save();

            return sendSuccessResponse("Friend request accepted", $exists);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Friend request accept failed");
        }
    }

    public function reject(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'sent_by' => 'required|exists:users,id'
            ], [
                'sent_by.required' => 'Friend\'s id is required',
                'sent_by.exists' => 'Friend does not exist'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $exists = FriendRequest::where([
                'sent_by' => $request->sent_by,
                'received_by' => auth()->id(),
                'status' => 'pending'
            ])->first();

            if (!$exists) return sendFailResponse("No pending friend request found", 404);
            $exists->status = 'rejected';
            $exists->save();

            return sendSuccessResponse("Friend request rejected", $exists);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Friend request reject failed");
        }
    }

    public function list()
    {
        try {
            $data = (new FriendRequest())->getFriendList(auth()->id());
            return sendSuccessResponse("List fetched", $data);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Friend requests fetch failed");
        }
    }

    public function getFriendDetails(User $user)
    {
        try {
            $result = (new FriendRequest())->isFriend(auth()->id(), $user->id);
            if (!$result) return sendFailResponse("{$user->name} is not your dream buddy", 403);

            $frRequest = FriendRequest::where([
                'sent_by' => $user->id,
                'received_by' => auth()->id()
            ])->orWhere([
                'received_by' => $user->id,
                'sent_by' => auth()->id()
            ])->first(); 

            $user_meta = getMetaValues('user_meta', ['user_id' => $user->id]);
            $user->total_dreams = $user->dreams()->count();
            $user->request_id = $frRequest->id;
            $user->relation = $frRequest->received_by == auth()->id() ? $frRequest->sender_relation : $frRequest->receiver_relation;
            $user->meta_data = $user_meta;
            return sendSuccessResponse("Dream boddy fetched", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function pending()
    {
        try {
            $data = FriendRequest::select('sent_by as user_id', 'name', 'status')->join('users', 'sent_by', 'users.id')->where('status', 'pending')->where('received_by', auth()->id())->get();
            return sendSuccessResponse("List fetched", $data);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Pending friend request fetch failed");
        }
    }

    public function updateRelation(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'request_id' => 'required|exists:friend_requests,id',
                'friend_id' => 'required|exists:users,id',
                'relation' => 'required'
            ], [
                'request_id.required' => 'Friend Request id is required',
                'request_id.exists' => 'Friend Request does not exist',
                'friend_id.required' => 'Friend\'s id is required',
                'friend_id.exists' => 'Friend does not exist'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $result = (new FriendRequest())->isFriend(auth()->id(), $request->friend_id);
            if (!$result) return sendFailResponse("Requested user is not your dream buddy", 403);

            $updateField = FriendRequest::find($request->request_id)->received_by == auth()->id() ? 'sender_relation' : 'receiver_relation';

            $data = FriendRequest::where('id', $request->request_id)->update([
                "$updateField" => $request->relation
            ]);

            return sendSuccessResponse("Relation updated", $data);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Relation update failed");
        }
    }
}
