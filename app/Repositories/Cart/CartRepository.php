<?php

namespace App\Repositories\Cart;

use App\Models\Cart;
use App\Models\User;
use App\Repositories\Contracts\BaseRepository;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class CartRepository extends BaseRepository implements CartRepositoryInterface
{
    public Model $model;

    public function __construct(Cart $model)
    {
        $this->model = $model;
    }

    public function save(array $items, User $user): Model|Builder|null
    {
        $cart = $this->model::query()
            ->where([
                ['user_id', '=', $user->id],
                ['status', '=', Cart::IN_CART]
            ])->first();

        if (!$cart)
            $cart = $this->create([
                'user_id' => $user->id
            ]);

        $this->saveItems($items, $cart);

        return $cart;
    }

    public function delete_items(array $items, Cart $cart)
    {
        foreach ($items as $item) {
            $cart->items()->where('product_id',
                '=', $item['product_id'])
                ->delete();
        }
    }

    protected function saveItems($items, $cart)
    {
        foreach ($items as $item) {
            $cart->items()->updateOrCreate(
                ['product_id' => $item['product_id']],
                [
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity']
                ]);
        }
    }
}
