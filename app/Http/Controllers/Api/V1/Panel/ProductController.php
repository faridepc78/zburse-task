<?php

namespace App\Http\Controllers\Api\V1\Panel;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\Panel\Product\UnavailableProductRequest;
use App\Jobs\CheckUnavailableProducts;

class ProductController extends Controller
{
    public function convert_to_unavailable(UnavailableProductRequest $request)
    {
        $items = array_filter($request->input('data'));

        $this->dispatch(new CheckUnavailableProducts($items));

        return $this->success_response(null,
            'your request has been processed. please wait');
    }
}
