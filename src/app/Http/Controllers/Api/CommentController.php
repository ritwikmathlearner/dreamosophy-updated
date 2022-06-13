<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CommentResource;
use App\Models\Comment;
use App\Models\Dream;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class CommentController extends Controller
{
    public function index(Dream $dream)
    {
        try {
            $comments = CommentResource::collection($dream->comments()->orderBy('created_at', 'desc')->get());

            return sendSuccessResponse("Comments found", $comments);
        } catch(Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function save(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'comment' => 'required|string|min:2',
                'dream_id' => 'required|exists:dreams,id',
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $data = [
                'dream_id' => $request->dream_id,
                'user_id' => auth()->id(),
                'comment' => $request->comment
            ];

            $bad_word_intensity = count(array_intersect(Config::get('app.bad_words'), explode(" ", $request->comment)));

            if((bool) $bad_word_intensity) {
                $data['bad_comment_intensity'] = $bad_word_intensity;
            }

            $comment = Comment::create($data);

            return sendSuccessResponse("Comment saved", $comment);        
        } catch(Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function destroy(Comment $comment)
    {
        try {
            if (!$comment->belongsToCurrentUser()) return sendFailResponse("User cannot delete this comment", 403);

            $comment->delete();

            return sendSuccessResponse("Comment deleted", []);        
        } catch(Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }
}
