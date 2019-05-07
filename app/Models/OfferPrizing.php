<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;


class OfferPrizing extends Model
{
    protected $table = 'offer_prizings';

    public static function getAllPrizing($event_id)
    {
      return DB::table('offer_prizings as op')
                      ->select('op.id', 'op.title', 'op.include_winner', 'op.numbers')
                      ->addSelect(
                        DB::raw('(SELECT GROUP_CONCAT(st.times) FROM spin_times as st WHERE st.prize_id = op.id AND st.ready = 0) AS time_list'),
                        DB::raw('(SELECT GROUP_CONCAT(st.id) FROM spin_times as st WHERE st.prize_id = op.id AND st.ready = 0) AS time_ids')
                      )
                      ->where('op.event_id', $event_id)
                      ->get();

    }    

    public static function freeSpinTimes($prize_id)
    {
      return DB::table('spin_times')
                ->select('id')
                ->where('ready', 2)
                ->where('prize_id', $prize_id)
                ->count();
    }

  public static function findCurrentSpinTime()
  {
    $result = false;
    $data = DB::table('spin_times as st')
                ->select('st.id as time_id', 'st.times as num_item', 'op.*')
                ->selectRaw('(SELECT count(w.id) FROM winners w WHERE w.prize_id = st.prize_id) as winner_count')
                ->join('offer_prizings as op', 'op.id', '=', 'st.prize_id')
                ->where('st.ready', 2)
                ->first();

    if(!empty($data))
      $result = $data;

    return $result;
  } 

}
