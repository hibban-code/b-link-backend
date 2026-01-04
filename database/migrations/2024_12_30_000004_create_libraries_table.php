
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
        Schema::create('libraries', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('address');
            $table->decimal('latitude', 10, 8); // -90 to 90
            $table->decimal('longitude', 11, 8); // -180 to 180
            $table->json('facilities')->nullable(); // ["wifi", "parking", "ac"]
            $table->json('opening_hours'); // {"monday": {"open": "08:00", "close": "17:00"}}
            $table->string('website_url')->nullable();
            $table->text('description');
            $table->foreignId('created_by')->nullable()->constrained('users')->onDelete('set null');
            $table->timestamps();
            $table->softDeletes(); // Allow soft deletion
            
            // Indexes for performance
            $table->index('name');
            $table->index(['latitude', 'longitude']); // Spatial queries
            $table->index('created_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('libraries');
    }
};
