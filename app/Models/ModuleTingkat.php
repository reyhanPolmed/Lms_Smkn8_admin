<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ModuleTingkat extends Model
{
    protected $table = 'modules_tingkat';

    protected $guarded = [];

    public function module(): BelongsTo
    {
        return $this->belongsTo(Modules::class, 'module_id');
    }

    public function tingkat(): BelongsTo
    {
        return $this->belongsTo(Tingkat::class, 'tingkat_id');
    }
}
