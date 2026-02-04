<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ModuleStudentClassSchedule extends Model
{
    protected $table = 'module_student_class_schedules';
    protected $fillable = [
        'module_student_class_id',
        'hari_id',
        'rentang_jam_id',
    ];

    public function hari()
    {
        return $this->belongsTo(Hari::class);
    }

    public function rentangJam()
    {
        return $this->belongsTo(RentangJam::class);
    }

    public function moduleStudentClass()
    {
        return $this->belongsTo(ModuleStudentClass::class);
    }
}
