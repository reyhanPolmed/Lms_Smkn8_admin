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
        return $this->belongsTo(Teacher::class, 'head_of_department_id');
    }
}

