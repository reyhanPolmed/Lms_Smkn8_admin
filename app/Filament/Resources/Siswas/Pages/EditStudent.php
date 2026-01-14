<?php

namespace App\Filament\Resources\Siswas\Pages;

use App\Filament\Resources\Siswas\StudentResource;
use App\Models\User;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Hash;

class EditStudent extends EditRecord
{
    protected static string $resource = StudentResource::class;

    protected function mutateFormDataBeforeSave(array $data): array
    {
        // Update user password if provided
        if (!empty($data['password'])) {
            $this->record->user->update([
                'password' => Hash::make($data['password']),
            ]);
        }

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
