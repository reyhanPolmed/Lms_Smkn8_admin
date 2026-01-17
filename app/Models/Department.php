<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Department extends Model
{
    protected $fillable = [
        'name',
        'foto',
        'slug',
        'description',
        'icon_color',
        'head_of_department_id',
    ];

    public function students()
    {
        return $this->belongsToMany(Student::class);
    }

        public function classes()
    {
        return $this->belongsToMany(StudentClass::class);
    }

    public function teachers(): BelongsToMany
    {
        return $this->belongsToMany(Teacher::class);
    }

    public function headOfDepartment(): BelongsTo
    {
        return $this->belongsTo(Teacher::class, 'head_of_department_id');
    }
}
