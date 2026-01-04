<?php

namespace App\Http\Requests\Library;

use Illuminate\Foundation\Http\FormRequest;

class StoreLibraryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Only library_admin and super_admin can create libraries
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
            'name' => ['required', 'string', 'max:255'],
            'address' => ['required', 'string'],
            'latitude' => ['required', 'numeric', 'between:-90,90'],
            'longitude' => ['required', 'numeric', 'between:-180,180'],
            'facilities' => ['nullable', 'array'],
            'facilities.*' => ['string'],
            'opening_hours' => ['required', 'array'],
            'website_url' => ['nullable', 'url', 'max:255'],
            'description' => ['required', 'string'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'name.required' => 'Library name is required',
            'address.required' => 'Address is required',
            'latitude.required' => 'Latitude is required',
            'latitude.between' => 'Latitude must be between -90 and 90',
            'longitude.required' => 'Longitude is required',
            'longitude.between' => 'Longitude must be between -180 and 180',
            'opening_hours.required' => 'Opening hours are required',
            'website_url.url' => 'Please provide a valid URL',
            'description.required' => 'Description is required',
        ];
    }
}
