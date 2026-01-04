<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Badge;

class BadgeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $badges = [
            [
                'name' => 'First Steps',
                'description' => 'Made your first library visit',
                'icon' => '🎯',
                'criteria_type' => 'first_visit',
                'criteria_value' => 1,
            ],
            [
                'name' => 'Explorer',
                'description' => 'Visited 5 different libraries',
                'icon' => '🗺️',
                'criteria_type' => 'visit_count',
                'criteria_value' => 5,
            ],
            [
                'name' => 'Adventurer',
                'description' => 'Visited 10 different libraries',
                'icon' => '🏆',
                'criteria_type' => 'visit_count',
                'criteria_value' => 10,
            ],
            [
                'name' => 'Master Explorer',
                'description' => 'Visited 15 different libraries',
                'icon' => '⭐',
                'criteria_type' => 'visit_count',
                'criteria_value' => 15,
            ],
            [
                'name' => 'Completionist',
                'description' => 'Visited all libraries in Bandung',
                'icon' => '👑',
                'criteria_type' => 'complete_all',
                'criteria_value' => 1,
            ],
            [
                'name' => 'Community Member',
                'description' => 'Participated in forum discussions (5 posts)',
                'icon' => '💬',
                'criteria_type' => 'forum_activity',
                'criteria_value' => 5,
            ],
            [
                'name' => 'Active Contributor',
                'description' => 'Made 20 forum contributions',
                'icon' => '🌟',
                'criteria_type' => 'forum_activity',
                'criteria_value' => 20,
            ],
        ];

        foreach ($badges as $badge) {
            Badge::create($badge);
        }
    }
}
