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
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->foreignId('library_id')->constrained('libraries')->onDelete('cascade');
            $table->string('title');
            $table->text('description');
            $table->dateTime('event_date');
            $table->timestamps();
            $table->softDeletes();
            
            // Indexes for performance
            $table->index('library_id');
            $table->index('event_date');
            $table->index('created_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('events');
    }
};
