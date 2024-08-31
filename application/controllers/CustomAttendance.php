<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class CustomAttendance extends Admin_Controller
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
    }
    public function index()
    {
        $data['title'] = 'Student List';
        $student_result = $this->student_model->get();
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $data['studentlist'] = $student_result;
        $this->load->view('layout/header', $data);
        $this->load->view('CustomAttendance/attendance-management', $data);
        $this->load->view('layout/footer', $data);
    }
    function searchbyform()
    {
        
        extract($_REQUEST);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        $this->load->view('CustomAttendance/attendancestudentlist', get_defined_vars());
    }
   
   

    function absentList()
    {
        showErrors();
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $sql="SELECT s.* , ss.class_id, ss.section_id FROM `student_session` ss INNER JOIN `students` s ON s.id = ss.student_id LEFT JOIN `student_attendences` ats ON ss.id = ats.student_session_id where ats.date='$date' and ats.attendence_type_id=4 and s.school_id=".getSchoolID().";";
        $students = db::getRecords($sql);
  
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('CustomAttendance/exportAbsentList', get_defined_vars());
         $html_content = ob_get_clean();
        $this->makePDF($html_content, 'Absent-List-'.date('Y-m-d').'.pdf');
    }


    function SMSAbsents()
    {
        showErrors();
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        
        $sql="SELECT s.* , ss.class_id, ss.section_id FROM `student_session` ss INNER JOIN `students` s ON s.id = ss.student_id LEFT JOIN `student_attendences` ats ON ss.id = ats.student_session_id where ats.date='$date' and ats.attendence_type_id=4 and s.school_id=".getSchoolID().";";
        $students = db::getRecords($sql);
      
        if($students){
        foreach ($students as $key => $student) {
             $mobile=$student['mobileno'];
            
            if($mobile){
                $date=date("l d F Y",strtotime($date));
                $class=getClass($student['class_id']);
                $section=getSecion($student['section_id']);
                $message="Name: {$student['firstname']} {$student['lastname']} Class $class - $section is Absent on $date ";
                sendSMS($mobile,$message,false);
            }
        }
        echo "<center><h1>Attendance has been sent Successfully</h1></center>";

    }else{
        echo "<center><h1>No-Student to send</h1></center>";
    }

    }


    function WhatsppAbsents()
    {
        showErrors();
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        
        $sql="SELECT s.* , ss.class_id, ss.section_id FROM `student_session` ss INNER JOIN `students` s ON s.id = ss.student_id LEFT JOIN `student_attendences` ats ON ss.id = ats.student_session_id where ats.date='$date' and ats.attendence_type_id=4 and s.school_id=".getSchoolID().";";
        $students = db::getRecords($sql);
      
        if($students){
        foreach ($students as $key => $student) {
            $mobile=$student['mobileno'];
            if($mobile){
                $date=date("l d F Y",strtotime($date));
                $class=getClass($student['class_id']);
                $section=getSecion($student['section_id']);
                $message="Name: {$student['firstname']} {$student['lastname']} Class $class - $section is Absent on $date ";
                sendWhatsapp($mobile,$message);
            }
        }
        echo "<center><h1>Attendance has been sent Successfully</h1></center>";

    }else{
        echo "<center><h1>No-Student to send</h1></center>";
    }

    }


    function markAttendanceByID()
    {
        showErrors();
       $date=date("Y-m-d");
        ob_start();
        $this->load->view('CustomAttendance/markAttendanceByID', get_defined_vars());
        echo  $html_content = ob_get_clean();

        
    }

    


  function markAttendance()  {
    extract($this->input->post());
    $type=checkAttendance($student_id,$type,$date);
    echo json_encode(array('code' => 200, 'message' => "Attendance has been successfully marked","type"=>$type));
  }


  function bulkAttendance()  {
    extract($this->input->post());


    if($attendance){
    foreach ($attendance as $key => $student_id) {
        $type=$attendanceMark[$student_id];
        $st = $this->student_model->getStudentbyID($student_id);
        checkAttendance($student_id,$type,$date);
        if($alert && $type !='1') {
            switch ($alert) {
                case '2':
               

                     $message="Name: {$st['firstname']} {$st['lastname']} Class {$st['class']} {$st['section']} is Absent on $date ";
                     $st['mobileno']="+923099914748";
                     sendSMS($st['mobileno'],$message,"",false);
                  
                    break;
                case '4':
                  
                    break;
                
                
            }
        }
       
        
    }
    echo json_encode(array('code' => 200, 'message' => "Attendance has been successfully marked"));



    }
    
    
  }



  function AttendanceRegister()  {

    showErrors();
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('CustomAttendance/exportRegister', get_defined_vars());
          $html_content = ob_get_clean();
       $this->makePDF($html_content, 'Register-'.date('mY').'_Detailed.pdf');

    
  }
  function AttendanceMarkMenual()  {

    showErrors();
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('CustomAttendance/exportMenualAttendance', get_defined_vars());
          $html_content = ob_get_clean();
       $this->makePDF($html_content, 'menual-'.date('mY').'.pdf');

    
  }
  function request_form_for_id()  {

    showErrors();
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('CustomAttendance/request_form_for_id', get_defined_vars());
          $html_content = ob_get_clean();
       $this->makePDF($html_content, 'menual-'.date('mY').'.pdf');

    
  }


  function comaAttendance()  {
    extract($this->input->post());
    $students_id=explode(',', $student_id);
    if($student_id) {
        foreach ($students_id as $key => $student_id) {
            $exist=db::getCell("SELECT* from students where id=$student_id and school_id=".getSchoolID());
            if( $exist){
                checkAttendance($student_id,$type,$date);
            }
          
        }

        echo json_encode(array('code' => 200, 'message' => "Attendance has been successfully marked"));
    }else{
        echo json_encode(array('code' => 201, 'message' => "No Student ID Exists please enter coma saprated"));
    }
  }


}
