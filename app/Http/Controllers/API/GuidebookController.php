<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Library;
use Illuminate\Http\JsonResponse;

class GuidebookController extends Controller
{
    /**
     * Get complete guidebook for all libraries
     */
    public function index(): JsonResponse
    {
        try {
            $libraries = Library::with(['events' => function ($q) {
                $q->where('event_date', '>=', now())
                  ->orderBy('event_date')
                  ->limit(3);
            }])
            ->withCount('books')
            ->get();

            return response()->json([
                'success' => true,
                'data' => $libraries,
                'meta' => [
                    'total_libraries' => $libraries->count(),
                    'last_updated' => now()->toDateTimeString(),
                ],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching guidebook',
            ], 500);
        }
    }

    /**
     * Get detailed guidebook for single library
     */
    public function show(int $id): JsonResponse
    {
        try {
            $library = Library::with(['events', 'books' => function ($q) {
                $q->limit(10);
            }])
            ->withCount('books', 'events', 'visits')
            ->findOrFail($id);

            return response()->json([
                'success' => true,
                'data' => $library,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Library not found',
            ], 404);
        }
    }

    /**
     * Get transportation guide
     */
    public function transportation(): JsonResponse
    {
        try {
            $libraries = Library::select([
                'id',
                'name',
                'address',
                'latitude',
                'longitude',
                'parking_info',
                'public_transport'
            ])->get();

            return response()->json([
                'success' => true,
                'data' => $libraries,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching transportation info',
            ], 500);
        }
    }
}
