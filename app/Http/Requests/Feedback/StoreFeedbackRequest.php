<?php

namespace App\Http\Requests\Feedback;

use Illuminate\Foundation\Http\FormRequest;

class StoreFeedbackRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true; // Feedback is public (can be anonymous)
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'type' => ['required', 'in:criticism,suggestion,wishlist'],
            'content' => ['required', 'string', 'min:10'],
            'is_anonymous' => ['sometimes', 'boolean'],
            'library_id' => ['nullable', 'exists:libraries,id'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'type.required' => 'Feedback type is required',
            'type.in' => 'Feedback type must be criticism, suggestion, or wishlist',
            'content.required' => 'Feedback content is required',
            'content.min' => 'Feedback content must be at least 10 characters',
            'library_id.exists' => 'Selected library does not exist',
        ];
    }
}
