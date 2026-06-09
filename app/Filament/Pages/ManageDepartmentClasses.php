<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Modules as Department;
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
    public $jurusanName;

    public $teacher_id;
    public $allTeachers;

    protected string $view = 'filament.pages.detail_mapel';


    // 1. Pastikan slug ini ada (seperti solusi sebelumnya)
    protected static ?string $slug = 'modules/{department}/detail';

    // 2. TAMBAHKAN INI: Agar tidak muncul di sidebar menu
    protected static bool $shouldRegisterNavigation = false;

    public ?Department $department = null;
    public $allClasses;


public function mount(Department $department): void
    {
        // ... (kode load relationship yang lama tetap sama) ...
        $department->load([
            'headOfDepartment',
            'classes.homeroomTeacher',
            'classes.students',
            'teachers',
        ])->loadCount([
            'teachers',
        ]);

        $this->department = $department;

        // -------------------------------------------------------------
        // PERBAIKAN LOGIC
        // -------------------------------------------------------------
        // Ambil kelas yang department_id-nya SAMA dengan department_id milik Module ini
        
        $this->allClasses = StudentClass::query()
            ->where('jurusan_id', $this->department->jurusan_id)
            ->with(['homeroomTeacher', 'students'])
            ->get();

        // -------------------------------------------------------------

        $this->allTeachers = Teacher::all();

        $this->name = $department->title;
        $this->description = $department->description;
        $this->jurusanName = $department->title;
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
                'thumbnail' => $path,
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
            'jurusanName' => 'required|min:3',
            'description' => 'nullable',
        ]);

        $this->department->update([
            'judul' => $this->jurusanName,
            'deskripsi' => $this->description,
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
