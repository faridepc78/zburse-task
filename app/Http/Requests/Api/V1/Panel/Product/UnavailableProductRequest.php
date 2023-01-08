<?php

namespace App\Http\Requests\Api\V1\Panel\Product;

use App\Models\Product;
use App\Models\Role;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UnavailableProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() &&
            auth()->user()->hasRole(Role::ROLE_ADMIN);
    }

    public function rules(): array
    {
        return [
            'data' => ['required', 'array', 'min:1'],
            'data.*' => ['size:1'],
            'data.*.product_id' => ['required', 'distinct',
                Rule::exists('products', 'id')
                    ->whereNot('status', Product::UNAVAILABLE)]
        ];
    }
}
