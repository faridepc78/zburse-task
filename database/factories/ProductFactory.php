<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'name' => fake()->unique()->name(),
            'slug' => fake()->unique()->slug(),
            'price' => fake()->numberBetween(1000, 10000000),
            'discount' => fake()->numberBetween(1, 100),
            'quantity' => fake()->numberBetween(1, 1000),
            'status' => fake()->randomElement(Product::$statuses)
        ];
    }
}
