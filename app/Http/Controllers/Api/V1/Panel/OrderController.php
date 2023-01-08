<?php

namespace App\Http\Controllers\Api\V1\Panel;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\Panel\Order\FilterOrderRequest;
use App\Http\Requests\Api\V1\Panel\Order\UpdateOrderRequest;
use App\Http\Resources\Api\V1\Panel\Order\AccountantOrderResource;
use App\Http\Resources\Api\V1\Panel\Order\AdminOrderResource;
use App\Models\Order;
use App\Models\Role;
use App\Repositories\Order\OrderRepositoryInterface;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    private OrderRepositoryInterface $orderRepository;

    public function __construct(OrderRepositoryInterface $orderRepository)
    {
        $this->orderRepository = $orderRepository;
    }

    public function index(FilterOrderRequest $request)
    {
        $started_at = $request->query('started_at');
        $ended_at = $request->query('ended_at');
        $sort_type = $request->query('sort_type');

        $orders = $this->orderRepository
            ->filterByDateTime($started_at, $ended_at, $sort_type);

        if (Auth::user()->hasRole(Role::ROLE_ADMIN)) {
            return $this->success_response(['orders' => AdminOrderResource::collection($orders)],
                'list of orders', 200, count($orders));
        } else {
            return $this->success_response(['orders' => AccountantOrderResource::collection($orders)],
                'list of orders', 200, count($orders));
        }
    }

    public function update(Order $order, UpdateOrderRequest $request)
    {
        $data = array_filter($request->except('data'));

        $this->orderRepository->update($data, $order->id);

        if ($request->filled('data'))
            $this->orderRepository->updateItems($request->input('data'), $order);

        return $this->success_response(['order' => new AdminOrderResource($order->refresh())],
            'order has been successfully updated');
    }
}
