<?php

namespace App\Filament\Resources\Teachers\Schemas;

use App\Models\Teacher;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use App\Models\Departments;
use Filament\Forms\Components\Select;
use Illuminate\Validation\Rule;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class TeacherForm
{
    public static function getComponents(): array
    {
        return [
            // =====================
            // DATA GURU
            // =====================
            TextInput::make('nama')
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

            TextInput::make('email')
                ->label('Email Guru')
                ->email()
                ->required()
                ->maxLength(255)
                ->unique(
                    table: 'teachers',
                    column: 'email',
                    ignoreRecord: true
                )
                ->rules([
                    fn (?Teacher $record) => Rule::unique('users', 'email')->ignore($record?->user_id),
                ])
                ->placeholder('Contoh: guru@akara.sch.id'),

            FileUpload::make('foto')
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

            Select::make('jurusan_id')
                ->label('Jurusan')
                ->options(fn () => Departments::query()
                    ->orderBy('nama_jurusan')
                    ->pluck('nama_jurusan', 'id')
                    ->all())
                ->searchable()
                ->preload()
                ->nullable()
                ->required(fn (string $operation): bool => $operation !== 'create' || Departments::query()->exists())
                ->helperText(fn (): ?string => Departments::query()->exists()
                    ? null
                    : 'Belum ada jurusan. Guru dapat dibuat dulu tanpa jurusan, lalu diperbarui setelah jurusan tersedia.'),

            // =====================
            // AKUN LOGIN GURU
            // =====================
            TextInput::make('password')
                ->label('Password Baru')
                ->password()
                ->revealable()
                ->dehydrated(fn($state) => filled($state)) // hanya kirim kalau diisi
                ->required(fn (string $operation): bool => $operation === 'create')
                ->minLength(6)
                ->afterStateHydrated(fn($component) => $component->state('')), // kosongkan saat edit

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
