<?php

namespace App\Repositories\Cart;

use App\Models\Cart;
use App\Models\User;
use App\Repositories\Contracts\BaseRepositoryInterface;

interface CartRepositoryInterface extends BaseRepositoryInterface
{
    public function save(array $items, User $user);

    public function delete_items(array $items, Cart $cart);
}
