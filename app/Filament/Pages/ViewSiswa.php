<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Student;

class ViewSiswa extends Page
{
    protected string $view = 'filament.pages.view-siswa';

    protected static ?string $title = ' ';

    public $classId;
    
    public function getBreadcrumbs(): array
    {
        return [
            '/admin/view-kelas' => 'Kelas',
            '/admin/view-siswa?class=' . $this->classId => 'List',
            '' => $this->classId,
        ];
    }
    protected static bool $shouldRegisterNavigation = false;


    public $students;

    public function mount(): void
    {
        // ambil ?class=2 dari URL
        $this->classId = request()->query('class');

        // kalau tidak ada parameter, kosongkan collection biar aman
        if (!$this->classId) {
            $this->students = collect();
            return;
        }

        // query siswa berdasarkan class_level_id
        $this->students = Student::where('class_level_id', $this->classId)
            ->orderBy('name')
            ->get();
    }
}
