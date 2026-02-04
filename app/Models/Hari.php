<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Hari extends Model
{
    protected $table = 'haris';

    protected $fillable = [
        'nama_hari',
        'urutan',
    ];

    public $timestamps = true;

    /*
    |--------------------------------------------------------------------------
    | Relations
    |--------------------------------------------------------------------------
    */

    // 1 hari punya banyak jadwal
    public function schedules()
    {
        return $this->hasMany(
            ModuleStudentClassSchedule::class,
            'hari_id'
        );
    }
}
