<?php

function smarty_function_validation_errors($params,&$smarty) {
  if (!function_exists('validation_errors')) {
  //return error message in case we can't get CI instance
    if (!function_exists('get_instance')) 
      return "Can't get CI instance";
    $CI= &get_instance();
    $CI->load->helper('form');
  }
  
  return validation_errors(); 
}
?>