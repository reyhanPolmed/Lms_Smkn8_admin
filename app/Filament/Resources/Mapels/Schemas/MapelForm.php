<?php

namespace App\Filament\Resources\Mapels\Schemas;

use Filament\Schemas\Schema;
use App\Models\Departments;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;

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
                    ->image() // Membuat tampilan upload bulat (opsional)
                    ->directory('thumbnails')
                    ->maxFiles(1) // Folder penyimpanan
                    ->label('Thumbnail Mata Pelajaran'),

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
