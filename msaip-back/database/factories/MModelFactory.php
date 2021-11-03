<?php

namespace Database\Factories;

use App\Models\Manufacturer;
use Illuminate\Database\Eloquent\Factories\Factory;

class MModelFactory extends Factory {
  /**
   * Define the model's default state.
   *
   * @return array
   */
  public function definition() {
    return [
      'name' => $this->faker->name(),
      'manufacturer_id' => Manufacturer::factory(),
    ];
  }
}
