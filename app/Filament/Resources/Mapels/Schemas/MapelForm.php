<?php

namespace App\Filament\Resources\Mapels\Schemas;

use Filament\Schemas\Schema;
use App\Models\Departments;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class MapelForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('judul')
                    ->label('Nama Mapel')
                    ->required(),


                Select::make('tingkats')
                    ->label('Pilih Tingkat')
                    ->relationship('tingkats', 'name')
                    ->multiple()
                    ->searchable()
                    ->preload()
                    ->required(),

                FileUpload::make('thumbnail')
                    ->label('Gambar')
                    ->image()
                    ->directory(null) // 🔥 penting (disable local path)

                    ->saveUploadedFileUsing(function ($file) {
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
                    ->options(Departments::pluck('nama_jurusan', 'id'))
                    ->searchable()
                    ->required(),

                Textarea::make('deskripsi')
                    ->label('Deskripsi')
                    ->rows(3),
            ]);
    }
}
