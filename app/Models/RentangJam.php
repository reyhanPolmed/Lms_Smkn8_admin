<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RentangJam extends Model
{
    protected $table = 'rentang_jams';

    protected $fillable = [
        'jam_mulai',
        'jam_selesai',
    ];

    protected $casts = [
        'jam_mulai' => 'datetime:H:i',
        'jam_selesai' => 'datetime:H:i',
    ];

    public $timestamps = true;

    /*
    |--------------------------------------------------------------------------
    | Relations
    |--------------------------------------------------------------------------
    */

    // 1 jam punya banyak jadwal
    public function schedules()
    {
        return $this->hasMany(
            ModuleStudentClassSchedule::class,
            'rentang_jam_id'
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Helper (biar enak tampil)
    |--------------------------------------------------------------------------
    */

    public function getLabelAttribute()
    {
        return $this->jam_mulai . ' - ' . $this->jam_selesai;
    }
}
