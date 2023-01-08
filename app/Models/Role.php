<?php

namespace App\Models;

class Role extends \Spatie\Permission\Models\Role
{
    const ROLE_ADMIN = 'admin';
    const ROLE_ACCOUNTANT = 'accountant';
    const ROLE_USER = 'user';

    static array $roles = [
        self::ROLE_ADMIN => [
            Permission::PERMISSION_MANAGE_ORDERS,
            Permission::PERMISSION_MANAGE_PRODUCTS,
            Permission::PERMISSION_MANAGE_CARTS
        ],
        self::ROLE_ACCOUNTANT => [
            Permission::PERMISSION_AUDIT_MANAGEMENT
        ],
        self::ROLE_USER => [
        ]
    ];
}
