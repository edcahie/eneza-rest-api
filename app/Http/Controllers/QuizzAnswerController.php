<?php

namespace App\Http\Controllers;

use App\QuizzAnswer;
use Illuminate\Http\Request;

class QuizzAnswerController extends Controller
{
    public function index()
    {
        //
        $QuizzAnswer = QuizzAnswer::orderBy('quizz_answer_id', 'ASC')->get();
        return response()->json([
            'success' => true,
            'data' => $QuizzAnswer
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'answer' => 'required|string' ,
            'isanswer' => 'required|string|min:1|max:1' ,
            'content_id' => 'required|numeric|min:1' ,
        ]);
        $input = $request->all();
        $QuizzAnswer = QuizzAnswer::create($input);
        if ($QuizzAnswer)
            return response()->json([
                'success' => true,
                'data' => $QuizzAnswer->toArray()
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'QuizzAnswer could not be added'
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
        //
        $QuizzAnswer = QuizzAnswer::find($id);

        if (!$QuizzAnswer) {
            return response()->json([
                'success' => false,
                'message' => 'QuizzAnswer with id ' . $id . ' not found'
            ], 400);
        }

        return response()->json([
            'success' => true,
            'data' => $QuizzAnswer->toArray()
        ], 400);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $QuizzAnswer = QuizzAnswer::find($id);
        if (!$QuizzAnswer) {
            return response()->json([
                'success' => false,
                'message' => 'Answer with id ' . $id . ' not found'
            ], 400);
        }
        $input = $request->all();
        $QuizzAnswer->fill($input);
        //dd($input);
        if ($QuizzAnswer->update())
            return response()->json([
                'success' => true
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Answer could not be updated'
            ], 500);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $QuizzAnswer = QuizzAnswer::find($id);

        if (!$QuizzAnswer) {
            return response()->json([
                'success' => false,
                'message' => 'Answer with id ' . $id . ' not found'
            ], 400);
        }

        if ($QuizzAnswer->delete()) {
            return response()->json([
                'success' => true
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Answer could not be deleted'
            ], 500);
        }
    }
}
