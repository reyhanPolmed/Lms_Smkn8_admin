<?php

namespace App\Filament\Resources\Mapels\Tables;

use App\Models\Tingkat;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Tables\Table;
// Import Kolom
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;

class MapelsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                // 1. Thumbnail (Image)
                ImageColumn::make('thumbnail')
                    ->square() // atau ->circular()
                    ->label('Foto'),

                // 2. Title (Judul Module)
                TextColumn::make('title')
                    ->searchable()
                    ->sortable()
                    ->weight('bold')
                    ->label('Mata Pelajaran'),

                // 3. Department (Relasi BelongsTo)
                // Asumsi: Di model Module ada fungsi 'department()'
                TextColumn::make('department.name')
                    ->label('Jurusan')
                    ->sortable()
                    ->badge() // Opsional: Memberikan background warna
                    ->color('info'),

                // 4. Kelas (Relasi Many-to-Many / Pivot)
                // Asumsi: Di model Module ada fungsi 'tingkats()'
                // Filament otomatis mengambil 'name' dari tabel 'tingkats' via pivot
                TextColumn::make('tingkats.name')
                    ->label('Kelas')
                    ->badge(), // Menampilkan sebagai tags/badge kecil

                // 5. Description
                TextColumn::make('description')
                    ->label('Deskripsi')
                    ->limit(50) // Membatasi teks agar tidak kepanjangan di tabel
                    ->wrap(), // Text turun ke bawah jika panjang// Text turun ke bawah jika panjang
            ])
            ->filters([

                // Filter Jurusan (belongsTo)
                SelectFilter::make('department_id')
                    ->relationship('department', 'name')
                    ->searchable()
                    ->preload(),


                // Filter Tingkat (many-to-many pivot)
                SelectFilter::make('tingkat')
                    ->label('Tingkat')
                    ->options(Tingkat::pluck('name', 'id'))
                    ->query(function ($query, $data) {
                        if ($data['value']) {
                            $query->whereHas('tingkats', function ($q) use ($data) {
                                $q->where('tingkat_id', $data['value']);
                            });
                        }
                    }),

            ])

            ->actions([ // Standard V3 menggunakan 'actions'
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->bulkActions([ // Standard V3 menggunakan 'bulkActions'
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
