<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Teacher extends Model
{
    use HasFactory;
    use MapsLegacyAttributes;

    protected $fillable = [
        'user_id',
        'nip',
        'nama',
        'email',
        'foto',
        'jenis',
        'status',
        'jurusan_id',
        'name',
        'photo',
        'department_id',
    ];

    protected array $attributeAliases = [
        'name' => 'nama',
        'photo' => 'foto',
        'department_id' => 'jurusan_id',
    ];

    protected $casts = [
        'email_terverifikasi_pada' => 'datetime',
        'otp_kedaluwarsa' => 'datetime',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function modules(): BelongsToMany
    {
        return $this->belongsToMany(Modules::class, 'modules_teacher', 'teacher_id', 'module_id')
            ->withTimestamps();
    }

    public function moduleClasses(): HasMany
    {
        return $this->hasMany(ModuleStudentClass::class, 'teacher_id');
    }

    public function homeroomClasses(): HasMany
    {
        return $this->hasMany(StudentClass::class, 'homeroom_teacher_id');
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Departments::class, 'jurusan_id');
    }
}
