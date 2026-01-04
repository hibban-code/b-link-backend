<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LibraryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'address' => $this->address,
            'latitude' => (float) $this->latitude,
            'longitude' => (float) $this->longitude,
            'facilities' => $this->facilities,
            'opening_hours' => $this->opening_hours,
            'website_url' => $this->website_url,
            'description' => $this->description,
            'created_at' => $this->created_at?->toISOString(),
            'updated_at' => $this->updated_at?->toISOString(),
            
            // Conditional relationships
            'creator' => $this->when($this->relationLoaded('creator'), fn() => new UserResource($this->creator)),
            'books_count' => $this->when($this->relationLoaded('books'), fn() => $this->books->count()),
            'events_count' => $this->when($this->relationLoaded('events'), fn() => $this->events->count()),
            'visits_count' => $this->when($this->relationLoaded('visits'), fn() => $this->visits->count()),
            
            // Computed attributes
            'visit_count' => $this->when(isset($this->visit_count), $this->visit_count),
        ];
    }
}
