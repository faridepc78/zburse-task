<?php

use App\Models\Role;
use Illuminate\Support\Facades\Route;


/*START HOME*/

Route::group(['prefix' => 'v1/home', 'as' => 'api.v1.home.', 'middleware' => ['api', 'throttle:50,1'],
    'namespace' => 'App\Http\Controllers\Api\V1\Home'], function () {

    Route::get('products', 'ProductController')
        ->name('get_all_products');

});

/*END HOME*/


/*START AUTH*/

Route::group(['prefix' => 'v1/auth', 'as' => 'api.v1.auth.', 'middleware' => ['api', 'throttle:50,1'],
    'namespace' => 'App\Http\Controllers\Api\V1\Auth'], function () {

    Route::post('login', 'AuthController@login')
        ->name('login');

    Route::post('logout', 'AuthController@logout')
        ->name('logout')->middleware('auth:sanctum');

});

/*END AUTH*/


/*START SHOP*/

Route::group(['prefix' => 'v1/shop', 'as' => 'api.v1.shop.', 'middleware' =>
    ['api', 'throttle:50,1', 'auth:sanctum', 'check_role:' . Role::ROLE_USER],
    'namespace' => 'App\Http\Controllers\Api\V1\Shop'], function () {

    Route::post('save_cart', 'CartController@save')
        ->name('save_cart');

    Route::delete('delete_cart_items/{cart}', 'CartController@delete_items')
        ->name('delete_cart_items');

    Route::post('save_order/{cart}', 'OrderController@save')
        ->name('save_order');

    Route::put('complete_order/{order}', 'OrderController@complete')
        ->name('complete_order');

});

/*END SHOP*/


/*START PANEL*/

Route::group(['prefix' => 'v1/panel', 'as' => 'api.v1.panel.', 'middleware' =>
    ['api', 'throttle:50,1', 'auth:sanctum'],
    'namespace' => 'App\Http\Controllers\Api\V1\Panel'], function () {

    Route::get('orders', 'OrderController@index')
        ->name('get_orders');

    Route::group(['middleware' => 'check_role:' . Role::ROLE_ADMIN], function () {

        Route::put('orders/update/{order}', 'OrderController@update')
            ->name('update_orders');

        Route::put('products/convert_to_unavailable', 'ProductController@convert_to_unavailable')
            ->name('convert_to_unavailable_products');

    });

});

/*END PANEL*/