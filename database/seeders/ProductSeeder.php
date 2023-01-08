<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run()
    {
        if (Product::query()->count() == 0) {
            Product::factory(100)->create();
        } else {
            $this->command->warn('products has already been created');
        }
    }
}
