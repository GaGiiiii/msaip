<?php

namespace App\Http\Controllers;

use App\Models\Type;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;

class TypeController extends Controller {
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index(Request $request) {
    try {
      $model = $request->query('model');

      if ($model) {
        $types = Type::where('m_model_id', $model)->get();
      } else {
        $types = Type::all();
      }

      $types = $types->fresh(['mModel', 'make', 'mModel.manufacturer']);

      return response([
        "types" => $types,
        "message" => "Types found",
      ], 200);
    } catch (QueryException $qe) {
      return response([
        "types" => null,
        "message" => $qe->getMessage(),
      ], 500);
    } catch (Exception $e) {
      return response([
        "types" => null,
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
    //
  }

  /**
   * Display the specified resource.
   *
   * @param  \App\Models\Type  $type
   * @return \Illuminate\Http\Response
   */
  public function show(Type $type) {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  \App\Models\Type  $type
   * @return \Illuminate\Http\Response
   */
  public function edit(Type $type) {
    //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \App\Models\Type  $type
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, Type $type) {
    //
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  \App\Models\Type  $type
   * @return \Illuminate\Http\Response
   */
  public function destroy(Type $type) {
    //
  }
}
