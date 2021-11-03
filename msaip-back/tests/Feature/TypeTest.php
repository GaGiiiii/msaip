<?php

namespace Tests\Feature;

use App\Models\Type;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TypeTest extends TestCase {
  /**
   * A basic feature test example.
   *
   * @return void
   */
  use RefreshDatabase;

  public function test_get_all_types() {
    $types = Type::factory(10)->create();
    $response = $this->getJson('/api/types');

    $response
      ->assertStatus(200)
      ->assertJson([
        "types" => $types->toArray(),
        "message" => "Types found",
      ]);
  }

  public function test_get_all_types_empty() {
    $response = $this->getJson('/api/types');

    $response
      ->assertStatus(200)
      ->assertJson([
        "types" => [],
        "message" => "Types found",
      ]);
  }

  public function test_get_all_types_for_model() {
    $types = Type::factory(10)->create();
    $modelID = $types[0]->mModel->id;
    $response = $this->getJson("/api/types?model=$modelID");
    $foundTypes = Type::where('m_model_id', $modelID)->get();

    $response
      ->assertStatus(200)
      ->assertJson([
        "types" => $foundTypes->toArray(),
        "message" => "Types found",
      ]);
  }
}
