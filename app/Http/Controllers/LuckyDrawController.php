<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\OfferPrizing;
use App\Models\SpinTime;
use App\Models\Event;
use App\Models\Play;
use App\Models\Winner;

class LuckyDrawController extends Controller
{
    public function index()
    {      
      $events = Event::all(['id', 'title'])->toArray();

      $data = ['events'=>$events];
      return view('index')->with($data);
    }

    public function screen(Request $request)
    {
      $spin_data = OfferPrizing::findCurrentSpinTime();

      $data['entry'] = $spin_data;

      if($request->ajax()){
        $data['status'] = ($spin_data) ? 'Successful' : 'Fail';
        return response()->json($data);
      }

      return view('screen')->with($data);
    }

    public function preSpiner(Request $request)
    {
      $status = ['msg'=>'Fail'];

      // $timeId  = $request->get('time_id');
      $prizeId = $request->get('prize_id');
      $eventId = $request->get('event_id');    

      if(!empty($prizeId)){
        SpinTime::where('prize_id', $prizeId)->update(['ready'=>2]);
        $status = ['msg'=>'Successful'];
      }
      return response()->json($status);
    }

    public function getPrizeByEvent($event_id)
    {
      if(!empty($event_id)){
        $prize = OfferPrizing::getAllPrizing($event_id);

        return response()->json($prize);
      }
    }

    public function updateSpinTime(Request $request)
    {
      $status = ['msg'=>'Fail'];

      $timeId     = $request->get('time_id');
      $winnerIds  = $request->get('winner_id');
      $winnerNums = $request->get('winner_num');
      $prizeId    = $request->get('prize_id');
      $eventId    = $request->get('event_id');

      if(count($winnerIds)){
        // Update spin time
        $add_winners = [];
        SpinTime::where('id', $timeId)->update(['ready'=>1]);

        foreach ($winnerIds as $ind => $value) {
          
          $add_winners[$ind] = ['participant_id'=>$value, 
                                'event_id'=>$eventId, 
                                'prize_id'=>$prizeId,
                                'win_number'=>$winnerNums[$ind],
                                'created_at'=>date('Y-m-d H:i:s')];

          Play::where('id', $winnerNums[$ind])->update(['is_picked'=>1]);
          
        }
        if($add_winners)
          Winner::insert($add_winners);

        // get number of spin time that not yet spin
        $free_spin = OfferPrizing::freeSpinTimes($prizeId);      
        $status = ['msg'=>'Successful', 'spin_time'=>$free_spin];
      }

      return response()->json($status);
    }

    public function pickUpWinner(Request $request)
    {
      $response = ['status'=>'error', 'data'=>[]];
      $incWin = $request->get('inc_win');
      $limit  = $request->get('count');
      $prizeId= $request->get('prize_id');

      $results = Play::pickPlayer($prizeId, $limit, $incWin);
      if(count($results) < $limit)
        $results = Play::pickPlayer($prizeId, $limit, $incWin, false);

      if(count($results))
        $response = ['status'=>'success', 'data'=>$results];

      return response()->json($response);
    }

    public function checkActivitySpin()
    {
      $status = ['msg'=>'no', 'data'=>'';
      $cur_data = SpinTime::currentSpin();
      if(count($cur_data)){
        $status = ['msg'=>'yes', 'data'=>$cur_data];
      }
      return response()->json($status);
    }
}
  