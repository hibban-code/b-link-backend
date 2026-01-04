<?php

namespace App\Services;

use App\Models\Event;
use Illuminate\Pagination\LengthAwarePaginator;
use Carbon\Carbon;

class EventService
{
    /**
     * Get all events with filters
     */
    public function getAll(array $filters = [], int $perPage = 15): LengthAwarePaginator
    {
        $query = Event::query()->with(['library']);

        // Library filter
        if (!empty($filters['library_id'])) {
            $query->byLibrary($filters['library_id']);
        }

        // Date range filter
        if (!empty($filters['from']) || !empty($filters['to'])) {
            $query->dateRange($filters['from'] ?? null, $filters['to'] ?? null);
        }

        // Upcoming/past filter
        if (isset($filters['upcoming'])) {
            if ($filters['upcoming']) {
                $query->upcoming();
            } else {
                $query->past();
            }
        }

        // Default sort by event date
        $query->orderBy('event_date', 'asc');

        return $query->paginate($perPage);
    }

    /**
     * Get upcoming events
     */
    public function getUpcoming(int $perPage = 15): LengthAwarePaginator
    {
        return Event::with(['library'])
            ->upcoming()
            ->paginate($perPage);
    }

    /**
     * Get events by month for calendar view
     */
    public function getByMonth(string $month): array
    {
        $startDate = Carbon::parse($month)->startOfMonth();
        $endDate = Carbon::parse($month)->endOfMonth();

        return Event::with(['library'])
            ->whereBetween('event_date', [$startDate, $endDate])
            ->orderBy('event_date', 'asc')
            ->get()
            ->toArray();
    }

    /**
     * Get single event
     */
    public function getById(int $id): Event
    {
        return Event::with(['library'])->findOrFail($id);
    }

    /**
     * Create new event
     */
    public function create(array $data): Event
    {
        $event = Event::create($data);
        return $event->load('library');
    }

    /**
     * Update event
     */
    public function update(Event $event, array $data): Event
    {
        $event->update($data);
        return $event->fresh(['library']);
    }

    /**
     * Delete event
     */
    public function delete(Event $event): bool
    {
        return $event->delete();
    }
}
