<?php

namespace App\Filament\Resources\Siswas\Tables;

use App\Filament\Imports\StudentImporter;
use Filament\Actions\ImportAction;
use Filament\Actions\CreateAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\BulkAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Forms;
use Illuminate\Support\Collection;
use App\Models\Student;

class StudentsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('photo')
                    ->label('Foto')
                    ->circular()
                    ->default('/images/placeholder-student.png'),

                TextColumn::make('nisn')
                    ->label('NISN')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('name')
                    ->label('Nama Siswa')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('department.name')
                    ->label('Jurusan')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('student_class.name')
                    ->label('Kelas')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('tingkat.name')
                    ->label('Tingkat')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('created_at')
                    ->label('Dibuat Pada')
                    ->dateTime('d-m-Y H:i')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])

            ->filters([

                /*
    |--------------------------------------------------------------------------
    | Filter Kelas
    |--------------------------------------------------------------------------
    */
                \Filament\Tables\Filters\SelectFilter::make('class_level_id')
                    ->label('Kelas')
                    ->relationship('student_class', 'name')
                    ->searchable()
                    ->preload(),

            ])

            ->headerActions([
                ImportAction::make()
                    ->importer(StudentImporter::class),
            ])

            ->bulkActions([

                BulkAction::make('naikKelas')
                    ->label('Naik Kelas')
                    ->icon('heroicon-o-arrow-up')
                    ->color('success')
                    ->requiresConfirmation()

                    ->form([
                        Forms\Components\Select::make('class_level_id')
                            ->relationship('student_class', 'name')
                            ->required(),

                        Forms\Components\Select::make('tingkat_id')
                            ->relationship('tingkat', 'name')
                            ->required(),
                    ])

                    ->action(function (Collection $records, array $data) {
                        Student::whereIn('id', $records->pluck('id'))
                            ->update($data);
                    }),

                DeleteBulkAction::make(),

            ])

            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ]);
    }
}
