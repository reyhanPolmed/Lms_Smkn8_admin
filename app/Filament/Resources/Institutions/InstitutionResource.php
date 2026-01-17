<?php

namespace App\Filament\Resources\Institutions;

use App\Filament\Resources\Institutions\Pages\CreateInstitution;
use App\Filament\Resources\Institutions\Pages\EditInstitution;
use App\Filament\Resources\Institutions\Pages\ListInstitutions;
use App\Filament\Resources\Institutions\Pages\ViewDepartments;
use App\Filament\Resources\Institutions\Schemas\DepartmentForm;
use App\Models\Department;
use BackedEnum;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\Icons\Heroicon;

class InstitutionResource extends Resource
{
    protected static ?string $model = Department::class;

    // protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlineAcademicCap;

    protected static ?string $navigationLabel = 'Jurusan';

    protected static ?string $recordTitleAttribute = 'name';

    // public static function form(Form $form): Form
    // {
    //     return $form->schema(DepartmentForm::getComponents());
    // }                       

    public static function getPages(): array
    {
        return [
            'index' => ListInstitutions::route('/'),
            'create' => CreateInstitution::route('/create'),
            'edit' => EditInstitution::route('/{record}/edit'),
        ];
    }
}
