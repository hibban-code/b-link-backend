<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Event\StoreEventRequest;
use App\Http\Requests\Event\UpdateEventRequest;
use App\Http\Resources\EventResource;
use App\Models\Event;
use App\Services\EventService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class EventController extends Controller
{
    public function __construct(
        protected EventService $eventService
    ) {
        $this->eventService = $eventService;
    }

    /**
     * Get all events
     */
    public function index(Request $request): JsonResponse
    {
        $filters = $request->only(['library_id', 'from', 'to', 'upcoming']);
        $perPage = $request->input('per_page', 15);

        $events = $this->eventService->getAll($filters, $perPage);

        return response()->json([
            'success' => true,
            'data' => EventResource::collection($events),
            'meta' => [
                'current_page' => $events->currentPage(),
                'per_page' => $events->perPage(),
                'total' => $events->total(),
                'last_page' => $events->lastPage(),
            ],
        ]);
    }

    /**
     * Get upcoming events
     */
    public function upcoming(Request $request): JsonResponse
    {
        $perPage = $request->input('per_page', 15);
        $events = $this->eventService->getUpcoming($perPage);

        return response()->json([
            'success' => true,
            'data' => EventResource::collection($events),
            'meta' => [
                'current_page' => $events->currentPage(),
                'per_page' => $events->perPage(),
                'total' => $events->total(),
                'last_page' => $events->lastPage(),
            ],
        ]);
    }

    /**
     * Get events by month (calendar view)
     */
    public function calendar(Request $request): JsonResponse
    {
        try {
            $start = $request->input('start');
            $end = $request->input('end');

            $query = Event::with('library:id,name');

            if ($start && $end) {
                $query->whereBetween('event_date', [$start, $end]);
            } else {
                $query->where('event_date', '>=', now());
            }

            $events = $query->get()->map(function ($event) {
                return [
                    'id' => $event->id,
                    'title' => $event->name,
                    'start' => $event->event_date,
                    'end' => $event->event_date,
                    'description' => $event->description,
                    'location' => $event->library->name ?? 'Unknown',
                    'library_id' => $event->library_id,
                    'type' => $event->type,
                    'capacity' => $event->capacity,
                    'registered_count' => $event->registered_count ?? 0,
                ];
            });

            return response()->json([
                'success' => true,
                'data' => $events,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching calendar events',
            ], 500);
            }
    }

    /**
     * Get single event
     */
    public function show(int $id): JsonResponse
    {
        $event = $this->eventService->getById($id);

        return response()->json([
            'success' => true,
            'data' => new EventResource($event),
        ]);
    }

    /**
     * Create new event
     */
    public function store(StoreEventRequest $request): JsonResponse
    {
        $event = $this->eventService->create($request->validated());

        return response()->json([
            'success' => true,
            'message' => 'Event created successfully',
            'data' => new EventResource($event),
        ], 201);
    }

    /**
     * Update event
     */
    public function update(UpdateEventRequest $request, Event $event): JsonResponse
    {
        $this->authorize('update', $event);

        $event = $this->eventService->update($event, $request->validated());

        return response()->json([
            'success' => true,
            'message' => 'Event updated successfully',
            'data' => new EventResource($event),
        ]);
    }

    /**
     * Delete event
     */
    public function destroy(Event $event): JsonResponse
    {
        $this->authorize('delete', $event);

        $this->eventService->delete($event);

        return response()->json([
            'success' => true,
            'message' => 'Event deleted successfully',
        ]);
    }
}
