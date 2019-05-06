<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;


class SpinTime extends Model
{
  public $timestamps = false;    

  public static function currentSpin()
  {
      return DB::table('spin_times')
                ->select('id')
                ->where('ready', 2)
                ->first();
  }
}
