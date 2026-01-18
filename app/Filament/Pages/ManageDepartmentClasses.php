<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Department;
use Livewire\WithFileUploads;
use Filament\Notifications\Notification;


class ManageDepartmentClasses extends Page
{
    use WithFileUploads;        // ← DAN DI AKTIFKAN DI SINI

    public $foto;

    protected string $view = 'filament.pages.manage-classes';


    // 1. Pastikan slug ini ada (seperti solusi sebelumnya)
    protected static ?string $slug = 'departments/{department}/classes';

    // 2. TAMBAHKAN INI: Agar tidak muncul di sidebar menu
    protected static bool $shouldRegisterNavigation = false;

    public ?Department $department = null;

    public function mount(Department $department): void
    {
        $department->load([
            'headOfDepartment',
            'classes.homeroomTeacher',
            'classes.students',
        ])->loadCount([
            'students',
            'teachers',
        ]);

        // Masukkan ke properti public
        $this->department = $department;
    }

    protected function getHeaderActions(): array
    {
        return [];
    }

    public function updatedFoto()
    {
        $this->validate([
            'foto' => 'image|max:2048',
        ]);

        $path = $this->foto->store('departments', 'private');

        Department::where('id', $this->department->id)
            ->update([
                'foto' => $path,
            ]);

        Notification::make()
            ->title('Foto berhasil diubah')
            ->success()
            ->send();

        $this->department->refresh();

        $this->dispatch('$refresh');
    }
}
