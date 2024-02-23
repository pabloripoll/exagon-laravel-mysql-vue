<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); */

Route::group(['prefix' => 'v1'], function () {

    Route::match(['get', 'post'], '/health', function() {
        return response()->json([
            'status' => true,
            'message' => 'connection successful'
        ]);
    });

    Route::get('/session', function() {
        return response()->json([
            'status' => true
        ]);
    });

    /* Route::get('/access/{token}', [AdminAdaptor::class, 'asyncAccess']);
    Route::post('/backend/{panel?}/{module?}/{section?}/{segment?}/{target?}', [AdminAdaptor::class, 'asyncBackend']);
    Route::post('/content/{panel?}/{module?}/{section?}/{segment?}/{target?}', [AdminAdaptor::class, 'asyncContent']);
    Route::get('/{board?}/{panel?}/{module?}/{section?}/{segment?}/{target?}', [AdminAdaptor::class, 'landingContent']); */
});


