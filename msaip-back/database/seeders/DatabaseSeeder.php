<?php

namespace Database\Seeders;

use App\Models\Make;
use App\Models\Manufacturer;
use App\Models\MModel;
use App\Models\SavedCar;
use App\Models\Type;
use App\Models\User;
use Exception;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
  /**
   * Seed the application's database.
   *
   * @return void
   */
  public function run() {
    $users = User::factory(10)->create(); // Create 10 users

    $manufacturers = Manufacturer::factory(10)->create(); // Create 10 manufacturers

    // Create between 1 - 5 models for each manufacturer
    foreach ($manufacturers as $manufacturer) {
      MModel::factory()->count(rand(1, 5))->for($manufacturer)->create();
    }

    $makes = Make::factory(20)->create();
    $mmodels = MModel::all();

    // Create 20 types based on existing makes and models
    for ($i = 0; $i < sizeof($mmodels); $i++) {
      try {
        for ($j = 0; $j < rand(1, 5); $j++) {
          Type::factory()->for($makes[rand(0, sizeof($makes) - 1)])->for($mmodels[$i])->create();
        }
      } catch (Exception $e) {
        continue;
      }
    }

    $types = Type::all();

    // Create 40 saved cars based on existing users and types
    for ($i = 0; $i < 40; $i++) {
      try {
        SavedCar::factory()->for($types[rand(0, sizeof($types) - 1)])->for($users[rand(0, sizeof($users) - 1)])->create();
      } catch (Exception $e) {
        continue;
      }
    }
  }
}
