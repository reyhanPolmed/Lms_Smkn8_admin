<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

use App\Models\Student;
use App\Models\StudentClass;
use App\Models\Departments;
use App\Models\Modules;

class LMSStats extends BaseWidget
{
    protected function getStats(): array
    {
        return [

            Stat::make('Total Siswa', Student::count())
                ->description('Semua siswa terdaftar')
                ->descriptionIcon('heroicon-m-user-group')
                ->color('success'),

            Stat::make('Total Kelas', StudentClass::count())
                ->description('Kelas aktif')
                ->descriptionIcon('heroicon-m-academic-cap')
                ->color('success'),

            Stat::make('Total Mata Pelajaran', Modules::count())
                ->description('Mata pelajaran aktif')
                ->descriptionIcon('heroicon-m-building-library')
                ->color('success'),

            Stat::make('Total Jurusan', Departments::count())
                ->description('Jurusan')
                ->descriptionIcon('heroicon-m-building-office')
                ->color('success'),
        ];
    }
}
