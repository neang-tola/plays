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

    public static function pickPlayer($prize_id, $num_player=1, $is_winner_inc=true)
    {
      $exist_winner  = Play::filterWinners($prize_id);

        $pick_winner = DB::table('participants as pt')
                              ->select('pl.participant_id', 'pl.id', 'lk.event_id', 'op.id as prize_id', 'op.title', 'pt.id_card as number', 'pt.name', 'pt.phone')
                              ->selectRaw('(SELECT count(w.id) FROM winners w WHERE w.prize_id = op.id) as winner_count')
                              ->selectRaw('(SELECT count(sp.id) FROM spin_times sp WHERE sp.ready != 1) as prize_count')
                              ->join('plays as pl', 'pl.participant_id', '=', 'pt.id')
                              ->join('luckies as lk', 'lk.id', '=', 'pl.lucky_id')
                              ->join('offer_prizings as op', 'op.event_id', '=', 'lk.event_id')
                              ->where('pl.is_picked', 0)
                              ->where('op.id', $prize_id);

      if(!$is_winner_inc && count($exist_winner)){
        $pick_winner = $pick_winner->whereNotIn('pl.participant_id', $exist_winner);
      }
      
        $pick_winner = $pick_winner->groupBy('pt.id')
                                   ->inRandomOrder()
                                   ->limit($num_player)
                                   ->offset(0)
                                   ->get();

      return $pick_winner;
    }

    protected static function filterWinners($prize_id)
    {
      $winner_list = [];
      $get_win = DB::table('winners as w')
                          ->select('w.participant_id')
                          ->join('offer_prizings as op', 'op.id', '=', 'w.prize_id')
                          ->where('w.prize_id', $prize_id)
                          ->where('op.include_winner', 0)
                          ->groupBy('w.participant_id')
                          ->get();

      if(count($get_win)){
        foreach ($get_win as $key => $item) {
          $winner_list[$key] = $item->participant_id;
        }
      }

      return $winner_list;
    }
}
