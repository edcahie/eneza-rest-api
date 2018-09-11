# Project Title

Laravel REST API with oauth

php version 7
### How to install
- Clone the repository
- Set up database credentials in .env file
- Run composer update
- Run php artisan migrate to migrate the database
- Run php artisan passport:install
- Run composer dump-autoload
- Run these commands  to seed data php artisan db:seed --class=CoursesTableSeeder ;php artisan db:seed --class=SubjectsTableSeeder ; php artisan db:seed --class=ContentsTableSeeder ; 
php artisan db:seed --class=QuizzAnswerTableSeeder ;

### Testing
We will be testing it on PHP development server but you can use virtual host if you want. Run the following command to serve the application on the PHP development server.
php artisan serve
Launch
http://127.0.0.1:8000
Now, let’s test our API endpoints using an API testing tool like Postman.

# Register
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/register.PNG)

# Login 
now that you are registered you can login in the application ,and get token credentials
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/login.PNG)

# Getting credential
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/gettingcredential.PNG)

# Course Store API 
http://127.0.0.1:8000/api/courses 
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/coursestore.PNG)

# Courses Index API
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/courseshow.PNG)

# Courses Index API
When testing API that requires a user to be authenticated, you need to specify two headers. You must specify access token as a Bearer token in the Authorization header. Basically, you have to concatenate the access token that you received after login and registration with the Bearer followed by a space.
'headers' => [
    'Accept' => 'application/json',
    'Authorization' => 'Bearer '. $accessToken,
]
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/courseshow.PNG)

# Course update API
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/courseupdate.PNG)

# Course delete API
![alt text](https://github.com/edcahie/eneza-rest-api/blob/master/files/coursedelete.PNG)

### Testing with phpunit

To run test with phunit ,dont forget to put these differents routes  outside auth midleware :
- Route::resource('courses', 'CourseController');//Dont forget to uncomment this fror test
- Route::resource('subjects', 'SubjectController');
- Route::resource('contents', 'ContentController');
- Route::resource('quizzes', 'QuizzAnswerController');
