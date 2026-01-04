<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('book_views', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->onDelete('cascade');
            $table->foreignId('book_id')->constrained()->onDelete('cascade');
            $table->string('session_id')->nullable(); // For non-logged in users
            $table->timestamps();
            
            // Indexes for performance
            $table->index(['user_id', 'created_at']);
            $table->index(['session_id', 'created_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('book_views');
    }
};
