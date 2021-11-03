<?php

namespace Database\Factories;

use App\Models\Type;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class SavedCarFactory extends Factory {
  /**
   * Define the model's default state.
   *
   * @return array
   */
  public function definition() {
    return [
      'user_id' => User::class,
      'type_id' => Type::class,
    ];
  }
}
