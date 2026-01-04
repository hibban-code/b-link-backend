<?php

namespace App\Policies;

use App\Models\ForumThread;
use App\Models\User;

class ForumThreadPolicy
{
    /**
     * Determine if the user can view any threads.
     */
    public function viewAny(?User $user): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can view the thread.
     */
    public function view(?User $user, ForumThread $thread): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can create threads.
     */
    public function create(User $user): bool
    {
        return true; // Any authenticated user
    }

    /**
     * Determine if the user can update the thread.
     */
    public function update(User $user, ForumThread $thread): bool
    {
        // Owner or super admin
        return $thread->user_id === $user->id || $user->isSuperAdmin();
    }

    /**
     * Determine if the user can delete the thread.
     */
    public function delete(User $user, ForumThread $thread): bool
    {
        return $this->update($user, $thread);
    }
}
