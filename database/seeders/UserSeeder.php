<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Super Admin
        User::create([
            'name' => 'Super Admin',
            'email' => 'admin@bandunglibrary.id',
            'password' => Hash::make('password123'),
            'role' => 'super_admin',
            'email_verified_at' => now(),
        ]);

        // Library Admin
        User::create([
            'name' => 'Library Admin',
            'email' => 'libadmin@bandunglibrary.id',
            'password' => Hash::make('password123'),
            'role' => 'library_admin',
            'email_verified_at' => now(),
        ]);

        // Regular User
        User::create([
            'name' => 'John Doe',
            'email' => 'user@bandunglibrary.id',
            'password' => Hash::make('password123'),
            'role' => 'user',
            'email_verified_at' => now(),
        ]);
    }
}
