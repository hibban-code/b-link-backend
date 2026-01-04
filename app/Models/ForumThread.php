<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class ForumThread extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'content',
        'user_id',
    ];

    /**
     * User who created the thread
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Replies to this thread
     */
    public function replies(): HasMany
    {
        return $this->hasMany(ForumReply::class, 'thread_id');
    }

    /**
     * Scope for searching threads
     */
    public function scopeSearch($query, ?string $search)
    {
        if (!$search) {
            return $query;
        }

        return $query->where(function ($q) use ($search) {
            $q->where('title', 'ILIKE', "%{$search}%")
              ->orWhere('content', 'ILIKE', "%{$search}%");
        });
    }

    /**
     * Scope for threads by user
     */
    public function scopeByUser($query, ?int $userId)
    {
        if (!$userId) {
            return $query;
        }

        return $query->where('user_id', $userId);
    }

    /**
     * Get reply count
     */
    public function getRepliesCountAttribute(): int
    {
        return $this->replies()->count();
    }
}
