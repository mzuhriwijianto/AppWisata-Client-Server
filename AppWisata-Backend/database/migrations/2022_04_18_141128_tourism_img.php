<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TourismImg extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tourism_img', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tourism_id')->unsigned();
            $table->string('tourism_img_file');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });

        Schema::table('tourism_img', function (Blueprint $table) {
            $table->foreign('tourism_id')->references('id')->on('tourism');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
