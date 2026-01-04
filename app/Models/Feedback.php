<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Feedback extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'type',
        'content',
        'is_anonymous',
        'user_id',
        'library_id',
        'status',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'is_anonymous' => 'boolean',
    ];

    /**
     * User who submitted feedback (nullable for anonymous)
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Library related to feedback (optional)
     */
    public function library(): BelongsTo
    {
        return $this->belongsTo(Library::class);
    }

    /**
     * Scope for filtering by type
     */
    public function scopeByType($query, ?string $type)
    {
        if (!$type) {
            return $query;
        }

        return $query->where('type', $type);
    }

    /**
     * Scope for filtering by status
     */
    public function scopeByStatus($query, ?string $status)
    {
        if (!$status) {
            return $query;
        }

        return $query->where('status', $status);
    }
}
