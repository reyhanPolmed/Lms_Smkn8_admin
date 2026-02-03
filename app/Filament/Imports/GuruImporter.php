<?php

namespace App\Filament\Imports;

use App\Models\User;
use App\Models\Teacher;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;
use Illuminate\Support\Number;

class GuruImporter extends Importer
{
    protected static ?string $model = Teacher::class;

    public static function getColumns(): array
    {
        return [
            ImportColumn::make('name')->requiredMapping(),
            ImportColumn::make('nip')->requiredMapping(),
            ImportColumn::make('department_id'),
        ];
    }

        protected function beforeCreate(): void
    {
        $user = User::firstOrCreate(
            ['identifier' => $this->data['nip']],
            [
                'name' => $this->data['name'],
                'password' => bcrypt($this->data['nip']),
            ]
        );

        $this->record->user_id = $user->id;
    }

    public function resolveRecord(): Teacher
    {
        return new Teacher();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your teacher import has completed and ' . Number::format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . Number::format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
