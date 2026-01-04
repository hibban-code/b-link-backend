<?php

namespace App\Http\Requests\Event;

use Illuminate\Foundation\Http\FormRequest;

class StoreEventRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return $this->user()->hasRole(['library_admin', 'super_admin']);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'library_id' => ['required', 'exists:libraries,id'],
            'title' => ['required', 'string', 'max:255'],
            'description' => ['required', 'string'],
            'event_date' => ['required', 'date', 'after:now'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'library_id.required' => 'Library is required',
            'library_id.exists' => 'Selected library does not exist',
            'title.required' => 'Event title is required',
            'description.required' => 'Event description is required',
            'event_date.required' => 'Event date is required',
            'event_date.after' => 'Event date must be in the future',
        ];
    }
}
