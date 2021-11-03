<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Type extends Model {
  use HasFactory;

  protected $fillable = [
    'mmodel_id',
    'make_id',
  ];

  public function mModel() {
    return $this->belongsTo(MModel::class);
  }

  public function make() {
    return $this->belongsTo(Make::class);
  }
}
