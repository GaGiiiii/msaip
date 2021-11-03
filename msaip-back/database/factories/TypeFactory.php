<?php

namespace Database\Factories;

use App\Models\Make;
use App\Models\MModel;
use Illuminate\Database\Eloquent\Factories\Factory;

class TypeFactory extends Factory {
  /**
   * Define the model's default state.
   *
   * @return array
   */
  public function definition() {
    return [
      'm_model_id' => MModel::factory(),
      'make_id' => Make::factory(),
    ];
  }
}
