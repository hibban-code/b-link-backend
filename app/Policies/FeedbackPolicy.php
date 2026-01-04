<?php

namespace App\Policies;

use App\Models\Feedback;
use App\Models\User;

class FeedbackPolicy
{
    /**
     * Determine if the user can view any feedback.
     */
    public function viewAny(User $user): bool
    {
        // Only super admin can view all feedback
        return $user->isSuperAdmin();
    }

    /**
     * Determine if the user can view the feedback.
     */
    public function view(User $user, Feedback $feedback): bool
    {
        return $user->isSuperAdmin();
    }

    /**
     * Determine if the user can create feedback.
     */
    public function create(?User $user): bool
    {
        return true; // Anyone can submit feedback (even anonymous)
    }

    /**
     * Determine if the user can update the feedback status.
     */
    public function update(User $user, Feedback $feedback): bool
    {
        return $user->isSuperAdmin();
    }

    /**
     * Determine if the user can delete the feedback.
     */
    public function delete(User $user, Feedback $feedback): bool
    {
        return $user->isSuperAdmin();
    }
}
