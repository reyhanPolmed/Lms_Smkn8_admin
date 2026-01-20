<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Modules as Department;
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

class ViewModules extends Page
{
    protected string $view = 'filament.pages.view-modules';

    protected static ?string $navigationLabel = 'Mata Pelajaran';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBuildingOffice;
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

                    TextInput::make('name')
                        ->label('Nama Mata Pelajaran')
                        ->required()
                        ->maxLength(255),

                    FileUpload::make('foto')
                        ->image()
                        ->maxFiles(1)
                        ->directory('matakuliah'),

                    TextInput::make('slug')
                        ->label('Slug')
                        ->required(),

                    Textarea::make('description')
                        ->label('Deskripsi')
                        ->rows(3),

                    Select::make('head_of_department_id')
                        ->label('Guru Pengampu / Kaprog')
                        ->options(Teacher::pluck('name', 'id'))
                        ->searchable()
                        ->preload(),

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
