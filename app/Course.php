<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns;
use App\Subject;
use App\CourseSubject;

class Course extends Model
{

    protected $table = 'courses';
    protected $primaryKey = 'course_id';

    protected $fillable = [
        'course_name',
    ];

    public function subjects()
    {
        return $this->belongsToMany('App\Subject');
    }

    public function course_subjects()
    {
        return $this->hasMany('App\CourseSubject');
    }
}
