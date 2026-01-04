<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class ForumReply extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'thread_id',
        'user_id',
        'content',
    ];

    /**
     * Thread this reply belongs to
     */
    public function thread(): BelongsTo
    {
        return $this->belongsTo(ForumThread::class, 'thread_id');
    }

    /**
     * User who created the reply
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
