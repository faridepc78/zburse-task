<?php

namespace App\Repositories\Order;

use App\Models\Cart;
use App\Models\Order;
use App\Models\User;
use App\Repositories\Contracts\BaseRepositoryInterface;

interface OrderRepositoryInterface extends BaseRepositoryInterface
{
    public function save(array $items, User $user, Cart $cart);

    public function updateItems(array $items, Order $order);

    public function filterByDateTime($started_at, $ended_at, $sort_type);
}
