<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FailedImportRow extends Model
{
    protected $table = 'failed_import_rows';

    protected $guarded = [];

    protected $casts = [
        'data' => 'array',
    ];

    public function import(): BelongsTo
    {
        return $this->belongsTo(Import::class, 'import_id');
    }
}
