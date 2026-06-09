<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Departments extends Model
{
    use MapsLegacyAttributes;

    protected $table = 'departments';

    protected $fillable = [
        'nama_jurusan',
        'gambar',
        'kepala_jurusan_id',
        'name',
        'image',
        'head_department_id',
    ];

    protected array $attributeAliases = [
        'name' => 'nama_jurusan',
        'image' => 'gambar',
        'head_department_id' => 'kepala_jurusan_id',
        'head_of_department_id' => 'kepala_jurusan_id',
    ];

    public function modules(): HasMany
    {
        return $this->hasMany(Modules::class, 'jurusan_id');
    }

    public function student_classes(): HasMany
    {
        return $this->hasMany(StudentClass::class, 'jurusan_id');
    }

    public function studentClasses(): HasMany
    {
        return $this->student_classes();
    }

    public function headOfDepartment(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'kepala_jurusan_id');
    }

    public function teachers(): HasMany
    {
        return $this->hasMany(Teacher::class, 'jurusan_id');
    }

    public function students(): HasMany
    {
        return $this->hasMany(Student::class, 'jurusan_id');
    }
}
