<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Dream;
use App\Models\FriendRequest;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class DreamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $dreams = Dream::with('plant')->where('user_id', auth()->id())->where([
                'private' => 0,
                'draft' => 0
            ])->get();
            return sendSuccessResponse("Dreams fetched", $dreams);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dreams");
        }
    }

    /**
     * Fetch private dreams only
     */
    public function private()
    {
        try {
            $dreams = Dream::with('plant')->where('user_id', auth()->id())->where([
                'private' => 1,
                'draft' => 0
            ])
                ->get();
            return sendSuccessResponse("Dreams fetched", $dreams);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dreams");
        }
    }

    /**
     * Fetch draft dreams only
     */
    public function draft()
    {
        try {
            $dreams = Dream::with('plant')->where('user_id', auth()->id())->where('draft', 1)->get();
            return sendSuccessResponse("Dreams fetched", $dreams);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dreams");
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required|string|min:2',
                'description' => 'required|string',
                'watched_on' => 'required|date|before_or_equal:today',
                'location' => 'required|string',
                'private' => 'required|boolean',
                'draft' => 'required|boolean',
                'garden_level' => 'required|integer',
                'bed_no' => 'required|integer'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $dreamCountPerBedPerDream = Dream::where([
                'user_id' => auth()->id(),
                'garden_level' => $request->garden_level,
                'bed_no' => $request->bed_no
            ])->count();

            if ($dreamCountPerBedPerDream >= 3) return sendFailResponse("Bed already occupied", 400);

            $dream = Dream::create([
                'title' => $request->title,
                'description' => $request->description,
                'watched_on' => $request->watched_on,
                'location' => $request->location,
                'user_id' => auth()->id(),
                'private' => $request->private,
                'draft' => $request->draft,
                'garden_level' => $request->garden_level,
                'bed_no' => $request->bed_no
            ]);
            $dream->plant()->create();

            $dream->plant = $dream->plant;

            return sendSuccessResponse("Dream stored", $dream);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dreams");
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Dream  $dream
     * @return \Illuminate\Http\Response
     */
    public function show(Dream $dream)
    {
        try {
            if ($dream->user_id != auth()->id()) return sendFailResponse("Dream does not belong to user", 403);

            $dream->plant = $dream->plant;

            return sendSuccessResponse("Dream fetched", $dream);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dreams");
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Dream  $dream
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Dream $dream)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required|string|min:2',
                'description' => 'required|string',
                'watched_on' => 'required|date|before_or_equal:today',
                'location' => 'required|string',
                'private' => 'required|boolean',
                'draft' => 'required|boolean',
                'garden_level' => 'required|integer',
                'bed_no' => 'required|integer',
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            if ($dream->user_id != auth()->id()) return sendFailResponse("Dream does not belong to user", 403);

            $dream->title = $request->title;
            $dream->description = $request->description;
            $dream->watched_on = $request->watched_on;
            $dream->location = $request->location;
            $dream->private = $request->private;
            $dream->draft = $request->draft;
            $dream->garden_level = $request->garden_level;
            $dream->bed_no = $request->bed_no;
            $dream->save();

            return sendSuccessResponse("Dream updated", $dream);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to update dream");
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Dream  $dream
     * @return \Illuminate\Http\Response
     */
    public function destroy(Dream $dream)
    {
        //
    }

    public function friendDreams(User $user)
    {
        try {
            $friendIds = array_column((new FriendRequest())->getFriendList($user->id), 'id');

            if (!in_array(auth()->id(), $friendIds)) return sendFailResponse("You are not friend with this player", 403);

            return sendSuccessResponse("Dreams fetched", $user->dreams()->where('private', 0)->where('draft', 0)->get());
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dream");
        }
    }

    public function fetchDreamByGardenDeb($userId, $garden, $bed)
    {
        try {
            $query = Dream::where('garden_level', $garden)->where('bed_no', $bed)->where('user_id', $userId);
            $dreams = $query->with('plant')->get();
            $dreamOwnerId = $query->first()->user_id;
            $friendIds = array_column((new FriendRequest())->getFriendList(auth()->id()), 'id');

            if (empty($dreams)) return sendFailResponse("Dreams not found", 404);
            if (!($dreamOwnerId == auth()->id() || in_array($dreamOwnerId, $friendIds))) return sendFailResponse("Dream cannot be shown to user", 403);

            return sendSuccessResponse("Dream fetched", $dreams);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch dream");
        }
    }

    public function storeQuestionProgress(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'current_question_no' => 'required|integer|min:0',
                'dream_id' => 'required|exists:dreams,id'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $dream = Dream::find($request->dream_id);

            if ($dream->draft) return sendFailResponse("Cannot save progress for draft dream", 403);
            if ($dream->user_id != auth()->id()) return sendFailResponse("Dream does not belong to user", 403);

            $dream->current_question_no = $request->current_question_no;
            $dream->save();

            return sendSuccessResponse("Success on store progress question", $dream);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to store progress question");
        }
    }

    public function getQuestionProgress(Dream $dream)
    {
        try {
            return sendSuccessResponse("Success on fetch progress question", [
                ["current_question_no" => $dream->current_question_no]
            ]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch progress question");
        }
    }

    public function storePlantProgress(Request $request, Dream $dream)
    {
        try {
            $validator = Validator::make($request->all(), [
                'height' => 'required|numeric'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            if ($dream->draft) return sendFailResponse("There is no plant for draft dream", 400);
            if ($dream->user_id != auth()->id()) return sendFailResponse("Dream does not belong to user", 403);

            $dream->plant->height = $request->height;
            $dream->plant->updated_at = Carbon::now();
            $dream->plant->save();

            return sendSuccessResponse("Success on store progress question", $dream->plant);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to store progress question");
        }
    }
}
