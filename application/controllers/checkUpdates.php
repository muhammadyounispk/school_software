<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Checkupdatesofsystem extends Admin_Controller 
{

    public function __construct()
    {
        parent::__construct();
        $this->school_id=$this->session->school_id;
        $this->institute = $this->setting_model->getSetting();
        $this->load->library('smsgateway');
        $this->sms_connected_devices=@$this->getSMSDevices();
   
    }







    function DeleteDevice()
    {
        $id = str_decode($this->input->get('device_id'));
        $this->db->where("id", $id)->delete("whatsapp_devices");
        redirect('smsconfig');
    }
    public function index()
    {
        if (!$this->rbac->hasPrivilege('sms_setting', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'smsconfig/index');
    }

    function Disconnected()
    {
        $curl = curl_init();
        $id = str_decode($this->input->get('device_id'));
        $session = $id . "_" . HOST_NAME;
        curl_setopt_array(
            $curl,
            array(
                CURLOPT_URL => WHATSAPP_SERVER . "/logout?session=$session&scan=true",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'GET',
            )
        );
        $response = curl_exec($curl);
        curl_close($curl);
        $this->db->query("UPDATE `whatsapp_devices` SET `is_active` = 0 WHERE `id` = '$id'");
        $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Whatsapp Device Disconnected Successfully</div>');
        redirect('smsconfig');
    }
 

    public function ScanQR()
    {
        $id = str_decode($this->input->post('device_id'));
        $device = $id . "_" . HOST_NAME;
        $curl = curl_init();
        curl_setopt_array(
            $curl,
            array(
                CURLOPT_URL => WHATSAPP_SERVER . '/scanQR?session=' . $device . '&scan=true',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'GET',
            )
        );
        $response = curl_exec($curl);
        if (strpos($response, "message")) {
            echo "Connected";
        } else {
            echo $response;
        }
        curl_close($curl);
    }
    public function CheckScan()
    {

        $id = str_decode($this->input->post('device_id'));
        $this->db->select("is_active");
        $this->db->where("id", $id);
        $this->db->from("whatsapp_devices");
        $rs = $this->db->get();

        if ($rs->row()->is_active == 1) {
            echo json_encode(array("code" => 200, "message" => "Your Device has been Conneced"));
        } else {
            echo json_encode(array("code" => 201, "message" => "Please Scan Above QR Code Using Whatsapp"));
        }
    }
    public function SMSQRCode()
    {


        $admin = $this->session->admin;
        $school_id = $this->institute->id;
        $email = $admin['email'];
        // $email="shahidhassnain82@gmail.com";   //debug
        $name = $admin['sch_name'];
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://sms.isdigitalschools.com/ajax/digis_sms_user.php',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array('email' => $email, 'name' => $name),
            CURLOPT_HTTPHEADER => array(
                'Cookie: PHPSESSID=f5dab41d866e5e569d1cf144ed042ba1; SMS_GATEWAY=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2OTA4ODM2NTUsImp0aSI6ImY1ZGFiNDFkODY2ZTVlNTY5ZDFjZjE0NGVkMDQyYmExIiwiaXNzIjoiIiwibmJmIjoxNjkwODgzNjU1LCJleHAiOjE2OTYwNjc2NTUsImRhdGEiOiIifQ.ZDofKc77jR8fmsgfZ2M3i-kCeuW32SLC1a-T3OZBIY4aRGhbq86T68dvJH9pO29VlfdgiKI8VAJaAK4GfaXnxA'
            ),
        ));

        $response = curl_exec($curl);
        //setAPIKEY

        $this->db->select("*");
        $this->db->where("school_id", $school_id);
        $this->db->from("sms_config");
        $rs = $this->db->get();
        $this->sms_config = $rs->result_array();

        $data = json_decode($response);
        $apiKey = $data->apiKey;
        if ($this->sms_config) {
            $sql = "UPDATE `sms_config` SET is_active='enabled' , type='clickatell', api_id = '$apiKey' where  school_id='$school_id'  ";
        } else {
            $sql = "INSERT INTO `sms_config` (`school_id`, `id`, `type`, `name`, `api_id`, `authkey`, `senderid`, `contact`, `username`, `url`, `password`, `is_active`, `created_at`, `updated_at`) VALUES ('$school_id', NULL, 'clickatell', '', '$apiKey', '', '0', '', '', '', NULL, 'enabled', '2023-07-20 16:43:22', NULL);";
        }
        $this->db->query($sql);
        curl_close($curl);
        echo $response;
    }

    function checkSMSDevice()  {
        $current=$this->input->get("current");
        if(isset($this->sms_connected_devices)){
        $updated=count($this->sms_connected_devices);
        if($updated>$current){
            echo json_encode(array("code"=>200,"New SMS Device is added successfully "));

        }else{
            echo json_encode(array("code"=>201,"No new SMS Device is found "));
        }
    }else{
        echo json_encode(array("code"=>201,"No new SMS Device is found "));

    }
        
    }


 

 

   

 
}
