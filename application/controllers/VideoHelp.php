<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class VideoHelp extends CI_Controller
{

   

    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->setting_result = $this->setting_model->getSetting();
     
        $this->load->helpers('custom_helper');
       
        
    }

    function index()  {
        $page=$this->input->get('page');
        ob_start();
      
        $this->load->view('accounts/videoHelp', get_defined_vars());
        echo $html_content = ob_get_clean();
        
        
    }

   
    }


      
   

  


        
    