<?php

namespace App\Models;

use App\Models\Concerns\MapsLegacyAttributes;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory;
    use MapsLegacyAttributes;
    use Notifiable;

    protected $fillable = [
        'identifier',
        'name',
        'email',
        'email_verified',
        'password',
        'photo',
        'image',
        'nisn',
        'jurusan',
    ];

    protected array $attributeAliases = [
        'image' => 'photo',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function teachers(): HasMany
    {
        return $this->hasMany(Teacher::class);
    }

    public function teacher(): HasMany
    {
        return $this->teachers();
    }

    public function students(): HasMany
    {
        return $this->hasMany(Student::class);
    }

    public function student()
    {
        return $this->hasOne(Student::class);
    }

    public function accounts(): HasMany
    {
        return $this->hasMany(Account::class);
    }

    public function getFilamentName(): string
    {
        return $this->name ?: $this->identifier ?: $this->email ?: (string) $this->getKey();
    }

    public function canAccessPanel(Panel $panel): bool
    {
        $allowedEmails = array_filter(array_map('trim', explode(',', (string) env('FILAMENT_ADMIN_EMAILS', ''))));
        $allowedIdentifiers = array_filter(array_map('trim', explode(',', (string) env('FILAMENT_ADMIN_IDENTIFIERS', ''))));

        if ($allowedEmails !== [] && in_array((string) $this->email, $allowedEmails, true)) {
            return true;
        }

        if ($allowedIdentifiers !== [] && in_array((string) $this->identifier, $allowedIdentifiers, true)) {
            return true;
        }

        return ($this->role ?? null) === 'admin';
    }
}
