<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use Illuminate\Http\Request;

class TodoController extends Controller
{
    public function index()
    {
        return response()->json(Todo::all(), 200);
    }

    public function store(Request $request)
    {
        $validateData = $request->validate([
            'description' => 'required|string'
        ]);
        $todo = Todo::create($validateData);
        return response()->json($todo, 201);
    }
    public function update(Request $request, $id)
    {
        $todo = Todo::find($id);
        if (!$todo) {
            return response()->json(['message'=>'Todo not found'], 404);
        }
        $validateData = $request->validate([
            'description' => 'sometimes|required|string',
            'completed' => 'sometimes|required|boolean'
        ]);
        $todo->update($validateData);
        return response()->json($todo,200);
    }
    public function destroy(string $id)
    {
        $todo = Todo::find($id);
        if (!$todo) {
            return response()->json(['message'=>'Todo not found'], 404);
        }
        $todo->delete();
        return response()->json(['message'=>'Todo deleted successfully'],200);
    }
    
}
