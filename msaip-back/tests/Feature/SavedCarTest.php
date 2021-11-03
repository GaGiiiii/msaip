<?php

namespace Tests\Feature;

use App\Models\SavedCar;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class SavedCarTest extends TestCase {
  use RefreshDatabase;
  /**
   * A basic feature test example.
   *
   * @return void
   */

  public function test_get_all_saved_cars() {
    $savedCars = SavedCar::factory(10)->create();
    $response = $this->getJson('/api/saved-cars');

    $response
      ->assertStatus(200)
      ->assertJson([
        "savedCars" => $savedCars->toArray(),
        "message" => "Saved cars found",
      ]);
  }

  public function test_get_all_saved_cars_empty() {
    $response = $this->getJson('/api/saved-cars');

    $response
      ->assertStatus(200)
      ->assertJson([
        "savedCars" => [],
        "message" => "Saved cars found",
      ]);
  }

  public function test_get_all_saved_cars_for_user() {
    $savedCars = SavedCar::factory(10)->create();
    $userID = $savedCars[0]->user->id;
    $response = $this->getJson("/api/saved-cars?user=$userID");
    $foundSavedCars = SavedCar::where('user_id', $userID)->get();
    $foundSavedCars = $foundSavedCars->fresh(['user', 'type']);

    $response
      ->assertStatus(200)
      ->assertJson([
        "savedCars" => $foundSavedCars->toArray(),
        "message" => "Saved cars found",
      ]);
  }

  public function test_get_all_saved_cars_for_type() {
    $savedCars = SavedCar::factory(10)->create();
    $typeID = $savedCars[0]->type->id;
    $response = $this->getJson("/api/saved-cars?tpe=$typeID");
    $foundSavedCars = SavedCar::where('type_id', $typeID)->get();
    $foundSavedCars = $foundSavedCars->fresh(['user', 'type']);

    $response
      ->assertStatus(200)
      ->assertJson([
        "savedCars" => $foundSavedCars->toArray(),
        "message" => "Saved cars found",
      ]);
  }

  public function test_get_all_saved_cars_for_user_and_type() {
    $savedCars = SavedCar::factory(10)->create();
    $userID = $savedCars[0]->user->id;
    $typeID = $savedCars[0]->type->id;
    $response = $this->getJson("/api/saved-cars?user=$userID&type=$typeID");
    $foundSavedCars = SavedCar::where('user_id', $userID)->where('type_id', $typeID)->get();
    $foundSavedCars = $foundSavedCars->fresh(['user', 'type']);

    $response
      ->assertStatus(200)
      ->assertJson([
        "savedCars" => $foundSavedCars->toArray(),
        "message" => "Saved cars found",
      ]);
  }
}
