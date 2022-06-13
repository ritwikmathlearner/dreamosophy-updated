<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FriendRequest extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'sent_by',
        'received_by',
        'status'
    ];

    public function getFriendList($userId)
    {
        $blockedIds = BlockedUser::where('user_id', $userId)->get()->pluck('blocked_by')->toArray();
        $sent = FriendRequest::select('users.*', 'friend_requests.id as request_id', 'status', 'receiver_relation as relation')->join('users', 'received_by', 'users.id')->whereNotIn('users.id', $blockedIds)->where('status', 'accepted')->where('sent_by', $userId)->get()->toArray();
        $received = FriendRequest::select('users.*', 'friend_requests.id as request_id', 'status', 'sender_relation as relation')->join('users', 'sent_by', 'users.id')->whereNotIn('users.id', $blockedIds)->where('status', 'accepted')->where('received_by', $userId)->get()->toArray();
        return array_merge($sent, $received);
    }

    public function isFriend($userId, $friendId)
    {
        $data = BlockedUser::where([
            'user_id' => $userId,
            'blocked_by' => $friendId
        ])->first();
        
        if(!empty($data)) return false;
         
        $sent = FriendRequest::select('received_by as user_id', 'name', 'status')->join('users', 'received_by', 'users.id')->where('status', 'accepted')->where('sent_by', $userId)->where('received_by', $friendId)->get()->toArray();
        $received = FriendRequest::select('sent_by as user_id', 'name', 'status')->join('users', 'sent_by', 'users.id')->where('status', 'accepted')->where('received_by', $userId)->where('sent_by', $friendId)->get()->toArray();
        return count(array_merge($sent, $received)) > 0;
    }
}
