<?php

namespace App\Services;

use App\Models\Book;
use Illuminate\Pagination\LengthAwarePaginator;

class BookService
{
    /**
     * Get all books with filters
     */
    public function getAll(array $filters = [], int $perPage = 15): LengthAwarePaginator
    {
        $query = Book::query()->with(['library']);

        // Search filter
        if (!empty($filters['search'])) {
            $query->search($filters['search']);
        }

        // Category filter
        if (!empty($filters['category'])) {
            $query->byCategory($filters['category']);
        }

        // Library filter
        if (!empty($filters['library_id'])) {
            $query->byLibrary($filters['library_id']);
        }

        // Sorting
        $sortBy = $filters['sort_by'] ?? 'created_at';
        $sortOrder = $filters['sort_order'] ?? 'desc';
        $query->orderBy($sortBy, $sortOrder);

        return $query->paginate($perPage);
    }

    /**
     * Get single book
     */
    public function getById(int $id): Book
    {
        return Book::with(['library'])->findOrFail($id);
    }

    /**
     * Get books by library
     */
    public function getByLibrary(int $libraryId, int $perPage = 15): LengthAwarePaginator
    {
        return Book::where('library_id', $libraryId)
            ->with(['library'])
            ->orderBy('title', 'asc')
            ->paginate($perPage);
    }

    /**
     * Create new book
     */
    public function create(array $data): Book
    {
        $book = Book::create($data);
        return $book->load('library');
    }

    /**
     * Update book
     */
    public function update(Book $book, array $data): Book
    {
        $book->update($data);
        return $book->fresh(['library']);
    }

    /**
     * Delete book
     */
    public function delete(Book $book): bool
    {
        return $book->delete();
    }

    /**
     * Get book categories (distinct)
     */
    public function getCategories(): array
    {
        return Book::select('category')
            ->distinct()
            ->orderBy('category')
            ->pluck('category')
            ->toArray();
    }
}
