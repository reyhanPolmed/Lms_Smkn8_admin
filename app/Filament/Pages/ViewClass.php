<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Modules as Department;
use App\Models\Departments;
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
                ->label('Tambah Mata Pelajaran')
                ->model(Department::class)

                ->form([

                    TextInput::make('title')
                        ->label('Nama Mata Pelajaran')
                        ->required()
                        ->maxLength(255),

                    FileUpload::make('thumbnail')
                        ->image()
                        ->maxFiles(1)
                        ->directory('matakuliah'),

                    Textarea::make('description')
                        ->label('Deskripsi')
                        ->rows(3),

                    Select::make('department_id')
                        ->label('Jurusan')
                        ->options(Departments::pluck('name', 'id'))
                        ->searchable()
                        ->required(),
                ])

                ->successNotificationTitle('Mata Pelajaran berhasil ditambahkan'),
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
            ->title('Department berhasil dihapus')
            ->success()
            ->send();


        return redirect()->to(\App\Filament\Pages\ViewModules::getUrl());
    }
}
