<?php

namespace App\Policies;

use App\Models\Cart;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CartPolicy
{
    use HandlesAuthorization;

    public function delete_cart_items(User $user, Cart $cart)
    {
        if ($cart->user_id == $user->id)
            return true;
    }

    public function save_order(User $user, Cart $cart)
    {
        if ($cart->user_id == $user->id)
            return true;
    }
}
