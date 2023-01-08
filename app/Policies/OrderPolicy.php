<?php

namespace App\Policies;

use App\Models\Order;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OrderPolicy
{
    use HandlesAuthorization;

    public function complete_order(User $user, Order $order)
    {
        if ($order->user_id == $user->id)
            return true;
    }
}
