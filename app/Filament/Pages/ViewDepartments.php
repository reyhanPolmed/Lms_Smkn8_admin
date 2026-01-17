<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Department;
use Filament\Actions\CreateAction;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use App\Models\Teacher;
use UnitEnum;
use BackedEnum;

use Filament\Support\Icons\Heroicon;

class ViewDepartments extends Page
{
    protected string $view = 'filament.pages.view-departments';

    protected static ?string $navigationLabel = 'Struktur Institusi';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBuildingOffice;
    // protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    protected static string|UnitEnum|null $navigationGroup = 'Institusi';

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
}
