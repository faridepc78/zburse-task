<?php

namespace Database\Seeders;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Database\Seeder;

class RolePermissionSeeder extends Seeder
{
    public function run()
    {
        foreach (\App\Models\Permission::$permissions as $permission) {
            Permission::findOrCreate($permission);
        }

        foreach (\App\Models\Role::$roles as $name => $permissions) {
            Role::findOrCreate($name)->givePermissionTo($permissions);
        }
    }
}
