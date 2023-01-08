<?php

namespace App\Http\Controllers\Api\V1\Shop;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\V1\Common\Order\OrderResource;
use App\Models\Cart;
use App\Models\Order;
use App\Repositories\Cart\CartRepositoryInterface;
use App\Repositories\Order\OrderRepositoryInterface;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    private CartRepositoryInterface $cartRepository;
    private OrderRepositoryInterface $orderRepository;

    public function __construct(CartRepositoryInterface  $cartRepository,
                                OrderRepositoryInterface $orderRepository)
    {
        $this->cartRepository = $cartRepository;
        $this->orderRepository = $orderRepository;
    }

    public function save(Cart $cart)
    {
        $this->authorize('save_order', $cart);

        if ($cart->status == Cart::IN_CART) {
            $order = $this->orderRepository->save($cart->items->toArray(), Auth::user(), $cart);

            $this->cartRepository->update(['status' => Cart::IN_ORDER], $cart->id);

            return $this->success_response(['order' => new OrderResource($order)],
                'order was successfully placed', 201);
        } else {
            return $this->error_response(400,
                'cart has already been converted to an order');
        }
    }

    public function complete(Order $order)
    {
        $this->authorize('complete_order', $order);

        if ($order->status == Order::AWAITING_PAYMENT) {
            $this->orderRepository
                ->update(['status' => Order::PAYMENT_CONFIRMATION], $order->id);

            $order->decrementProductsQuantity();

            $order->refresh();

            return $this->success_response(['order' => new OrderResource($order)],
                'order was successfully paid');
        } else {
            return $this->error_response(400,
                'order has not yet reached awaiting payment status');
        }
    }
}
