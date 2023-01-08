<?php

namespace App\Console\Commands;

use App\Models\Order;
use Illuminate\Console\Command;

class PreparationOrderCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'preparation:order';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Preparation Order With (payment_confirmation) Status In 12 pm';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(): int
    {
        $orders = Order::query()
            ->where('status', '=', Order::PAYMENT_CONFIRMATION)
            ->whereDate('created_at', '=', date('Y-m-d'))
            ->get();

        foreach ($orders as $order) {
            $order->update([
                'status' => Order::PREPARATION
            ]);
        }
    }
}
