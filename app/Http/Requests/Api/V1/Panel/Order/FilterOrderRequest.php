<?php

namespace App\Http\Requests\Api\V1\Panel\Order;

use App\Models\Role;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FilterOrderRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() &&
            auth()->user()->hasRole(Role::ROLE_ADMIN)
            || auth()->user()->hasRole(Role::ROLE_ACCOUNTANT);
    }

    public function rules(): array
    {
        return [
            'started_at' => ['required', 'date', 'date_format:Y-m-d H:i'],
            'ended_at' => ['required', 'date', 'date_format:Y-m-d H:i'],
            'sort_type' => ['required', Rule::in(['desc', 'asc'])]
        ];
    }
}
