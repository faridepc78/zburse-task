<?php

namespace App\Models;

class Permission extends \Spatie\Permission\Models\Permission
{
    const PERMISSION_MANAGE_ORDERS = 'manage orders';
    const PERMISSION_MANAGE_PRODUCTS = 'manage products';
    const PERMISSION_MANAGE_CARTS = 'manage carts';
    const PERMISSION_AUDIT_MANAGEMENT = 'audit management';

    static array $permissions = [
        self::PERMISSION_MANAGE_ORDERS,
        self::PERMISSION_MANAGE_PRODUCTS,
        self::PERMISSION_MANAGE_CARTS,
        self::PERMISSION_AUDIT_MANAGEMENT
    ];
}
