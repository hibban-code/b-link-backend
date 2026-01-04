<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Feedback\StoreFeedbackRequest;
use App\Http\Resources\FeedbackResource;
use App\Models\Feedback;
use App\Services\FeedbackService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    public function __construct(
        protected FeedbackService $feedbackService
    ) {
        $this->feedbackService = $feedbackService;
    }

    /**
     * Get all feedback (admin only)
     */
    public function index(Request $request): JsonResponse
    {
        $this->authorize('viewAny', Feedback::class);

        $filters = $request->only(['type', 'status', 'library_id', 'sort_by', 'sort_order']);
        $perPage = $request->input('per_page', 15);

        $feedback = $this->feedbackService->getAll($filters, $perPage);

        return response()->json([
            'success' => true,
            'data' => FeedbackResource::collection($feedback),
            'meta' => [
                'current_page' => $feedback->currentPage(),
                'per_page' => $feedback->perPage(),
                'total' => $feedback->total(),
                'last_page' => $feedback->lastPage(),
            ],
        ]);
    }

    /**
     * Get single feedback (admin only)
     */
    public function show(Feedback $feedback): JsonResponse
    {
        $this->authorize('view', $feedback);

        return response()->json([
            'success' => true,
            'data' => new FeedbackResource($feedback->load(['user', 'library'])),
        ]);
    }

    /**
     * Submit feedback (public)
     */
    public function store(StoreFeedbackRequest $request): JsonResponse
    {
        $userId = $request->user()?->id;
        $feedback = $this->feedbackService->submit($request->validated(), $userId);

        return response()->json([
            'success' => true,
            'message' => 'Feedback submitted successfully',
            'data' => new FeedbackResource($feedback),
        ], 201);
    }

    /**
     * Update feedback status (admin only)
     */
    public function updateStatus(Request $request, Feedback $feedback): JsonResponse
    {
        $this->authorize('update', $feedback);

        $request->validate([
            'status' => 'required|in:pending,reviewed,resolved',
        ]);

        $feedback = $this->feedbackService->updateStatus($feedback, $request->status);

        return response()->json([
            'success' => true,
            'message' => 'Feedback status updated successfully',
            'data' => new FeedbackResource($feedback),
        ]);
    }

    /**
     * Delete feedback (admin only)
     */
    public function destroy(Feedback $feedback): JsonResponse
    {
        $this->authorize('delete', $feedback);

        $this->feedbackService->delete($feedback);

        return response()->json([
            'success' => true,
            'message' => 'Feedback deleted successfully',
        ]);
    }
}
