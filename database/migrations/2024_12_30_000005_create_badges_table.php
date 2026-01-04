<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('badges', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description');
            $table->string('icon')->nullable(); // URL or icon class
            $table->string('criteria_type'); // visit_count, event_attendance, forum_activity
            $table->integer('criteria_value'); // e.g., 5 for "Visit 5 libraries"
            $table->timestamps();
            
            // Index
            $table->index('criteria_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('badges');
    }
};
