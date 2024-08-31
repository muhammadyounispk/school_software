<?php

use PhpOffice\PhpWord\Writer\HTML\Part\Head;

define('THEMES_DIR', 'themes');
define('BASE_URI', str_replace('index.php', '', $_SERVER['SCRIPT_NAME']));

class MY_Controller extends CI_Controller
{

    protected $langs = array();

    public function __construct()
    {

        parent::__construct();
        $this->config->load('license');
        $this->load->helper('language');
        $this->load->library('auth');
        $this->load->library('module_lib');
        $this->load->library('pushnotification');
        $this->load->library('jsonlib');

        $this->load->helper(array('directory', 'customfield', 'custom'));
        $this->load->model(array('setting_model', 'customfield_model', 'onlinestudent_model', 'houselist_model', 'onlineexam_model', 'onlineexamquestion_model', 'onlineexamresult_model', 'examstudent_model', 'admitcard_model', 'marksheet_model', 'chatuser_model', 'examgroupstudent_model', 'examgroup_model', 'batchsubject_model'));

        if ($this->session->has_userdata('admin')) {

            $admin = $this->session->userdata('admin');
            $language = ($admin['language']['language']);
        } else if ($this->session->has_userdata('student')) {

            $student = $this->session->userdata('student');
            $language = ($student['language']['language']);
        } else {
            $this->school_details = $this->setting_model->getSchoolDetail();
            $language = ($this->school_details->language);
        }

        $this->config->set_item('language', $language);
        $lang_array = array('form_validation_lang');
        // $lang_array = array('db_lang');
        $map = directory_map(APPPATH . "./language/" . $language . "/app_files");
        foreach ($map as $lang_key => $lang_value) {
            $lang_array[] = 'app_files/' . str_replace(".php", "", $lang_value);
        }

        $this->load->language($lang_array, $language);
        $this->auto_voucher = array(0 => 'None', 1 => 'monthly', 2 => 'yearly');

        //Configure the wahsatsapp message , use it globaly
        //active only
        $this->db->select("*");
        $this->db->where("school_id", getSchoolID());
        $this->db->where("is_active", 1);
        $this->db->from("whatsapp_devices");
        $active = $this->db->get();
        $this->active_wa_devices = $active->result_array();
        if ($this->active_wa_devices) {
            $this->delay_arr = array_column($this->active_wa_devices, "delay", 'id');
        }
        //ACTIVE SMS GATEWAY
        $this->sms_settings = $this->smsconfig_model->getActiveSMS();
        $this->current_session = $this->setting_model->getCurrentSession();
        $this->current_voucher_id=$this-> getActiveVoucher();
        $this->smsdevice=$this->session->userdata("device_id");
        $_SESSION['SMS_APP_ID']=$this->sms_settings->api_id;
        $_SESSION['DEVICES']=json_encode($this->smsdevice);
        $_SESSION['wa_active_devices']=$this->active_wa_devices;
        $_SESSION['delay_arr']=$this->delay_arr ;

       


        
    }

    function getActiveVoucher() {
            $this->db->select('fee_session_groups.*,fee_groups.name as `group_name`');
            $this->db->from('fee_session_groups');
            $this->db->join('fee_groups', 'fee_groups.id = fee_session_groups.fee_groups_id');
            $this->db->where('fee_session_groups.session_id', $this->current_session);
            $this->db->where('fee_groups.is_system', 0);
            $this->db->where('fee_groups.is_active',1);
            $this->db->where('fee_session_groups.school_id', getSchoolID());
            $query = $this->db->get();
            $result = $query->result();
            return isset($result[0]->id) ? $result[0]->id:'';
        
    }

   public  function generateAccountNumber() {
        $unique = false;
        $accountNumber = '';
    
        // Loop until a unique account number is generated
        while (!$unique) {
            $accountNumber = str_pad(rand(1, 9999999999), 10, '0', STR_PAD_LEFT); // Generate a random 10-digit number
    
            // Check if the generated account number already exists in the database
            $query = "SELECT COUNT(*) FROM students WHERE id = '$accountNumber' ";
            $count=db::getCell($query);
            if ($count == 0) {
                $unique = true; // Account number is unique
            }
        }
    
        return $accountNumber;
    }
   public  function getSessionID($school_id) {
            $query = "SELECT session_id  FROM sch_settings WHERE id = '$school_id' ";
            $session_id=db::getCell($query);
            return $session_id;
           
    }


