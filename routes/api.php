<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\LibraryController;
use App\Http\Controllers\API\BookController;
use App\Http\Controllers\API\EventController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\VisitController;
use App\Http\Controllers\API\BadgeController;
use App\Http\Controllers\API\MapController;
use App\Http\Controllers\API\GuidebookController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// ============================================================================
// PUBLIC ROUTES (No Authentication Required)
// ============================================================================

// Authentication Routes
Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
});

// Libraries Routes (Public Read)
Route::get('libraries', [LibraryController::class, 'index']);
Route::get('libraries/{id}', [LibraryController::class, 'show']);

// Books Routes (Public Read)
Route::get('books', [BookController::class, 'index']);
Route::get('/books/search', [BookController::class, 'search']);
Route::get('books/{id}', [BookController::class, 'show']);
Route::get('books-categories', [BookController::class, 'categories']);
Route::get('books/recommendations/for-you', [BookController::class, 'recommendations']);
Route::get('books/history/views', [BookController::class, 'viewHistory']);

// Map Routes (Public)
Route::get('map/libraries', [MapController::class, 'libraries']);
Route::get('map/nearby', [MapController::class, 'nearby']);

// Events Routes (Public Read)
Route::get('events', [EventController::class, 'index']);
Route::get('events/upcoming', [EventController::class, 'upcoming']);
Route::get('events/calendar', [EventController::class, 'calendar']);
Route::get('events/{id}', [EventController::class, 'show']);

// Forum Routes (Public Read)
Route::get('forum/threads', [ForumController::class, 'index']);
Route::get('forum/threads/{id}', [ForumController::class, 'show']);

Route::get('guidebook', [GuidebookController::class, 'index']);
Route::get('guidebook/{id}', [GuidebookController::class, 'show']);
Route::get('guidebook/transportation/all', [GuidebookController::class, 'transportation']);


// Feedback Routes (Public Submit)
Route::post('feedback', [FeedbackController::class, 'store']);

// ============================================================================
// AUTHENTICATED ROUTES
// ============================================================================

Route::middleware('auth:sanctum')->group(function () {
    
    Route::get('books/history/views', [BookController::class, 'viewHistory']);
    // Auth Routes
    Route::prefix('auth')->group(function () {
        Route::post('logout', [AuthController::class, 'logout']);
        Route::get('me', [AuthController::class, 'me']);
        Route::put('profile', [AuthController::class, 'updateProfile']);
    });
    
    // Visit & Gamification Routes
    Route::prefix('visits')->group(function () {
        Route::post('/', [VisitController::class, 'store']);
        Route::get('/user/{userId?}', [VisitController::class, 'userVisits']);
        Route::get('/stats/{userId?}', [VisitController::class, 'stats']);
        Route::get('/badges/{userId?}', [VisitController::class, 'badges']);
    });
    
    // Forum Routes (Authenticated)
    Route::prefix('forum')->group(function () {
        Route::post('threads', [ForumController::class, 'storeThread']);
        Route::put('threads/{id}', [ForumController::class, 'updateThread']);
        Route::delete('threads/{id}', [ForumController::class, 'destroyThread']);
        Route::post('threads/{id}/replies', [ForumController::class, 'storeReply']);
        Route::put('replies/{id}', [ForumController::class, 'updateReply']);
        Route::delete('replies/{id}', [ForumController::class, 'destroyReply']);
    });
    
    // ========================================================================
    // ADMIN ONLY ROUTES
    // ========================================================================
    
    Route::middleware('role:super_admin,library_admin')->group(function () {
        
        // Library Management
        Route::post('libraries', [LibraryController::class, 'store']);
        Route::put('libraries/{id}', [LibraryController::class, 'update']);
        Route::delete('libraries/{id}', [LibraryController::class, 'destroy']);
        
        // Book Management
        Route::post('books', [BookController::class, 'store']);
        Route::put('books/{id}', [BookController::class, 'update']);
        Route::delete('books/{id}', [BookController::class, 'destroy']);
        
        // Event Management
        Route::post('events', [EventController::class, 'store']);
        Route::put('events/{id}', [EventController::class, 'update']);
        Route::delete('events/{id}', [EventController::class, 'destroy']);
        
        // Feedback Management
        Route::get('feedback', [FeedbackController::class, 'index']);
        Route::put('feedback/{id}/status', [FeedbackController::class, 'updateStatus']);
        Route::delete('feedback/{id}', [FeedbackController::class, 'destroy']);
    });
});
