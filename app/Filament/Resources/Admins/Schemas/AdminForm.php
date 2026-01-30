<?php

namespace App\Filament\Resources\Admins\Schemas;

// Pastikan import komponen form yang benar
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Form; // Sesuaikan jika Anda menggunakan wrapper custom

class AdminForm
{
    // Catatan: Di standar Filament V3, parameter biasanya (Form $form), 
    // tapi saya ikuti struktur (Schema $schema) sesuai kode Anda.
    public static function configure($schema)
    {
        return $schema
            ->components([

                // Gunakan Grid agar tampilan lebih rapi (opsional)


                // 2. Input Nama
                TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->label('Nama Lengkap'),


                // 3. Input Email
                TextInput::make('email')
                    ->email()
                    ->required()
                    ->unique(ignoreRecord: true) // Cek unik, abaikan jika sedang edit data sendiri
                    ->maxLength(255),

                // 1. Input Foto (Sesuai dengan tabel sebelumnya)
                FileUpload::make('photo')
                    ->image() // Membuat tampilan upload bulat (opsional)
                    ->directory('admin-photos')
                    ->maxFiles(1) // Folder penyimpanan
                    ->label('Foto Profil'),

                // 4. Input Password
                TextInput::make('password')
                    ->label('Password Baru')
                    ->password()
                    ->revealable()
                    ->dehydrated(fn($state) => filled($state)) // hanya kirim kalau diisi
                    ->required(false)
                    ->minLength(6)
                    ->afterStateHydrated(fn($component) => $component->state('')) // kosongkan saat edit
                    ->dehydrateStateUsing(fn($state) => Hash::make($state)),


                TextInput::make('confirmPassword')
                    ->label('Konfirmasi Password')
                    ->password()
                    ->revealable()
                    ->required(fn($operation) => $operation === 'create')
                    ->hidden(fn($operation) => $operation === 'edit')
                    ->same('password')
                    ->placeholder('Ulangi password')
            ]);
    }
}
