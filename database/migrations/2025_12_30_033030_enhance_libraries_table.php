<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('libraries', function (Blueprint $table) {
            if (!Schema::hasColumn('libraries', 'phone')) {
                $table->string('phone')->nullable()->after('website_url');
            }
            if (!Schema::hasColumn('libraries', 'email')) {
                $table->string('email')->nullable()->after('phone');
            }
            if (!Schema::hasColumn('libraries', 'address')) {
                $table->text('address')->nullable()->after('name');
            }
            if (!Schema::hasColumn('libraries', 'operating_hours')) {
                $table->json('operating_hours')->nullable()->after('opening_hours');
            }
            if (!Schema::hasColumn('libraries', 'facility_details')) {
                $table->json('facility_details')->nullable()->after('facilities');
            }
            if (!Schema::hasColumn('libraries', 'rules')) {
                $table->json('rules')->nullable()->after('facility_details');
            }
            if (!Schema::hasColumn('libraries', 'parking_info')) {
                $table->text('parking_info')->nullable()->after('rules');
            }
            if (!Schema::hasColumn('libraries', 'public_transport')) {
                $table->json('public_transport')->nullable()->after('parking_info');
            }
        });
    }

    public function down(): void
    {
        Schema::table('libraries', function (Blueprint $table) {
            $columns = [
                'phone', 'email', 'operating_hours', 'facility_details', 
                'rules', 'parking_info', 'public_transport'
            ];
            
            foreach ($columns as $column) {
                if (Schema::hasColumn('libraries', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
    }
};
