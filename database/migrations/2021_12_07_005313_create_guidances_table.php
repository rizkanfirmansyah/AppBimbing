<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGuidancesTable extends Migration
{
    /**
     * Run the migrations.
    *
     * @return void
     */
    public function up()
    {
        Schema::create('guidances', function (Blueprint $table) {
            $table->id();
            $table->char('mahasiswa_id');
            $table->string('title');
            $table->text('description');
            $table->string('file');
            $table->enum('status', ['0', '1', '2'])->default('2');
            $table->text('description_dosen')->nullable();
            $table->text('memo')->nullable();
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
        Schema::dropIfExists('guidances');
    }
}
