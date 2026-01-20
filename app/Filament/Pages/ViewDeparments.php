<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Departments;
use Filament\Notifications\Notification;
use BackedEnum;
use Filament\Support\Icons\Heroicon;

class ViewDepartments extends Page
{
    protected string $view = 'filament.pages.view-departments';

    protected static ?string $navigationLabel = 'Jurusan';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBuildingOffice;

    public $selectedDepartment; 

    public function getDepartments()
    {
        return Departments::with([
        ])->get();
    }

    public function deleteDepartment()
    {
        Departments::find($this->selectedDepartment)?->delete();

        Notification::make()
            ->title('Department deleted')
            ->success()
            ->send();

        $this->dispatch('$refresh');
    }
}
