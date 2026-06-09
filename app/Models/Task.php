<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Task extends Model
{
    protected $guarded = [];

    protected $casts = [
        'available_at' => 'date',
        'deadline' => 'datetime',
        'allow_revision' => 'boolean',
        'is_aktif' => 'boolean',
    ];

    public function moduleStudentClass(): BelongsTo
    {
        return $this->belongsTo(ModuleStudentClass::class, 'modules_student_class_id');
    }

    public function lesson(): BelongsTo
    {
        return $this->belongsTo(Lesson::class, 'lesson_id');
    }

    public function rubrics(): HasMany
    {
        return $this->hasMany(TaskRubric::class, 'task_id');
    }

    public function submissions(): HasMany
    {
        return $this->hasMany(TaskSubmission::class, 'task_id');
    }
}
