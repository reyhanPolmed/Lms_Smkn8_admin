<?php

namespace App\Filament\Resources\Siswas\Tables;

use App\Filament\Imports\StudentImporter;
use Filament\Actions\ImportAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\BulkAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Forms;
use Illuminate\Support\Collection;
use App\Models\Student;
use App\Models\StudentClass;

class StudentsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('foto')
                    ->label('Foto')
                    ->circular()
                    ->default('/images/placeholder-student.png'),

                TextColumn::make('nisn')
                    ->label('NISN')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('nama')
                    ->label('Nama Siswa')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('department.nama_jurusan')
                    ->label('Jurusan')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('student_class.nama_kelas')
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

            /*
            |--------------------------------------------------------------------------
            | Filters
            |--------------------------------------------------------------------------
            */
            ->filters([
                \Filament\Tables\Filters\SelectFilter::make('kelas_id')
                    ->label('Kelas')
                    ->relationship('student_class', 'nama_kelas')
                    ->searchable()
                    ->preload(),
            ])

            /*
            |--------------------------------------------------------------------------
            | Header Actions
            |--------------------------------------------------------------------------
            */
            ->headerActions([
                ImportAction::make()
                    ->importer(StudentImporter::class),
            ])

            /*
            |--------------------------------------------------------------------------
            | Bulk Actions
            |--------------------------------------------------------------------------
            */
            ->bulkActions([

                BulkAction::make('naikKelas')
                    ->label('Naik Kelas')
                    ->icon('heroicon-o-arrow-up')
                    ->color('success')
                    ->requiresConfirmation()
                    ->deselectRecordsAfterCompletion()

                    ->form([

                        /*
                        ✅ Student class ikut filter halaman
                        */
                        Forms\Components\Select::make('kelas_id')
                            ->label('Student Class')
                            ->options(function ($livewire) {

                                $filterId = $livewire->tableFilters['kelas_id']['value'] ?? null;

                                if (!$filterId) {
                                    return StudentClass::pluck('nama_kelas', 'id');
                                }

                                $departmentId = StudentClass::find($filterId)?->jurusan_id;

                                return StudentClass::where('jurusan_id', $departmentId)
                                    ->pluck('nama_kelas', 'id');
                            })
                            ->searchable()
                            ->preload()
                            ->required(),

                        Forms\Components\Select::make('tingkat_id')
                            ->relationship('tingkat', 'name')
                            ->searchable()
                            ->preload()
                            ->required(),
                    ])

                    /*
                    ✅ update hanya data hasil filter
                    */
                    ->action(function (array $data, $livewire) {
                        $livewire->getFilteredTableQuery()->update($data);
                    }),

                DeleteBulkAction::make(),
            ])

            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ]);
    }
}
