<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Department;
use App\Models\StudentClass;

class DepartmentSeeder2 extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Tata Boga Department
        $tataBoga = Department::create([
            'name' => 'Tata Boga',
            'slug' => 'tata-boga',
            'description' => 'Culinary Arts Department',
            'icon_color' => '#F59E0B',

        ]);

        // Classes for Tata Boga (15 classes)
        $taBogeClasses = ['X TA 1', 'X TA 2', 'X TA 3', 'X TA 4', 'X TA 5', 'XI TA 1', 'XI TA 2', 'XI TA 3', 'XI TA 4', 'XI TA 5', 'XII TA 1', 'XII TA 2', 'XII TA 3', 'XII TA 4', 'XII TA 5'];
        
        foreach ($taBogeClasses as $className) {
            StudentClass::create([
                'department_id' => $tataBoga->id,
                'name' => $className,
                'is_active' => true,
            ]);
        }

        // Tata Busana Department
        $tataBusana = Department::create([
            'name' => 'Tata Busana',
            'slug' => 'tata-busana',
            'icon_color' => '#8B5CF6',
            'description' => 'Fashion Design Department',
        ]);

        // Classes for Tata Busana (12 classes)
        $taBusanaClasses = ['X TA 1', 'X TA 2', 'X TA 3', 'X TA 4', 'XI TA 1', 'XI TA 2', 'XI TA 3', 'XI TA 4', 'XII TA 1', 'XII TA 2', 'XII TA 3', 'XII TA 4'];
        
        foreach ($taBusanaClasses as $className) {
            StudentClass::create([
                'department_id' => $tataBusana->id,
                'name' => $className,
                'is_active' => true,
            ]);
        }

        // Tata Kecantikan Department
        $tataKecantikan = Department::create([
            'name' => 'Tata Kecantikan',
            'slug' => 'tata-kecantikan',
            'icon_color' => '#EC4899',
            'description' => 'Beauty and Cosmetology Department',
        ]);

        // Classes for Tata Kecantikan (9 classes)
        $taKecantikanClasses = ['X TA 1', 'X TA 2', 'X TA 3', 'XI TA 1', 'XI TA 2', 'XII TA 1', 'XII TA 2', 'XII TA 3', 'XII TA 4'];
        
        foreach ($taKecantikanClasses as $className) {
            StudentClass::create([
                'department_id' => $tataKecantikan->id,
                'name' => $className,
                'is_active' => true,
            ]);
        }
    }
}
