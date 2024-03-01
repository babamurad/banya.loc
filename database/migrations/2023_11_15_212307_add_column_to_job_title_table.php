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
        Schema::table('job_titles', function (Blueprint $table) {
            $table->text('desc')->nullable()->after('name');
            $table->decimal('price',10,2)->nullable()->after('name');
            $table->decimal('qty',10,2)->nullable()->after('name');
            $table->decimal('sum',10,2)->nullable()->after('name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('job_titles', function (Blueprint $table) {
            $table->dropColumn('desc');
            $table->dropColumn('price');
            $table->dropColumn('qty');
            $table->dropColumn('sum');
        });
    }
};
