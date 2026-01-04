<?php

namespace App\Services;

use App\Models\Library;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class LibraryService
{
    /**
     * Get all libraries with filters
     */
    public function getAll(array $filters = [], int $perPage = 15): LengthAwarePaginator
    {
        $query = Library::query()->with(['creator']);

        // Search filter
        if (!empty($filters['search'])) {
            $query->search($filters['search']);
        }

        // Facility filter
        if (!empty($filters['facility'])) {
            $query->withFacility($filters['facility']);
        }

        // Sorting
        $sortBy = $filters['sort_by'] ?? 'created_at';
        $sortOrder = $filters['sort_order'] ?? 'desc';
        $query->orderBy($sortBy, $sortOrder);

        return $query->paginate($perPage);
    }

    /**
     * Get single library with relationships
     */
    public function getById(int $id): Library
    {
        return Library::with(['creator', 'books', 'events'])
            ->withCount(['visits'])
            ->findOrFail($id);
    }

    /**
     * Create new library
     */
    public function create(array $data, int $userId): Library
    {
        $library = DB::transaction(function () use ($data, $userId) {
            $library = Library::create([
                'name' => $data['name'],
                'address' => $data['address'],
                'latitude' => $data['latitude'],
                'longitude' => $data['longitude'],
                'facilities' => $data['facilities'] ?? [],
                'opening_hours' => $data['opening_hours'],
                'website_url' => $data['website_url'] ?? null,
                'description' => $data['description'],
                'created_by' => $userId,
            ]);

            return $library;
        });

        return $library->load('creator');
    }

    /**
     * Update library
     */
    public function update(Library $library, array $data): Library
    {
        $library->update($data);
        return $library->fresh(['creator']);
    }

    /**
     * Delete library
     */
    public function delete(Library $library): bool
    {
        return $library->delete();
    }

    /**
     * Search libraries by location (radius)
     * Future enhancement for proximity search
     */
    public function searchByRadius(float $lat, float $lng, float $radiusKm = 10): array
    {
        // Haversine formula for distance calculation
        $libraries = Library::selectRaw("
            *,
            (
                6371 * acos(
                    cos(radians(?)) * cos(radians(latitude)) *
                    cos(radians(longitude) - radians(?)) +
                    sin(radians(?)) * sin(radians(latitude))
                )
            ) AS distance
        ", [$lat, $lng, $lat])
        ->having('distance', '<=', $radiusKm)
        ->orderBy('distance', 'asc')
        ->get()
        ->toArray();

        return $libraries;
    }
}
