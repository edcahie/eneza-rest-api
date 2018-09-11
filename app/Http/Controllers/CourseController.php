<?php

namespace App\Http\Controllers;

use App\Course;
use App\Reposotories\CourseReposotory;
use App\Reposotories\EloquentCourse;
use Illuminate\Http\Request;

/**
 * Class CourseController
 * @package App\Http\Controllers
 */
class CourseController extends Controller
{
    /**
     * @var CourseReposotory
     * */
    private $course;
    /**
     * CourseController constructor.
     */
    public function __construct(EloquentCourse $course)
    {
        $this->course = $course ;
    }
    public function index(){
      return  $this->course->all();
    }
    public function store(Request $request){
        $this->validate($request, [
            'course_name' => 'required|unique:courses' ,
        ]);
        $input = $request->all();
        $course = $this->course->create($input);
        if ($course)
            return response()->json([
                'success' => true,
                'data' => $course->toArray()
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Course could not be added'
            ], 500);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $course = $this->course->getById($id);

        if (!$course) {
            return response()->json([
                'success' => false,
                'message' => 'Course with id ' . $id . ' not found'
            ], 400);
        }

        return response()->json([
            'success' => true,
            'data' => $course->toArray()
        ], 400);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $course = $this->course->getById($id);
        if (!$course) {
            return response()->json([
                'success' => false,
                'message' => 'Course with id ' . $id . ' not found'
            ], 400);
        }
        $input = $request->all();
        $course = $this->course->update($input, $id);
//        $course->fill($input);
        //dd($input);
        if ($course)
            return response()->json([
                'success' => true
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Course could not be updated'
            ], 500);
    }

    public function destroy($id)
    {
        $course = $this->course->getById($id);

        if (!$course) {
            return response()->json([
                'success' => false,
                'message' => 'Course with id ' . $id . ' not found'
            ], 400);
        }
        //dd($course);
        if ($this->course->delete($id)) {
            return response()->json([
                'success' => true
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Course could not be deleted'
            ], 500);
        }
    }
}
