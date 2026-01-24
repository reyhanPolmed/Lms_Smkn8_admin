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

    // State Model (Route Binding)
    public ?Departments $department = null;

    // State Filter (Tambahan Baru)
    public $tingkat = null;

    // Form Properties
    public $foto;
    public $name;
    public $description;
    public $teacher_id;

    // Data Collections
    public $allModules = [];
    public $allTeachers = [];

    // Gunakan Type Hint Model agar otomatis resolve ID (Best Practice)
    public function mount(Departments $department): void
    {
        $this->department = $department;

        // 1. Ambil parameter filter dari URL (query string)
        $this->tingkat = request()->query('tingkat');

        $this->loadModules();
        $this->allTeachers = Teacher::all();

        $this->name = $department->name;
        $this->description = $department->description;
    }

    private function loadModules(): void
    {
        // Siapkan ID untuk whereIn (antisipasi jika null/single value)
        $ids = (array) $this->tingkat;

        $this->allModules = Modules::query()
            ->where('department_id', $this->department->id)
            
            // 2. Logika Filter (Hanya jalan jika ada ?tingkat=...)
            ->when($this->tingkat, function ($q) use ($ids) {
                $q->whereHas('tingkats', function ($t) use ($ids) {
                     $t->whereIn('tingkat_id', $ids);
                });
            })
            
            ->with([
                'teachers',
                'classes',
                'classes.students',
                'headOfDepartment',
            ])
            ->get();
    }

    private function refreshData()
    {
        $this->department->refresh();
        $this->loadModules(); // Panggil ulang loadModules agar filter tetap jalan
        $this->dispatch('$refresh');
    }

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