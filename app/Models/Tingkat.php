<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tingkat extends Model
{
    protected $table = 'tingkat';
    protected $fillable = [
        'name',
    ];

    public function modules()
    {
        return $this->belongsToMany(
            Modules::class,
            'modules_tingkat',
            'tingkat_id',
            'module_id'
        );
    }

    public function students()
    {
        return $this->hasMany(Student::class);
    }
}
