<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns;
use App\Course;
use App\CourseSubject;

class Subject extends Model
{
    //
    protected $table = 'subjects'; //table
    protected $primaryKey = 'subject_id'; //identifiant

    protected $fillable = [
        'subject_name',
        'subject_code'
    ];

    public function courses()
    {
        return $this->belongsToMany('App\Course');
    }

    public function course_subjects()
    {
        return $this->hasMany('App\CourseSubject');
    }
}
