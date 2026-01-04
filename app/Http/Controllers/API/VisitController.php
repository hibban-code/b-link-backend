<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Visit\StoreVisitRequest;
use App\Http\Resources\VisitResource;
use App\Http\Resources\BadgeResource;
use App\Services\GamificationService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class VisitController extends Controller
{
    public function __construct(
        protected GamificationService $gamificationService
    ) {
        $this->middleware('auth:sanctum');
    }

    /**
     * Record a visit (check-in)
     */
    public function store(StoreVisitRequest $request): JsonResponse
    {
        $visit = $this->gamificationService->recordVisit(
            $request->user()->id,
            $request->library_id,
            $request->visited_at
        );

        return response()->json([
            'success' => true,
            'message' => 'Visit recorded successfully',
            'data' => new VisitResource($visit),
        ], 201);
    }

    /**
     * Get user's visit history
     */
    public function userVisits(Request $request, ?int $userId = null): JsonResponse
    {
        $userId = $userId ?? $request->user()->id;
        
        // Users can only view their own visits unless super admin
        if ($userId !== $request->user()->id && !$request->user()->isSuperAdmin()) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized',
            ], 403);
        }

        $perPage = $request->input('per_page', 15);
        $visits = $this->gamificationService->getUserVisits($userId, $perPage);

        return response()->json([
            'success' => true,
            'data' => VisitResource::collection($visits),
            'meta' => [
                'current_page' => $visits->currentPage(),
                'per_page' => $visits->perPage(),
                'total' => $visits->total(),
                'last_page' => $visits->lastPage(),
            ],
        ]);
    }

    /**
     * Get user's visit statistics
     */
    public function userStats(Request $request, ?int $userId = null): JsonResponse
    {
        $userId = $userId ?? $request->user()->id;
        
        // Users can only view their own stats unless super admin
        if ($userId !== $request->user()->id && !$request->user()->isSuperAdmin()) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized',
            ], 403);
        }

        $stats = $this->gamificationService->getUserVisitStats($userId);

        return response()->json([
            'success' => true,
            'data' => $stats,
        ]);
    }

    /**
     * Get user's badges
     */
    public function userBadges(Request $request, ?int $userId = null): JsonResponse
    {
        $userId = $userId ?? $request->user()->id;

        $badges = $this->gamificationService->getUserBadges($userId);

        return response()->json([
            'success' => true,
            'data' => [
                'earned' => BadgeResource::collection($badges['earned']),
                'available' => BadgeResource::collection($badges['available']),
                'earned_count' => $badges['earned_count'],
                'total_count' => $badges['total_count'],
            ],
        ]);
    }
}
