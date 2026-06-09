<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class FilamentAdminSeeder extends Seeder
{
    public function run(): void
    {
        $email = env('FILAMENT_ADMIN_EMAIL', 'admin@akara.sch.id');
        $identifier = env('FILAMENT_ADMIN_IDENTIFIERS', 'admin');
        $password = env('FILAMENT_ADMIN_PASSWORD', 'Password123!');

        User::updateOrCreate(
            ['email' => $email],
            [
                'identifier' => explode(',', $identifier)[0] ?: 'admin',
                'name' => 'Administrator Akara',
                'email_verified' => true,
                'password' => Hash::make($password),
            ],
        );
    }
}
