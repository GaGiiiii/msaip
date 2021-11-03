<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MModel extends Model {
  use HasFactory;

  protected $fillable = [
    'name',
    'manufacturer_id',
  ];

  public function types() {
    return $this->hasMany(Type::class);
  }

  public function manufacturer() {
    return $this->belongsTo(Manufacturer::class);
  }
}
