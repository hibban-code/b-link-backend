<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ForumThreadResource extends JsonResource
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
            'title' => $this->title,
            'content' => $this->content,
            'user_id' => $this->user_id,
            'replies_count' => $this->when($this->relationLoaded('replies'), fn() => $this->replies->count()),
            'created_at' => $this->created_at?->toISOString(),
            'updated_at' => $this->updated_at?->toISOString(),
            
            // Conditional relationships
            'user' => $this->when($this->relationLoaded('user'), fn() => new UserResource($this->user)),
            'replies' => $this->when($this->relationLoaded('replies'), fn() => ForumReplyResource::collection($this->replies)),
        ];
    }
}
