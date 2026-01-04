<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Library extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $casts = [
        'facilities' => 'array',
        'facility_details' => 'array',
        'operating_hours' => 'array',
        'rules' => 'array',
        'public_transport' => 'array',
        'latitude' => 'float',
        'longitude' => 'float',
    ];

    public function books()
    {
        return $this->hasMany(Book::class);
    }

    public function events()
    {
        return $this->hasMany(Event::class);
    }

    public function visits()
    {
        return $this->hasMany(Visit::class);
    }

    public function feedback()
    {
        return $this->hasMany(Feedback::class);
    }

    public function isOpenNow(): bool
    {
        if (!$this->operating_hours) {
            return false;
        }

        $today = strtolower(now()->format('l'));
        $hours = $this->operating_hours[$today] ?? null;

        if (!$hours) {
            return false;
        }

        $now = now()->format('H:i');
        return $now >= $hours['open'] && $now <= $hours['close'];
    }

    public function getTodayHours(): ?array
    {
        if (!$this->operating_hours) {
            return null;
        }

        $today = strtolower(now()->format('l'));
        return $this->operating_hours[$today] ?? null;
    }
}
