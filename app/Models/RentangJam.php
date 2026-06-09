<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class RentangJam extends Model
{
    protected $table = 'rentang_jams';

    protected $fillable = [
        'jam_mulai',
        'jam_selesai',
    ];

    public function schedules(): HasMany
    {
        return $this->hasMany(ModuleStudentClassSchedule::class, 'rentang_jam_id');
    }

    public function getLabelAttribute(): string
    {
        return substr((string) $this->jam_mulai, 0, 5) . ' - ' . substr((string) $this->jam_selesai, 0, 5);
    }
}
