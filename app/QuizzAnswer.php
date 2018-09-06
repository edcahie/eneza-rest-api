<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class QuizzAnswer extends Model
{
protected $table = 'quizz_answers';

protected $primaryKey = 'quizz_answer_id';

protected $fillable =[
'content_id', 'answer', 'isanswer'
];

public function content()
{
return $this->belongsTo('App\Content');
}

}