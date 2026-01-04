<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    /**
     * Check if user has specific role
     */
    public function hasRole(string|array $roles): bool
    {
        if (is_array($roles)) {
            return in_array($this->role, $roles);
        }
        
        return $this->role === $roles;
    }

    /**
     * Check if user is super admin
     */
    public function isSuperAdmin(): bool
    {
        return $this->role === 'super_admin';
    }

    /**
     * Check if user is library admin
     */
    public function isLibraryAdmin(): bool
    {
        return $this->role === 'library_admin';
    }

    /**
     * Libraries created by this user (for library admins)
     */
    public function libraries(): HasMany
    {
        return $this->hasMany(Library::class, 'created_by');
    }

    /**
     * Forum threads created by user
     */
    public function threads(): HasMany
    {
        return $this->hasMany(ForumThread::class);
    }

    /**
     * Forum replies by user
     */
    public function replies(): HasMany
    {
        return $this->hasMany(ForumReply::class);
    }

    /**
     * Library visits by user
     */
    public function visits(): HasMany
    {
        return $this->hasMany(Visit::class);
    }

    /**
     * Feedback submitted by user
     */
    public function feedback(): HasMany
    {
        return $this->hasMany(Feedback::class);
    }

    /**
     * Badges earned by user
     */
    public function badges(): BelongsToMany
    {
        return $this->belongsToMany(Badge::class, 'user_badges')
            ->withTimestamps()
            ->withPivot('earned_at');
    }

    /**
     * Get libraries visited by user
     */
    public function visitedLibraries(): BelongsToMany
    {
        return $this->belongsToMany(Library::class, 'visits')
            ->withTimestamps()
            ->withPivot('visited_at');
    }
}
