<?php

namespace App\Services;

use App\Models\Feedback;
use Illuminate\Pagination\LengthAwarePaginator;

class FeedbackService
{
    /**
     * Get all feedback with filters (admin only)
     */
    public function getAll(array $filters = [], int $perPage = 15): LengthAwarePaginator
    {
        $query = Feedback::query()->with(['user', 'library']);

        // Type filter
        if (!empty($filters['type'])) {
            $query->byType($filters['type']);
        }

        // Status filter
        if (!empty($filters['status'])) {
            $query->byStatus($filters['status']);
        }

        // Library filter
        if (!empty($filters['library_id'])) {
            $query->where('library_id', $filters['library_id']);
        }

        // Sorting
        $sortBy = $filters['sort_by'] ?? 'created_at';
        $sortOrder = $filters['sort_order'] ?? 'desc';
        $query->orderBy($sortBy, $sortOrder);

        return $query->paginate($perPage);
    }

    /**
     * Get single feedback
     */
    public function getById(int $id): Feedback
    {
        return Feedback::with(['user', 'library'])->findOrFail($id);
    }

    /**
     * Submit feedback
     */
    public function submit(array $data, ?int $userId = null): Feedback
    {
        $feedback = Feedback::create([
            'type' => $data['type'],
            'content' => $data['content'],
            'is_anonymous' => $data['is_anonymous'] ?? false,
            'user_id' => ($data['is_anonymous'] ?? false) ? null : $userId,
            'library_id' => $data['library_id'] ?? null,
            'status' => 'pending',
        ]);

        return $feedback->load(['user', 'library']);
    }

    /**
     * Update feedback status (admin only)
     */
    public function updateStatus(Feedback $feedback, string $status): Feedback
    {
        $feedback->update(['status' => $status]);
        return $feedback->fresh(['user', 'library']);
    }

    /**
     * Delete feedback
     */
    public function delete(Feedback $feedback): bool
    {
        return $feedback->delete();
    }
}
