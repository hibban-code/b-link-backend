<?php

namespace App\Policies;

use App\Models\Event;
use App\Models\User;

class EventPolicy
{
    /**
     * Determine if the user can view any events.
     */
    public function viewAny(?User $user): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can view the event.
     */
    public function view(?User $user, Event $event): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can create events.
     */
    public function create(User $user): bool
    {
        return $user->hasRole(['library_admin', 'super_admin']);
    }

    /**
     * Determine if the user can update the event.
     */
    public function update(User $user, Event $event): bool
    {
        if ($user->isSuperAdmin()) {
            return true;
        }

        if ($user->isLibraryAdmin()) {
            return $event->library->created_by === $user->id;
        }

        return false;
    }

    /**
     * Determine if the user can delete the event.
     */
    public function delete(User $user, Event $event): bool
    {
        return $this->update($user, $event);
    }
}
