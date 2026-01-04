<?php

namespace App\Http\Requests\Library;

use Illuminate\Foundation\Http\FormRequest;

class UpdateLibraryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $library = $this->route('library');
        
        // Super admin can update any library
        if ($this->user()->isSuperAdmin()) {
            return true;
        }
        
        // Library admin can only update their own libraries
        if ($this->user()->isLibraryAdmin()) {
            return $library->created_by === $this->user()->id;
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
            'name' => ['sometimes', 'string', 'max:255'],
            'address' => ['sometimes', 'string'],
            'latitude' => ['sometimes', 'numeric', 'between:-90,90'],
            'longitude' => ['sometimes', 'numeric', 'between:-180,180'],
            'facilities' => ['sometimes', 'array'],
            'facilities.*' => ['string'],
            'opening_hours' => ['sometimes', 'array'],
            'website_url' => ['nullable', 'url', 'max:255'],
            'description' => ['sometimes', 'string'],
        ];
    }
}
