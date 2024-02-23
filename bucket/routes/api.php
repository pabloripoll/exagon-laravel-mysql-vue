<?php

use App\Http\Route;
use App\Adaptor\InputAdaptor;

Route::get('/', [InputAdaptor::class, 'httpApiGet']);
Route::post('/', [InputAdaptor::class, 'httpApiPost']);
Route::put('/', [InputAdaptor::class, 'httpApiPut']);
Route::patch('/', [InputAdaptor::class, 'httpApiPatch']);
Route::delete('/', [InputAdaptor::class, 'httpApiDelete']);
Route::head('/', [InputAdaptor::class, 'httpApiHead']);
Route::options('/', [InputAdaptor::class, 'httpApiOptions']);
