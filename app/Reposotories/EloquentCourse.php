<?php
/**
 * Created by IntelliJ IDEA.
 * User: lenovo
 * Date: 11/09/2018
 * Time: 13:55
 */

namespace App\Reposotories;


use App\Course;

class EloquentCourse implements CourseReposotory
{

    /**
     * EloquentCourse constructor.
     * @param Course $model
     */
    public function __construct(Course $model)
    {
      return $this->model = $model;
    }

    public function all()
    {
        return  $this->model->all();
    }

    public function create(array $data)
    {
        return $this->model->create($data);
    }

    public function update(array $data, $id)
    {
        $course = $this->model->findOrFail($id);
        $course->update($data);
        return $course;
    }

    public function delete($id)
    {
        $this->model->findOrFail($id)->delete();
        return TRUE;
    }

    public function getById($id)
    {
        return $this->model->find($id);
    }
}