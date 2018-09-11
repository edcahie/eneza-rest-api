<?php

use Illuminate\Http\Request;

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

//Route::resource('courses', 'CourseController');//Dont forget to uncomment this fror test
//Route::resource('subjects', 'SubjectController');
//Route::resource('contents', 'ContentController');
//Route::resource('quizzes', 'QuizzAnswerController');



//Route::post('login', 'PassportController@login')->name('login');
//Route::post('register', 'PassportController@register')->name('register');

Route::middleware('auth:api')->group(function () {
    Route::get('user', 'PassportController@details');

    Route::resource('products', 'ProductController');
    Route::resource('courses', 'CourseController');
    Route::resource('subjects', 'SubjectController');
    Route::resource('contents', 'ContentController');
    Route::resource('quizzes', 'QuizzAnswerController');
});