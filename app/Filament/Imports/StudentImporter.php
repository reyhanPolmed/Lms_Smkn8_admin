<?php

namespace App\Filament\Imports;

use App\Models\Student;
use App\Models\User;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;
use Illuminate\Support\Number;
use Illuminate\Support\Facades\Hash;

class StudentImporter extends Importer
{
    protected static ?string $model = Student::class;


    public static function getColumns(): array
    {
        return [
            ImportColumn::make('name')->requiredMapping(),
            ImportColumn::make('nisn')->requiredMapping(),
            ImportColumn::make('department_id'),
            ImportColumn::make('class_level_id'),
            ImportColumn::make('tingkat_id'),
            ImportColumn::make('photo'),
        ];
    }


    protected function beforeCreate(): void
    {
        $user = User::firstOrCreate(
            ['identifier' => $this->data['nisn']],
            [
                'name' => $this->data['name'],
                'password' => bcrypt($this->data['nisn']),
            ]
        );

        $this->record->user_id = $user->id;
    }

    public function resolveRecord(): ?Student
    {
        return new Student();
    }
    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Import siswa selesai. ' . Number::format($import->successful_rows) . ' ' . str('baris')->plural($import->successful_rows) . ' berhasil diimpor.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . Number::format($failedRowsCount) . ' ' . str('baris')->plural($failedRowsCount) . ' gagal diimpor.';
        }

        return $body;
    }
}
