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
                    ->password()
                    ->revealable() // Tombol mata untuk lihat password
                    ->dehydrateStateUsing(fn(string $state): string => Hash::make($state)) // Hash password sebelum simpan
                    ->dehydrated(fn(?string $state): bool => filled($state)) // Hanya simpan jika field diisi
                    ->required(fn(string $operation): bool => $operation === 'create') // Wajib diisi saat Create, opsional saat Edit
                    ->confirmed() // Mewajibkan adanya field password_confirmation
                    ->label('Password'),

                // 5. Input Konfirmasi Password
                TextInput::make('password_confirmation')
                    ->password()
                    ->revealable()
                    ->requiredWith('password') // Wajib jika password diisi
                    ->dehydrated(false) // Field ini TIDAK boleh disimpan ke database
                    ->label('Konfirmasi Password')
            ]);
    }
}
