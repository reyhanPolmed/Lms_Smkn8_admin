<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Modules as Department;
use App\Models\Departments;
use App\Models\StudentClass;
use Filament\Actions\CreateAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use Filament\Notifications\Notification;
use App\Models\Teacher;
use UnitEnum;
use BackedEnum;

use Filament\Support\Icons\Heroicon;

class ViewKelas extends Page
{
    protected string $view = 'filament.pages.view-classes';

    protected static ?string $navigationLabel = 'kelas';

    protected static ?string $title = 'Kelas';

    protected static string|UnitEnum|null $navigationGroup = 'Manajemen Akademik';
    protected static ?int $navigationSort = 10;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedUserGroup;

    // protected static ?string $navigationIcon = 'heroicon-o-academic-cap';


    public $selectedDepartment;


    public function getDepartments()
    {
        return Department::with([
            'headOfDepartment',
            'classes',
            'students',
            'teachers',
        ])
            ->withCount([
                'students',
                'teachers',
            ])
            ->get();
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

                    Select::make('homeroomTeacher')
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
}
