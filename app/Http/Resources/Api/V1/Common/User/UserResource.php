<?php

namespace App\Http\Resources\Api\V1\Common\User;

use App\Http\Resources\Api\V1\Common\RolePermission\PermissionResource;
use App\Http\Resources\Api\V1\Common\RolePermission\RoleResource;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'created_at' => $this->created_at->format('Y-m-d H:i:s'),
            'updated_at' => $this->updated_at->format('Y-m-d H:i:s'),
            'role' => RoleResource::collection($this->roles),
            'permissions' => PermissionResource::collection($this->permissions)
        ];
    }
}
