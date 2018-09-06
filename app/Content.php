<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $table = 'contents';

    protected $primaryKey = 'content_id';

    protected $fillable = [
        'subject_id',
        'content',
        'content_type'
    ];
    public function subject()
    {
        return $this->belongsTo('App\Subject');
    }
}
