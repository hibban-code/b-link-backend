<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class VisitResource extends JsonResource
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
            'library_id' => $this->library_id,
            'user_id' => $this->user_id,
            'visited_at' => $this->visited_at?->toISOString(),
            'created_at' => $this->created_at?->toISOString(),
            
            // Conditional relationships
            'library' => $this->when($this->relationLoaded('library'), fn() => new LibraryResource($this->library)),
            'user' => $this->when($this->relationLoaded('user'), fn() => new UserResource($this->user)),
        ];
    }
}
