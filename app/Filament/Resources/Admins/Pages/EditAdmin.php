<?php

namespace App\Filament\Resources\Admins\Pages;

// Pastikan namespace ini sesuai dengan lokasi AdminResource Anda
use App\Filament\Resources\Admins\AdminResource; 
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAdmin extends EditRecord
{
    // Hubungkan dengan Resource utama
    protected static string $resource = AdminResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // Menambahkan tombol Hapus di pojok kanan atas halaman Edit
            Actions\DeleteAction::make(),
        ];
    }

    /**
     * Agar setelah tombol 'Save Changes' ditekan,
     * halaman kembali ke Table List (Index), bukan tetap di form edit.
     */
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}