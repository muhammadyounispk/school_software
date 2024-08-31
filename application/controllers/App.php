<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class App extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('setting_model');
        $this->load->model('user_model');
        $this->load->helper('custom_helper');
    }

    public function index()
    {
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $username = $this->input->get("username");
            $setting_result = $this->user_model->getSchoolURL($username);
         


    if($setting_result->host){
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(200)
                ->set_output(json_encode(array(
                    'status'                      => 200,
                
                    'url'                      => "https://".$setting_result->host."/api/",
                    'site_url'                 =>"https://". $setting_result->host."/",
                    'app_logo'                 => $setting_result->app_logo,
                    'app_primary_color_code'   => "#1F74C1",
                    'app_secondary_color_code' => "#daf6fc",
                    'lang_code'                => "en-US",
                    'username'                => $username,
                    'session_id'                => $setting_result->session_id,
                    
                )));
                
    }else{
        
         return $this->output
                ->set_content_type('application/json')
                ->set_status_header(200)
                ->set_output(json_encode(array(
                     'status'                      => 201,
                    'url'                      => "https://".$setting_result->host."/api/",
                    'site_url'                 =>"https://". $setting_result->host."/",
                    'app_logo'                 => $setting_result->app_logo,
                    'app_primary_color_code'   => "#1F74C1",
                    'app_secondary_color_code' => "#daf6fc",
                    'lang_code'                => "en-US",
                    'username'                => $username,
                    'session_id'                => $setting_result->session_id,
                )));
                
    }
        } else {
            return $this->output
                ->set_content_type('application/json')
                ->set_status_header(405)
                ->set_output(json_encode(array(
                    'error' => "Method Not Allowed",
                )));
        }
    }

    public function zoom()
    {

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL            => "https://api.zoom.us/v2/users?status=active&page_size=30&page_number=1",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING       => "",
            CURLOPT_MAXREDIRS      => 10,
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_HTTP_VERSION   => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST  => "GET",
            CURLOPT_HTTPHEADER     => array(
                "authorization: Bearer sY6xc8tAS7Wj8-MXyXxheg",
                "content-type: application/json",
            ),
        ));

        $response = curl_exec($curl);
        $err      = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            echo $response;
        }
    }

    function getProgress()  {
    $progress=db::getRecord("SELECT* from progress where school_id=".getSchoolID());
        $per= isset($progress['job']) && $progress['done']? round($progress['job']/$progress['done']*100,2):'No Progress';
        echo $per;
    }

}
