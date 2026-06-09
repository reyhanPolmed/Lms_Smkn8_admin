<?php

namespace App\Filament\Imports;

use App\Models\Account;
use App\Models\Student;
use App\Models\User;
use App\Support\TeacherAuthCredentialSync;
use Filament\Actions\Imports\ImportColumn;
use Filament\Actions\Imports\Importer;
use Filament\Actions\Imports\Models\Import;
use Illuminate\Support\Number;

class StudentImporter extends Importer
{
    protected static ?string $model = Student::class;


    public static function getColumns(): array
    {
        return [
            ImportColumn::make('nama')->requiredMapping(),
            ImportColumn::make('nisn')->requiredMapping(),
            ImportColumn::make('email'),
            ImportColumn::make('jurusan_id'),
            ImportColumn::make('kelas_id'),
            ImportColumn::make('tingkat_id'),
            ImportColumn::make('foto'),
        ];
    }


    protected function beforeCreate(): void
    {
        $user = User::firstOrNew([
            'identifier' => $this->data['nisn'],
        ]);

        $user->name = $this->data['nama'];
        $user->email_verified = true;
        $user->nisn = $this->data['nisn'];

        if (filled($this->data['email'] ?? null)) {
            $user->email = $this->data['email'];
        }

        if (! filled($user->password)) {
            $user->password = bcrypt($this->data['nisn']);
        }

        $user->save();

        TeacherAuthCredentialSync::sync(
            $user,
            ! Account::query()
                ->where('user_id', $user->id)
                ->where('provider_id', 'credential')
                ->exists()
                ? $this->data['nisn']
                : null
        );

        $this->record->user_id = $user->id;
        $this->record->email = $user->email;
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
