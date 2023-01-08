<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, HasRoles;

    protected $table = 'users';

    protected $guarded =
        [
            'id',
            'created_at',
            'updated_at'
        ];

    protected $fillable =
        [
            'name',
            'email',
            'password'
        ];

    protected $hidden =
        [
            'password'
        ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }

    static array $users = [
        [
            'name' => 'farid',
            'email' => 'farid@gmail.com',
            'password' => '12345678',
            'role' => Role::ROLE_ADMIN
        ],
        [
            'name' => 'ali',
            'email' => 'ali@gmail.com',
            'password' => '12345678',
            'role' => Role::ROLE_ACCOUNTANT
        ],
        [
            'name' => 'reza',
            'email' => 'reza@gmail.com',
            'password' => '12345678',
            'role' => Role::ROLE_USER
        ]
    ];
}
