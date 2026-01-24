<?php

namespace App\Filament\Resources\Admins\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
// Import class kolom di sini
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Illuminate\Database\Eloquent\Builder;
class AdminsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(function (Builder $query) {
                // Hanya ambil data dimana email TIDAK NULL dan TIDAK KOSONG
                return $query->whereNotNull('email')->where('email', '!=', '');
            })
            ->columns([

                // 2. Kolom Nama
                TextColumn::make('name')
                    ->searchable() // Agar bisa dicari via search bar
                    ->sortable()   // Agar bisa diurutkan (A-Z)
                    ->weight('bold') // Membuat teks sedikit tebal
                    ->label('Nama Lengkap'),

                // 3. Kolom Email
                TextColumn::make('email')
                    ->icon('heroicon-m-envelope') // Menambah ikon amplop kecil
                    ->searchable()
                    ->copyable() // Memudahkan admin menyalin email
                    ->copyMessage('Email copied')
                    ->label('Email Address'),
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