    public function sendBothText($messages)
    {
        $sms=$this->sendSMS($messages,true);
        $whatspp=$this->sendWhatsapptext($messages,true);
        $message="";
        if($sms){
            $message.= "=> SMS SENT <br> ";
        }else{
            $message.= "=> SMS ERROR  <br>";
        }
        if($whatspp){
            $message.= "=> WHATSAPP SENT <br> ";
        }else{
            $message.= "=> WHATSAPP ERROR  <br> ";
        }

        echo json_encode(array('type'=>'both','code'=>200,'message'=> $message));
        


    }

    public function sendWhatsapptext($messages,$return=false)
    {
        
        foreach ($messages as $key => $value) {
            $url="https://".$_SERVER['HTTP_HOST']."/site/userlogin";
            $messages[$key]['text']=$value['text']."\n*FROM*:\n_*".getSchoolInfo('name')."*_\n*Phone:*".getSchoolInfo('phone')."\n*Email:* ".getSchoolInfo('email')."\n-----------\n*Portal*: ".$url;
                 }
        

        $split_at_devices = splitMessagesEqually($this->active_wa_devices,  $messages);
        if ($split_at_devices) {
            foreach ($split_at_devices as $device_id => $message) {
              
                $session = $device_id . "_" . $_SERVER['HTTP_HOST'];
                $delay = $this->delay_arr[$device_id];
                $curl = curl_init();
                
                curl_setopt_array($curl, array(
                    CURLOPT_URL => WHATSAPP_SERVER . '/sendMessageBulk',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => '{
                        "delay":"' . $delay . '",
                        "session":"' . $session . '",
                         "data":' . $message . '
                               }
                                     ',
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json'
                    ),
                ));

                 $response = curl_exec($curl);

                   
                
                
                if(!$return){
                    echo json_encode(array('type'=>'whatsapp','code'=>200,'message'=> "whatsapp Added in  Queued"));
                }else{
                    return true;
                }
                 

                curl_close($curl);
             
            }
        }else{
            if(!$return){
                echo json_encode(array('type'=>'whatsapp','code'=>200,'message'=> "whatsapp Added in  Queued"));

            }else{
                return true;
            }
        }
    }
    public function sendWhatsappFile($messages,$return=false)
    {

        $split_at_devices = splitMessagesEqually($this->active_wa_devices,  $messages);
        if ($split_at_devices) {
            foreach ($split_at_devices as $device_id => $message) {
                $session = $device_id . "_" . $_SERVER['HTTP_HOST'];
                $delay = $this->delay_arr[$device_id];
                $curl = curl_init();

                    curl_setopt_array($curl, array(
                    CURLOPT_URL => WHATSAPP_SERVER . '/sendDocument',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => '{
                        "delay":"' . $delay . '",
                        "session":"' . $session . '",
                        "data":[
                            {
                            "to":"'. $messages['to'].'",
                            "text":"'. $messages['text'].'",
                            "filename":"'. $messages['filename'].'",
                            "media":"'. $messages['link'].'"
                            }
                            ]
                               }
                                     ',
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json'
                    ),
                    ));

                $response = curl_exec($curl);

                   
                
                
                if(!$return){
                    echo json_encode(array('type'=>'whatsapp','code'=>200,'message'=> "whatsapp Added in  Queued"));
                }else{
                    return true;
                }
                 

                curl_close($curl);
             
            }
        }else{
            if(!$return){
                echo json_encode(array('type'=>'whatsapp','code'=>200,'message'=> "whatsapp Added in  Queued"));

            }else{
                return true;
            }
        }
    }


    public function sendSMS($messages,$return =false)
    {
       
        

        $device[] = array("id" => "1");
        $split_at_devices = splitMessagesEqually($device,  $messages);
        if ($split_at_devices) {
            foreach ($split_at_devices as $device_id => $message) {
                $message = json_decode($message, true);


                foreach ($message as $key => $value) {
                    $message[$key]['number'] = "+".$value['to'];
                    $message[$key]['message'] = str_replace('*','',$value['text'])."\nFrom: ".getSchoolInfo('name');
                    unset($message[$key]['to']);
                    unset($message[$key]['text']);
                }

                $url = SMS_SERVER . "/services/send.php";
                $postData = [
                    'messages' => json_encode($message),
                    'schedule' => null,
                    'key' => $this->sms_settings->api_id,
                    'devices' => json_encode($this->smsdevice),
                    'option' => 0,
                    'useRandomDevice' => true
                ];
         
             $reply=   sendRequest($url, $postData);
             if(!$return){

             
             if($reply['error']){
                echo json_encode(array('type'=>'sms','code'=>404,'message'=> $reply['error']['message']));
             }else{
                echo json_encode(array('type'=>'sms','code'=>200,'message'=> $reply['message']));
             }

            }else{
                if($reply['error']){
                    return false;

                }else{
                    return true;
                 }
            }
            
              
            
            }
        }
    }
  
   public  function getSMSDevices() {
    if($this->sms_settings){
        $url = SMS_SERVER . "/services/get-devices.php";
        $postData = [
            'key' => $this->sms_settings->api_id
        ];
     return sendRequest($url, $postData)["data"]['devices'];
    }
    }



    function DownloadAdmissionForm($student)  {
        require_once(APPPATH . 'third_party/phpWord/autoload.php');
        $template = new PhpOffice\PhpWord\TemplateProcessor(ADMISSION_FORM);


        $vars=$template->getVariables();
        $vars['print_date_time']=date("d/m/Y h:i:s a");
        if( $vars){
        foreach ($vars as $key => $value) {
            $template->setValue('${'.$value.'}', isset($student[$value])? $student[$value]: '');
        }
       
        // Save the modified document
        $outputFile =str_encode($student['id']).'.docx';

        $template->saveAs(STUDENT_ADMISSION_FORM.$outputFile);
        return STUDENT_FORM_HTTPS.$outputFile;
       
        
        

    }
        


        
        
    }


    function DownloadAdmissionFormSample($student)  {
     
        return SAMPLE_ADMISSION_FORM_HTTPS;
       
    }

    

    function getStudentFeeforOnlinePayment($student_id=66) {
       
        $student=db::getRecord("SELECT s.*,ss.id as student_session_id from students s inner join student_session ss on ss.student_id=s.id where s.id=$student_id");
        if($student){
      
        
        $total=$student['fee']+$student['arrears'];
        $total_after=$total;
        $fine=0;
        $student['payable_before']=$total;
        $student['payable_after']=$total_after;
        $student['fine_amount']=$fine;
        $student['due_date']=  date('Y-m-d');
        $student['fees']= $total;
        return $student;  
    }       
      
    }

    public function MarkAsFeeFullPaid($student_id=66,$paid_via){
        $mode = $paid_via->bankMnemonic;
        $txn_id = $paid_via->authId;
        $feegroup=$this->getStudentFeeforOnlinePayment($student_id);
        $school_id=$feegroup['school_id'];
       
        $send_to=$feegroup['mobileno'];
        if(isset($feegroup['fees'])){
            $feeses=$feegroup['fees'][0]->fees;
            foreach ($feeses as $key => $fee) {
                $json_array = array(
                    'amount' => $fee->amount,
                    'date' => date('Y-m-d'),
                    'amount_discount' => 0,
                    'amount_fine' => 0,
                    'description' => "Fee Paid Using $mode Transaction ID " . $txn_id,
                    'received_by' => '',
                    'payment_mode' => $mode,
                );
                $data = array(
                    'student_fees_master_id' => $fee->id,
                    'fee_groups_feetype_id' => $fee->fee_groups_feetype_id,
                    'amount_detail' => $json_array
                );
                   $this->studentfeemaster_model->fee_deposit($data, $send_to,null,$school_id);

            }
        }
      }



    function CalcululateTotalPayable($studentfee) {
        $total=0;
        foreach ($studentfee[0]->fees as $key => $fee) {
          if(!$fee->amount_detail){
            $total+=$fee->amount;
          }
        }
       
        return $total;
    }
    
     public  function LoadTemplate($template_name = 'demo.tpl')
    {
        require_once(APPPATH . 'third_party/twig/autoload.php');
        $loader = new \Twig\Loader\FilesystemLoader(TPL_PATH);
        $twig = new \Twig\Environment($loader, [
            // Optional configuration options
        ]);
        try {
            $data = $twig->render($template_name, (array) $this);
            return $data;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
    
     public  function create_pdf($data, $file_name, $download = FALSE)
    {
       
        include_once APPPATH . '/third_party/unispdf/autoload.php';
        $hrml="<style>
        @page { margin: 0px; }
        body { margin: 0px; }
        
        ".file_get_contents($_SERVER['DOCUMENT_ROOT']."/backend/dist/css/reports.css")."</style>";
        


        $path = $_SERVER['DOCUMENT_ROOT'].  '/uploads/digis/'.getSchoolID().'/';
        $path_HTTP ="https://". $_SERVER['HTTP_HOST'].  '/uploads/digis/'.getSchoolID().'/';
        if(!file_exists( $path)){
            mkdir($path,0755);
        }
       
        $dompdf = new \Dompdf\Dompdf();
        $dompdf-> set_option('isRemoteEnabled', true);
        if(strpos($file_name,'_Detailed')){
            $dompdf->set_paper('A4', 'landscape');
            $hrml.="<style>table{font-size: 0.6rem!important}</style>";

        }

        $hrml.=$data;
        $dompdf->loadHtml($hrml);
        $dompdf->render();
        //$dompdf->getCanvas()->page_text(560, 25, "{PAGE_NUM} of {PAGE_COUNT}", NULL, 10, array(0, 0, 0));
        $file_name=str_encode($file_name);
        $pdf = $path . $file_name;
        
        file_put_contents($pdf, $dompdf->output());
        $url=$path_HTTP.$file_name;
        return array("file"=> $pdf,'url'=>$url );
       
    }




    public function SystemWhatsapp($phone="923099914748",$name="muhammad younis",$message='otp is 45346',$header_img='otp.png') {
        include_once APPPATH . '/third_party/whatsapp/autoload.php';
        $whatsapp_cloud_api = new Netflie\WhatsAppCloudApi\WhatsAppCloudApi([
            'from_phone_number_id' => '112985921665237',
            'access_token' => 'EAAHBWmtSq7oBACLqxnyRbNfsY7fjUBiwzi5SJzPb2M8ZAwmcd1qdvE5OFYYkvHBhAkWQTZBWAmUZA6gpxZAZC9I4RkCMmm1FmomrR3bYVGPeN5ovbP5DQzTIMCjLvZCjP8o5mDUEIZCTXFJz9qaeGHAfPNDkFtpHn2kebGjyyeRQ4vZCE1ZAZCbIwc',
        ]);

        $img=DIGIS_HTTP.'otp.png';
  
        
        $component_header = [
            ["type" => "image", "image" => ["link" => DIGIS_HTTP.$header_img]]
        ];
        
        
        $component_body = [
            [
                'type' => 'text',
                'text' => $name,
            ],
            [
                'type' => 'text',
                'text' => $message,
            ]
        ];
        
      
        
        $components = new Netflie\WhatsAppCloudApi\Message\Template\Component($component_header, $component_body, array());
        try {
          $res=$whatsapp_cloud_api->sendTemplate($phone, 'sms ', 'ur', $components); // Language is optional
          $arr=json_decode($res->body());
          
          $mid= $arr->messages[0]->id;
          return responseJson("Whatsapp sent Success #$mid",200);
      }
      catch (GuzzleHttp\Exception\ClientException $e) {
          $response = $e->getResponse();
          $responseBodyAsString = $response->getBody()->getContents();
          return responseJson($responseBodyAsString,201);

      }

        
        
    }


public function setData($name,$data) {
    $this->session->set_userdata($name,$data);
}
public function getData($name,$clear=false) {
   $data= $this->session->userdata($name);
   
   if($clear){
     $this->session->unset_userdata($name);
   }

   return $data;
}
   





public function showResponse($code=200,$data=array()){
             $data['request_status']=$code;
        echo json_encode($data);
}



function makePDF($html, $file_name)  {
    include_once APPPATH . '/third_party/unispdf/autoload.php';
    $hrml="<style>".file_get_contents($_SERVER['DOCUMENT_ROOT']."/backend/dist/css/reports.css")."</style>";
    $hrml.=$html??'No Data';


    $path = $_SERVER['DOCUMENT_ROOT'].  '/uploads/digis/'.getSchoolID().'/';
    if(!file_exists( $path)){
        mkdir($path,0755);
    }
   
    $dompdf = new \Dompdf\Dompdf();
    $dompdf-> set_option('isRemoteEnabled', true);
    if(strpos($file_name,'_Detailed')){
        $dompdf->set_paper('A4', 'landscape');
        $hrml.="<style>table{font-size: 0.6rem!important}</style>";

    }

    $file_name="download";
    $dompdf->loadHtml($hrml);
    $dompdf->render();
    //$dompdf->getCanvas()->page_text(560, 25, "{PAGE_NUM} of {PAGE_COUNT}", NULL, 10, array(0, 0, 0));
    $pdf = $path . $file_name . '.pdf';
    file_put_contents($pdf, $dompdf->output());
    header('Cache-Control: no-cache, no-store, must-revalidate'); // HTTP 1.1
    header('Pragma: no-cache'); // HTTP 1.0
    header('Expires: 0');
    $dompdf->stream($file_name, array('Attachment' => 1));
    
}

}










class Admin_Controller extends MY_Controller
{

    protected $aaaa = false;

    public function __construct()
    {
        parent::__construct();
        $this->auth->is_logged_in();
        $this->check_license();
        $this->load->library('rbac');
        $this->config->load('app-config');
        $this->load->model(array('batchsubject_model', 'examgroup_model', 'examsubject_model', 'examgroupstudent_model', 'feereminder_model', 'filetype_model'));
        $this->load->model('whatsapp_model');
        $this->config->load('ci-blog');
        $this->config->load('custom_filed-config');

        $this->allowme=$this->rbac->getAllPermissions();
        $this->base_url=base_url() ;

        $this->isSupperAdmin= $this->session->userdata['admin']['roles']['Super Admin']??false;
        $this->whoiam= $this->session->userdata['admin']??false;
   
      
      
















    }

    public function check_license()
    {
        return true;
    }


}
class Admin_ControllerWithOutLogin extends MY_Controller
{

    protected $aaaa = false;

    public function __construct()
    {
        parent::__construct();
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        $this->config->load('app-config');
        $this->load->model(array('batchsubject_model', 'examgroup_model', 'examsubject_model', 'examgroupstudent_model', 'feereminder_model', 'filetype_model'));
        $this->load->model('whatsapp_model');
        $this->config->load('ci-blog');
        $this->config->load('custom_filed-config');


    }

    public function check_license()
    {
        return true;
    }
}

class Student_Controller extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('studentmodule_lib');
        $this->config->load('app-config');
        $this->auth->is_logged_in_user('student');
    }
}

