<?php

namespace App\Http\Controllers;

use App\Models\Manufacturer;
use Exception;
use Illuminate\Http\Request;

class ManufacturerController extends Controller {
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index() {
    try {
      $manufacturers = Manufacturer::all();
      $manufacturers = $manufacturers->fresh('mModels');

      return response([
        "manufacturers" => $manufacturers,
        "message" => "Manufacturers found",
      ], 200);
    } catch (Exception $e) {
      return response([
        "manufacturers" => null,
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
   * @param  \App\Models\Manufacturer  $manufacturer
   * @return \Illuminate\Http\Response
   */
  public function show(Manufacturer $manufacturer) {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  \App\Models\Manufacturer  $manufacturer
   * @return \Illuminate\Http\Response
   */
  public function edit(Manufacturer $manufacturer) {
    //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \App\Models\Manufacturer  $manufacturer
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, Manufacturer $manufacturer) {
    //
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  \App\Models\Manufacturer  $manufacturer
   * @return \Illuminate\Http\Response
   */
  public function destroy(Manufacturer $manufacturer) {
    //
  }
}
