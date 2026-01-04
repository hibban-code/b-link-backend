<?php

namespace App\Services;

use App\Models\User;
use App\Models\Visit;
use App\Models\Badge;
use App\Models\Library;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class GamificationService
{
    /**
     * Record a visit to a library
     */
    public function recordVisit(int $userId, int $libraryId, ?string $visitedAt = null): Visit
    {
        $visit = DB::transaction(function () use ($userId, $libraryId, $visitedAt) {
            // Create visit record
            $visit = Visit::create([
                'user_id' => $userId,
                'library_id' => $libraryId,
                'visited_at' => $visitedAt ? Carbon::parse($visitedAt) : now(),
            ]);

            // Check and award badges
            $this->checkAndAwardBadges($userId);

            return $visit;
        });

        return $visit->load(['library']);
    }

    /**
     * Get user's visit history
     */
    public function getUserVisits(int $userId, int $perPage = 15)
    {
        return Visit::where('user_id', $userId)
            ->with(['library'])
            ->orderBy('visited_at', 'desc')
            ->paginate($perPage);
    }

    /**
     * Get user's visit statistics
     */
    public function getUserVisitStats(int $userId): array
    {
        $totalLibraries = Library::count();
        $visitedLibrariesCount = Visit::where('user_id', $userId)
            ->distinct('library_id')
            ->count('library_id');
        
        $visitedLibraryIds = Visit::where('user_id', $userId)
            ->pluck('library_id')
            ->toArray();

        $percentage = $totalLibraries > 0 
            ? round(($visitedLibrariesCount / $totalLibraries) * 100, 2)
            : 0;

        return [
            'total_libraries' => $totalLibraries,
            'visited_count' => $visitedLibrariesCount,
            'unvisited_count' => $totalLibraries - $visitedLibrariesCount,
            'percentage' => $percentage,
            'visited_library_ids' => $visitedLibraryIds,
        ];
    }

    /**
     * Get user's badges
     */
    public function getUserBadges(int $userId)
    {
        $user = User::with(['badges'])->findOrFail($userId);
        $allBadges = Badge::all();

        return [
            'earned' => $user->badges,
            'available' => $allBadges,
            'earned_count' => $user->badges->count(),
            'total_count' => $allBadges->count(),
        ];
    }

    /**
     * Check and award badges based on user activity
     */
    protected function checkAndAwardBadges(int $userId): void
    {
        $user = User::findOrFail($userId);
        $badges = Badge::all();

        foreach ($badges as $badge) {
            // Skip if user already has this badge
            if ($user->badges->contains($badge->id)) {
                continue;
            }

            $shouldAward = false;

            // Check badge criteria
            switch ($badge->criteria_type) {
                case 'visit_count':
                    $visitCount = Visit::where('user_id', $userId)
                        ->distinct('library_id')
                        ->count('library_id');
                    $shouldAward = $visitCount >= $badge->criteria_value;
                    break;

                case 'first_visit':
                    $visitCount = Visit::where('user_id', $userId)->count();
                    $shouldAward = $visitCount >= 1;
                    break;

                case 'complete_all':
                    $totalLibraries = Library::count();
                    $visitedCount = Visit::where('user_id', $userId)
                        ->distinct('library_id')
                        ->count('library_id');
                    $shouldAward = $visitedCount >= $totalLibraries;
                    break;

                case 'forum_activity':
                    $threadCount = $user->threads()->count();
                    $replyCount = $user->replies()->count();
                    $totalActivity = $threadCount + $replyCount;
                    $shouldAward = $totalActivity >= $badge->criteria_value;
                    break;
            }

            // Award badge if criteria met
            if ($shouldAward) {
                $user->badges()->attach($badge->id, [
                    'earned_at' => now(),
                ]);
            }
        }
    }

    /**
     * Get library visit count
     */
    public function getLibraryVisitCount(int $libraryId): int
    {
        return Visit::where('library_id', $libraryId)->count();
    }

    /**
     * Check if user has visited a library
     */
    public function hasUserVisited(int $userId, int $libraryId): bool
    {
        return Visit::where('user_id', $userId)
            ->where('library_id', $libraryId)
            ->exists();
    }
}
