<?php

namespace App\Http\Controllers\Api\V1\Shop;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\Shop\DeleteCartItemsRequest;
use App\Http\Requests\Api\V1\Shop\SaveCartRequest;
use App\Http\Resources\Api\V1\Common\Cart\CartResource;
use App\Models\Cart;
use App\Repositories\Cart\CartRepositoryInterface;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    private CartRepositoryInterface $cartRepository;

    public function __construct(CartRepositoryInterface $cartRepository)
    {
        $this->cartRepository = $cartRepository;
    }

    public function save(SaveCartRequest $request)
    {
        $items = array_filter($request->input('data'));

        $cart = $this->cartRepository->save($items, Auth::user());

        return $this->success_response(['cart' => new CartResource($cart)],
            'cart has been successfully updated');
    }

    public function delete_items(DeleteCartItemsRequest $request, Cart $cart)
    {
        $items = array_filter($request->input('data'));

        $this->cartRepository->delete_items($items, $cart);

        return $this->success_response(['cart' => new CartResource($cart)],
            'cart has been successfully updated');
    }
}
