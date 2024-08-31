<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}


class DomPdf {

    public $CI;
   
    public function __construct() {
        $this->CI = &get_instance();
        ini_set('memory_limit', '-1');
       
    }

   
    

}
