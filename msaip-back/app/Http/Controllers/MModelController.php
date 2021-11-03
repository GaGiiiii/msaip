<?php

namespace App\Http\Controllers;

use App\Models\MModel;
use Exception;
use Illuminate\Http\Request;

class MModelController extends Controller {
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index(Request $request) {
    try {
      $manufacturer = $request->query('manufacturer');

      if ($manufacturer) {
        $models = MModel::where('manufacturer_id', $manufacturer)->get();
      } else {
        $models = MModel::all();
      }

      $models = $models->fresh(['manufacturer', 'types', 'types.make']);

      return response([
        "models" => $models,
        "message" => "Models found",
      ], 200);
    } catch (Exception $e) {
      return response([
        "models" => null,
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
   * @param  \App\Models\MModel  $mModel
   * @return \Illuminate\Http\Response
   */
  public function show(MModel $mModel) {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  \App\Models\MModel  $mModel
   * @return \Illuminate\Http\Response
   */
  public function edit(MModel $mModel) {
    //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \App\Models\MModel  $mModel
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, MModel $mModel) {
    //
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  \App\Models\MModel  $mModel
   * @return \Illuminate\Http\Response
   */
  public function destroy(MModel $mModel) {
    //
  }
}
