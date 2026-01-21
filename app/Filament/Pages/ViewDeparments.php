<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Departments;
use Filament\Notifications\Notification;
use BackedEnum;
use UnitEnum;
use Filament\Support\Icons\Heroicon;

class ViewDepartments extends Page
{
    protected string $view = 'filament.pages.view-departments';

    protected static ?string $navigationLabel = 'Jurusan';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBuildingOffice;

    protected static string|UnitEnum|null $navigationGroup = 'Manajemen Akademik';

    public $selectedDepartment;

    public function getDepartments()
    {
        return Departments::with([])->get();
    }

    public function confirmDelete($id)
    {
        $this->dispatch('open-modal', id: 'delete-department');

        $this->selectedDepartment = $id;
    }

    public function deleteDepartment()
    {
        $dept = Departments::with(['modules.teachers', 'students'])
            ->findOrFail($this->selectedDepartment);

        // 1. Lepas kepala jurusan
        $dept->update([
            'head_department_id' => null,
        ]);

        // 2. Pindahkan / null-kan siswa
        $dept->students()->update([
            'department_id' => null, // atau pindah ke jurusan lain
        ]);

        // 3. Detach guru dari module
        foreach ($dept->modules as $module) {
            $module->teachers()->detach();
        }

        // 4. Hapus module
        $dept->modules()->delete();

        // 5. Hapus department
        $dept->delete();

        Notification::make()
            ->title('Jurusan berhasil dihapus')
            ->success()
            ->send();

        $this->dispatch('close-modal', id: 'delete-department');
        $this->dispatch('$refresh');
    }
}
