<?php

namespace App\Filament\Resources\Jurusans\Schemas;

use App\Models\Teacher;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Form;
use Filament\Forms\Components\Select;
use Filament\Schemas\Schema;

class JurusanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([

                // Gunakan Grid agar tampilan lebih rapi (opsional)


                // 2. Input Nama
                TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->label('Nama Lengkap'),


                // 3. Input Kepala Jurusan
                Select::make('head_department_id')
                    ->label('Kepala jurusan')
                    ->options(Teacher::pluck('name', 'id'))
                    ->searchable()
                    ->required(),

                // 1. Input Foto (Sesuai dengan tabel sebelumnya)
                FileUpload::make('image')
                    ->image()
                    ->maxFiles(1)
                    ->directory('jurusan'),

            ]);
    }
}
