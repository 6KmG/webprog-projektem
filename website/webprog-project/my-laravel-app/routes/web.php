<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "HII";
});

Route::get('/hello', function () {
    return view('hello');
});