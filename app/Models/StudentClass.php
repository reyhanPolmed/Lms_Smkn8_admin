<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class StudentClass extends Model
{
    protected $fillable = [
        'name',
        'level',
        'homeroom_teacher_id',
        'department_id',
    ];

    public function students(): HasMany
    {
        return $this->hasMany(Student::class, 'class_level_id');
    }
    public function modules()
    {
        return $this->belongsToMany(
            \App\Models\Modules::class,
            'modules_student_class',   // pivot table
            'student_class_id',        // FK ke student_classes
            'module_id'                // FK ke modules  ⭐ INI YANG PENTING
        )
            ->using(\App\Models\ModuleStudentClass::class)
            ->withPivot('teacher_id');
    }

    public function homeroomTeacher(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'homeroom_teacher_id');
    }

    public function department()
    {
        return $this->belongsTo(Departments::class, 'department_id');
    }
}
