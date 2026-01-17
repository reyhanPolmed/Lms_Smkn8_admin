<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/file/{path}', function ($path) {

    $file = storage_path('app/private/' . $path);

    abort_unless(file_exists($file), 404);

    return response()->file($file);

})->where('path', '.*');