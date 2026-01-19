<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Department;
use App\Models\StudentClass;
use App\Models\Teacher;
use Livewire\WithFileUploads;
use Filament\Notifications\Notification;


class ManageDepartmentClasses extends Page
{
    use WithFileUploads;        // ← DAN DI AKTIFKAN DI SINI

    public $foto;
    public $name;
    public $description;

    public $teacher_id;
    public $allTeachers;

    protected string $view = 'filament.pages.manage-classes';


    // 1. Pastikan slug ini ada (seperti solusi sebelumnya)
    protected static ?string $slug = 'departments/{department}/classes';

    // 2. TAMBAHKAN INI: Agar tidak muncul di sidebar menu
    protected static bool $shouldRegisterNavigation = false;

    public ?Department $department = null;
    public $allClasses;


    public function mount(Department $department): void
    {
        $department->load([
            'headOfDepartment',
            'classes.homeroomTeacher',
            'classes.students',
            'teachers',
        ])->loadCount([
            'students',
            'teachers',
        ]);

        // Masukkan ke properti public
        $this->department = $department;

        $this->allClasses = StudentClass::with(['homeroomTeacher', 'students'])->get();
        $this->allTeachers = Teacher::all();

        $this->name = $department->name;
        $this->description = $department->description;
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

    public function attachClass($classId)
    {
        // Cegah double attach
        $this->department->classes()->syncWithoutDetaching([$classId]);

        $this->department->refresh();
        $this->department->load('classes');

        Notification::make()
            ->title('Kelas berhasil ditambahkan ke jurusan')
            ->success()
            ->send();

        $this->dispatch('$refresh');
    }

    public function detachClass($classId)
    {
        $this->department->classes()->detach($classId);

        $this->department->refresh();
        $this->department->load('classes');

        Notification::make()
            ->title('Kelas dikeluarkan dari jurusan')
            ->warning()
            ->send();

        $this->dispatch('$refresh');
    }

    public function save()
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
            ->title('Perubahan berhasil disimpan')
            ->success()
            ->send();

        // refresh data
        $this->department->refresh();
    }

    public function attachTeacher()
{
    $this->validate([
        'teacher_id' => 'required',
    ]);

    $this->department->teachers()
        ->syncWithoutDetaching([$this->teacher_id]);

    $this->department->refresh();
    $this->department->load('teachers');

    $this->teacher_id = null;

    Notification::make()
        ->title('Guru berhasil ditambahkan')
        ->success()
        ->send();

    $this->dispatch('$refresh');
}

public function detachTeacher($teacherId)
{
    $this->department->teachers()->detach($teacherId);

    $this->department->refresh();
    $this->department->load('teachers');

    Notification::make()
        ->title('Guru dikeluarkan dari jurusan')
        ->warning()
        ->send();

    $this->dispatch('$refresh');
}

}
