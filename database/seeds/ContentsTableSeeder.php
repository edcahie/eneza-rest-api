<?php

use Illuminate\Database\Seeder;

class ContentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('contents')->insert([
            'subject_id' 		=> '1',
            'content' 		=> 'You could also say that abbreviations are shortened versions of written words or phrases used to replace the original. Here are some examples: A.D. = Anno Domini - in the year of the Lord A.M. = Ante Meridiem - before midday B.A. = Bachelor of Arts B.S. = Bachelor of Science e.g. = for example et al. = and others", "and co-workers" etc. = et cetera, "and the others", "and other things", "and the rest"i.e. = \'that is\'N.B. = nota bene, "note well"Ph. D. = "Doctor of Philosophy" P.M. = Post Meridiem, "after midday" vs. = versus, "against',
            'content_type' 		=> 'T', //T for tutorial ,Q for Quizz
        ]);

        DB::table('contents')->insert([
            'subject_id' 		=> '1',
            'content' 		=> 'A clause is a group of related words that include a subject and predicate. Predicate is the part of a sentence that shows action or describes the subject. A sentence may have the main clause and one or more subordinate clauses. For example: The boy who was telling a story is a prefect. \'Who\' is used to refer to the person who did the action. The pupil who worked hardest was given a reward. \'Whose\' shows ownership or possession. For example: The boy whose shirt the cows tore got injured',
            'content_type' 		=> 'T', //T for tutorial ,Q for Quizz
        ]);

        DB::table('contents')->insert([
            'subject_id' 		=> '2',
            'content' 		=> 'Latitudes move which direction on a map?',
            'content_type' 		=> 'Q', //T for tutorial ,Q for Quizz
        ]);

        DB::table('contents')->insert([
            'subject_id' 		=> '2',
            'content' 		=> '',
            'content_type' 		=> 'Q', //T for tutorial ,Q for Quizz
        ]);

    }
}
