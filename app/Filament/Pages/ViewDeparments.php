<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\Departments;
use Filament\Notifications\Notification;
use BackedEnum;
use UnitEnum;
use Filament\Support\Icons\Heroicon;

class ViewDepartments extends Page
{
    protected string $view = 'filament.pages.view-departments';

    protected static ?string $navigationLabel = 'Overview';

    protected static ?string $title = 'Overview';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBuildingOffice;

    public $selectedDepartment;

    public ?int $tingkatFilter = null;


    public function getDepartments()
    {
        return \App\Models\Departments::query()

            /*
        |--------------------------------------------------------------------------
        | Hitung jumlah MAPEL sesuai filter tingkat
        |--------------------------------------------------------------------------
        */
            ->withCount([
                'modules as modules_count' => function ($query) {
                    $query->when($this->tingkatFilter, function ($q) {
                        $q->whereHas('tingkats', function ($qq) {
                            $qq->where('tingkat_id', $this->tingkatFilter);
                        });
                    });
                }
            ])

            ->withCount([
                'modules as teachers_count' => function ($query) {
                    $query
                        ->when($this->tingkatFilter, function ($q) {
                            $q->whereHas('tingkats', function ($qq) {
                                $qq->where('tingkat_id', $this->tingkatFilter);
                            });
                        })
                        ->whereHas('teachers')
                        ->withCount('teachers');
                }
            ])


            /*
        |--------------------------------------------------------------------------
        | Filter department yang punya mapel di tingkat tsb
        |--------------------------------------------------------------------------
        */
            ->when($this->tingkatFilter, function ($query) {
                $query->whereHas('modules.tingkats', function ($q) {
                    $q->where('tingkat_id', $this->tingkatFilter);
                });
            })

            ->with([
                'modules.teachers'
            ])

            ->get();
    }


    public function confirmDelete($id)
    {
        $this->dispatch('open-modal', id: 'delete-department');

        $this->selectedDepartment = $id;
    }

    public function deleteDepartment()
    {
        $dept = Departments::with(['modules.teachers', 'students'])
            ->findOrFail($this->selectedDepartment);

        // 1. Lepas kepala jurusan
        $dept->update([
            'head_department_id' => null,
        ]);

        // 2. Pindahkan / null-kan siswa
        $dept->students()->update([
            'department_id' => null, // atau pindah ke jurusan lain
        ]);

        // 3. Detach guru dari module
        foreach ($dept->modules as $module) {
            $module->teachers()->detach();
        }

        // 4. Hapus module
        $dept->modules()->delete();

        // 5. Hapus department
        $dept->delete();

        Notification::make()
            ->title('Jurusan berhasil dihapus')
            ->success()
            ->send();

        $this->dispatch('close-modal', id: 'delete-department');
        $this->dispatch('$refresh');
    }
}
