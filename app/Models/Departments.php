<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Departments extends Model
{
    protected $fillable = [
        'name',
        'foto',
    ];
    public function modules()
    {
        return $this->hasMany(Modules::class, 'department_id');
    }

    public function headOfDepartment()
    {
        return $this->belongsTo(Teacher::class, 'head_department_id');
    }

    public function teachers()
    {
        return $this->hasManyThrough(
            Teacher::class,
            Modules::class,
            'department_id', // FK di modules
            'id',            // FK di teachers (sementara)
            'id',
            'id'
        );
    }

    public function students()
    {
        return $this->hasMany(Student::class, 'department_id');
    }
}
