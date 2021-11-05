<?php

namespace App\Http\Controllers;

use App\Models\SavedCar;
use App\Models\Type;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Validator;

class SavedCarController extends Controller {
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index(Request $request) {
    try {
      $user = $request->query('user');
      $type = $request->query('type');

      if ($user && !$type) {
        $savedCars = SavedCar::where('user_id', $user)->get();
      } else if (!$user && $type) {
        $savedCars = SavedCar::where('type_id', $type)->get();
      } else if ($user && $type) {
        $savedCars = SavedCar::where('type_id', $type)->where('user_id', $user)->get();
      } else {
        $savedCars = SavedCar::all();
      }

      $savedCars = $savedCars->fresh(['user', 'type', 'type.mModel', 'type.make', 'type.mModel.manufacturer']);

      return response([
        "savedCars" => $savedCars,
        "message" => "Saved cars found",
      ], 200);
    } catch (QueryException $qe) {
      return response([
        "savedCars" => null,
        "message" => $qe->getMessage(),
      ], 500);
    } catch (Exception $e) {
      return response([
        "savedCars" => null,
        "message" => $e->getMessage(),
      ], 500);
    }
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function create() {
    //
  }

  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request) {
    try {
      $type = Type::find($request->type_id);

      if (!$type) {
        return response([
          'savedCar' => null,
          'message' => 'Type not found.',
        ], 400);
      }

      // VALIDATE DATA
      $validator = Validator::make($request->all(), [
        'type_id' => 'required|integer',
      ]);

      if ($validator->fails()) {
        return response([
          'savedCar' => null,
          'message' => 'Validation failed.',
          'errors' => $validator->messages(),
        ], 400);
      }

      $savedCar = new SavedCar;
      $savedCar->user_id = auth()->user()->id;
      $savedCar->type_id = $request->type_id;
      $savedCar->save();

      $savedCar = $savedCar->fresh(['user', 'type']);

      return response([
        "savedCar" => $savedCar,
        "message" => "Saved car created.",
      ], 201);
    } catch (QueryException $e) {
      return response([
        "savedCar" => null,
        "message" => 'Car already saved',
      ], 400);
    } catch (Exception $e) {
      return response([
        "savedCar" => null,
        "message" => $e->getMessage(),
      ], 500);
    }
  }

  /**
   * Display the specified resource.
   *
   * @param  \App\Models\SavedCar  $savedCar
   * @return \Illuminate\Http\Response
   */
  public function show(SavedCar $savedCar) {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  \App\Models\SavedCar  $savedCar
   * @return \Illuminate\Http\Response
   */
  public function edit(SavedCar $savedCar) {
    //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \App\Models\SavedCar  $savedCar
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, SavedCar $savedCar) {
    //
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  $id
   * @return \Illuminate\Http\Response
   */
  public function destroy(int $id) {
    try {

      $savedCar = SavedCar::find($id);

      if (!$savedCar) {
        return response([
          'savedCar' => null,
          'message' => 'Saved car not found.',
        ], 404);
      }

      if (auth()->user()->cannot('delete', $savedCar)) {
        return response([
          "savedCar" => $savedCar,
          "message" => "Unauthorized.",
        ], 401);
      }

      $savedCar->delete();

      return response([
        "savedCar" => $savedCar,
        "message" => "Saved car deleted.",
      ], 200);
    } catch (Exception $e) {
      return response([
        "savedCar" => null,
        "message" => $e->getMessage(),
      ], 500);
    }
  }
}
