<?php

namespace App\Http\Resources\Api\V1\Panel\Order;

use App\Http\Resources\Api\V1\Common\Cart\CartResource;
use App\Http\Resources\Api\V1\Common\Item\ItemResource;
use App\Http\Resources\Api\V1\Common\User\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;

class AdminOrderResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'user' => new UserResource($this->user),
            'cart' => new CartResource($this->cart),
            'code' => $this->code,
            'total_price' => $this->total_price,
            'created_at' => $this->created_at->format('Y-m-d H:i:s'),
            'updated_at' => $this->updated_at->format('Y-m-d H:i:s'),
            'items' => ItemResource::collection($this->items)
        ];
    }
}
