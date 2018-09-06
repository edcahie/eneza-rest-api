<?php

namespace Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;



class CourseTest extends \PHPUnit_Framework_TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    use WithoutMiddleware;

    public function testPost()
    {

//        $this->withoutMiddleware('auth');
        $client = new Client(); //GuzzleHttp\Client
        $result = $client->post('http://127.0.0.1:8000/api/courses', [
            'form_params' => [
                'course_name' => 'Beginner'
            ]
        ]) ;
    }
    public function testGet()
    {
        $client = new Client();
        $client->request('GET', 'http://127.0.0.1:8000/api/courses/');
    }
    public function testDelete()
    {

//        $this->withoutMiddleware('auth');
        $client = new Client(); //GuzzleHttp\Client
        $result = $client->delete('http://127.0.0.1:8000/api/courses/8', [
            'form_params' => [
                'course_name' => 'Beginner'
            ]
        ]) ;
    }
    public function testUpdate()
    {

//        $this->withoutMiddleware('auth');
        $client = new Client(); //GuzzleHttp\Client
        $result = $client->put('http://127.0.0.1:8000/api/courses/1', [
            'form_params' => [
                'course_name' => 'Beginner'
            ]
        ]) ;
    }

}
