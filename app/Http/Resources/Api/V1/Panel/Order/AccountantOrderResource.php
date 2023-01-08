<?php

namespace App\Http\Resources\Api\V1\Panel\Order;

use Illuminate\Http\Resources\Json\JsonResource;

class AccountantOrderResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'total_price' => $this->total_price
        ];
    }
}
