<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Smsconfig extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('smsgateway');
        

        $ini_whatsapp_delay[] = array('id' => 3000, "name" => "3 Seconds");
        $ini_whatsapp_delay[] = array('id' => 5000, "name" => "5 Seconds");
        $ini_whatsapp_delay[] = array('id' => 7000, "name" => "7 Seconds");
        $ini_whatsapp_delay[] = array('id' => 9000, "name" => "9 Seconds");
        $this->delay_array=$ini_whatsapp_delay;
        $this->sms_connected_devices=@$this->getSMSDevices();

    }
    public function test(){

        $phone="03099914748";
        $message="sas";
        $this->sendWhatsapptext(array(array("text"=>$message,'to'=>"03099914748")),true);

    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('sms_setting', 'can_view')) {
            access_denied();
        }

        $messages[] = array("to" => "+923099914748", "text" => "Hello 1");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 2");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 3");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 4");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 5");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 6");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 7");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 8");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 9");
        $messages[] = array("to" => "+923099914748", "text" => "Hello 10");

        //tesing
   //    $this->sendSMS($messages);
     

        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'smsconfig/index');
        $data['title'] = 'SMS Config List';
        $data['ini_whatsapp_delay'] =$this->delay_array;
        $data['whatsapp_devices'] =$this->whatsapp_model->get();
        $data['sms_devices'] = $this->sms_connected_devices;
        $this->load->view('layout/header', $data);
        $this->load->view('smsconfig/smsList', $data);
        $this->load->view('layout/footer', $data);
    }
    public function add_whatsapp_account()
    {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('device_name', $this->lang->line('device_name'), 'required');
        $this->form_validation->set_rules('delay', $this->lang->line('delay'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'device_name' => $this->input->post('device_name'),
                'delay' => $this->input->post('delay'),
                'is_active' => 0,
            );
         
            $this->whatsapp_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Whatsapp Device is Created Successfully</div>');
            redirect('smsconfig');


    }
}
    public function test_sms()
    {
        $phone = $this->input->post('test_phone');
        $khan = $this->smsgateway->sendSMS($phone, "", "Hi , Test SMS Gateway");

        echo json_encode(array('st' => 0, 'msg' => "Request Submitted , Please Validate Your Request"));
    }

    public function clickatell()
    {

        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('clickatell_api_id', $this->lang->line('api_id'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'clickatell',
                'api_id' => $this->input->post('clickatell_api_id'),
                'senderid' => $this->input->post('clickatell_sim_use'),
                'contact' => $this->input->post('clickatell_whatsapp_id'),
                'username' => $this->input->post('clickatell_whatsapp_token'),
                'url' => $this->input->post('clickatell_whatsapp_template'),
                'is_active' => $this->input->post('clickatell_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'clickatell_api_id' => form_error('clickatell_api_id'),
                'clickatell_status' => form_error('clickatell_status'),
            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function twilio()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('twilio_account_sid', $this->lang->line('account_id'), 'required');
        $this->form_validation->set_rules('twilio_auth_token', $this->lang->line('auth_token'), 'required');
        $this->form_validation->set_rules('twilio_sender_phone_number', $this->lang->line('phone_number'), 'required');
        $this->form_validation->set_rules('twilio_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'twilio',
                'api_id' => $this->input->post('twilio_account_sid'),
                'password' => $this->input->post('twilio_auth_token'),
                'contact' => $this->input->post('twilio_sender_phone_number'),
                'is_active' => $this->input->post('twilio_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'twilio_account_sid' => form_error('twilio_account_sid'),
                'twilio_auth_token' => form_error('twilio_auth_token'),
                'twilio_sender_phone_number' => form_error('twilio_sender_phone_number'),
                'twilio_status' => form_error('twilio_status'),
            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function custom()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('name', $this->lang->line('name'), 'required');
        $this->form_validation->set_rules('custom_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'custom',
                'name' => $this->input->post('name'),
                'is_active' => $this->input->post('custom_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'name' => form_error('name'),
                'custom_status' => form_error('custom_status'),
            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function msgnineone()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('authkey', $this->lang->line('auth_key'), 'required');
        $this->form_validation->set_rules('senderid', $this->lang->line('sender_id'), 'required');
        $this->form_validation->set_rules('msg_nineone_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'msg_nineone',
                'authkey' => $this->input->post('authkey'),
                'senderid' => $this->input->post('senderid'),
                'is_active' => $this->input->post('msg_nineone_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'authkey' => form_error('authkey'),
                'senderid' => form_error('senderid'),
                'msg_nineone_status' => form_error('msg_nineone_status'),
            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function smscountry()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('smscountry', $this->lang->line('username'), 'required');
        $this->form_validation->set_rules('smscountrypassword', $this->lang->line('password'), 'required');
        $this->form_validation->set_rules('smscountrysenderid', $this->lang->line('sender_id'), 'required');
        $this->form_validation->set_rules('smscountry_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'smscountry',
                'username' => $this->input->post('smscountry'),
                'password' => $this->input->post('smscountrypassword'),
                'senderid' => $this->input->post('smscountrysenderid'),
                'is_active' => $this->input->post('smscountry_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'smscountry' => form_error('smscountry'),
                'smscountrypassword' => form_error('smscountrypassword'),
                'smscountrysenderid' => form_error('smscountrysenderid'),
                'smscountry_status' => form_error('smscountry_status'),
            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function textlocal()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('text_local', $this->lang->line('username'), 'required');
        $this->form_validation->set_rules('text_localpassword', $this->lang->line('password'), 'required');
        $this->form_validation->set_rules('text_localsenderid', $this->lang->line('sender_id'), 'required');
        $this->form_validation->set_rules('text_local_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'text_local',
                'username' => $this->input->post('text_local'),
                'password' => $this->input->post('text_localpassword'),
                'senderid' => $this->input->post('text_localsenderid'),
                'is_active' => $this->input->post('text_local_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'text_local' => form_error('text_local'),
                'text_localpassword' => form_error('text_localpassword'),
                'text_localsenderid' => form_error('text_localsenderid'),
                'text_local_status' => form_error('text_local_status'),

            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function bulk_sms()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('bulk_sms_user_name', $this->lang->line('username'), 'required');
        $this->form_validation->set_rules('bulk_sms_user_password', $this->lang->line('password'), 'required');
        $this->form_validation->set_rules('bulk_sms_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'bulk_sms',
                'username' => $this->input->post('bulk_sms_user_name'),
                'password' => $this->input->post('bulk_sms_user_password'),
                'is_active' => $this->input->post('bulk_sms_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));
        } else {

            $data = array(
                'bulk_sms_user_name' => form_error('bulk_sms_user_name'),
                'bulk_sms_user_password' => form_error('bulk_sms_user_password'),
                'bulk_sms_status' => form_error('bulk_sms_status'),

            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }

    public function mobireach()
    {

        $this->form_validation->set_error_delimiters('', '');

        $this->form_validation->set_rules('mobireach_auth_key', $this->lang->line('auth_Key'), 'required');
        $this->form_validation->set_rules('mobireach_sender_id', $this->lang->line('sender_id'), 'required');
        $this->form_validation->set_rules('mobireach_route_id', $this->lang->line('route_id'), 'required');
        $this->form_validation->set_rules('mobireach_status', $this->lang->line('status'), 'required');

        if ($this->form_validation->run()) {

            $data = array(
                'type' => 'mobireach',
                'authkey' => $this->input->post('mobireach_auth_key'),
                'senderid' => $this->input->post('mobireach_sender_id'),
                'api_id' => $this->input->post('mobireach_route_id'),
                'is_active' => $this->input->post('mobireach_status'),
            );
            $this->smsconfig_model->add($data);
            echo json_encode(array('st' => 0, 'msg' => $this->lang->line('update_message')));

        } else {

            $data = array(
                'mobireach_auth_key' => form_error('mobireach_auth_key'),
                'mobireach_sender_id' => form_error('mobireach_sender_id'),
                'mobireach_route_id' => form_error('mobireach_route_id'),
                'mobireach_status' => form_error('mobireach_status'),

            );

            echo json_encode(array('st' => 1, 'msg' => $data));
        }
    }
function setDefaultSim()  {
    db::query("UPDATE sch_settings set default_sim =".$_REQUEST['default_sim']." where id=".getSchoolID());
   echo "SET SUCCESS0";
}
 

}