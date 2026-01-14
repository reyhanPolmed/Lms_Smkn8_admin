<?php

namespace App\Filament\Resources\Siswas\Pages;

use App\Filament\Resources\Siswas\StudentResource;
use App\Models\Student;
use App\Models\User;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;

class CreateStudent extends CreateRecord
{
    protected static string $resource = StudentResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Create user account for the student
        $user = User::create([
            'identifier' => $data['nisn'],
            'name' => $data['name'],
            'password' => Hash::make($data['password']),
        ]);

        // Remove password from student data and add user_id
        unset($data['password']);
        unset($data['confirmPassword']);
        $data['user_id'] = $user->id;

        return $data;
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
