<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSeminarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seminars', function (Blueprint $table) {
            $table->id();
            $table->string('title', 255);
            $table->string('speaker', 255);
            $table->char('ruangan', 125);
            $table->char('max', 50);
            $table->timestamp('date')->nullable();
            $table->timestamp('end_date')->nullable();
            $table->enum('status', ['0', '1', '2'])->nullable();
            $table->text('description')->nullable();
            $table->char('created_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seminars');
    }
}
