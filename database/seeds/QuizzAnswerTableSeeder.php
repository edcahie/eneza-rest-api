<?php

use Illuminate\Database\Seeder;

class QuizzAnswerTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('quizz_answers')->insert([
            'content_id' 		=> '3',
            'answer' 		=> 'Asia',
            'isanswer' 		=> 'Y', //Y is it's the question answer ,N if not
        ]);

        DB::table('quizz_answers')->insert([
            'content_id' 		=> '3',
            'answer' 		=> 'America',
            'isanswer' 		=> 'N', //Y is it's the question answer ,N if not
        ]);
        DB::table('quizz_answers')->insert([
            'content_id' 		=> '3',
            'answer' 		=> 'Africa',
            'isanswer' 		=> 'N', //Y is it's the question answer ,N if not
        ]);

        DB::table('quizz_answers')->insert([
            'content_id' 		=> '3',
            'answer' 		=> 'North to South',
            'isanswer' 		=> 'N', //Y is it's the question answer ,N if not
        ]);
        DB::table('quizz_answers')->insert([
            'content_id' 		=> '3',
            'answer' 		=> 'East to West',
            'isanswer' 		=> 'Y', //Y is it's the question answer ,N if not
        ]);
    }
}
