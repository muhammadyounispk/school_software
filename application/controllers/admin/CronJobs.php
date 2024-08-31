<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
} 

class CronJobs extends Admin_ControllerWithOutLogin
{

    public function __construct()
    {

        parent::__construct();

        
        ini_set('memory_limit', '-1');
        $this->load->model("classteacher_model");
        $this->load->model("Staff_model");
        $this->load->model("smsconfig_model");
        $this->load->library('Enc_lib');
        $this->load->library('mailer');
        $this->load->model('smsconfig_model');
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $this->config->load("mailsms");
        $this->load->library('mailsmsconf');




    }

    function newVersionAlert()
    {
       

      $schools=db::getRecords("SELECT* from sch_settings where is_blocked=0");
        $messages=array();

        foreach ($schools as $key => $school){
            $this->school=$school;
            $this->puitc=$puitc=PUITCVersionDetails();
            if(PUITCVersion()>$school['version']){
              $html= $this->LoadTemplate("new_version.html");
              $filename="Software_updates_Version".$puitc['version'].".pdf";
              $path=$this->create_pdf($html,$filename,true,$style = ['mode' => 'utf-8', 'format' => 'A4-P', 'margin_bottom' => 1, 'margin_top' => 5, 'margin_left' => 3, 'margin_right' => 3]);
              $text="*_Dear {$school['name']}  ,_*\\n_we released new version {$puitc['version']} but you are using {$school['version']}_,\\nPlease find full detail in above file  & please login your Institute to Intsall Thank you\\n*Version Released at*:\\n{$puitc['created_at']}\\nRegards,\\n*Technical Team*\\nPUITC -Lahore\\n03099914748";
              $text2="Dear {$school['name']}  , we released new version {$puitc['version']}, please login your Institute to Intsall Thank you ";
             

                $whsatapp['to']=str_replace("+",'',$school['phone']);
                $whsatapp['link']=$path['url'];
                $whsatapp['filename']=$filename; 
                $whsatapp['text']=$text;
                $this->sendWhatsappFile($whsatapp,true);
             sleep(5);

            }
        }

        // $mail['email']="unis.panwar@gmail.com";
        // $mail['subject']="unis.panwar@gmail.com";
        // $mail['body']="unis.panwar@gmail.com";
        // $this->mailsmsconf->sendEmail($mail);

       







    }


    function MakeSoftwareBilling() {
    
        $schools=db::getRecords("select* FROM sch_settings where is_blocked=0");
  
        foreach ($schools as $school) {
        extract($school);
        $data=SoftwareBilling($id);
        pr($data);
        // if($data){
        // if($data['days']<0){
        //     $up['is_locked']=1;
        //     $sql=db::prepUpdateQuery($up,'sch_school',"id",$id);
        //      $sql;
        //     //db::updateRecord($sql);
        // }else{
        //     if($data['days']<10){
        //      $message="Please re-new your school software subcription today";
        //      sendSMS("+923099914748",$message);


        //     }
           
        // }
      
        // }
    }
        
    }


    function MarkAttendance()  {

 
           $student_id=str_decode(@$this->input->get('secure_auth_request'));
       
         @$exist=db::getRecord("SELECT* from students where id=$student_id ");
  
         if(@$exist){
             $date=date("Y-m-d");
             checkAttendance($student_id,1,$date);
             $message="Name: {$exist['firstname']} {$exist['lastname']} is Present On $date";
             sendSMS($exist['mobileno'],$message);
             echo json_encode(array("code"=>200,"message"=>"{$exist['firstname']} {$exist['lastname']} is Present"));
         }else{
             echo json_encode(array("code"=>201,"message"=>"No Student Exists"));
         }

     
        
    }



}
