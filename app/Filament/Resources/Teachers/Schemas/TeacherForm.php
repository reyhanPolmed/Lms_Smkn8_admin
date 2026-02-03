<?php

namespace App\Filament\Resources\Teachers\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use App\Models\Departments;
use Filament\Forms\Components\Select;
use Illuminate\Support\Facades\Hash;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

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

            FileUpload::make('photo')
                ->label('Gambar')
                ->image()
                ->required()
                ->saveUploadedFileUsing(function ($file) {

                    // Gunakan helper function 'cloudinary()' huruf kecil
                    $upload = Cloudinary::uploadApi()->upload(
                        $file->getRealPath(),
                        [
                            'folder' => 'lms_smkn8medan'
                        ]
                    );

                    return $upload['secure_url'];
                }),

            Select::make('department_id')
                ->label('Jurusan')
                ->options(Departments::pluck('name', 'id'))
                ->searchable()
                ->required(),

            // =====================
            // AKUN LOGIN GURU
            // =====================
            TextInput::make('password')
                ->label('Password Baru')
                ->password()
                ->revealable()
                ->dehydrated(fn($state) => filled($state)) // hanya kirim kalau diisi
                ->required(false)
                ->minLength(6)
                ->afterStateHydrated(fn($component) => $component->state('')) // kosongkan saat edit
                ->dehydrateStateUsing(fn($state) => Hash::make($state)),

            TextInput::make('confirmPassword')
                ->label('Konfirmasi Password')
                ->password()
                ->revealable()
                ->required(fn($operation) => $operation === 'create')
                ->hidden(fn($operation) => $operation === 'edit')
                ->same('password')
                ->placeholder('Ulangi password'),

            TextInput::make('user.identifier')
                ->label('NIP (User)')
                ->disabled()
                ->hidden(fn($operation) => $operation === 'create')
                ->helperText('NIP otomatis disinkronkan dari data guru'),
        ];
    }
}
