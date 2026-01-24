<?php

namespace App\Filament\Resources\Mapels\Pages;

use App\Filament\Resources\Mapels\MapelResource;
use Filament\Resources\Pages\CreateRecord;

class CreateMapel extends CreateRecord
{
    protected static string $resource = MapelResource::class;

    protected function getRedirectUrl(): string
    {
        // Mengarahkan kembali ke halaman 'index' (Tabel List)
        return $this->getResource()::getUrl('index');
    }
}
