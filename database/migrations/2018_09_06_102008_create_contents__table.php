<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contents', function (Blueprint $table) {
            $table->increments('content_id');
            $table->bigInteger('subject_id')->unsigned(); //migration du subject par son identifiant dans la table des couses subjects
            $table->foreign('subject_id')
                ->references('subject_id')->on('subjects')
                ->onDelete('cascade');
            $table->text('content');
            $table->string('content_type', 1);
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
        //
    }
}
