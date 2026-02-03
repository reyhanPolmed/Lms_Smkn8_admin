<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;

use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected function getHeaderWidgets(): array
    {
        return [
            \App\Filament\Widgets\LMSStats::class,
            \App\Filament\Widgets\StudentsPerTingkatChart::class,
        ];
    }
}

