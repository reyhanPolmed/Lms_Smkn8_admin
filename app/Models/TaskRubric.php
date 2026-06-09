<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TaskRubric extends Model
{
    protected $guarded = [];

    public function task(): BelongsTo
    {
        return $this->belongsTo(Task::class, 'task_id');
    }

    public function submissionScores(): HasMany
    {
        return $this->hasMany(TaskSubmissionRubricScore::class, 'rubric_id');
    }
}
