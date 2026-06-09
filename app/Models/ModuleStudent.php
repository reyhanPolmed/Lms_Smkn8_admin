<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ModuleStudent extends Model
{
    protected $table = 'modules_student';

    protected $guarded = [];

    public function module(): BelongsTo
    {
        return $this->belongsTo(Modules::class, 'module_id');
    }

    public function student(): BelongsTo
    {
        return $this->belongsTo(Student::class, 'student_id');
    }
}