class Public_Controller extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
    }
}

class Parent_Controller extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->auth->is_logged_in_user('parent');
        $this->config->load('app-config');
        $this->load->library('parentmodule_lib');
    }
}

class Front_Controller extends CI_Controller
{

    protected $data = array();
    protected $school_details = array();
    protected $parent_menu = '';
    protected $page_title = '';
    protected $theme_path = '';
    protected $front_setting = '';

    public function __construct()
    {

        parent::__construct();

       

        if ($this->config->item('installed') == true) {

            $this->db->reconnect();
        }
        $this->load->helper('language');
        $this->school_details = $this->setting_model->getSchoolDetail();

        $this->load->model('frontcms_setting_model');

        $this->front_setting = $this->frontcms_setting_model->get();

        if (!$this->front_setting) {

            redirect('site/userlogin');
        } else {

            if (!$this->front_setting->is_active_front_cms) {

                redirect('site/userlogin');
            }
        }

        $this->theme_path = $this->front_setting->theme;
        //================
        $language = ($this->school_details->language);
        $this->load->helper('directory');
        $lang_array = array('form_validation_lang');
        $map = directory_map(APPPATH . "./language/" . $language . "/app_files");
        foreach ($map as $lang_key => $lang_value) {
            $lang_array[] = 'app_files/' . str_replace(".php", "", $lang_value);
        }

        $this->load->language($lang_array, $language);
        //===============

        $this->load->config('ci-blog');
    }

