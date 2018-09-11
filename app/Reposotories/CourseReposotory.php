<?php
/**
 * Created by IntelliJ IDEA.
 * User: lenovo
 * Date: 11/09/2018
 * Time: 13:49
 */

namespace App\Reposotories;


interface CourseReposotory
{
    public function all();

    public function create(array $data);

    public function update(array $data, $id);

    public function delete($id);

    public function getById($id);
}