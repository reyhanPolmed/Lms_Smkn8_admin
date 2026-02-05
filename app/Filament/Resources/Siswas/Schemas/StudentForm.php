<?php

namespace App\Filament\Resources\Siswas\Schemas;

use App\Models\StudentClass;
use App\Models\Departments;
use App\Models\Tingkat;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;

use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;


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
                ->maxLength(20)
                ->placeholder('Contoh: 1234567890'),

            FileUpload::make('photo')
                ->label('Gambar')
                ->image()
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

            // Select::make('jurusan')
            //     ->label('Jurusan')
            //     ->required()
            //     ->options([
            //         'IPA' => 'Ilmu Pengetahuan Alam (IPA)',
            //         'IPS' => 'Ilmu Pengetahuan Sosial (IPS)',
            //         'Bahasa' => 'Bahasa',
            //         'Kejuruan' => 'Program Kejuruan',
            //     ])
            //     ->placeholder('Pilih jurusan'),



            Select::make('class_level_id')
                ->label('Kelas')
                ->relationship('student_class', 'name')
                ->searchable()
                ->preload()
                ->required()
                ->placeholder('Pilih kelas'),

            Select::make('tingkat_id')
                ->label('Tingkat')
                ->options(Tingkat::pluck('name', 'id'))
                ->searchable()
                ->required(),

            // =====================
            // AKUN LOGIN SISWA
            // =====================
            TextInput::make('password')
                ->label('Password Baru')
                ->password()
                ->revealable()
                ->minLength(6)
                ->dehydrated(fn($state) => filled($state)),

            TextInput::make('confirmPassword')
                ->label('Konfirmasi Password')
                ->password()
                ->revealable()
                ->same('password')
                ->required(fn($operation) => $operation === 'create')
                ->visible(fn($operation) => $operation === 'create'),


            TextInput::make('user.identifier')
                ->label('NISN (User)')
                ->disabled()
                ->hidden(fn($operation) => $operation === 'create')
                ->helperText('NISN otomatis disinkronkan dari data siswa'),
        ];
    }
}
