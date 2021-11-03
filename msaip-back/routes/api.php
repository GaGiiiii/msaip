<?php

use App\Http\Controllers\ManufacturerController;
use App\Http\Controllers\MModelController;
use App\Http\Controllers\SavedCarController;
use App\Http\Controllers\TypeController;
use App\Http\Controllers\UserController;
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


// Auth ==========================================================================================
Route::post('/login', [UserController::class, 'login']);
Route::post('/register', [UserController::class, 'register']);
Route::get('/loggedIn', [UserController::class, 'loggedIn']);
// Auth ==========================================================================================

// Manufacturers =================================================================================
Route::get('/manufacturers', [ManufacturerController::class, 'index']);
// Manufacturers =================================================================================

// Models ========================================================================================
Route::get('/models', [MModelController::class, 'index']);
// Models ========================================================================================

// Types =========================================================================================
Route::get('/types', [TypeController::class, 'index']);
// Types =========================================================================================

// Saved-cars ====================================================================================
Route::get('/saved-cars', [SavedCarController::class, 'index']);
// Saved-cars ====================================================================================


// PROTECTED =====================================================================================
Route::group(['middleware' => 'auth:sanctum'], function () {
  // Auth
  Route::post('/logout', [UserController::class, 'logout']);

  // Likes
  Route::post('/saved-cars', [SavedCarController::class, 'store']);
  Route::delete('/saved-cars/{car}', [SavedCarController::class, 'destroy']);
});
// PROTECTED ======================================================================================