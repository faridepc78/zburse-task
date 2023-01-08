<?php

namespace App\Rules;

use App\Models\Product;
use Illuminate\Contracts\Validation\Rule;

class CheckProductStatus implements Rule
{
    public function passes($attribute, $value): bool|int
    {
        $product = Product::query()->find($value);

        return $product->status == Product::ACTIVE;
    }

    public function message(): string
    {
        return 'the product by id is invalid';
    }
}
