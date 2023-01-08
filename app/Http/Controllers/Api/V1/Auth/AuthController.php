<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\Auth\LoginRequest;
use App\Http\Resources\Api\V1\Auth\AuthResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(LoginRequest $request)
    {
        if (Auth::attempt(['email' => $request->input('email'),
            'password' => $request->input('password')])) {

            Auth::user()->api_token = Auth::user()
                ->createToken($request->input('email') . '_api_token')->plainTextToken;

            return $this->success_response(['user' => new AuthResource(Auth::user())],
                'login was successful');
        } else {
            return $this->error_response(401,
                'no information found with this email');
        }
    }

    public function logout(): JsonResponse
    {
        Auth::user()->tokens()->delete();

        return $this->success_response(null,
            'logout was successful');
    }
}
