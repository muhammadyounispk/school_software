<?php
 
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Guardians extends Admin_Controller
{

    public $sch_setting_detail = array();

    public function __construct()
    {
        parent::__construct();
        $this->config->load('app-config');
        $this->load->library('smsgateway');
        $this->load->library('mailsmsconf');

        $this->load->library('encoding_lib');
        $this->load->model("classteacher_model");
        $this->load->model(array("timeline_model", "student_edit_field_model"));
        $this->blood_group = $this->config->item('bloodgroup');
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $this->role;
        sendEmail("unis.panwar@gmail.com","sdfd","unis.panwar@gmail.com","Ali");

    
    }

    public function index()
    {



        $data['title'] = 'Student List';
        $student_result = $this->student_model->get();


        $data['studentlist'] = $student_result;
        $this->load->view('layout/header', $data);
        $this->load->view('student/studentList', $data);
        $this->load->view('layout/footer', $data);
    }

    function search() {
        extract($_REQUEST);
         $guardian=db::getRecord("SELECT* from guardians where guardian_cnic ='$guardian_cnic'");
        $this->load->view('guardian/guardian_profile', get_defined_vars());
        
    }
    function admission_form() {
        extract($_REQUEST);
         $guardian=db::getRecord("SELECT* from guardians where guardian_cnic ='$guardian_cnic'");
        $this->load->view('guardian/admission_form', get_defined_vars());
        
    }
    function StudentListByGuardian() {
        extract($_REQUEST);
        $cnic=$this->input->get('cnic');
        $childs=$this->studentsession_model->searchMultiStudentByFather($cnic);
    
        $this->load->view('guardian/StudentListByGuardian', get_defined_vars());
        
    }

    function save_student()  {
        extract($_REQUEST);

        if(isset($_POST['id']) && !empty($_POST['id'])) {
            $id=$_POST['id'];
            $fee=$_POST['fee'];
            $payable=0;
            db::deleteRecord('students_fee','student_id',$id);
            foreach ($fee as $key => $account_id) {
              $amount=$_POST['amount'][$account_id];
              $feetitle=$_POST['feetitle'][$account_id];
              $ischecked=$_POST['ischecked'][$account_id];
              if($ischecked){
                $insert_db['accounts_id']=$account_id;
                $insert_db['title']=$feetitle;
                $insert_db['student_id']=$id;
                $insert_db['payable_amount']=$amount;
                if($account_id!='4'){
                    $payable=$payable+$amount;
                }
                $query=db::prepInsertQuery($insert_db,'students_fee');
                db::insertRecord($query);
              }

            }
              $db_up['fee']=$payable;
              $db_up['fee']=$payable;
              $db_up['admission_fee']=$admission_fee;
              $db_up['firstname'] = $this->input->post('firstname');
              $db_up['cnic'] = $this->input->post('cnic');
              $db_up['dob'] = $this->input->post('dob');
              $db_up['gender'] = $this->input->post('gender');
              $db_up['arrears'] = $this->input->post('arrears');
              $update_sql=db::prepUpdateQuery($db_up,'students','id',$id);
              db::updateRecord($update_sql);

              $up_student_session['class_id']=$this->input->post('class_id');
              $up_student_session['section_id']=$this->input->post('section_id');
              $update_st=db::prepUpdateQuery($up_student_session,'student_session','student_id',$id);
              db::updateRecord($update_st);
             

              //update payable
              updateParentPayable($father->guardian_cnic);

            

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = str_encode($id) . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/student_images/" . $img_name);
                $data_img = array('id' => $id, 'image' => 'uploads/student_images/' . $img_name);
                $this->student_model->add($data_img);
            }


        

                echo json_encode(array('status'=>200,'message'=>'Updated  Successfully Done','sql'=> $update_sql));

                

        



       die;
        }
        
       
        $father=(object)db::getRecord("SELECT* from guardians where id='".$_GET['guardian_id']."' ");

        $payfrom=$_POST['payfrom'];

        $payment=0;
        $admission_fee=0;
        foreach ($fee as $key => $account_id) {
            $amount=$_POST['amount'][$account_id];
            $ischecked=$_POST['ischecked'][$account_id];
            if($ischecked){
                $payment=$payment+$amount;
            }

            if($account_id==4){
                $admission_fee=$amount;
            }
        }
        
         $pay_from_account=true;
         $balance= getParentBalance($father->guardian_cnic);
        if($payment  >$balance){
            $pay_from_account=false;
        }

        if($payfrom==1){

            if(!$pay_from_account){

                echo json_encode(array("status"=>201,"message"=> "Guardian has low Balance ($balance) in Account to pay $payment"));
                die;
            }


        }else if($payfrom== 2){

            $to=getFatherAccount($father->id);
            $from='1';
            $date=date('Y-m-d H:i:s');
            $amount=$payment;
           $trix= transactionCR($from,$to,$amount,"Deposit CASH @ ACCOUNTS-BRANCH (A/C:$from) againts An amount $amount has been transfered  to Guardian  A/c: $to , Title {$father->guardian_name}   at  $date successfully ");
         




        }


  
  
        
        $data_insert = array(
            'firstname' => $this->input->post('firstname'),
            'cnic' => $this->input->post('cnic'),
            'father_cnic' =>$father->guardian_cnic,
            'rte' => 'No',
            'state' => '',
            'city' => '',
            'pincode' => '',
            'cast' => '',
            'previous_school' => '',
            'dob' => $this->input->post('dob'),
            'current_address' => '',
            'permanent_address' => '',

            'adhar_no' => '',
            'samagra_id' => '',
            'bank_account_no' => '',
            'bank_name' => '',
            'ifsc_code' =>'',
            'guardian_occupation' =>$father->guardian_profession ,
            'guardian_email' => $father->guardian_email,
            'email' => $father->guardian_email,
            'gender' => $this->input->post('gender'),
            'guardian_name' => $father->guardian_name,
            'father_name' => $father->guardian_name,
            'guardian_relation' => $this->input->post('guardian_relation'),
            'guardian_phone' => $father->guardian_mobileno,
            'mobileno' => $father->guardian_mobileno,
            'father_phone' => $father->guardian_mobileno,
            'guardian_address' => '',
            'vehroute_id' => '',
            'hostel_room_id' => '',
            'current_address' => $father->address,
            'permanent_address' => $father->address,
            'cast' => $father->address,
            'religion' => $father->religion,
            'father_pic' => $father->image,
            'guardian_pic' => $father->image,
            'guardian_relation' => 'Father',
            'guardian_address' => $father->address,
            'note' => '',
            'is_active' => 'yes',
        );

        $data_insert['admission_date'] = date('Y-m-d');
        $data_insert['roll_no'] = $this->input->post('roll_no');
        $data_insert['guardian_is'] = 'Father';
        $data_setting = array();
        $data_setting['id'] = $this->sch_setting_detail->id;
        $data_setting['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;
        $data_setting['adm_update_status'] = $this->sch_setting_detail->adm_update_status;
        $admission_number = $this->student_model->generateADM_NO($class_id, $section_id);
        $data_insert['admission_no'] = $admission_number;
        $insert=true;
  
        if ($insert) {
            $insert_id = $this->student_model->add($data_insert, $data_setting);
            if (!empty($custom_value_array)) {
                $this->customfield_model->insertRecord($custom_value_array, $insert_id);
            }
            $data_new = array(
                'student_id' => $insert_id,
                'class_id' => $class_id,
                'section_id' => $section_id,
                'session_id' => getSessionID(getSchoolID()),
                'fees_discount' => '',
            );
            $this->student_model->add_student_session($data_new);
            $user_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);

            $sibling_id = $this->input->post('sibling_id');
            $data_student_login = array(
                'username' => $this->student_login_prefix . $insert_id,
                'password' => $user_password,
                'user_id' => $insert_id,
                'role' => 'student',
            );

            $this->user_model->add($data_student_login);

            if ($sibling_id > 0) {
                $student_sibling = $this->student_model->get($sibling_id);
                $update_student = array(
                    'id' => $insert_id,
                    'parent_id' => $student_sibling['parent_id'],
                );
                $student_sibling = $this->student_model->add($update_student);
            } else {
                $parent_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);
                $temp = $insert_id;
                $data_parent_login = array(
                    'username' => $this->parent_login_prefix . $insert_id,
                    'password' => $parent_password,
                    'user_id' => 0,
                    'role' => 'parent',
                    'childs' => $temp,
                );
                $ins_parent_id = $this->user_model->add($data_parent_login);
                $update_student = array(
                    'id' => $insert_id,
                    'parent_id' => $ins_parent_id,
                );
                $this->student_model->add($update_student);
            }

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/student_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'image' => 'uploads/student_images/' . $img_name);
                $this->student_model->add($data_img);
            }

            if (isset($_FILES["father_pic"]) && !empty($_FILES['father_pic']['name'])) {
                $fileInfo = pathinfo($_FILES["father_pic"]["name"]);
                $img_name = $insert_id . "father" . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["father_pic"]["tmp_name"], "./uploads/student_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'father_pic' => 'uploads/student_images/' . $img_name);
                $this->student_model->add($data_img);
            }
            if (isset($_FILES["mother_pic"]) && !empty($_FILES['mother_pic']['name'])) {
                $fileInfo = pathinfo($_FILES["mother_pic"]["name"]);
                $img_name = $insert_id . "mother" . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["mother_pic"]["tmp_name"], "./uploads/student_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'mother_pic' => 'uploads/student_images/' . $img_name);
                $this->student_model->add($data_img);
            }

            if (isset($_FILES["guardian_pic"]) && !empty($_FILES['guardian_pic']['name'])) {
                $fileInfo = pathinfo($_FILES["guardian_pic"]["name"]);
                $img_name = $insert_id . "guardian" . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["guardian_pic"]["tmp_name"], "./uploads/student_images/" . $img_name);
                $data_img = array('id' => $insert_id, 'guardian_pic' => 'uploads/student_images/' . $img_name);
                $this->student_model->add($data_img);
            }

            if (isset($_FILES["first_doc"]) && !empty($_FILES['first_doc']['name'])) {
                $uploaddir = './uploads/student_documents/' . $insert_id . '/';
                if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                    die("Error creating folder $uploaddir");
                }
                $fileInfo = pathinfo($_FILES["first_doc"]["name"]);
                $first_title = $this->input->post('first_title');
                $file_name = $_FILES['first_doc']['name'];
                $exp = explode(' ', $file_name);
                $imp = implode('_', $exp);
                $img_name = $uploaddir . $imp;
                move_uploaded_file($_FILES["first_doc"]["tmp_name"], $img_name);
                $data_img = array('student_id' => $insert_id, 'title' => $first_title, 'doc' => $imp);
                $this->student_model->adddoc($data_img);
            }
            if (isset($_FILES["second_doc"]) && !empty($_FILES['second_doc']['name'])) {
                $uploaddir = './uploads/student_documents/' . $insert_id . '/';
                if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                    die("Error creating folder $uploaddir");
                }
                $fileInfo = pathinfo($_FILES["second_doc"]["name"]);
                $second_title = $this->input->post('second_title');
                $file_name = $_FILES['second_doc']['name'];
                $exp = explode(' ', $file_name);
                $imp = implode('_', $exp);
                $img_name = $uploaddir . $imp;
                move_uploaded_file($_FILES["second_doc"]["tmp_name"], $img_name);
                $data_img = array('student_id' => $insert_id, 'title' => $second_title, 'doc' => $imp);
                $this->student_model->adddoc($data_img);
            }

            if (isset($_FILES["fourth_doc"]) && !empty($_FILES['fourth_doc']['name'])) {
                $uploaddir = './uploads/student_documents/' . $insert_id . '/';
                if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                    die("Error creating folder $uploaddir");
                }
                $fileInfo = pathinfo($_FILES["fourth_doc"]["name"]);
                $fourth_title = $this->input->post('fourth_title');
                $file_name = $_FILES['fourth_doc']['name'];
                $exp = explode(' ', $file_name);
                $imp = implode('_', $exp);
                $img_name = $uploaddir . $imp;
                move_uploaded_file($_FILES["fourth_doc"]["tmp_name"], $img_name);
                $data_img = array('student_id' => $insert_id, 'title' => $fourth_title, 'doc' => $imp);
                $this->student_model->adddoc($data_img);
            }
            if (isset($_FILES["fifth_doc"]) && !empty($_FILES['fifth_doc']['name'])) {
                $uploaddir = './uploads/student_documents/' . $insert_id . '/';
                if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                    die("Error creating folder $uploaddir");
                }
                $fileInfo = pathinfo($_FILES["fifth_doc"]["name"]);
                $fifth_title = $this->input->post('fifth_title');
                $file_name = $_FILES['fifth_doc']['name'];
                $exp = explode(' ', $file_name);
                $imp = implode('_', $exp);
                $img_name = $uploaddir . $imp;

                move_uploaded_file($_FILES["fifth_doc"]["tmp_name"], $img_name);
                $data_img = array('student_id' => $insert_id, 'title' => $fifth_title, 'doc' => $imp);
                $this->student_model->adddoc($data_img);
            } }


            $fee=$_POST['fee'];
           




            $payable=0;
            foreach ($fee as $key => $account_id) {
              $amount=$_POST['amount'][$account_id];
              $feetitle=$_POST['feetitle'][$account_id];
              $ischecked=$_POST['ischecked'][$account_id];
             
              if($ischecked){
                $insert_db['accounts_id']=$account_id;
                $insert_db['title']=$feetitle;
                $insert_db['student_id']=$insert_id;
                $insert_db['payable_amount']=$amount;
                if($account_id!='4'){
                    $payable=$payable+$amount;
                }
               if($payfrom==1 || $payfrom==2){
                $nature=$payfrom==1?'INTERNAL ACCOUNT':'EXTERNAL / CASH ';

                $query=db::prepInsertQuery($insert_db,'students_fee');
                db::insertRecord($query);
                $from=getFatherAccount($father->id);
                $to=getInstAccount($account_id);
                $date=date('Y-m-d H:i:s');
                $st_name=$this->input->post('firstname');
                
               $trix= transactionCR($from,$to,$amount,"An amount $amount in Ref. $st_name  against $feetitle($to)  has been Received from Guardian A/C: $from Title {$father->guardian_name}    successfully at  $date @$nature ",$insert_id);
             
             
               if($trix){

                

               
                $trixdr= transactionDR($from,$to,$amount,"An amount $amount  in Ref. $st_name  against $feetitle($to) has been Transfrered to Institute A/c: $to , Title $feetitle  successfully at  $date  trix ID:$trix  @$nature",$insert_id);
                  if($trixdr && $payfrom==1){
                    //update Guardan Balance and also make DR transaction statement 
                    $gid=getIDbyFatherAccount($from);
                    db::query("UPDATE guardians
                    SET balance = balance - $amount
                    WHERE id = '$gid';
                    ");

                  }


               }
              

               }
               
              }
              $db_up['fee']=$payable;
              $db_up['admission_fee']=$admission_fee;
              if($payfrom=='1' && $payfrom=='2'){
                $db_up['admission_fee_paid']=1;
              }else{
                $db_up['admission_fee_paid']=1;
              }
              $update_sql=db::prepUpdateQuery($db_up,'students','id',$insert_id);
              db::updateRecord($update_sql);

              //update payable
              updateParentPayable($father->guardian_cnic);

            }

            if($insert_id){

                echo json_encode(array('status'=>200,'message'=>'Admission Successfully Done'));
            }else{
                echo json_encode(array('status'=>201,'message'=>'Errpr while adding student'));
            }

           
           

           

           



    }

