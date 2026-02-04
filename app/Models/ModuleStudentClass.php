<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class ModuleStudentClass extends Pivot
{
    protected $table = 'modules_student_class';

    public $timestamps = false;

    protected $fillable = [
        'student_class_id',
        'module_id',
        'teacher_id',
    ];

    // ✅ guru
    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }

    // ✅ modul
    public function module()
    {
        return $this->belongsTo(Modules::class, 'module_id');
    }

    // 🔥 INI YANG PENTING (jadwal)
    public function schedules()
    {
        return $this->hasMany(ModuleStudentClassSchedule::class, 'module_student_class_id');
    }
}
