<?php

use Illuminate\Database\Seeder;

class CoursesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('courses')->insert([
            'course_name' 		=> 'Pridmaire',
        ]);

        DB::table('courses')->insert([
            'course_name' 		=> 'Secodndaire',
        ]);
    }
}
