<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Student extends Model
{
    protected $fillable = [
        'name',
        'nisn',
        'user_id',
        'photo',
        'tingkat_id',
        'department_id',
        'class_level',
        'class_level_id',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function modules()
    {
        return $this->belongsToMany(Modules::class);
    }

    public function student_class(): BelongsTo
    {
        return $this->belongsTo(StudentClass::class, 'class_level_id');
    }

    public function department()
    {
        return $this->belongsTo(Departments::class);
    }

    public function tingkat()
    {
        return $this->belongsTo(Tingkat::class, 'tingkat_id');
    }
}
