<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class WhatsappWebhook extends CI_Controller
{

  

    /**
     * This is default constructor of the class
     */
    public function __construct($key = "")
    {
        parent::__construct();
        $this->institute = $this->setting_model->getSetting();
        $this->load->helper("custom_helper");
        $this->devide_id=$this->input->get('device_id');
        $this->key=$this->input->get('key');
        if(!$this->key=='IlovePakistan@786'){
            echo json_encode(array("code"=>403,"message"=>"Invalid Request Key"));
            exit("");
        } 
        if($this->devide_id==''){
            echo json_encode(array("code"=>201,"message"=>"Device ID Not Supplied"));
            exit("");
        } 
        
    }

    public function index()
    {
       
      
    }
    public function Disconnect()
    {     
        $this->db->query("UPDATE `whatsapp_devices` SET `is_active` = 0 WHERE `id` = '".$this->devide_id."'");
        echo json_encode(array("code"=>200,"message"=>"Device Disconnected Successfully"));

       
      
    }
    public function Connect()
    {     
        $this->db->query("UPDATE `whatsapp_devices` SET `is_active` = 1 WHERE `id` = '".$this->devide_id."'");
        echo json_encode(array("code"=>200,"message"=>"Device Connected Successfully"));
        
        
        
    }
    public function OnMessageReceived()
    {     
        $rawData = file_get_contents('php://input');
        file_put_contents("dd.txt",$rawData);
        $array=(array)json_decode($rawData);
        $db_array['sender']=$array['verifiedBizName'];
        $db_array['device_id']=explode("_",$array['sessionId'])[0];
        $db_array['number']=$array['pushName'];
        $db_array['message']=$array['message']->conversation;
        $db_array['fromMe']=$array['key']->fromMe;
        $db_array['data']=$rawData;
        $db_array['school_id']=getSchoolID();
        $this->db->insert("whatsapp_messages",$db_array);
        echo json_encode(array("code"=>200,"message"=>"Event has bene handled Successfully"));
        

       
      
    }

  
    

}
