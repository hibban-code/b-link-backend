<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\BookView;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BookController extends Controller
{
    /**
     * Get all books with filters
     */
    public function index(Request $request): JsonResponse
    {
        try {
            $query = Book::with('library:id,name');

            // Filter by category
            if ($request->has('category') && $request->category !== 'All') {
                $query->where('category', $request->category);
            }

            // Search
            if ($request->has('search')) {
                $search = $request->search;
                $query->where(function($q) use ($search) {
                    $q->where('title', 'ILIKE', "%{$search}%")
                      ->orWhere('author', 'ILIKE', "%{$search}%");
                });
            }

            $books = $query->orderBy('title')->get();

            return response()->json([
                'success' => true,
                'data' => $books,
                'meta' => [
                    'total' => $books->count(),
                ]
            ]);
        } catch (\Exception $e) {
            \Log::error('Book index error: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Error fetching books',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Get book by ID and track view
     */
    public function show(int $id, Request $request): JsonResponse
    {
        try {
            $book = Book::with(['library' => function ($q) {
                $q->select('id', 'name');
            }])->findOrFail($id);

            // Track book view
            $this->trackBookView($id, $request);

            return response()->json([
                'success' => true,
                'data' => $book,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Book not found',
            ], 404);
        }
    }

    /**
     * Get all book categories
     */
    public function categories(): JsonResponse
    {
        try {
            $categories = Book::select('category')
                ->distinct()
                ->whereNotNull('category')
                ->orderBy('category')
                ->pluck('category');

            return response()->json([
                'success' => true,
                'data' => $categories,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching categories',
            ], 500);
        }
    }

    public function search(Request $request): JsonResponse
{
    try {
        $title = $request->input('title');
        
        if (!$title) {
            return response()->json([
                'success' => false,
                'message' => 'Title parameter required',
            ], 400);
        }

        $books = Book::with('library')
            ->where('title', 'ILIKE', "%{$title}%")
            ->limit(5)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $books,
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'success' => false,
            'message' => 'Error searching books',
            'error' => $e->getMessage(),
        ], 500);
    }
}

    /**
     * Get user's view history
     */
    public function viewHistory(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $sessionId = $request->header('X-Session-ID') ?? $request->ip();

            $query = BookView::with(['book.library' => function ($q) {
                $q->select('id', 'name');
            }]);

            if ($user) {
                $query->where('user_id', $user->id);
            } else {
                $query->where('session_id', $sessionId);
            }

            $views = $query->orderBy('created_at', 'desc')
                ->limit(50)
                ->get();

            return response()->json([
                'success' => true,
                'data' => $views,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching view history',
            ], 500);
        }
    }

    /**
     * Get recommendations based on view history
     */
    public function recommendations(Request $request): JsonResponse
    {
        try {
            $user = $request->user();
            $sessionId = $request->header('X-Session-ID') ?? $request->ip();

            // Get most viewed categories
            $query = BookView::select('books.category', DB::raw('count(*) as views'))
                ->join('books', 'book_views.book_id', '=', 'books.id');

            if ($user) {
                $query->where('book_views.user_id', $user->id);
            } else {
                $query->where('book_views.session_id', $sessionId);
            }

            $topCategories = $query->groupBy('books.category')
                ->orderBy('views', 'desc')
                ->limit(3)
                ->pluck('books.category')
                ->toArray();

            if (empty($topCategories)) {
                // Return random books if no history
                $recommendations = Book::with(['library' => function ($q) {
                    $q->select('id', 'name');
                }])
                ->inRandomOrder()
                ->limit(10)
                ->get();
            } else {
                // Get recommendations from top categories
                $recommendations = Book::with(['library' => function ($q) {
                    $q->select('id', 'name');
                }])
                ->whereIn('category', $topCategories)
                ->whereNotIn('id', function ($query) use ($user, $sessionId) {
                    $q = $query->select('book_id')->from('book_views');
                    if ($user) {
                        $q->where('user_id', $user->id);
                    } else {
                        $q->where('session_id', $sessionId);
                    }
                })
                ->inRandomOrder()
                ->limit(5)
                ->get();
            }

            return response()->json([
                'success' => true,
                'data' => $recommendations,
                'meta' => [
                    'top_categories' => $topCategories,
                ],
            ]);
        } catch (\Exception $e) {
            \Log::error('Recommendations Error: ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Error fetching recommendations',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Track book view
     */
    private function trackBookView(int $bookId, Request $request): void
    {
        try {
            $user = $request->user();
            $sessionId = $request->header('X-Session-ID') ?? $request->ip();

            BookView::create([
                'user_id' => $user?->id,
                'book_id' => $bookId,
                'session_id' => $user ? null : $sessionId,
            ]);
        } catch (\Exception $e) {
            \Log::warning('Book View Tracking Failed: ' . $e->getMessage());
            // Silently fail tracking
        }
    }

    /**
     * Create new book (Admin only)
     */
    public function store(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'title' => 'required|string|max:255',
                'author' => 'required|string|max:255',
                'category' => 'required|string|max:100',
                'description' => 'nullable|string',
                'library_id' => 'required|exists:libraries,id',
            ]);

            $book = Book::create($validated);

            return response()->json([
                'success' => true,
                'message' => 'Book created successfully',
                'data' => $book->load('library'),
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error creating book',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Update book (Admin only)
     */
    public function update(Request $request, int $id): JsonResponse
    {
        try {
            $book = Book::findOrFail($id);

            $validated = $request->validate([
                'title' => 'sometimes|string|max:255',
                'author' => 'sometimes|string|max:255',
                'category' => 'sometimes|string|max:100',
                'description' => 'nullable|string',
                'library_id' => 'sometimes|exists:libraries,id',
            ]);

            $book->update($validated);

            return response()->json([
                'success' => true,
                'message' => 'Book updated successfully',
                'data' => $book->load('library'),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error updating book',
            ], 404);
        }
    }

    /**
     * Delete book (Admin only)
     */
    public function destroy(int $id): JsonResponse
    {
        try {
            $book = Book::findOrFail($id);
            $book->delete();

            return response()->json([
                'success' => true,
                'message' => 'Book deleted successfully',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Book not found',
            ], 404);
        }
    }
}
