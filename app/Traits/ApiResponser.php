<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;

trait ApiResponser
{
    protected function success_response($data = null, string $message = null,
                                        int $code = 200,
        int $count_data = null): JsonResponse
    {
        if ($count_data == null)
            $count_data = false;

        return response()->json([
            'status' => 'Success',
            'message' => $message,
            'code' => $code,
            'count_data' => $count_data,
            'data' => $data,
        ])->setStatusCode($code);
    }

    protected function error_response(int $code, string $message = null,
                                          $data = null): JsonResponse
    {
        return response()->json([
            'status' => 'Error',
            'message' => $message,
            'code' => $code,
            'data' => $data
        ])->setStatusCode($code);
    }
}
