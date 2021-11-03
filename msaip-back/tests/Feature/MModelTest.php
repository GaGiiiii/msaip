<?php

namespace Tests\Feature;

use App\Models\MModel;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class MModelTest extends TestCase {
  use RefreshDatabase;
  /**
   * A basic feature test example.
   *
   * @return void
   */

  public function test_get_all_models() {
    $models = MModel::factory(10)->create();
    $response = $this->getJson('/api/models');

    $response
      ->assertStatus(200)
      ->assertJson([
        "models" => $models->toArray(),
        "message" => "Models found",
      ]);
  }

  public function test_get_all_models_empty() {
    $response = $this->getJson('/api/models');

    $response
      ->assertStatus(200)
      ->assertJson([
        "models" => [],
        "message" => "Models found",
      ]);
  }

  public function test_get_all_models_for_manufacturer() {
    $models = MModel::factory(10)->create();
    $mfID = $models[0]->manufacturer->id;
    $response = $this->getJson("/api/models?manufacturer=$mfID");
    $foundModels = MModel::where('manufacturer_id', $mfID)->get();

    $response
      ->assertStatus(200)
      ->assertJson([
        "models" => $foundModels->toArray(),
        "message" => "Models found",
      ]);
  }
}
