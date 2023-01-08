<?php

namespace App\Http\Requests\Api\V1\Shop;

use App\Models\Role;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DeleteCartItemsRequest extends FormRequest
{
    private $cart;

    public function __construct()
    {
        $this->cart = request()->route('cart');
    }

    public function authorize(): bool
    {
        return auth()->check() &&
            auth()->user()->hasRole(Role::ROLE_USER)
            && auth()->user()->can('delete_cart_items', $this->cart);
    }

    public function rules(): array
    {
        return [
            'data' => ['required', 'array', 'min:1'],
            'data.*' => ['size:1'],
            'data.*.product_id' => ['required', 'distinct', 'exists:products,id',
                Rule::exists('items', 'product_id')
                    ->where('itemable_id', $this->cart->id)]
        ];
    }
}
