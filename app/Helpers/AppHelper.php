<?php 
  if(! function_exists('card_formater')){
    function card_formater($str_card){
      $result = $str_card;
      if(strlen($str_card) > 10){
        $result = substr($str_card, 3, 10);
      }
      return $result;
    }
  }
