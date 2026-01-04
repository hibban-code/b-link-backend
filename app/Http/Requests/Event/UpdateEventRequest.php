<?php

namespace App\Http\Requests\Event;

use Illuminate\Foundation\Http\FormRequest;

class UpdateEventRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $event = $this->route('event');
        
        if ($this->user()->isSuperAdmin()) {
            return true;
        }
        
        if ($this->user()->isLibraryAdmin()) {
            return $event->library->created_by === $this->user()->id;
        }
        
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'library_id' => ['sometimes', 'exists:libraries,id'],
            'title' => ['sometimes', 'string', 'max:255'],
            'description' => ['sometimes', 'string'],
            'event_date' => ['sometimes', 'date'],
        ];
    }
}
