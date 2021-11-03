<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Hash;
use Tests\TestCase;

class UserTest extends TestCase {
  use RefreshDatabase;
  use WithFaker;

  public function test_login() {
    $user = User::factory()->create([
      'password' => Hash::make($password = 'pw1234'),
    ]);

    $response = $this->postJson('/api/login', [
      'email' => $user->email,
      'password' => $password,
    ]);

    $response->assertStatus(200);
  }

  public function test_login_wrong_combination() {
    $user = User::factory()->create([
      'password' => Hash::make($password = 'pw1234'),
    ]);

    $response = $this->postJson('/api/login', [
      'email' => $user->email,
      'password' => "123123123",
    ]);

    $response
      ->assertStatus(401)
      ->assertJson([
        "user" => null,
        "message" => "Login failed.",
      ]);
  }

  public function test_login_invalid_data() {
    $user = User::factory()->create([
      'password' => Hash::make($password = 'pw1234'),
    ]);

    $response = $this->postJson('/api/login', [
      'email' => $user->email,
    ]);

    $response->assertStatus(400);
  }

  public function test_logout() {
    $user = User::factory()->create();
    $this->actingAs($user);

    $response = $this->postJson('/api/logout');

    $response
      ->assertStatus(200)
      ->assertJson([
        "user" => $user->toArray(),
        "message" => "Logout successful.",
      ]);
  }

  public function test_logout_not_logged_in() {
    $response = $this->postJson('/api/logout');

    $response
      ->assertStatus(401)
      ->assertJson([
        'message' => 'Unauthenticated.'
      ]);
  }

  public function test_register() {
    $response = $this->postJson('/api/register', [
      'username' => $this->faker->word(),
      'email' => $this->faker->email(),
      'password' => 'gagiiiii',
      'password_confirmation' => 'gagiiiii',
    ]);

    $response->assertStatus(201);
  }

  public function test_register_invalid_data() {
    $response = $this->postJson('/api/register', [
      'username' => $this->faker->word(),
      'email' => $this->faker->email(),
      'password' => 'gagiiiii',
    ]);

    $response->assertStatus(400);
  }
}
