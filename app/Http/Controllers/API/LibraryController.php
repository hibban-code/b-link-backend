<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Library;
use Illuminate\Http\JsonResponse;

class LibraryController extends Controller
{
    public function index(): JsonResponse
    {
        try {
            $libraries = Library::withCount('books')->get();

            return response()->json([
                'success' => true,
                'data' => $libraries,
            ]);
        } catch (\Exception $e) {
            \Log::error('Library index error: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Error fetching libraries',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function show(int $id): JsonResponse
    {
        try {
            $library = Library::with(['books' => function ($query) {
                $query->limit(10);
            }])
            ->withCount('books')
            ->findOrFail($id);

            return response()->json([
                'success' => true,
                'data' => $library,
            ]);
        } catch (\Exception $e) {
            \Log::error('Library show error: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Library not found',
                'error' => $e->getMessage(),
            ], 404);
        }
    }
}