function create()  {
    extract($this->input->post());
   

    if (isset($_FILES["guardian_photo"]) && !empty($_FILES['guardian_photo']['name'])) {
        $fileInfo = pathinfo($_FILES["guardian_photo"]["name"]);
        $text=getSchoolID().'_'.time();
        $img_name =  $text.'.'. $fileInfo['extension'];
        if(move_uploaded_file($_FILES["guardian_photo"]["tmp_name"], "./uploads/student_images/" . $img_name)){
            $data['image']=$img_name; 
        }
       
    }
   
    $data['guardian_name']=$guardian_name;
    $data['guardian_cnic']=$guardian_cnic;
    $data['guardian_profession']=$guardian_profession;
    $data['guardian_email']=$guardian_email;
    $data['guardian_mobileno']=$guardian_mobileno;
    $data['caste']=$caste;
    $data['religion']=$religion;
    $data['address']=$address;
    $data['balance']=$balance;
    if(!empty($id)){
        $data['last_updated']=date('Y-m-d h:i:s a');
         $query=db::prepUpdateQuery($data,'guardians','id',$id);
       db::updateRecord($query);
       echo json_encode(array("status"=>202,"message"=>"Record Updated Successfully"));
       
    }else{
        $exist=db::getCell("select guardian_name from guardians where guardian_cnic='$guardian_cnic'");
        if($exist){
             echo json_encode(array("status"=>201,"message"=>"$guardian_cnic exist with $exist"));
        }else{
            $data['reg_date']=date('Y-m-d h:i:s a');
                 $query=db::prepInsertQuery($data,'guardians');
                   $parent_id= db::insertRecord($query);

            echo json_encode(array("status"=>200,"message"=>"$guardian_cnic Added Successfully"));
        }
    }

    
}
    





}