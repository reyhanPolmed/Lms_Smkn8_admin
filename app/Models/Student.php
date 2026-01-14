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
        'foto',
        'jurusan',
        'class_level',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the user that owns this student
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
