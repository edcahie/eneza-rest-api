<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCoursesSubjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courses_subjects', function (Blueprint $table) {
            $table->increments('course_subject_id');
            $table->bigInteger('course_id')->unsigned();
            $table->foreign('course_id')
                ->references('course_id')->on('courses')
                ->onDelete('cascade');

            $table->bigInteger('subject_id')->unsigned();
            $table->foreign('subject_id')
                ->references('subject_id')->on('subjects')
                ->onDelete('cascade');

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
