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
        Schema::create('visits', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('library_id')->constrained('libraries')->onDelete('cascade');
            $table->timestamp('visited_at');
            $table->timestamps();
            
            // Composite index for unique visit tracking
            $table->unique(['user_id', 'library_id', 'visited_at']);
            
            // Indexes for performance
            $table->index('user_id');
            $table->index('library_id');
            $table->index('visited_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('visits');
    }
};
