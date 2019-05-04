<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;


class Play extends Model
{
    public $timestamps = false;  
    protected $table = 'plays';

    public static function checkPlayByEvent($event_id)
    {
      return DB::table('events as ev')
                      ->select('lk.*', 'ev.title as event_title')
                      ->join('luckies as lk', 'ev.id', '=', 'lk.event_id')
                      ->where('ev.id', $event_id)
                      ->get();
    }

    public static function pickPlayer($prize_id, $num_player=1, $is_winner_inc=true, $unique_winner=true)
    {
      $exist_winner  = Play::filterWinners($prize_id);

        $pick_winner = DB::table('participants as pt')
                              ->select('pl.participant_id', 'pl.id', 'lk.event_id', 'op.id as prize_id', 'op.title', 'pt.id_card as number', 'pt.name', 'pt.phone')
                              ->join(
                                  DB::raw('(SELECT pl.participant_id, pl.id, pl.lucky_id, pl.is_picked FROM plays pl GROUP BY pl.participant_id) AS pl'), 'pl.participant_id', '=', 'pt.id'
                                )
                              ->join('luckies as lk', 'lk.id', '=', 'pl.lucky_id')
                              ->join('offer_prizings as op', function($join) use ($prize_id){
                                      $join->on('op.event_id', '=', 'lk.event_id');
                                      $join->where('op.id', $prize_id);
                                })
                              ->where('pl.is_picked', 0);

      if(!$is_winner_inc && count($exist_winner)){
        $pick_winner = $pick_winner->whereNotIn('pl.participant_id', $exist_winner);
      }
      
        $pick_winner = $pick_winner->inRandomOrder()
                                   ->limit($num_player)
                                   ->offset(0)
                                   ->get();

      return $pick_winner;
    }

    protected static function filterWinners($prize_id)
    {
      $winner_list = [];
      $get_win = DB::table('winners')
                          ->select('participant_id')
                          ->where('prize_id', $prize_id)
                          ->groupBy('participant_id')
                          ->get();

      if(count($get_win)){
        foreach ($get_win as $key => $item) {
          $winner_list[$key] = $item->participant_id;
        }
      }

      return $winner_list;
    }
}
