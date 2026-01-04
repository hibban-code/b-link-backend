<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Forum\StoreThreadRequest;
use App\Http\Requests\Forum\UpdateThreadRequest;
use App\Http\Requests\Forum\StoreReplyRequest;
use App\Http\Resources\ForumThreadResource;
use App\Http\Resources\ForumReplyResource;
use App\Models\ForumThread;
use App\Models\ForumReply;
use App\Services\ForumService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ForumController extends Controller
{
    public function __construct(
        protected ForumService $forumService
    ) {
        $this->forumService = $forumService;
    }

    /**
     * Get all threads
     */
    public function indexThreads(Request $request): JsonResponse
    {
        $filters = $request->only(['search', 'user_id', 'sort_by', 'sort_order']);
        $perPage = $request->input('per_page', 20);

        $threads = $this->forumService->getAllThreads($filters, $perPage);

        return response()->json([
            'success' => true,
            'data' => ForumThreadResource::collection($threads),
            'meta' => [
                'current_page' => $threads->currentPage(),
                'per_page' => $threads->perPage(),
                'total' => $threads->total(),
                'last_page' => $threads->lastPage(),
            ],
        ]);
    }

    /**
     * Get single thread with replies
     */
    public function showThread(int $id): JsonResponse
    {
        $thread = $this->forumService->getThreadById($id);

        return response()->json([
            'success' => true,
            'data' => new ForumThreadResource($thread),
        ]);
    }

    /**
     * Create new thread
     */
    public function storeThread(StoreThreadRequest $request): JsonResponse
    {
        $thread = $this->forumService->createThread(
            $request->validated(),
            $request->user()->id
        );

        return response()->json([
            'success' => true,
            'message' => 'Thread created successfully',
            'data' => new ForumThreadResource($thread),
        ], 201);
    }

    /**
     * Update thread
     */
    public function updateThread(UpdateThreadRequest $request, ForumThread $thread): JsonResponse
    {
        $this->authorize('update', $thread);

        $thread = $this->forumService->updateThread($thread, $request->validated());

        return response()->json([
            'success' => true,
            'message' => 'Thread updated successfully',
            'data' => new ForumThreadResource($thread),
        ]);
    }

    /**
     * Delete thread
     */
    public function destroyThread(ForumThread $thread): JsonResponse
    {
        $this->authorize('delete', $thread);

        $this->forumService->deleteThread($thread);

        return response()->json([
            'success' => true,
            'message' => 'Thread deleted successfully',
        ]);
    }

    /**
     * Create reply to thread
     */
    public function storeReply(StoreReplyRequest $request, ForumThread $thread): JsonResponse
    {
        $reply = $this->forumService->createReply(
            $thread,
            $request->validated(),
            $request->user()->id
        );

        return response()->json([
            'success' => true,
            'message' => 'Reply posted successfully',
            'data' => new ForumReplyResource($reply),
        ], 201);
    }

    /**
     * Update reply
     */
    public function updateReply(Request $request, ForumReply $reply): JsonResponse
    {
        $this->authorize('update', $reply);

        $request->validate(['content' => 'required|string|min:1']);

        $reply = $this->forumService->updateReply($reply, $request->all());

        return response()->json([
            'success' => true,
            'message' => 'Reply updated successfully',
            'data' => new ForumReplyResource($reply),
        ]);
    }

    /**
     * Delete reply
     */
    public function destroyReply(ForumReply $reply): JsonResponse
    {
        $this->authorize('delete', $reply);

        $this->forumService->deleteReply($reply);

        return response()->json([
            'success' => true,
            'message' => 'Reply deleted successfully',
        ]);
    }
}
