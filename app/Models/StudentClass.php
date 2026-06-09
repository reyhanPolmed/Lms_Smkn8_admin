<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class StudentClass extends Model
{
    use MapsLegacyAttributes;

    protected $fillable = [
        'nama_kelas',
        'level',
        'homeroom_teacher_id',
        'jurusan_id',
        'tingkat_id',
        'name',
        'department_id',
    ];

    protected array $attributeAliases = [
        'name' => 'nama_kelas',
        'department_id' => 'jurusan_id',
    ];

    public function students(): HasMany
    {
        return $this->hasMany(Student::class, 'kelas_id');
    }

    public function modules(): BelongsToMany
    {
        return $this->belongsToMany(Modules::class, 'modules_student_class', 'student_class_id', 'module_id')
            ->using(ModuleStudentClass::class)
            ->withPivot(['id', 'teacher_id'])
            ->withTimestamps();
    }

    public function homeroomTeacher(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'homeroom_teacher_id');
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Departments::class, 'jurusan_id');
    }

    public function tingkat(): BelongsTo
    {
        return $this->belongsTo(Tingkat::class, 'tingkat_id');
    }
}
