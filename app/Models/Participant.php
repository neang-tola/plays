<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Participant extends Model
{
    public static function checkExistingMember($name=null, $card=null)
    {
      $status = true;
      if(!empty($name) && !empty($card)){
        $status = false;
        $check  = Participant::where('name', $name)
                              ->where('id_card', $card)
                              ->first();     
        if(!empty($check)){
          $status = true;
        }
      }

      return $status;
    }

    public static function getFieldByCard($id_card, $field_name='id')
    {
      $result = Participant::where('id_card', $id_card)->first();
      if(!empty($result))
      return $result->{$field_name};
    }
}

