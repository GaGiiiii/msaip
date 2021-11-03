<?php

namespace Tests\Feature;

use App\Models\Manufacturer;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ManufacturerTest extends TestCase {
  use RefreshDatabase;
  /**
   * A basic feature test example.
   *
   * @return void
   */

  public function test_get_all_manufacturers() {
    $manufacturers = Manufacturer::factory(10)->create();
    $response = $this->getJson('/api/manufacturers');

    $response
      ->assertStatus(200)
      ->assertJson([
        "manufacturers" => $manufacturers->toArray(),
        "message" => "Manufacturers found",
      ]);
  }

  public function test_get_all_manufacturers_empty() {
    $response = $this->getJson('/api/manufacturers');

    $response
      ->assertStatus(200)
      ->assertJson([
        "manufacturers" => [],
        "message" => "Manufacturers found",
      ]);
  }
}
