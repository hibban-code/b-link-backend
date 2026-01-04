<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class Event extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'library_id',
        'title',
        'description',
        'event_date',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'event_date' => 'datetime',
    ];

    /**
     * Library hosting this event
     */
    public function library(): BelongsTo
    {
        return $this->belongsTo(Library::class);
    }

    /**
     * Scope for upcoming events
     */
    public function scopeUpcoming($query)
    {
        return $query->where('event_date', '>=', Carbon::now())
            ->orderBy('event_date', 'asc');
    }

    /**
     * Scope for past events
     */
    public function scopePast($query)
    {
        return $query->where('event_date', '<', Carbon::now())
            ->orderBy('event_date', 'desc');
    }

    /**
     * Scope for events by library
     */
    public function scopeByLibrary($query, ?int $libraryId)
    {
        if (!$libraryId) {
            return $query;
        }

        return $query->where('library_id', $libraryId);
    }

    /**
     * Scope for events by date range
     */
    public function scopeDateRange($query, ?string $from, ?string $to)
    {
        if ($from) {
            $query->where('event_date', '>=', Carbon::parse($from));
        }

        if ($to) {
            $query->where('event_date', '<=', Carbon::parse($to));
        }

        return $query;
    }

    /**
     * Check if event is upcoming
     */
    public function getIsUpcomingAttribute(): bool
    {
        return $this->event_date->isFuture();
    }
}
