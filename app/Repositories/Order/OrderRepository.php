<?php

namespace App\Repositories\Order;

use App\Models\Cart;
use App\Models\Order;
use App\Models\User;
use App\Repositories\Contracts\BaseRepository;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

class OrderRepository extends BaseRepository implements OrderRepositoryInterface
{
    public Model $model;

    public function __construct(Order $model)
    {
        $this->model = $model;
    }

    public function save(array $items, User $user, Cart $cart): Model|Builder|null
    {
        $order = $this->create([
            'user_id' => $user->id,
            'cart_id' => $cart->id,
            'code' => randomNumbers(10)
        ]);

        $this->saveItems($items, $order);

        return $order;
    }

    public function updateItems(array $items, Order $order)
    {
        foreach ($items as $item) {
            $order->items()
                ->where('product_id', '=', $item['product_id'])
                ->update([
                    'quantity' => $item['quantity']
                ]);
        }
    }

    protected function saveItems($items, $order)
    {
        foreach ($items as $item) {
            $order->items()->updateOrCreate(
                ['product_id' => $item['product_id']],
                [
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity']
                ]);
        }
    }

    public function filterByDateTime($started_at, $ended_at, $sort_type): Collection|array
    {
        return $this->model::query()
            ->whereBetween('created_at', [$started_at, $ended_at])
            ->orderBy('created_at', $sort_type)
            ->get();
    }
}
