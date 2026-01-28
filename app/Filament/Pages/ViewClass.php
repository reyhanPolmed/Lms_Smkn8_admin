<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Modules as Department;
use App\Models\Departments;
use App\Models\StudentClass;
use App\Models\ModuleStudentClass;
use Filament\Actions\CreateAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use Filament\Notifications\Notification;
use Filament\Actions\Action;

use App\Models\Teacher;
use UnitEnum;
use BackedEnum;

use Filament\Support\Icons\Heroicon;

class ViewKelas extends Page
{
    protected string $view = 'filament.pages.view-classes';

    protected static ?string $navigationLabel = 'kelas';

    protected static ?string $title = 'Daftar Kelas';

    protected static string|UnitEnum|null $navigationGroup = 'Manajemen Akademik';
    protected static ?int $navigationSort = 10;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedUserGroup;

    // protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    public $selectedDepartment;

    public function getBreadcrumbs(): array
    {
        return [
            '/admin/view-kelas' => 'Kelas',
            'List',
        ];
    }


    protected function getViewData(): array
    {
        $classes = StudentClass::with([
            'modules',
            'homeroomTeacher',
        ])->get();

        $teachers = Teacher::pluck('name', 'id');

        return compact('classes', 'teachers');
    }

    // Di dalam Class Filament Page Anda (misal: EditCourse.php)

    public $selectedTeacherId; // Untuk wire:model di select modal
    public $selectedClassId;   // Diset saat tombol pencil diklik
    public $selectedModuleId;  // Diset saat tombol pencil diklik

    // Method baru: Dipanggil saat tombol pencil diklik
    public function openTeacherModal($classId, $moduleId)
    {
        $this->selectedClassId = $classId;
        $this->selectedModuleId = $moduleId;

        // Reset pilihan guru sebelumnya (opsional, agar bersih)
        $this->reset('selectedTeacherId');

        // Jika data sudah ada sebelumnya, kita bisa load (opsional)
        // $existing = ModuleStudentClass::where('...')->first();
        // $this->selectedTeacherId = $existing?->teacher_id;

        // Dispatch event browser agar AlpineJS membuka modal
        $this->dispatch('open-teacher-modal');
    }

    public function saveTeacher()
    {
        $this->validate([
            'selectedTeacherId' => 'required|exists:teachers,id',
        ]);

        ModuleStudentClass::updateOrCreate(
            [
                'student_class_id' => $this->selectedClassId,
                'module_id'        => $this->selectedModuleId,
            ],
            [
                'teacher_id' => $this->selectedTeacherId,
            ]
        );

        Notification::make()
            ->title('Guru berhasil ditugaskan')
            ->success()
            ->send();

        $this->dispatch('$refresh');
        $this->dispatch('close-teacher-modal');

        $this->reset('selectedTeacherId');
    }


    protected function getActions(): array
    {
        return [
            CreateAction::make()
                ->label('Tambah Kelas')
                ->model(StudentClass::class)

                ->form([

                    TextInput::make('name')
                        ->label('Nama Kelas')
                        ->required()
                        ->maxLength(255),

                    Select::make('homeroom_teacher_id')
                        ->label('Wali Kelas')
                        ->options(Teacher::pluck('name', 'id'))
                        ->searchable()
                        ->required(),

                    Select::make('department_id')
                        ->label('Jurusan')
                        ->options(Departments::pluck('name', 'id'))
                        ->searchable()
                        ->required(),
                ])

                ->successNotificationTitle('Kelas berhasil ditambahkan'),
        ];
    }


    public function confirmDelete($id)
    {
        $this->dispatch('open-modal', id: 'delete-department');

        $this->selectedDepartment = $id;
    }

    public function deleteDepartment()
    {
        $dept = Department::findOrFail($this->selectedDepartment);

        $dept->delete();

        Notification::make()
            ->title('Kelas berhasil dihapus')
            ->success()
            ->send();


        return redirect()->to(\App\Filament\Pages\ViewModules::getUrl());
    }

    public function openEditClass($id)
    {
        $this->selectedClassId = $id;

        $this->mountAction('editClass');
    }

    public function editClassAction(): Action
    {
        return Action::make('editClass')
            ->label('Edit Kelas')
            ->icon('heroicon-m-pencil-square')
            ->color('warning')
            ->modalHeading('Edit Kelas')

            ->mountUsing(function ($form) {
                $class = StudentClass::find($this->selectedClassId);

                if (!$class) return;

                $form->fill([
                    'name' => $class->name,
                    'department_id' => $class->department_id,
                    'homeroom_teacher_id' => $class->homeroom_teacher_id,
                ]);
            })

            ->form([
                TextInput::make('name')->required(),

                Select::make('department_id')
                    ->options(Departments::pluck('name', 'id'))
                    ->required(),

                Select::make('homeroom_teacher_id')
                    ->options(Teacher::pluck('name', 'id'))
                    ->required(),
            ])

            ->action(function ($data) {
                StudentClass::find($this->selectedClassId)?->update($data);

                Notification::make()
                    ->title('Kelas berhasil diperbarui')
                    ->success()
                    ->send();
            });
    }

    public function openDeleteClass($id)
    {
        $this->selectedClassId = $id;

        $this->mountAction('deleteClass');
    }

    public function deleteClassAction(): Action
    {
        return Action::make('deleteClass')
            ->label('Hapus Kelas')
            ->icon('heroicon-m-trash')
            ->color('danger')

            ->requiresConfirmation() // 🔥 auto modal confirm
            ->modalHeading('Hapus Kelas?')
            ->modalDescription('Data kelas akan dihapus permanen.')

            ->action(function () {
                StudentClass::find($this->selectedClassId)?->delete();

                Notification::make()
                    ->title('Kelas berhasil dihapus')
                    ->success()
                    ->send();

                $this->dispatch('$refresh');
            });
    }
}
