<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Section extends Model
{
    protected $guarded = [];

    public function moduleStudentClass(): BelongsTo
    {
        return $this->belongsTo(ModuleStudentClass::class, 'module_student_class_id');
    }

    public function lessons(): HasMany
    {
        return $this->hasMany(Lesson::class, 'section_id');
    }

    public function quizzes(): HasMany
    {
        return $this->hasMany(Quiz::class, 'section_id');
    }
}
