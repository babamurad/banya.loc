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
        Schema::create('employes', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('first_name')->nullable();
            $table->string('last_name')->nullable();
            $table->string('phone')->nullable();
            $table->bigInteger('address')->unsigned()->nullable();
            $table->foreign('address')->references('id')->on('users')->onDelete('cascade');
            $table->bigInteger('department_id')->unsigned()->default(0);
            $table->foreign('department_id')->references('id')->on('departments')->onDelete('cascade');
            $table->bigInteger('jobtitle_id')->unsigned()->default(1);
            $table->foreign('jobtitle_id')->references('id')->on('job_titles')->onDelete('cascade');
            $table->bigInteger('role_id')->unsigned()->default(1);
            $table->foreign('role_id')->references('id')->on('roles')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employes');
    }
};
