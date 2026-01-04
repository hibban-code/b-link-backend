<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class FeedbackResource extends JsonResource
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
            'type' => $this->type,
            'content' => $this->content,
            'is_anonymous' => $this->is_anonymous,
            'status' => $this->status,
            'library_id' => $this->library_id,
            'created_at' => $this->created_at?->toISOString(),
            
            // Conditional data - hide user if anonymous
            'user' => $this->when(!$this->is_anonymous && $this->relationLoaded('user'), fn() => new UserResource($this->user)),
            'library' => $this->when($this->relationLoaded('library'), fn() => new LibraryResource($this->library)),
        ];
    }
}
