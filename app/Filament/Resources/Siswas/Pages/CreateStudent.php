<?php

namespace App\Filament\Resources\Siswas\Pages;

use App\Filament\Resources\Siswas\StudentResource;
use App\Models\Student;
use App\Models\User;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class CreateStudent extends CreateRecord
{
    protected static string $resource = StudentResource::class;

protected function mutateFormDataBeforeCreate(array $data): array
{
    $user = User::create([
        'identifier' => $data['nisn'],
        'name' => $data['name'],
        'password' => Hash::make($data['password']),
    ]);

    // hapus token lama sanctum
    $user->tokens()->delete();

    $token = $user->createToken(
        'student-token',
        ['*'],
        Carbon::now()->addSeconds(9600)
    )->plainTextToken;

    // ✅ simpan ke remember_token
    $user->remember_token = $token;
    $user->save();

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
