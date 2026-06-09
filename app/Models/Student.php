<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Student extends Model
{
    use MapsLegacyAttributes;

    protected $fillable = [
        'nisn',
        'email',
        'nama',
        'foto',
        'user_id',
        'jurusan_id',
        'kelas_id',
        'tingkat_id',
        'jenis_kelamin',
        'agama',
        'nis',
        'tempat_lahir',
        'tanggal_lahir',
        'nama_orang_tua',
        'hp_orang_tua',
        'name',
        'photo',
        'department_id',
        'class_level_id',
    ];

    protected array $attributeAliases = [
        'name' => 'nama',
        'photo' => 'foto',
        'department_id' => 'jurusan_id',
        'class_level_id' => 'kelas_id',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'tanggal_lahir' => 'date',
        'email_terverifikasi_pada' => 'datetime',
        'otp_kedaluwarsa' => 'datetime',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function modules(): BelongsToMany
    {
        return $this->belongsToMany(Modules::class, 'modules_student', 'student_id', 'module_id')
            ->withTimestamps();
    }

    public function student_class(): BelongsTo
    {
        return $this->belongsTo(StudentClass::class, 'kelas_id');
    }

    public function studentClass(): BelongsTo
    {
        return $this->student_class();
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
