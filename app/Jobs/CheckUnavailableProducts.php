<?php

namespace App\Jobs;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CheckUnavailableProducts implements ShouldQueue, ShouldBeUnique
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private array $items;

    public function __construct(array $items)
    {
        $this->items = $items;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        foreach ($this->items as $item) {
            Product::query()
                ->where('id', '=', $item['product_id'])
                ->update([
                    'status' => Product::UNAVAILABLE
                ]);

            $carts = Cart::query()
                ->where('status', '=', Cart::IN_CART)
                ->get();

            foreach ($carts as $cart) {
                $cart->items()
                    ->where('product_id', '=', $item['product_id'])
                    ->delete();
            }

            $orders = Order::query()
                ->whereNot('status', '=', Order::PREPARATION)
                ->orWhereNot('status', '=', Order::SUBMIT)
                ->get();

            foreach ($orders as $order) {
                $data = $order->items()
                    ->where('product_id', '=', $item['product_id'])
                    ->first();

                if ($data) {
                    $order->update(['status' => Order::REJECTED]);
                }
            }
        }
    }
}
