<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Validation\Rule;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Participant;

class ParticipantsController extends VoyagerBaseController
{
    public function handleImportData(Request $request)
    { 
        $arr = [];
        $validator = Validator::make($request->all(), ['import_file' => 'required|mimes:csv,txt']);
        if($validator->fails()){
          $response = ['message'    => "Import file is required and accept only CSV file.",
                       'type'       => 'error'];
        }else{
          $path = $request->file('import_file')->getRealPath();
          $data = Excel::load($path)->get();

          if($data->count()){
            foreach($data as $value){
              $card = card_formater($value->id_card);
              if(!Participant::checkExistingMember($value->name, $card)){
                $arr[] = ['name'        => $value->name, 
                          'phone'       => $value->phone,
                          'id_card'     => $card,
                          'phone'       => $value->phone,
                          'email'       => $value->email,
                          'created_at'  => date('Y-m-d H:i:s'),
                          'updated_at'  => date('Y-m-d H:i:s'),
                          'location'    => $value->location
                         ];
              }
            }
          }

          if(!empty($arr)){
            $all_imported = count($arr);
            Participant::insert($arr);
            $response = ['message'    => "Your importing $all_imported records has been successful.",
                         'type'       => 'success'];            
          }else{
            $response = ['message'    => "There are no data for importing from your source file.",
                         'type'       => 'error'];            
          }
        }

        $request->session()->flash('alert', $response);
        return back();
        // if ($request->ajax()) {
          // return response()->json($response);
        // }
    }

}
