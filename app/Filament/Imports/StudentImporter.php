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
        ImportColumn::make('name')
            ->rules(['required']),

        ImportColumn::make('nisn')
            ->rules(['required']),

        ImportColumn::make('department_id')
            ->rules(['required', 'exists:departments,id']),

        ImportColumn::make('class_level_id')
            ->rules(['required', 'exists:class_levels,id']),
            
        ImportColumn::make('tingkat_id')
            ->rules(['required', 'exists:tingkats,id']),
    ];
}


    protected function createRecord(array $data): Student
    {
        // 1️⃣ Buat user dulu
        $user = User::create([
            'name'       => $data['name'],
            'identifier' => $data['nisn'],
            'password'   => Hash::make($data['nisn']), // password = nisn
        ]);

        // 2️⃣ Buat student
        return Student::create([
            'user_id'    => $user->id,
            'name'       => $data['name'],
            'nisn'       => $data['nisn'],
            'department_id' => $data['department_id'],
            'class_level_id' => $data['class_level_id'],
            'tingkat_id' => $data['tingkat_id'],
        ]);
    }

    public function resolveRecord(): Student
    {
        return new Student();
    }

    public static function getCompletedNotificationBody(Import $import): string
    {
        $body = 'Your student import has completed and ' . Number::format($import->successful_rows) . ' ' . str('row')->plural($import->successful_rows) . ' imported.';

        if ($failedRowsCount = $import->getFailedRowsCount()) {
            $body .= ' ' . Number::format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to import.';
        }

        return $body;
    }
}
