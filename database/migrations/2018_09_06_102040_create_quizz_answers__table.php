<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuizzAnswersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quizz_answers', function (Blueprint $table) {
            $table->increments('quizz_answer_id');
            $table->bigInteger('content_id')->unsigned(); //migration du subject par son identifiant dans la table des couses subjects
            $table->foreign('content_id')
                ->references('content_id')->on('contents')
                ->onDelete('cascade');
            $table->text('answer');
            $table->string('isanswer', 1);
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
