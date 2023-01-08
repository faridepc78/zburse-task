<?php

namespace App\Http\Requests\Api\V1\Shop;

use App\Models\Role;
use App\Rules\CheckProductStatus;
use Illuminate\Foundation\Http\FormRequest;

class SaveCartRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->hasRole(Role::ROLE_USER);
    }

    public function rules(): array
    {
        return [
            'data' => ['required', 'array', 'min:1'],
            'data.*' => ['size:2'],
            'data.*.product_id' => ['required', 'distinct', 'exists:products,id', new CheckProductStatus()],
            'data.*.quantity' => ['required', 'numeric', 'between:1,100']
        ];
    }
}
