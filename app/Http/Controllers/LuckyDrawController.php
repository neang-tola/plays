<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Maatwebsite\Excel\Facades\Excel;

use TCG\Voyager\Voyager;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Exports\ExportGenerator;
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
      $voyager = new Voyager();
      $spin_data = OfferPrizing::findCurrentSpinTime();

      $data['entry'] = $spin_data;
      $data['image'] = !empty($spin_data) ? $voyager->image($spin_data->image) : '';

      if($request->ajax()){
        $data['status'] = !empty($spin_data) ? 'Successful' : 'Fail';
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

    public function pickUpWinner(Request $request)
    {
      $response = ['status'=>'Fail', 'data'=>[]];
      $timeId  = $request->get('time_id');
      $eventId = $request->get('event_id');
      $incWin  = $request->get('inc_win');
      $limit   = $request->get('count');
      $prizeId = $request->get('prize_id');

      $results = Play::pickPlayer($prizeId, $limit, $incWin);

      if(count($results)){
        $add_winners = [];
        SpinTime::where('id', $timeId)->update(['ready'=>1]);

        foreach ($results as $winner) {
          
          $add_winners[] = ['participant_id'=>$winner->participant_id, 
                            'event_id'=>$eventId, 
                            'prize_id'=>$prizeId,
                            'win_number'=>$winner->number,
                            'created_at'=>date('Y-m-d H:i:s')];

          Play::where('id', $winner->id)->update(['is_picked'=>1]);
          
        }
        if($add_winners)
          Winner::insert($add_winners);    

        $free_spin = OfferPrizing::freeSpinTimes($prizeId);
        $response = ['status'=>'Successful', 'data'=>$results, 'count'=>$free_spin];
      }

      return response()->json($response);
    }

    public function checkActivitySpin()
    {
      $status = ['msg'=>'no', 'data'=>''];
      $cur_data = SpinTime::currentSpin();
      if(count($cur_data)){
        $status = ['msg'=>'yes', 'data'=>$cur_data];
      }
      return response()->json($status);
    }

    public function export()
    {
      $file_name = 'winner_export_'. date('d_m_Y');
      return Excel::download(new ExportGenerator, $file_name);
    }
}
  