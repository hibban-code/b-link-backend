<?php

namespace App\Http\Requests\Book;

use Illuminate\Foundation\Http\FormRequest;

class UpdateBookRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $book = $this->route('book');
        
        if ($this->user()->isSuperAdmin()) {
            return true;
        }
        
        if ($this->user()->isLibraryAdmin()) {
            return $book->library->created_by === $this->user()->id;
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
            'title' => ['sometimes', 'string', 'max:255'],
            'author' => ['sometimes', 'string', 'max:255'],
            'category' => ['sometimes', 'string', 'max:100'],
            'library_id' => ['sometimes', 'exists:libraries,id'],
            'description' => ['nullable', 'string'],
        ];
    }
}
