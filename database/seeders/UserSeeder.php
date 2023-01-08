<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    public function run()
    {
        if (User::query()->count() == 0) {
            $users = User::factory(10)->create();
            $role = Role::query()
                ->where('name', '=', Role::ROLE_USER)
                ->first();

            foreach ($users as $user) {
                $user->roles()->sync($role);
            }
        } else {
            $this->command->warn('users has already been created');
        }

        foreach (User::$users as $user) {
            $role = Role::query()
                ->where('name', '=', $user['role'])
                ->first();

            User::query()->firstOrCreate(
                [
                    'email' => $user['email'],
                ]
                ,
                [
                    'name' => $user['name'],
                    'email' => $user['email'],
                    'password' => $user['password'],
                ])
                ->roles()->sync($role);
        }
    }
}
