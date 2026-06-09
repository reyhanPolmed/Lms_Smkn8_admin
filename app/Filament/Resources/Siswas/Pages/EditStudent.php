<?php

namespace App\Filament\Resources\Siswas\Pages;

use App\Filament\Resources\Siswas\StudentResource;
use App\Support\TeacherAuthCredentialSync;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Hash;

class EditStudent extends EditRecord
{
    protected static string $resource = StudentResource::class;

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $plainPassword = filled($data['password'] ?? null) ? $data['password'] : null;

        $this->record->user->update([
            'identifier' => $data['nisn'],
            'name' => $data['nama'],
            'email' => $data['email'],
            'email_verified' => true,
            'nisn' => $data['nisn'],
            ...($plainPassword !== null ? ['password' => Hash::make($plainPassword)] : []),
        ]);

        TeacherAuthCredentialSync::sync($this->record->user->refresh(), $plainPassword);

        // Remove password and confirmPassword from student data
        unset($data['password']);
        unset($data['confirmPassword']);

        return $data;
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
