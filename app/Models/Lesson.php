<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Lesson extends Model
{
    protected $guarded = [];

    protected $casts = [
        'tersedia_pada' => 'date',
    ];

    public function moduleStudentClass(): BelongsTo
    {
        return $this->belongsTo(ModuleStudentClass::class, 'module_student_class_id');
    }

    public function section(): BelongsTo
    {
        return $this->belongsTo(Section::class, 'section_id');
    }

    public function quizzes(): HasMany
    {
        return $this->hasMany(Quiz::class, 'lesson_id');
    }

    public function tasks(): HasMany
    {
        return $this->hasMany(Task::class, 'lesson_id');
    }

    public function users(): HasMany
    {
        return $this->hasMany(LessonUser::class, 'lesson_id');
    }

    public function durations(): HasMany
    {
        return $this->hasMany(LessonUserDuration::class, 'lesson_id');
    }
}
