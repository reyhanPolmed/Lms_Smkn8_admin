<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ModuleStudentClassSchedule extends Model
{
    use MapsLegacyAttributes;

    protected $table = 'module_student_class_schedules';

    protected $fillable = [
        'module_student_class_id',
        'hari_id',
        'rentang_jam_id',
    ];

    public function hari(): BelongsTo
    {
        return $this->belongsTo(Hari::class, 'hari_id');
    }

    public function moduleStudentClass(): BelongsTo
    {
        return $this->belongsTo(ModuleStudentClass::class, 'module_student_class_id');
    }

    public function rentangJam(): BelongsTo
    {
        return $this->belongsTo(RentangJam::class, 'rentang_jam_id');
    }

    public function getJamMulaiAttribute(): ?string
    {
        return $this->rentangJam?->jam_mulai;
    }

    public function getJamSelesaiAttribute(): ?string
    {
        return $this->rentangJam?->jam_selesai;
    }
}
