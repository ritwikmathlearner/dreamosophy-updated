<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Scene;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class SceneController extends Controller
{
    public function show(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'garden_level' => 'required|integer|max:3|min:1',
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $scene = Scene::where([
                'user_id' => auth()->id(),
                'garden_level' => $request->garden_level
            ])->first();

            if(empty($scene)) return sendFailResponse("No scene available", 404);

            return sendSuccessResponse("Scene fetched", $scene);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to store scene");
        }   
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'garden_level' => 'required|integer|max:3|min:1',
                'scene' => 'string'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $scene = Scene::create([
                'user_id' => auth()->id(),
                'garden_level' => $request->garden_level,
                'scene' => empty($request->scene) ? null : $request->scene
            ]);

            if(empty($scene)) return sendFailResponse("Scene storing failed");

            return sendSuccessResponse("Scene stored", $scene);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to store scene");
        }
    }
}
