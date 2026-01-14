<?php

namespace App\Filament\Resources\Teachers\Schemas;

use Filament\Forms\Components\TextInput;

class TeacherForm
{
    public static function getComponents(): array
    {
        return [
            // =====================
            // DATA GURU
            // =====================
            TextInput::make('name')
                ->label('Nama Guru')
                ->required()
                ->maxLength(255)
                ->placeholder('Masukkan nama lengkap guru'),

            TextInput::make('nip')
                ->label('NIP (Nomor Induk Pegawai)')
                ->required()
                ->unique(
                    table: 'teachers',
                    column: 'nip',
                    ignoreRecord: true
                )
                ->maxLength(30)
                ->placeholder('Contoh: 1234567890'),

            TextInput::make('mapel')
                ->label('Mata Pelajaran')
                ->required()
                ->maxLength(100)
                ->placeholder('Contoh: Matematika, Bahasa Indonesia'),

            // =====================
            // AKUN LOGIN GURU
            // =====================
            TextInput::make('password')
                ->label('Password Login')
                ->password()
                ->revealable()
                ->required(fn ($operation) => $operation === 'create')
                ->hidden(fn ($operation) => $operation === 'edit')
                ->minLength(8)
                ->maxLength(255)
                ->placeholder('Minimal 8 karakter'),

            TextInput::make('confirmPassword')
                ->label('Konfirmasi Password')
                ->password()
                ->revealable()
                ->required(fn ($operation) => $operation === 'create')
                ->hidden(fn ($operation) => $operation === 'edit')
                ->same('password')
                ->placeholder('Ulangi password'),

            TextInput::make('user.identifier')
                ->label('NIP (User)')
                ->disabled()
                ->hidden(fn ($operation) => $operation === 'create')
                ->helperText('NIP otomatis disinkronkan dari data guru'),
        ];
    }
}
