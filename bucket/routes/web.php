<?php

use App\Http\Route;
use App\Http\Response;
use App\Adaptor\InputAdaptor;

Route::get('/', function() {
    (new Response)->json(['message' => 'no resource']);
});

Route::get('/example', [InputAdaptor::class, 'httpWeb']);