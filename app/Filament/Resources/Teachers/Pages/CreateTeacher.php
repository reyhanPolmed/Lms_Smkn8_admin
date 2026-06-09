<?php

namespace App\Filament\Resources\Teachers\Pages;

use App\Filament\Resources\Teachers\TeacherResource;
use App\Models\User;
use App\Support\TeacherAuthCredentialSync;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;

class CreateTeacher extends CreateRecord
{
    protected static string $resource = TeacherResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $plainPassword = $data['password'];

        // Create user account for the teacher
        $user = User::create([
            'identifier' => $data['nip'],
            'name' => $data['nama'],
            'email' => $data['email'],
            'email_verified' => true,
            'password' => Hash::make($plainPassword),
        ]);

        TeacherAuthCredentialSync::sync($user, $plainPassword);

        // Remove password from teacher data and add user_id
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
