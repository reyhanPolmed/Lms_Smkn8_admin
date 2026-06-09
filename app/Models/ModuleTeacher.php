<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ModuleTeacher extends Model
{
    protected $table = 'modules_teacher';

    protected $guarded = [];

    public function module(): BelongsTo
    {
        return $this->belongsTo(Modules::class, 'module_id');
    }

    public function teacher(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'teacher_id');
    }
}
