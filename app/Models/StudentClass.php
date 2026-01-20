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
    ];

    public function students(): HasMany
    {
        return $this->hasMany(Student::class, 'class_level_id');
    }

        public function modules()
    {
        return $this->belongsToMany(Modules::class);
    }

        public function homeroomTeacher(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'homeroom_teacher_id');
    }
}
