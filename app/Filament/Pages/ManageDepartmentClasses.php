<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Department;

class ManageDepartmentClasses extends Page
{
    protected string $view = 'filament.pages.manage-classes';

    // 1. Pastikan slug ini ada (seperti solusi sebelumnya)
    protected static ?string $slug = 'departments/{department}/classes';

    // 2. TAMBAHKAN INI: Agar tidak muncul di sidebar menu
    protected static bool $shouldRegisterNavigation = false;

    public ?Department $department = null;

    public function mount(Department $department): void
    {
        $department->load([
            'headOfDepartment',
            'classes.homeroomTeacher',
            'classes.students',
        ])->loadCount([
            'students',
            'teachers',
        ]);

        // Masukkan ke properti public
        $this->department = $department;
    }

    protected function getHeaderActions(): array
    {
        return [];
    }


}
