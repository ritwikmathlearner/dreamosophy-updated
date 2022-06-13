<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\BlockedUser;
use App\Models\FriendRequest;
use App\Models\User;
use Error;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function search($name)
    {
        try {
            $name = htmlspecialchars(trim($name));

            if (strlen($name) < 3) return sendFailResponse("Please provide atleast three characters", 400);

            $users = User::where('name', 'like', '%' . $name . '%')->where('id', '!=', auth()->id())->get();

            if (count($users) < 1) return sendFailResponse("No result found", 404);

            return sendSuccessResponse("Result found", $users);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function watchedTutorial()
    {
        try {
            saveMetaData(
                'user_meta',
                [
                    'user_id' => auth()->id(),
                    'meta_key' => 'watched_tutorial'
                ],
                [
                    'meta_value' => true
                ]
            );
            return sendSuccessResponse("Result found", []);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function loggedinUserDetails()
    {
        try {
            $user = auth()->user();
            $user->dream_count = auth()->user()->dreams()->count();
            $user->meta_data = getMetaValues('user_meta', ['user_id' => auth()->id()]);
            return sendSuccessResponse("Result found", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function userDetails(User $user)
    {
        try {
            $user->dream_count = $user->dreams()->count();
            $user->meta_data = getMetaValues('user_meta', ['user_id' => $user->id]);
            return sendSuccessResponse("Result found", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function update(Request $request)
    {
        try {
            // dd($request->all());
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|min:2'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $user = Auth::user();
            $user->name = $request->name;
            $user->dislikes = empty($request->dislikes) ? null : $request->dislikes;
            $user->likes = empty($request->likes) ? null : $request->likes;
            $user->bio = empty($request->bio) ? null : $request->bio;
            $user->interest = empty($request->interest) ? null : $request->interest;
            $user->save();

            if(empty($user)) return sendFailResponse("Updating user profile failed");

            if(!empty($request->facebook_url))
                saveMetaData('user_meta', [
                    'user_id' => auth()->id(),
                    'meta_key' => 'facebook_url'
                ], [
                    'meta_value' => $request->facebook_url
                ]);
            
            if(!empty($request->linkedin_url))
                saveMetaData('user_meta', [
                    'user_id' => auth()->id(),
                    'meta_key' => 'linkedin_url'
                ], [
                    'meta_value' => $request->linkedin_url
                ]);
            
            if(!empty($request->tiktok_url))
                saveMetaData('user_meta', [
                    'user_id' => auth()->id(),
                    'meta_key' => 'tiktok_url'
                ], [
                    'meta_value' => $request->tiktok_url
                ]);
            
            $user->meta_data = getMetaValues('user_meta', ['user_id' => auth()->id()]);
            
            return sendSuccessResponse("Profile updated", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to update user profile");
        }
    }

    public function uploadProfilePic(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'profile_pic' => 'required|mimes:jpg,png'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));
            
            $profile_pic = $request->file('profile_pic');
            $filename = time() . '-' . Str::snake(auth()->user()->name) . '.' . $profile_pic->getClientOriginalExtension();
            $profile_pic->storeAs('public/profile_pics', $filename);

            $user = Auth::user();
            Storage::delete('public/profile_pics/'.Str::remove(url('').'/storage/profile_pics/', $user->profile_pic));
            $user->profile_pic = asset('storage/profile_pics/'. $filename);
            $user->save();
            return sendSuccessResponse("Profile pic uploaded", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function changeExperienceLevel(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'experience_level' => 'required|integer|min:1|max:3'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));
            
            $user = Auth::user();
            $user->experience_level = $request->experience_level;
            $user->save();
            
            return sendSuccessResponse("Experience level updated", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }

    public function getHoots(Request $request)
    {
        try {
            $hoots = getMetaValue('user_meta', ['user_id' => auth()->id(), 'meta_key' => 'hoots']);

            return sendSuccessResponse("Successfully fetched hoots", $hoots);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch hoots");
        }
    }

    public function adjustHoots(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'adjust_hoots_by' => 'required|numeric'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $adjust_hoots_by = (int) $request->adjust_hoots_by;
            $hoots = (int) getMetaValue('user_meta', ['user_id' => auth()->id(), 'meta_key' => 'hoots']) ?? 0;

            $new_hoots = $hoots + $adjust_hoots_by;

            saveMetaData('user_meta', ['user_id' => auth()->id(), 'meta_key' => 'hoots'], ['meta_value' => $new_hoots]);

            return sendSuccessResponse("Successfully updated hoots", [['hoots' => $new_hoots]]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to update hoots");
        }
    }

    public function block(User $user)
    {
        try {
            if(auth()->id() === $user->id) return sendFailResponse("You cannot block yourself", 400);

            $blocked = BlockedUser::create([
                'blocked_by' => auth()->id(),
                'user_id' => $user->id
            ]);
            return sendSuccessResponse("User block successful", $blocked);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to block user");
        }
    }

    public function unblock(User $user)
    {
        try {
            $data = BlockedUser::where([
                'blocked_by' => auth()->id(),
                'user_id' => $user->id
            ])->delete();
            
            if($data == 0) return sendFailResponse("User is not in your blocked list", 400);

            return sendSuccessResponse("User unblock successful", []);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to unblock user");
        }
    }

    public function blockedUsers()
    {
        try {
            $data = BlockedUser::join('users', 'blocked_users.user_id', 'users.id')
            ->where(['blocked_by' => auth()->id()])
            ->select('users.id', 'users.name', 'users.profile_pic')
            ->get();
            return sendSuccessResponse("User blocked list fetch successful", $data);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to  fetch user blocked list");
        }
    }
}
