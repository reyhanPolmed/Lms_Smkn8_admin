<?php

namespace App\Filament\Resources\Siswas\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;

class StudentForm
{
    public static function getComponents(): array
    {
        return [
            // =====================
            // DATA SISWA
            // =====================
            TextInput::make('name')
                ->label('Nama Siswa')
                ->required()
                ->maxLength(255)
                ->placeholder('Masukkan nama lengkap siswa'),

            TextInput::make('nisn')
                ->label('NISN (Nomor Induk Siswa Nasional)')
                ->required()
                ->unique(
                    table: 'students',
                    column: 'nisn',
                    ignoreRecord: true
                )
                ->maxLength(20)
                ->placeholder('Contoh: 1234567890'),

            Select::make('jurusan')
                ->label('Jurusan')
                ->required()
                ->options([
                    'IPA' => 'Ilmu Pengetahuan Alam (IPA)',
                    'IPS' => 'Ilmu Pengetahuan Sosial (IPS)',
                    'Bahasa' => 'Bahasa',
                    'Kejuruan' => 'Program Kejuruan',
                ])
                ->placeholder('Pilih jurusan'),

            Select::make('class_level')
                ->label('Tingkat Kelas')
                ->required()
                ->options([
                    'X' => 'Kelas X (10)',
                    'XI' => 'Kelas XI (11)',
                    'XII' => 'Kelas XII (12)',
                ])
                ->placeholder('Pilih tingkat kelas'),

            FileUpload::make('foto')
                ->image()
                ->maxFiles(1)
                ->directory('students'),


            // =====================
            // AKUN LOGIN SISWA
            // =====================
            TextInput::make('password')
                ->label('Password Login')
                ->password()
                ->revealable()
                ->required(fn($operation) => $operation === 'create')
                ->hidden(fn($operation) => $operation === 'edit')
                ->minLength(8)
                ->maxLength(255)
                ->placeholder('Minimal 8 karakter'),

            TextInput::make('confirmPassword')
                ->label('Konfirmasi Password')
                ->password()
                ->revealable()
                ->required(fn($operation) => $operation === 'create')
                ->hidden(fn($operation) => $operation === 'edit')
                ->same('password')
                ->placeholder('Ulangi password'),

            TextInput::make('user.identifier')
                ->label('NISN (User)')
                ->disabled()
                ->hidden(fn($operation) => $operation === 'create')
                ->helperText('NISN otomatis disinkronkan dari data siswa'),
        ];
    }
}
