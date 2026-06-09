<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Modules extends Model
{
    use MapsLegacyAttributes;

    protected $table = 'modules';

    protected $fillable = [
        'judul',
        'thumbnail',
        'deskripsi',
        'jurusan_id',
        'jurusan',
        'tingkat_id',
        'is_aktif',
        'title',
        'description',
        'department_id',
    ];

    protected array $attributeAliases = [
        'title' => 'judul',
        'description' => 'deskripsi',
        'department_id' => 'jurusan_id',
    ];

    protected $casts = [
        'is_aktif' => 'boolean',
    ];

    public function students(): BelongsToMany
    {
        return $this->belongsToMany(Student::class, 'modules_student', 'module_id', 'student_id');
    }

    public function classes(): BelongsToMany
    {
        return $this->belongsToMany(StudentClass::class, 'modules_student_class', 'module_id', 'student_class_id')
            ->using(ModuleStudentClass::class)
            ->withPivot(['id', 'teacher_id'])
            ->withTimestamps();
    }

    public function teachers(): BelongsToMany
    {
        return $this->belongsToMany(Teacher::class, 'modules_teacher', 'module_id', 'teacher_id')
            ->withTimestamps();
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Departments::class, 'jurusan_id');
    }

    public function headOfDepartment(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'kepala_jurusan_id');
    }

    public function tingkats(): BelongsToMany
    {
        return $this->belongsToMany(Tingkat::class, 'modules_tingkat', 'module_id', 'tingkat_id')
            ->withTimestamps();
    }

    public function offerings(): HasMany
    {
        return $this->hasMany(ModuleStudentClass::class, 'module_id');
    }
}
