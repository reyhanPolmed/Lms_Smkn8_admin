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

    // ❌ hapus casts (tidak perlu)
    protected $casts = [];

    public function getLabelAttribute()
    {
        return substr($this->jam_mulai, 0, 5) . ' - ' . substr($this->jam_selesai, 0, 5);
    }
}

