<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthService
{
    /**
     * Register a new user
     */
    public function register(array $data): User
    {
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'role' => $data['role'] ?? 'user',
        ]);

        return $user;
    }

    /**
     * Login user and generate token
     */
    public function login(array $credentials): array
    {
        $user = User::where('email', $credentials['email'])->first();

        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        // Delete old tokens
        $user->tokens()->delete();

        // Create new token
        $token = $user->createToken('api-token')->plainTextToken;

        return [
            'user' => $user,
            'token' => $token,
        ];
    }

    /**
     * Logout user (revoke token)
     */
    public function logout(User $user): void
    {
        $user->currentAccessToken()->delete();
    }

    /**
     * Update user profile
     */
    public function updateProfile(User $user, array $data): User
    {
        $user->update([
            'name' => $data['name'] ?? $user->name,
            'email' => $data['email'] ?? $user->email,
        ]);

        if (isset($data['password'])) {
            $user->update([
                'password' => Hash::make($data['password']),
            ]);
        }

        return $user->fresh();
    }
}
