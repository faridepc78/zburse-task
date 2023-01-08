<?php

namespace App\Http\Requests\Api\V1\Panel\Order;

use App\Models\Order;
use App\Models\Role;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateOrderRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() &&
            auth()->user()->hasRole(Role::ROLE_ADMIN);
    }

    public function rules(): array
    {
        $order = request()->route('order');

        return [
            'status' => ['nullable', Rule::in(Order::$statuses)],
            'data' => ['nullable', 'array', 'min:1'],
            'data.*' => ['size:2'],
            'data.*.product_id' => ['required', 'distinct', 'exists:products,id',
                Rule::exists('items', 'product_id')
                    ->where('itemable_id', $order->id)],
            'data.*.quantity' => ['required', 'numeric', 'between:1,100']
        ];
    }
}
