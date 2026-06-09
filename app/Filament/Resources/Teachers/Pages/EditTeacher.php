<?php

namespace App\Filament\Resources\Teachers\Pages;

use App\Filament\Resources\Teachers\TeacherResource;
use App\Support\TeacherAuthCredentialSync;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Hash;

class EditTeacher extends EditRecord
{
    protected static string $resource = TeacherResource::class;

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $plainPassword = filled($data['password'] ?? null) ? $data['password'] : null;

        $this->record->user->update([
            'identifier' => $data['nip'],
            'name' => $data['nama'],
            'email' => $data['email'],
            'email_verified' => true,
            ...($plainPassword !== null ? ['password' => Hash::make($plainPassword)] : []),
        ]);

        TeacherAuthCredentialSync::sync($this->record->user->refresh(), $plainPassword);

        // Remove password fields from teacher data
        unset($data['password']);
        unset($data['confirmPassword']);

        return $data;
    }

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
