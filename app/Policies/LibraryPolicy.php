<?php

namespace App\Policies;

use App\Models\Library;
use App\Models\User;

class LibraryPolicy
{
    /**
     * Determine if the user can view any libraries.
     */
    public function viewAny(?User $user): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can view the library.
     */
    public function view(?User $user, Library $library): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can create libraries.
     */
    public function create(User $user): bool
    {
        return $user->hasRole(['library_admin', 'super_admin']);
    }

    /**
     * Determine if the user can update the library.
     */
    public function update(User $user, Library $library): bool
    {
        // Super admin can update any library
        if ($user->isSuperAdmin()) {
            return true;
        }

        // Library admin can only update their own libraries
        if ($user->isLibraryAdmin()) {
            return $library->created_by === $user->id;
        }

        return false;
    }

    /**
     * Determine if the user can delete the library.
     */
    public function delete(User $user, Library $library): bool
    {
        // Same logic as update
        return $this->update($user, $library);
    }
}
