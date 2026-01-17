<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Teacher;
use Illuminate\Database\Seeder;

class TeacherDepartmentSeeder extends Seeder
{
    public function run(): void
    {
        $departments = Department::all();

        // 2 guru pertama jadi kepala jurusan
        $heads = Teacher::orderBy('id')->take(2)->get();

        foreach ($departments as $index => $department) {
            if (isset($heads[$index])) {
                $teacher = $heads[$index];

                $teacher->update([
                    'department_id' => $department->id,
                ]);

                $department->update([
                    'head_of_department_id' => $teacher->id,
                ]);
            }
        }

        // Sisa guru (WAJIB pakai limit)
        $remainingTeachers = Teacher::orderBy('id')
            ->skip(2)
            ->take(PHP_INT_MAX)
            ->get();

        foreach ($remainingTeachers as $teacher) {
            $teacher->update([
                'department_id' => $departments->random()->id,
            ]);
        }
    }
}
