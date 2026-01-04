<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'email' => $this->email,
            'role' => $this->role,
            'created_at' => $this->created_at?->toISOString(),
            
            // Conditional relationships
            'visits_count' => $this->when($this->relationLoaded('visits'), fn() => $this->visits->count()),
            'badges_count' => $this->when($this->relationLoaded('badges'), fn() => $this->badges->count()),
            'threads_count' => $this->when($this->relationLoaded('threads'), fn() => $this->threads->count()),
        ];
    }
}
