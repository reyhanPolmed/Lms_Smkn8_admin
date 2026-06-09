<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Modules as Department;
use App\Models\Departments;
use App\Models\Tingkat;
use App\Models\StudentClass;
use App\Models\ModuleStudentClassSchedule;
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

class ViewClass extends Page
{
    protected string $view = 'filament.pages.view-classes';

    protected static ?string $navigationLabel = 'kelas';

    protected static ?string $title = 'Daftar Kelas';

    protected static string|UnitEnum|null $navigationGroup = 'Manajemen Akademik';
    protected static ?int $navigationSort = 10;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedUserGroup;

    // protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    public $scheduleInputs = [];
    public $haris;
    public $rentangJams;

    public $selectedDepartment;

    public function getBreadcrumbs(): array
    {
        return [
            '/admin/view-kelas' => 'Kelas',
            'List',
        ];
    }

    public $filterLevel = '';
    public $filterDepartment = '';
    protected function getViewData(): array
    {
        // ========================
        // Query kelas
        // ========================
        $query = StudentClass::query()
            ->with([
                'modules',
                'homeroomTeacher',
                'department',
                'tingkat',
            ]);

        if ($this->filterLevel) {
            $query->where('tingkat_id', $this->filterLevel);
        }

        if ($this->filterDepartment) {
            $query->where('jurusan_id', $this->filterDepartment);
        }

        $classes = $query->get();


        // ========================
        // Query jadwal (🔥 langsung dari schedules)
        // ========================
        $schedules = ModuleStudentClassSchedule::with([
            'hari',
            'moduleStudentClass.teacher',
            'moduleStudentClass.module',
            'rentangJam',
        ])->get();


        // ========================
        // Group jadwal per kelas biar gampang dipakai di blade
        // ========================
        $schedulesByClass = $schedules->groupBy(
            fn($s) => $s->moduleStudentClass->student_class_id
        );


        $teachers = Teacher::pluck('nama', 'id');
        $departments = Departments::all();

        return compact(
            'classes',
            'teachers',
            'departments',
            'schedulesByClass'
        );
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

    $msc = ModuleStudentClass::with('schedules.rentangJam')
        ->where('student_class_id', $classId)
        ->where('module_id', $moduleId)
        ->first();

    if ($msc) {
        $this->selectedTeacherId = $msc->teacher_id;

        $this->scheduleInputs = $msc->schedules
            ->map(fn($s) => [
                'hari_id' => $s->hari_id,
                'jam_mulai' => $s->rentangJam?->jam_mulai,
                'jam_selesai' => $s->rentangJam?->jam_selesai,
            ])
            ->toArray();
    } else {
        $this->scheduleInputs = [
            ['hari_id' => '', 'jam_mulai' => '', 'jam_selesai' => '']
        ];
    }

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

                    TextInput::make('nama_kelas')
                        ->label('Nama Kelas')
                        ->required()
                        ->maxLength(255),

                    Select::make('homeroom_teacher_id')
                        ->label('Wali Kelas')
                        ->options(Teacher::pluck('nama', 'id'))
                        ->searchable()
                        ->required(),

                    Select::make('jurusan_id')
                        ->label('Jurusan')
                        ->options(Departments::pluck('nama_jurusan', 'id'))
                        ->searchable()
                        ->required(),

                    Select::make('tingkat_id')
                        ->label('Tingkat')
                        ->options(Tingkat::pluck('name', 'id'))
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
                    'nama_kelas' => $class->nama_kelas,
                    'jurusan_id' => $class->jurusan_id,
                    'homeroom_teacher_id' => $class->homeroom_teacher_id,
                    'tingkat_id' => $class->tingkat_id,
                ]);
            })

            ->form([
                TextInput::make('nama_kelas')->required(),

                Select::make('jurusan_id')
                    ->label('Jurusan')
                    ->options(Departments::pluck('nama_jurusan', 'id'))
                    ->required(),

                Select::make('homeroom_teacher_id')
                    ->options(Teacher::pluck('nama', 'id'))
                    ->label('Wali Kelas')
                    ->required(),

                Select::make('tingkat_id')
                    ->options(Tingkat::pluck('name', 'id'))
                    ->label('Tingkat')
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

    public function mount()
    {
        $this->haris = \App\Models\Hari::orderBy('id')->get();

        // default 1 baris
        $this->scheduleInputs = [
            ['hari_id' => '', 'jam_mulai' => '', 'jam_selesai' => '']
        ];
    }


    public function addScheduleRow()
    {
        $this->scheduleInputs[] = [
            'hari_id' => '',
            'jam_mulai' => '',
            'jam_selesai' => ''
        ];
    }


    public function removeScheduleRow($index)
    {
        unset($this->scheduleInputs[$index]);
        $this->scheduleInputs = array_values($this->scheduleInputs);
    }

public function saveTeacherAndSchedules()
{
    $this->validate([
        'selectedTeacherId' => 'required|exists:teachers,id',
    ]);

    // simpan pivot guru
    $msc = ModuleStudentClass::updateOrCreate(
        [
            'student_class_id' => $this->selectedClassId,
            'module_id' => $this->selectedModuleId,
        ],
        [
            'teacher_id' => $this->selectedTeacherId,
        ]
    );

    /*
    ===============================
    FIX DOUBLE JADWAL SUPPORT
    ===============================
    */

    // buang slot kosong & validasi waktu
    $errors = [];
    $rows = collect($this->scheduleInputs)
        ->filter(function ($r, $idx) use (&$errors) {
            if (!$r['hari_id'] || !$r['jam_mulai'] || !$r['jam_selesai']) {
                return false;
            }
            if ($r['jam_selesai'] <= $r['jam_mulai']) {
                $errors[] = "Baris ke-" . ($idx + 1) . ": Waktu selesai harus setelah waktu mulai";
                return false;
            }
            return true;
        })
        ->unique(fn($r) => $r['hari_id'].'-'.$r['jam_mulai'].'-'.$r['jam_selesai']); // cegah duplikat

    if ($errors) {
        Notification::make()
            ->title('Validasi Gagal')
            ->body(implode("\n", $errors))
            ->danger()
            ->persistent()
            ->send();
        return;
    }

    // hapus jadwal lama
    $msc->schedules()->delete();

    // insert banyak jadwal
    foreach ($rows as $row) {
        $rentangJam = \App\Models\RentangJam::firstOrCreate([
            'jam_mulai' => $row['jam_mulai'],
            'jam_selesai' => $row['jam_selesai'],
        ]);

        $msc->schedules()->create([
            'hari_id'   => $row['hari_id'],
            'rentang_jam_id' => $rentangJam->id,
        ]);
    }

    Notification::make()
        ->title('Guru & jadwal berhasil disimpan')
        ->success()
        ->send();

    $this->dispatch('$refresh');
    $this->dispatch('close-teacher-modal');

    // reset
    $this->scheduleInputs = [
        ['hari_id' => '', 'jam_mulai' => '', 'jam_selesai' => '']
    ];
}

}
