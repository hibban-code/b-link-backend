<?php

namespace App\Policies;

use App\Models\Book;
use App\Models\User;

class BookPolicy
{
    /**
     * Determine if the user can view any books.
     */
    public function viewAny(?User $user): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can view the book.
     */
    public function view(?User $user, Book $book): bool
    {
        return true; // Public access
    }

    /**
     * Determine if the user can create books.
     */
    public function create(User $user): bool
    {
        return $user->hasRole(['library_admin', 'super_admin']);
    }

    /**
     * Determine if the user can update the book.
     */
    public function update(User $user, Book $book): bool
    {
        if ($user->isSuperAdmin()) {
            return true;
        }

        if ($user->isLibraryAdmin()) {
            return $book->library->created_by === $user->id;
        }

        return false;
    }

    /**
     * Determine if the user can delete the book.
     */
    public function delete(User $user, Book $book): bool
    {
        return $this->update($user, $book);
    }
}
