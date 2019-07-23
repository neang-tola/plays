<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Winner extends Model
{
  public static function getAllWinner($event_id){
    return DB::table('winners as w')
                ->select('e.title as event_title', 'pa.name', 'pa.id_card as number', 'pr.title as prize')
                ->addSelect('pa.phone as phone_number', 'pa.location', 'w.created_at as winned_at')
                ->join('participants as pa', 'pa.id', '=', 'w.participant_id')
                ->join('events as e', 'e.id', '=', 'w.event_id')
                ->join('offer_prizings as pr', 'pr.id', '=', 'w.prize_id')
                ->where('e.id', $event_id)
                ->get();
  }
}
