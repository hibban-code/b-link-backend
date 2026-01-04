<?php

namespace App\Services;

use App\Models\ForumThread;
use App\Models\ForumReply;
use Illuminate\Pagination\LengthAwarePaginator;

class ForumService
{
    /**
     * Get all threads with filters
     */
    public function getAllThreads(array $filters = [], int $perPage = 20): LengthAwarePaginator
    {
        $query = ForumThread::query()->with(['user'])->withCount(['replies']);

        // Search filter
        if (!empty($filters['search'])) {
            $query->search($filters['search']);
        }

        // User filter
        if (!empty($filters['user_id'])) {
            $query->byUser($filters['user_id']);
        }

        // Sorting
        $sortBy = $filters['sort_by'] ?? 'created_at';
        $sortOrder = $filters['sort_order'] ?? 'desc';
        $query->orderBy($sortBy, $sortOrder);

        return $query->paginate($perPage);
    }

    /**
     * Get single thread with replies
     */
    public function getThreadById(int $id): ForumThread
    {
        return ForumThread::with(['user', 'replies.user'])
            ->withCount(['replies'])
            ->findOrFail($id);
    }

    /**
     * Create new thread
     */
    public function createThread(array $data, int $userId): ForumThread
    {
        $thread = ForumThread::create([
            'title' => $data['title'],
            'content' => $data['content'],
            'user_id' => $userId,
        ]);

        return $thread->load(['user']);
    }

    /**
     * Update thread
     */
    public function updateThread(ForumThread $thread, array $data): ForumThread
    {
        $thread->update($data);
        return $thread->fresh(['user']);
    }

    /**
     * Delete thread
     */
    public function deleteThread(ForumThread $thread): bool
    {
        return $thread->delete();
    }

    /**
     * Create reply to thread
     */
    public function createReply(ForumThread $thread, array $data, int $userId): ForumReply
    {
        $reply = ForumReply::create([
            'thread_id' => $thread->id,
            'content' => $data['content'],
            'user_id' => $userId,
        ]);

        return $reply->load(['user']);
    }

    /**
     * Update reply
     */
    public function updateReply(ForumReply $reply, array $data): ForumReply
    {
        $reply->update($data);
        return $reply->fresh(['user']);
    }

    /**
     * Delete reply
     */
    public function deleteReply(ForumReply $reply): bool
    {
        return $reply->delete();
    }
}
