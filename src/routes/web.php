<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware('auth')->group(function () {
    Route::get('/', [\App\Http\Controllers\AdminController::class, 'index'])->name('web.users');
    Route::post('/', [\App\Http\Controllers\AdminController::class, 'friends'])->name('web.friends');
    Route::post('/ratings', [\App\Http\Controllers\AdminController::class, 'changeRatings'])->name('web.ratings');
    Route::post('/hoots', [\App\Http\Controllers\AdminController::class, 'changeHoots'])->name('web.hoots');
    Route::post('/changeStatus', [\App\Http\Controllers\AdminController::class, 'changeStatus'])->name('web.users.change.status');
    Route::get('/dreams', [\App\Http\Controllers\AdminController::class, 'dreams'])->name('web.dreams');
    Route::get('/comments', [\App\Http\Controllers\AdminController::class, 'comments'])->name('web.comments');
    Route::get('/payments', [\App\Http\Controllers\AdminController::class, 'payments'])->name('web.payments');
});

Route::get("/payment/{user}/{hoots}", [\App\Http\Controllers\Api\PaymentController::class, 'make'])->name('payment');

require __DIR__ . '/auth.php';
