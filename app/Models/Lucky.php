<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;


class Lucky extends Model
{
    protected $table = 'luckies';

    // protected $fillable = [
    //   'participant_id',
    //   'event_id',
    //   'num_chances'
    // ];

    public function events()
    {
      return $this->belongTo('App\Models\Event');
    }

    public static function getLuckyByEvent($event_id)
    {
      return DB::table('events as ev')
                      ->select('lk.*', 'ev.title as event_title')
                      ->addSelect(
                        DB::raw('(SELECT GROUP_CONCAT(p.id) FROM plays as p WHERE p.lucky_id = lk.id) AS player_list')
                      )
                      ->join('luckies as lk', 'ev.id', '=', 'lk.event_id')
                      ->where('ev.id', $event_id)
                      ->get();

    }
}
