<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Departments;
use App\Models\Modules;
use App\Models\Teacher;
use Livewire\WithFileUploads;
use Filament\Notifications\Notification;

class ManageModulesClasses extends Page
{
    use WithFileUploads;

    protected string $view = 'filament.pages.manage-jurusan';

    protected static ?string $slug = 'modules/{department}/classes';
    protected static bool $shouldRegisterNavigation = false;

    public ?Departments $department = null;

    // Form Properties
    public $foto;
    public $name;
    public $description;
    public $teacher_id;

    // Data Collections
    public $allModules = [];
    public $allTeachers = [];

    public function mount(Departments $department): void
    {
        $this->department = $department;

        // Load modules milik department beserta relasinya
        $this->loadModules();

        // Load master teachers (untuk dropdown dll)
        $this->allTeachers = Teacher::all();

        // Bind form dari department
        $this->name = $department->name;
        $this->description = $department->description;
    }

    /**
     * Load modules with all required relations
     */
    private function loadModules(): void
    {
        $this->allModules = Modules::where('department_id', $this->department->id)
            ->with([
                'teachers',
                'classes',
                'classes.students',
                'headOfDepartment',
            ])
            ->get();
    }

    /**
     * Refresh all related data
     */
private function refreshData()
{
    $this->department->refresh();

    $this->allModules = Modules::where('department_id', $this->department->id)
        ->with([
            'teachers',
            'classes',
            'classes.students',
        ])
        ->get();

    $this->dispatch('$refresh');
}


    /**
     * Example save method (siap dipakai)
     */
    public function saveDepartment(): void
    {
        $this->validate([
            'name' => 'required|min:3',
            'description' => 'nullable',
        ]);

        $this->department->update([
            'name' => $this->name,
            'description' => $this->description,
        ]);

        Notification::make()
            ->title('Data department berhasil disimpan')
            ->success()
            ->send();

        $this->refreshData();
    }
}
