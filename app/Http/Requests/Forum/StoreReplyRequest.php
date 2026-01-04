<?php

namespace App\Http\Requests\Forum;

use Illuminate\Foundation\Http\FormRequest;

class StoreReplyRequest extends FormRequest
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
            'content' => ['required', 'string', 'min:1'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'content.required' => 'Reply content is required',
            'content.min' => 'Reply content must be at least 1 character',
        ];
    }
}
