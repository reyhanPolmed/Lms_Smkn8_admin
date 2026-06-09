<?php

namespace App\Filament\Resources\Siswas\Pages;

use App\Filament\Resources\Siswas\StudentResource;
use App\Models\User;
use App\Support\TeacherAuthCredentialSync;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;

class CreateStudent extends CreateRecord
{
    protected static string $resource = StudentResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $plainPassword = $data['password'];

        // Create user account for the student
        $user = User::create([
            'identifier' => $data['nisn'],
            'name' => $data['nama'],
            'email' => $data['email'],
            'email_verified' => true,
            'nisn' => $data['nisn'],
            'password' => Hash::make($plainPassword),
        ]);

        TeacherAuthCredentialSync::sync($user, $plainPassword);

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
