<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePesertaSeminarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('peserta_seminars', function (Blueprint $table) {
            $table->id();
            $table->char('seminar_id', 50);
            $table->string('nama', 255);
            $table->string('ticket', 255)->nullable();
            $table->string('instansi', 255)->nullable();
            $table->string('sosmed', 255)->nullable();
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
        Schema::dropIfExists('peserta_seminars');
    }
}
