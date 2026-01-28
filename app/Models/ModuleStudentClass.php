<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class ModuleStudentClass extends Pivot
{
    protected $table = 'modules_student_class';

    public $timestamps = false; // kalau pivot tidak ada created_at

    protected $fillable = [
        'student_class_id',
        'module_id',
        'teacher_id',
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }
}
