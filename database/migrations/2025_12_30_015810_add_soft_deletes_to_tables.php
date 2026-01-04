<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Add deleted_at to libraries (if not exists)
        if (!Schema::hasColumn('libraries', 'deleted_at')) {
            Schema::table('libraries', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to books (if not exists)
        if (!Schema::hasColumn('books', 'deleted_at')) {
            Schema::table('books', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to events (if not exists)
        if (!Schema::hasColumn('events', 'deleted_at')) {
            Schema::table('events', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to forum_threads (if not exists)
        if (!Schema::hasColumn('forum_threads', 'deleted_at')) {
            Schema::table('forum_threads', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to forum_replies (if not exists)
        if (!Schema::hasColumn('forum_replies', 'deleted_at')) {
            Schema::table('forum_replies', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to feedback (if not exists)
        if (!Schema::hasColumn('feedback', 'deleted_at')) {
            Schema::table('feedback', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to visits (if not exists)
        if (!Schema::hasColumn('visits', 'deleted_at')) {
            Schema::table('visits', function (Blueprint $table) {
                $table->softDeletes();
            });
        }

        // Add deleted_at to user_badges (if not exists)
        if (!Schema::hasColumn('user_badges', 'deleted_at')) {
            Schema::table('user_badges', function (Blueprint $table) {
                $table->softDeletes();
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('libraries', 'deleted_at')) {
            Schema::table('libraries', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('books', 'deleted_at')) {
            Schema::table('books', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('events', 'deleted_at')) {
            Schema::table('events', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('forum_threads', 'deleted_at')) {
            Schema::table('forum_threads', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('forum_replies', 'deleted_at')) {
            Schema::table('forum_replies', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('feedback', 'deleted_at')) {
            Schema::table('feedback', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('visits', 'deleted_at')) {
            Schema::table('visits', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }

        if (Schema::hasColumn('user_badges', 'deleted_at')) {
            Schema::table('user_badges', function (Blueprint $table) {
                $table->dropSoftDeletes();
            });
        }
    }
};
