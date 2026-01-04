<?php

namespace App\Http\Requests\Forum;

use Illuminate\Foundation\Http\FormRequest;

class StoreThreadRequest extends FormRequest
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
            'title' => ['required', 'string', 'min:3', 'max:255'],
            'content' => ['required', 'string', 'min:10'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'title.required' => 'Thread title is required',
            'title.min' => 'Thread title must be at least 3 characters',
            'content.required' => 'Thread content is required',
            'content.min' => 'Thread content must be at least 10 characters',
        ];
    }
}
