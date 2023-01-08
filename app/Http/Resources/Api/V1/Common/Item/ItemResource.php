<?php

namespace App\Http\Resources\Api\V1\Common\Item;

use App\Http\Resources\Api\V1\Common\Product\ProductResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ItemResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'quantity' => $this->quantity,
            'product'=>new ProductResource($this->product),
            'created_at' => $this->created_at->format('Y-m-d H:i:s'),
            'updated_at' => $this->updated_at->format('Y-m-d H:i:s'),
        ];
    }
}
