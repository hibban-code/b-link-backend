<?php

namespace App\Http\Requests\Visit;

use Illuminate\Foundation\Http\FormRequest;

class StoreVisitRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return $this->user() !== null; // Must be authenticated
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
            'visited_at' => ['sometimes', 'date'],
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
            'visited_at.date' => 'Visit date must be a valid date',
        ];
    }
}