    protected function load_theme($content = null, $layout = true)
    {

        $this->data['main_menus'] = '';
        $this->data['school_setting'] = $this->school_details;
        $this->data['front_setting'] = $this->front_setting;
        $menu_list = $this->cms_menu_model->getBySlug('main-menu');

        $footer_menu_list = $this->cms_menu_model->getBySlug('bottom-menu');
        if (count($menu_list) > 0) {
            $this->data['main_menus'] = $this->cms_menuitems_model->getMenus($menu_list['id']);
        }

        if (count($footer_menu_list) > 0) {
            $this->data['footer_menus'] = $this->cms_menuitems_model->getMenus($footer_menu_list['id']);
        }
        $this->data['header'] = $this->load->view('themes/' . $this->theme_path . '/header', $this->data, true);

        $this->data['slider'] = $this->load->view('themes/' . $this->theme_path . '/home_slider', $this->data, true);

        $this->data['footer'] = $this->load->view('themes/' . $this->theme_path . '/footer', $this->data, true);

        $this->base_assets_url = 'backend/' . THEMES_DIR . '/' . $this->theme_path . '/';

        $this->data['base_assets_url'] = BASE_URI . $this->base_assets_url;
        $is_captcha = $this->captchalib->is_captcha('admission');
        $this->data["is_captcha"] = $is_captcha;

        // if ($layout == true) {
        $this->data['content'] = (is_null($content)) ? '' : $this->load->view(THEMES_DIR . '/' . $this->theme_path . '/' . $content, $this->data, true);
        $this->load->view(THEMES_DIR . '/' . $this->theme_path . '/layout', $this->data);
        // } else {
        //     $this->load->view(THEMES_DIR . '/' . $this->config->item('ci_blog_theme') . '/' . $content, $this->data);
        // }
    }

