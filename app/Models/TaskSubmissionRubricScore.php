<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TaskSubmissionRubricScore extends Model
{
    protected $guarded = [];

    public function submission(): BelongsTo
    {
        return $this->belongsTo(TaskSubmission::class, 'submission_id');
    }

    public function rubric(): BelongsTo
    {
        return $this->belongsTo(TaskRubric::class, 'rubric_id');
    }
}
