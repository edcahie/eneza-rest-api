<?php

namespace App\Http\Controllers;

use App\Content;
use Illuminate\Http\Request;

class ContentController extends Controller
{
    public function index()
    {
        //
        $content = Content::orderBy('content_id', 'ASC')->get();
        return response()->json([
            'success' => true,
            'data' => $content
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
            'content' => 'required' ,
            'content_type' => 'required|string|min:1|max:1' ,
            'subject_id' => 'required|numeric|min:1' ,
        ]);
        $input = $request->all();
        $content = Content::create($input);
        if ($content)
            return response()->json([
                'success' => true,
                'data' => $content->toArray()
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Content could not be added'
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
        $content = Content::find($id);

        if (!$content) {
            return response()->json([
                'success' => false,
                'message' => 'Content with id ' . $id . ' not found'
            ], 400);
        }

        return response()->json([
            'success' => true,
            'data' => $content->toArray()
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
        $content = Content::find($id);
        if (!$content) {
            return response()->json([
                'success' => false,
                'message' => 'Content with id ' . $id . ' not found'
            ], 400);
        }
        $input = $request->all();
        $content->fill($input);
        //dd($input);
        if ($content->update())
            return response()->json([
                'success' => true
            ]);
        else
            return response()->json([
                'success' => false,
                'message' => 'Content could not be updated'
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
        $content = Content::find($id);

        if (!$content) {
            return response()->json([
                'success' => false,
                'message' => 'Content with id ' . $id . ' not found'
            ], 400);
        }

        if ($content->delete()) {
            return response()->json([
                'success' => true
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Content could not be deleted'
            ], 500);
        }
    }
}
