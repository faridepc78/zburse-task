<?php

namespace App\Http\Controllers\Api\V1\Home;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\V1\Common\Product\ProductResource;
use App\Models\Product;
use App\Repositories\Product\ProductRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ProductController extends Controller
{
    private ProductRepositoryInterface $productRepository;

    public function __construct(ProductRepositoryInterface $productRepository)
    {
        $this->productRepository = $productRepository;
    }

    public function __invoke(Request $request)
    {
        $request->validate([
            'status' => ['nullable', Rule::in(Product::$statuses)]
        ]);

        $products = $this->productRepository->getAll($request->query('status'));

        return $this->success_response(['products' => ProductResource::collection($products)],
            'list of products', 200, count($products));
    }
}
