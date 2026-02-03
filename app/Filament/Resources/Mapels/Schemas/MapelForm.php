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
                TextInput::make('title')
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

                Textarea::make('description')
                    ->label('Deskripsi')
                    ->rows(3),
            ]);
    }
}
