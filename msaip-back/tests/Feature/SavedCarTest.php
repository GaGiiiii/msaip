<?php

namespace Tests\Feature;

use App\Models\SavedCar;
use App\Models\Type;
use App\Models\User;
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

  public function test_save_car() {
    $user = User::factory()->create();
    $this->actingAs($user);
    $type = Type::factory()->create();

    $response = $this->postJson('/api/saved-cars', [
      'type_id' => $type->id
    ]);

    $response->assertStatus(201);
  }

  public function test_save_car_unauthenticated() {
    $type = Type::factory()->create();

    $response = $this->postJson('/api/saved-cars', [
      'type_id' => $type->id
    ]);

    $response
      ->assertStatus(401)
      ->assertJson([
        'message' => 'Unauthenticated.'
      ]);
  }

  public function test_save_car_no_type() {
    $user = User::factory()->create();
    $this->actingAs($user);
    $type = Type::factory()->create();

    $response = $this->postJson('/api/saved-cars', [
      'type_id' => 22
    ]);

    $response
      ->assertStatus(400)
      ->assertJson([
        'savedCar' => null,
        'message' => 'Type not found.',
      ]);
  }

  public function test_save_car_already_saved() {
    $user = User::factory()->create();
    $this->actingAs($user);
    $type = Type::factory()->create();
    SavedCar::factory()->create([
      'user_id' => $user,
      'type_id' => $type
    ]);

    $response = $this->postJson('/api/saved-cars', [
      'type_id' => $type->id
    ]);

    $response
      ->assertStatus(400)
      ->assertJson([
        "savedCar" => null,
        "message" => 'Car already saved',
      ]);
  }
}
