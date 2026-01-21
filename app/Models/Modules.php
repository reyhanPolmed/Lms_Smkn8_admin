<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Modules extends Model
{
    protected $table = 'modules';   // tambahkan biar jelas

    protected $fillable = [
        'title',
        'thumbnail',
        'description',
        'department_id',
    ];

    // ================= STUDENTS =================
    public function students(): BelongsToMany
    {
        return $this->belongsToMany(
            Student::class,
            'modules_student',   // nama pivot
            'module_id',         // FK ke modules
            'student_id'         // FK ke students
        );
    }

    // ================= CLASSES =================
    public function classes(): BelongsToMany
    {
        return $this->belongsToMany(
            StudentClass::class,
            'modules_student_class', // sesuaikan dengan tabel kamu
            'module_id',
            'student_class_id'
        );
    }

    // ================= TEACHERS =================
    public function teachers(): BelongsToMany
    {
        return $this->belongsToMany(
            Teacher::class,
            'modules_teacher',
            'module_id',
            'teacher_id'
        );
    }

    // ================= KAPROG =================
    public function headOfDepartment(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'head_of_department_id');
    }

        public function department()
    {
        return $this->belongsTo(Departments::class);
    }
}

