<?php

namespace App\Http\Requests\Forum;

use Illuminate\Foundation\Http\FormRequest;

class UpdateThreadRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $thread = $this->route('thread');
        
        // User can only update their own threads or super admin
        return $thread->user_id === $this->user()->id || $this->user()->isSuperAdmin();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => ['sometimes', 'string', 'min:3', 'max:255'],
            'content' => ['sometimes', 'string', 'min:10'],
        ];
    }
}
