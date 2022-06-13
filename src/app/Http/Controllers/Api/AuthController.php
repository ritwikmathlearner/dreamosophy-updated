<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Facade\FlareClient\Http\Client;
use Illuminate\Http\Request;
use App\Notifications\SendOTP;
use Carbon\Carbon;
use Error;
use Exception;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

use function PHPUnit\Framework\returnSelf;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string',
                'email' => 'required|email|unique:users',
                'password' => 'required',
                'dob' => 'required|date|before:today'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'dob' => $request->dob
            ]);

            if (!$user) return sendFailResponse("Registration failed");

            saveMetaData(
                'user_meta',
                [
                    'user_id' => $user->id,
                    'meta_key' => 'rating'
                ],
                [
                    'meta_value' => 0
                ]
            );

            saveMetaData(
                'user_meta',
                [
                    'user_id' => $user->id,
                    'meta_key' => 'hoots'
                ],
                [
                    'meta_value' => 0
                ]
            );

            $user->sendOTP();

            return sendSuccessResponse("Registration successful", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Registration failed");
        }
    }

    public function login(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|exists:users',
                'password' => 'required'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));
            $user = User::where('email', $request->email)->first();

            $currentStatus = getMetaValue('user_meta', ['user_id' => $request->user_id, 'meta_key' => 'banned']);
            if(!empty($currentStatus)) return sendFailResponse("You are banned from game", 403);

            if (!Hash::check($request->password, $user->password)) return sendFailResponse("Password did not match", 400);

            if (!empty($user->metaValue('otp')) && empty($user->email_verified_at)) return sendFailResponse("Email verification pending", 400);

            $token = $user->createToken('dreamosophy')->plainTextToken;

            $user->token = $token;

            return sendSuccessResponse("Login successful", $user)->withCookie(cookie('token', $token));
        } catch (Exception $e) {
            return Log::error($e->getMessage());
        }
    }

    public function logout(Request $request)
    {
        try {
            $user = auth()->user();

            $user->tokens()->delete();

            return sendSuccessResponse("Logout successful", [])->withCookie(cookie('token', null));
        } catch (Exception $e) {
            return Log::error($e->getMessage());
        }
    }

    public function changeName(Request $request, User $user)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            if (!empty($user->metaValue('otp')) && empty($user->email_verified_at)) return sendFailResponse("Email verification pending", 400);

            $user->name = $request->name;
            $user->save();

            return sendSuccessResponse("Name change successful", $user);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Name change request failed");
        }
    }

    public function resetPassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'currentpassword' => 'required|string',
                'newpassword' => 'required|string',
                'confirmnewpassword' => 'required|string'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $user = User::find(auth()->id());

            if (!Hash::check($request->currentpassword, $user->password)) return sendFailResponse("Current password did not match");

            if ($request->newpassword !== $request->confirmnewpassword) return sendFailResponse("Password did not match with confirm password");

            $user->password = Hash::make($request->newpassword);
            $user->save();

            return sendSuccessResponse("Passsword reset successful", [], 202)->withCookie(cookie('token', null));
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Password reset failed");
        }
    }

    public function verifyOtp(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required|exists:users',
                'otp' => 'required|int|digits:4'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $otp = getMetaValue('user_meta', ['user_id' => $request->id, 'meta_key' => 'otp']);

            if (empty($otp)) return sendFailResponse("No OTP found");

            if ($request->otp != $otp) return sendFailResponse("OTP did not match");

            deleteMetaValues('user_meta', [
                'user_id' => $request->id,
                'meta_key' => 'otp'
            ]);
            User::where('id', $request->id)->update([
                'email_verified_at' => Carbon::now()
            ]);
            return sendSuccessResponse("Otp verified", []);
        } catch (Exception $e) {
            Log::error($e);
            return sendFailResponse('OTP verification failed');
        }
    }

    public function forgetPassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|exists:users|email'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $user = User::where('email', $request->email)->first();

            $user->sendOTP();

            return sendSuccessResponse("Otp sent to email", $user->id);
        } catch (Exception $e) {
            Log::error($e);
            return sendFailResponse('OTP verification failed');
        }
    }

    public function changePassword(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required|exists:users',
                'otp' => 'required|int|digits:4',
                'new_password' => 'required|string',
                'confirm_new_password' => 'required|string|same:new_password'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $otp = getMetaValue('user_meta', ['user_id' => $request->id, 'meta_key' => 'otp']);

            if (empty($otp)) return sendFailResponse("No OTP found");

            if ($request->otp != $otp) return sendFailResponse("OTP did not match");

            deleteMetaValues('user_meta', [
                'user_id' => $request->id,
                'meta_key' => 'otp'
            ]);
            
            User::where('id', $request->id)->update([
                'password' => Hash::make($request->new_password)
            ]);

            return sendSuccessResponse("Otp verified", []);
        } catch (Exception $e) {
            Log::error($e);
            return sendFailResponse('OTP verification failed');
        }
    }

    public function resendOtp(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                "email" => "required|email|exists:users"
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));
        
            $user = User::where('email', $request->email)->first();
            
            $user->sendOTP();

            return sendSuccessResponse("Otp sent to email", $user->id);
        } catch (Exception $e) {
            Log::error($e);
            return sendFailResponse('OTP resend failed');
        }
    }
}
