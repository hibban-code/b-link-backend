<?php

namespace App\Policies;

use App\Models\ForumReply;
use App\Models\User;

class ForumReplyPolicy
{
    /**
     * Determine if the user can create replies.
     */
    public function create(User $user): bool
    {
        return true; // Any authenticated user
    }

    /**
     * Determine if the user can update the reply.
     */
    public function update(User $user, ForumReply $reply): bool
    {
        // Owner or super admin
        return $reply->user_id === $user->id || $user->isSuperAdmin();
    }

    /**
     * Determine if the user can delete the reply.
     */
    public function delete(User $user, ForumReply $reply): bool
    {
        return $this->update($user, $reply);
    }
}
