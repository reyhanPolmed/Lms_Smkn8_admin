<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\Pivot;

class ModuleStudentClass extends Pivot
{
    protected $table = 'modules_student_class';

    protected $primaryKey = 'id';

    public $incrementing = true;

    public $timestamps = true;

    protected $fillable = [
        'student_class_id',
        'module_id',
        'teacher_id',
    ];

    public function teacher(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }

    public function module(): BelongsTo
    {
        return $this->belongsTo(Modules::class, 'module_id');
    }

    public function studentClass(): BelongsTo
    {
        return $this->belongsTo(StudentClass::class, 'student_class_id');
    }

    public function schedules(): HasMany
    {
        return $this->hasMany(ModuleStudentClassSchedule::class, 'module_student_class_id');
    }

    public function sections(): HasMany
    {
        return $this->hasMany(Section::class, 'module_student_class_id');
    }

    public function lessons(): HasMany
    {
        return $this->hasMany(Lesson::class, 'module_student_class_id');
    }

    public function quizzes(): HasMany
    {
        return $this->hasMany(Quiz::class, 'modules_student_class_id');
    }

    public function tasks(): HasMany
    {
        return $this->hasMany(Task::class, 'modules_student_class_id');
    }
}
