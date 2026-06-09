<?php

namespace App\Filament\Resources\Teachers\Tables;

use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use App\Filament\Imports\GuruImporter;
use App\Models\Teacher;
use Filament\Actions\ImportAction;

class TeachersTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('foto')
                    ->label('Foto')
                    ->circular()
                    ->default('/images/placeholder-student.png'),

                TextColumn::make('nip')
                    ->label('NIP')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('nama')
                    ->label('Nama Guru')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('department.nama_jurusan')
                    ->label('Jurusan')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('created_at')
                    ->label('Dibuat Pada')
                    ->dateTime('d-m-Y H:i')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])

            ->headerActions([
                ImportAction::make()
                    ->importer(GuruImporter::class),
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
