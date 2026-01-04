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
        Schema::create('feedback', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['criticism', 'suggestion', 'wishlist']);
            $table->text('content');
            $table->boolean('is_anonymous')->default(false);
            $table->foreignId('user_id')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('library_id')->nullable()->constrained('libraries')->onDelete('set null');
            $table->enum('status', ['pending', 'reviewed', 'resolved'])->default('pending');
            $table->timestamps();
            
            // Indexes for performance
            $table->index('type');
            $table->index('status');
            $table->index('user_id');
            $table->index('library_id');
            $table->index('created_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('feedback');
    }
};
