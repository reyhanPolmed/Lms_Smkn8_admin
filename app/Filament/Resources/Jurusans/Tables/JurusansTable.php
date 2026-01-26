<?php

namespace App\Filament\Resources\Jurusans\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
// Import class kolom di sini
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Table;

class JurusansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('image')
                    ->label('Foto')
                    ->circular()
                    ->default('/images/placeholder-student.png'),
                // 2. Kolom Nama

                TextColumn::make('name')
                    ->searchable() // Agar bisa dicari via search bar
                    ->sortable()   // Agar bisa diurutkan (A-Z)
                    ->weight('bold') // Membuat teks sedikit tebal
                    ->label('Jurusan'),

                // 3. Kolom Email
                TextColumn::make('headOfDepartment.name') // Menambah ikon amplop kecil
                    ->searchable() // Memudahkan admin menyalin email
                    ->label('Kepala Jurusan'),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
