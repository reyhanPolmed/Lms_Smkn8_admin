<?php

namespace App\Filament\Resources\Jurusans\Schemas;

use App\Models\Teacher;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Schemas\Schema;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class JurusanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([

                // Gunakan Grid agar tampilan lebih rapi (opsional)


                // 2. Input Nama
                TextInput::make('nama_jurusan')
                    ->required()
                    ->maxLength(255)
                    ->label('Nama Jurusan'),


                // 3. Input Kepala Jurusan
                Select::make('kepala_jurusan_id')
                    ->label('Kepala jurusan')
                    ->options(fn () => Teacher::query()
                        ->orderBy('nama')
                        ->pluck('nama', 'id')
                        ->all())
                    ->searchable()
                    ->preload()
                    ->nullable()
                    ->helperText('Opsional saat membuat jurusan. Bisa diisi setelah data guru tersedia.'),

                // 1. Input Foto (Sesuai dengan tabel sebelumnya)
                FileUpload::make('gambar')
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

            ]);
    }
}
