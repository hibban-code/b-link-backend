<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Library;
use Illuminate\Http\JsonResponse;

class MapController extends Controller
{
    /**
     * Get all libraries for map display
     */
    public function libraries(): JsonResponse
    {
        try {
            $libraries = Library::select([
                'id',
                'name',
                'address',
                'latitude',
                'longitude',
                'phone',
                'operating_hours',
                'facilities'
            ])->get();

            return response()->json([
                'success' => true,
                'data' => $libraries,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching map data',
            ], 500);
        }
    }

    /**
     * Get nearby libraries based on coordinates
     */
    public function nearby(float $lat, float $lng, int $radius = 5): JsonResponse
    {
        try {
            // Calculate distance using Haversine formula
            $libraries = Library::selectRaw("
                id, name, address, latitude, longitude, phone, facilities,
                ( 6371 * acos( cos( radians(?) ) * 
                  cos( radians( latitude ) ) * 
                  cos( radians( longitude ) - radians(?) ) + 
                  sin( radians(?) ) * 
                  sin( radians( latitude ) ) ) 
                ) AS distance
            ", [$lat, $lng, $lat])
            ->having('distance', '<', $radius)
            ->orderBy('distance')
            ->get();

            return response()->json([
                'success' => true,
                'data' => $libraries,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error finding nearby libraries',
            ], 500);
        }
    }
}
