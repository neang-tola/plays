<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Validator;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use App\Http\Controllers\Backend\VoyagerBaseController;
use App\Models\Participant;

class ParticipantsController extends VoyagerBaseController
{
    use BreadRelationshipParser;

    public function handleImportData(Request $request)
    {
        $validator = $request->validate( 
                     ['file' => 'required|mimes:csv']);

        if($validator->fails()){
            
        }

        return response()->json(['message'=>'hello world']);
    }

}
