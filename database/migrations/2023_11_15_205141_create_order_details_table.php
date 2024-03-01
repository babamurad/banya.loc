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
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->integer('num')->nullable();
            $table->bigInteger('order_id')->unsigned();
            $table->bigInteger('jobtitle_id')->unsigned();
            $table->bigInteger('employes_id')->unsigned();
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('jobtitle_id')->references('id')->on('job_titles')->onDelete('cascade');
            $table->decimal('qty',10,2)->nullable();
            $table->decimal('price',10,2)->nullable();
            $table->decimal('sum',10,2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_details');
    }
};
