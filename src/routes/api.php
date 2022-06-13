<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('forget-password', [\App\Http\Controllers\Api\AuthController::class, 'forgetPassword']);
Route::any('login', [\App\Http\Controllers\Api\AuthController::class, 'login'])->name('login');
Route::post('register', [\App\Http\Controllers\Api\AuthController::class, 'register']);
Route::post('otp', [\App\Http\Controllers\Api\AuthController::class, 'verifyOtp']);
Route::post('changepassword', [\App\Http\Controllers\Api\AuthController::class, 'changePassword']);
Route::post('resend-otp', [\App\Http\Controllers\Api\AuthController::class, 'resendOtp']);
Route::post('payment', [\App\Http\Controllers\Api\PaymentController::class, 'store']);

Route::middleware(['token', 'auth:sanctum'])->group(function () {
    Route::post('reset-password', [\App\Http\Controllers\Api\AuthController::class, 'resetPassword']);
    Route::post('logout', [\App\Http\Controllers\Api\AuthController::class, 'logout']);
    Route::get('search/{name}', [\App\Http\Controllers\Api\UserController::class, 'search']);
    Route::post('send-friend-request', [\App\Http\Controllers\Api\FriendRequestController::class, 'send']);
    Route::get('friend-list', [\App\Http\Controllers\Api\FriendRequestController::class, 'list']);
    Route::get('friend-details/{user}', [\App\Http\Controllers\Api\FriendRequestController::class, 'getFriendDetails']);
    Route::get('pending-friend-request', [\App\Http\Controllers\Api\FriendRequestController::class, 'pending']);
    Route::post('accept-friend-request', [\App\Http\Controllers\Api\FriendRequestController::class, 'accept']);
    Route::post('reject-friend-request', [\App\Http\Controllers\Api\FriendRequestController::class, 'reject']);
    Route::resource('dreams', \App\Http\Controllers\Api\DreamController::class)->except(['create', 'edit', 'update']);
    Route::any('private-dreams', [\App\Http\Controllers\Api\DreamController::class, 'private']);
    Route::any('draft-dreams', [\App\Http\Controllers\Api\DreamController::class, 'draft']);
    Route::get('dreams/{userId}/{garden}/{bed}', [\App\Http\Controllers\Api\DreamController::class, 'fetchDreamByGardenDeb']);
    Route::post('dreams/{dream}', [\App\Http\Controllers\Api\DreamController::class, 'update']);
    Route::get('friend-dreams/{user}', [\App\Http\Controllers\Api\DreamController::class, 'friendDreams']);
    Route::get('watched-tutorial', [\App\Http\Controllers\Api\UserController::class, 'watchedTutorial']);
    Route::get('me', [\App\Http\Controllers\Api\UserController::class, 'loggedinUserDetails']);
    Route::get('users/{user}', [\App\Http\Controllers\Api\UserController::class, 'userDetails']);
    Route::get('comments/{dream}', [\App\Http\Controllers\Api\CommentController::class, 'index']);
    Route::post('comments', [\App\Http\Controllers\Api\CommentController::class, 'save']);
    Route::post('change-name/{user}', [\App\Http\Controllers\Api\AuthController::class, 'changeName']);
    Route::post('question-progrss', [\App\Http\Controllers\Api\DreamController::class, 'storeQuestionProgress']);
    Route::get('question-progrss/{dream}', [\App\Http\Controllers\Api\DreamController::class, 'getQuestionProgress']);
    Route::post('plant-progrss/{dream}', [\App\Http\Controllers\Api\DreamController::class, 'storePlantProgress']);
    Route::post('upload-profile-pic', [\App\Http\Controllers\Api\UserController::class, 'uploadProfilePic']);
    Route::get('scenes', [\App\Http\Controllers\Api\SceneController::class, 'show']);
    Route::post('scenes', [\App\Http\Controllers\Api\SceneController::class, 'store']);
    Route::post('users', [\App\Http\Controllers\Api\UserController::class, 'update']);
    Route::post('change-experience-level', [\App\Http\Controllers\Api\UserController::class, 'changeExperienceLevel']);
    Route::post('comment-delete/{comment}', [\App\Http\Controllers\Api\CommentController::class, 'destroy']);
    Route::get('hoots', [\App\Http\Controllers\Api\UserController::class, 'getHoots']);
    Route::post('hoots', [\App\Http\Controllers\Api\UserController::class, 'adjustHoots']);
    Route::get('items', [\App\Http\Controllers\Api\StoreController::class, 'index']);
    Route::post('buy', [\App\Http\Controllers\Api\StoreController::class, 'buy']);
    Route::get('user-items', [\App\Http\Controllers\Api\InventoryController::class, 'show']);
    Route::post('messages', [\App\Http\Controllers\Api\MessageController::class, 'store']);
    Route::get('messages/{user}', [\App\Http\Controllers\Api\MessageController::class, 'index']);
    Route::post('relations', [\App\Http\Controllers\Api\FriendRequestController::class, 'updateRelation']);
    Route::get('block/{user}', [\App\Http\Controllers\Api\UserController::class, 'block']);
    Route::get('unblock/{user}', [\App\Http\Controllers\Api\UserController::class, 'unblock']);
    Route::get('blocked-users', [\App\Http\Controllers\Api\UserController::class, 'blockedUsers']);
});
