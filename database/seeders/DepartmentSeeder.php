<?php

namespace Database\Seeders;

use App\Models\Department;
use Illuminate\Database\Seeder;

class DepartmentSeeder extends Seeder
{
    public function run(): void
    {
        $departments = [
            [
                'name' => 'Tata Boga',
                'slug' => 'tata-boga',
                'description' => 'Program keahlian dalam bidang tata boga dan kuliner',
                'icon_color' => '#F59E0B', // Amber
            ],
            [
                'name' => 'Tata Busana',
                'slug' => 'tata-busana',
                'description' => 'Program keahlian dalam bidang tata busana dan fashion design',
                'icon_color' => '#EC4899', // Pink
            ],
            [
                'name' => 'Tata Kecantikan',
                'slug' => 'tata-kecantikan',
                'description' => 'Program keahlian dalam bidang kecantikan dan perawatan kulit',
                'icon_color' => '#8B5CF6', // Purple
            ],
            [
                'name' => 'Perhotelan',
                'slug' => 'perhotelan',
                'description' => 'Program keahlian dalam bidang perhotelan dan pariwisata',
                'icon_color' => '#3B82F6', // Blue
            ],
        ];

        foreach ($departments as $department) {
            Department::firstOrCreate(
                ['slug' => $department['slug']],
                $department
            );
        }
    }
}
