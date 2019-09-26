<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\Backend\VoyagerBaseController;
use App\Models\Lucky;
use App\Models\Play;
use App\Models\Event;
use App\Models\Participant;
use Validator;

class LuckiesController extends VoyagerBaseController
{
    public function index(Request $request)
    {
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = $this->getSlug($request);

        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object) ['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];
        $searchable = $dataType->server_side ? array_keys(SchemaManager::describeTable(app($dataType->model_name)->getTable())->toArray()) : '';
        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', null);
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + 1;
            $orderColumn = [[$index, 'desc']];
            if (!$sortOrder && isset($dataType->order_direction)) {
                $sortOrder = $dataType->order_direction;
                $orderColumn = [[$index, $dataType->order_direction]];
            } else {
                $orderColumn = [[$index, 'desc']];
            }
        }

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model::select('*');

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%'.$search->value.'%';
                $query->where($search->key, $search_filter, $search_value);
            }

            if ($orderBy && in_array($orderBy, $dataType->fields())) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                $dataTypeContent = call_user_func([
                    $query->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        if (($isModelTranslatable = is_bread_translatable($model))) {
            $dataTypeContent->load('translations');
        }

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = isset($dataType->default_search_key) ? $dataType->default_search_key : null;

        // Binding data for event
        $events = Event::all(['title', 'id'])->toArray();

        $view = 'voyager::bread.browse';

        if (view()->exists("voyager::$slug.browse")) {
            $view = "voyager::$slug.browse";
        }

        return Voyager::view($view, compact(
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchable',
            'isServerSide',
            'defaultSearchKey',
            'events'
        ));
    }

    public function importData(Request $request)
    {
        $arr = [];
        $test = [];
        $validator = Validator::make($request->all(), ['import_data' => 'required|mimes:csv,txt']);
        if($validator->fails()){
          $response = ['message'    => "Import file is required and accept only CSV file.",
                       'type'       => 'error'];
        }else{
          $path = $request->file('import_data')->getRealPath();
          $data = Excel::load($path)->get();

          if($data->count()){
            foreach($data as $value){
              $card    = card_formater($value->id_card);
              $participant_id = Participant::getFieldByCard($card);
              
              if(!Lucky::checkExistingLuckyByEvent($value->event_id, $participant_id)){
                $arr[] = ['participant_id'  => $participant_id, 
                          'event_id'        => $value->event_id,
                          'num_chances'     => $value->chances,
                          'created_at'      => date('Y-m-d H:i:s'),
                          'updated_at'      => date('Y-m-d H:i:s')
                         ];
              }
            }
          }

          if(!empty($arr)){
            $all_imported = count($arr);
            Lucky::insert($arr);
            $response = ['message'    => "Your importing $all_imported records has been successful.",
                         'type'       => 'success'];            
          }else{
            $response = ['message'    => "There are no data for importing from your source file.",
                         'type'       => 'error'];            
          }
        }

        $request->session()->flash('alert', $response);
        return back();
    }

    public function store(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows);

        if ($val->fails()) {
            return response()->json(['errors' => $val->messages()]);
        }

        if (!$request->has('_validate')) {
            // Customize code
            $res_data = $this->create_update_number_chances($request['event_id'], $request['participant_id'], $request['num_chances']);
            $request['num_chances'] = $res_data['chance'];
            if($res_data['id'])
                $request['id'] = $res_data['id'];

            $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

            event(new BreadDataAdded($dataType, $data));

            if ($request->ajax()) {
                return response()->json(['success' => true, 'data' => $data]);
            }

            return redirect()
                ->route("voyager.{$dataType->slug}.index")
                ->with([
                        'message'    => __('voyager::generic.successfully_added_new')." {$dataType->display_name_singular}",
                        'alert-type' => 'success',
                    ]);
        }
    }

    public function destroy(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('delete', app($dataType->model_name));

        // Init array of IDs
        $ids = [];
        if (empty($id)) {
            // Bulk delete, get IDs from POST
            $ids = explode(',', $request->ids);
        } else {
            // Single item delete, get ID from URL
            $ids[] = $id;
        }
        foreach ($ids as $id) {
            $data = call_user_func([$dataType->model_name, 'findOrFail'], $id);
            $this->clear_chance($id);
            $this->cleanup($dataType, $data);
        }

        $displayName = count($ids) > 1 ? $dataType->display_name_plural : $dataType->display_name_singular;

        $res = $data->destroy($ids);
        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_deleted')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_deleting')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataDeleted($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    protected function create_update_number_chances($event_id, $person_id, $new_chance=0, $lucky_id=null)
    {
        $datas = []; 
        $response = ['id' => $lucky_id, 'chance' => $new_chance];

        $checked = Lucky::where('event_id', $event_id)
                           ->where('participant_id', $person_id)
                           ->first();

        if(!empty($checked->id)){
            $chance_up = ($lucky_id) ? $new_chance : $checked->num_chances + $new_chance;

            $response = ['id' => $checked->id, 'chance' => $chance_up];
            if(empty($lucky_id))
                $checked->delete();
        }

        return $response;
    }

    protected function clear_chance($lucky_id=null)
    {
        if($lucky_id){

            return Play::where('lucky_id', $lucky_id)->delete();
        }
    }

    public function chance_generator(Request $request)
    {
        $event_title = 'Your Event';
        $response = ['message'    => "Chance for {$event_title} cannot generated complete",
                     'alert_type' => 'error'];

        if($request->has('event_id')){
            $event_id  = $request->input('event_id');

            $res_data  = Lucky::getLuckyByEvent($event_id);

            if(count($res_data)){
                foreach($res_data as $row){
                    $event_title = $row->event_title;
                    $row_chances = [];
                    // Clear existing player
                    if($row->player_list){
                        $players = explode(',', $row->player_list);
                        Play::destroy($players);
                    }

                    for($i=0; $i<$row->num_chances; $i++){
                        $row_chances[$i] = ['participant_id' => $row->participant_id,'lucky_id' => $row->id];
                    }

                    Play::insert($row_chances);
                }

                $response = ['message'    => "Chance for {$event_title} is generated successful",
                             'alert_type' => 'success'];                
            }

        }

        if ($request->ajax()) {
            return response()->json($response);
        }

        //return redirect()->route("voyager.luckies.index")->with($response);

    }
}