    protected function load_theme_form($content = null, $layout = true)
    {

        $this->data['main_menus'] = '';
        $this->data['school_setting'] = $this->school_details;
        $this->data['front_setting'] = $this->front_setting;
        $menu_list = $this->cms_menu_model->getBySlug('main-menu');
        $footer_menu_list = $this->cms_menu_model->getBySlug('bottom-menu');
        if (count($menu_list > 0)) {
            $this->data['main_menus'] = $this->cms_menuitems_model->getMenus($menu_list['id']);
        }

        if (count($footer_menu_list > 0)) {
            $this->data['footer_menus'] = $this->cms_menuitems_model->getMenus($footer_menu_list['id']);
        }
        $this->data['header'] = $this->load->view('themes/' . $this->theme_path . '/header', $this->data, true);

        $this->data['slider'] = $this->load->view('themes/' . $this->theme_path . '/home_slider', $this->data, true);

        $this->data['footer'] = $this->load->view('themes/' . $this->theme_path . '/footer', $this->data, true);

        $this->base_assets_url = 'backend/' . THEMES_DIR . '/' . $this->theme_path . '/';

        $this->data['base_assets_url'] = BASE_URI . $this->base_assets_url;

        // if ($layout == true) {
        $this->data['content'] = (is_null($content)) ? '' : $this->load->view(THEMES_DIR . '/' . $this->theme_path . '/' . $content, $this->data, true);
        $this->load->view(THEMES_DIR . '/' . $this->theme_path . '/layout', $this->data);
        // } else {
        //     $this->load->view(THEMES_DIR . '/' . $this->config->item('ci_blog_theme') . '/' . $content, $this->data);
        // }
    }
    
    

  
}
