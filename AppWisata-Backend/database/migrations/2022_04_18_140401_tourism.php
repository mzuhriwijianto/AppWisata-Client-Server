<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Tourism extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tourism', function (Blueprint $table) {
            $table->increments('id');
            $table->string('tourism_name',80);
            $table->text('tourism_description');
            $table->string('tourism_location');
            $table->integer('tourism_ticket_price');
            $table->string('tourism_working_hours',50);
            $table->string('tourism_open_days',80);
            $table->string('tourism_img');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
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
