<?php

namespace App\Filament\Imports;

use App\Models\Account;
use App\Models\User;
use App\Models\Teacher;
use App\Support\TeacherAuthCredentialSync;
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
            ImportColumn::make('nama')->requiredMapping(),
            ImportColumn::make('nip')->requiredMapping(),
            ImportColumn::make('email'),
            ImportColumn::make('jurusan_id'),
        ];
    }

        protected function beforeCreate(): void
    {
        $user = User::firstOrNew([
            'identifier' => $this->data['nip'],
        ]);

        $user->name = $this->data['nama'];
        $user->email_verified = true;

        if (filled($this->data['email'] ?? null)) {
            $user->email = $this->data['email'];
        }

        if (! filled($user->password)) {
            $user->password = bcrypt($this->data['nip']);
        }

        $user->save();

        TeacherAuthCredentialSync::sync(
            $user,
            ! Account::query()
                ->where('user_id', $user->id)
                ->where('provider_id', 'credential')
                ->exists()
                ? $this->data['nip']
                : null
        );

        $this->record->user_id = $user->id;
        $this->record->email = $user->email;
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
