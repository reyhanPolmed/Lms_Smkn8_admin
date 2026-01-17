<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\StudentClass;
use Illuminate\Database\Seeder;

class StudentClassSeeder extends Seeder
{
    public function run(): void
    {
        $levels = ['X', 'XI', 'XII'];

        // Data kelas untuk setiap jurusan
        $classesData = [
            'tata-boga' => ['1', '2', '3', '4', '5'],
            'tata-busana' => ['1', '2', '3', '4'],
            'tata-kecantikan' => ['1', '2', '3'],
            'perhotelan' => ['1', '2', '3', '4'],
        ];

        foreach ($classesData as $deptSlug => $classNumbers) {
            $department = Department::where('slug', $deptSlug)->first();

            if ($department) {
                foreach ($levels as $level) {
                    foreach ($classNumbers as $number) {
                        $className = $level . ' ' . strtoupper(substr($deptSlug, 0, 2)) . ' ' . $number;

                        StudentClass::firstOrCreate(
                            ['name' => $className, 'department_id' => $department->id],
                            [
                                'level' => $level,
                            ]
                        );
                    }
                }
            }
        }
    }
}
