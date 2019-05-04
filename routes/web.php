<?php

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

Route::get('/', [
    'uses' => 'LuckyDrawController@index',
    'as'   => 'home'   
]);

Route::get('/screen-show', [
    'uses' => 'LuckyDrawController@screen',
    'as'   => 'screen_show'   
]);

Route::get('/pre-start-spin', [
    'uses' => 'LuckyDrawController@preSpiner',
    'as'   => 'pre_start_spin'
]);

Route::get('/get-prize-by-event/{event_id}', [
    'uses' => 'LuckyDrawController@getPrizeByEvent',
    'as'   => 'get_prize'
]);

Route::get('/update-spin-time', [
    'uses' => 'LuckyDrawController@updateSpinTime',
    'as'   => 'update_spintime'
]);

Route::get('/reservation-winner', [
    'uses' => 'LuckyDrawController@pickUpWinner',
    'as'   => 'pickup_winner'
]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::post('chance-generator', ['uses' => 'Backend\LuckiesController@chance_generator', 'as' => 'luckies.chance_generator']); 

    Route::post('import_participants', ['uses' => 'Backend\ParticipantsController@handleImportData', 'as' => 'participants.import']); 
});
