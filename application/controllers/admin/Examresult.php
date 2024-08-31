<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Examresult extends Admin_Controller {

    public $exam_type = array();

    public function __construct() {
        parent::__construct();
        $this->exam_type = $this->config->item('exam_type');
        $this->attendence_exam = $this->config->item('attendence_exam');
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $this->load->library('mailsmsconf');
        $this->mailer;
        
     
    }

    public function printCard() {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('admitcard_template', $this->lang->line('template'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('post_exam_id', $this->lang->line('exam'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('post_exam_group_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('exam_group_class_batch_exam_student_id[]', $this->lang->line('students'), 'required|trim|xss_clean');
        $data = array();

        if ($this->form_validation->run() == false) {
            $data = array(
                'admitcard_template' => form_error('admitcard_template'),
                'post_exam_id' => form_error('post_exam_id'),
                'post_exam_group_id' => form_error('post_exam_group_id'),
                'exam_group_class_batch_exam_student_id' => form_error('exam_group_class_batch_exam_student_id'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {
            $post_exam_id = $this->input->post('post_exam_id');
            $post_exam_group_id = $this->input->post('post_exam_group_id');
            $students_array = $this->input->post('exam_group_class_batch_exam_student_id');
            $exam = $this->examgroup_model->getExamByID($post_exam_id);
            $data['exam'] = $exam;
            $exam_grades = $this->grade_model->getByExamType($exam->exam_group_type);
            $data['exam_grades'] = $exam_grades;
            $data['admitcard'] = $this->admitcard_model->get($this->input->post('admitcard_template'));
            $data['exam_subjects'] = $this->batchsubject_model->getExamSubjects($post_exam_id);
            $data['student_details'] = $this->examstudent_model->getStudentsAdmitCardByExamAndStudentID($students_array, $post_exam_id);
            $data['sch_setting']= $this->sch_setting_detail;
            $student_admit_cards = $this->load->view('admin/admitcard/_printadmitcard', $data, true);
            $array = array('status' => '1', 'error' => '', 'page' => $student_admit_cards);
            echo json_encode($array);
        }
    }

    public function admitcard() {
        if (!$this->rbac->hasPrivilege('print_admit_card', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Examinations');
        $this->session->set_userdata('sub_menu', 'Examinations/examresult/admitcard');
        $examgroup_result = $this->examgroup_model->get();
        $data['examgrouplist'] = $examgroup_result;

        $admitcard_result = $this->admitcard_model->get();
        $data['admitcardlist'] = $admitcard_result;
        $class = $this->class_model->get();
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';
        $data['examType'] = $this->exam_type;
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('student'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_group_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_id', $this->lang->line('exam'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('admitcard', $this->lang->line('admit') . " " . $this->lang->line('card') . " " . $this->lang->line('template'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            
        } else {
            $exam_group_id = $this->input->post('exam_group_id');
            $exam_id = $this->input->post('exam_id');
            $session_id = $this->input->post('session_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
            $admitcard_template = $this->input->post('admitcard');
            $data['admitcard_template'] = $admitcard_template;

            $data['studentList'] = $this->examgroupstudent_model->searchExamStudents($exam_group_id, $exam_id, $class_id, $section_id, $session_id);

            $data['examList'] = $this->examgroup_model->getExamByExamGroup($exam_group_id, true);
 
            $data['exam_id'] = $exam_id;
            $data['exam_group_id'] = $exam_group_id;
        }
        $data['sch_setting'] = $this->sch_setting_detail;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/examresult/admitcard', $data);
        $this->load->view('layout/footer', $data);
    }

    public function marksheet() {
        if (!$this->rbac->hasPrivilege('print_marksheet', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Examinations');
        $this->session->set_userdata('sub_menu', 'Examinations/examresult/marksheet');
        $examgroup_result = $this->examgroup_model->get();
        $data['examgrouplist'] = $examgroup_result;

        $marksheet_result = $this->marksheet_model->get();
        $data['marksheetlist'] = $marksheet_result;

        $class = $this->class_model->get();
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';
        $data['examType'] = $this->exam_type;
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $this->form_validation->set_rules('marksheet', $this->lang->line('marksheet'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('student'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_group_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_id', $this->lang->line('exam'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            
        } else {
            $exam_group_id = $this->input->post('exam_group_id');
            $exam_id = $this->input->post('exam_id');
            $session_id = $this->input->post('session_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');

            $marksheet_template = $this->input->post('marksheet');
            $data['marksheet_template'] = $marksheet_template;

            $data['studentList'] = $this->examgroupstudent_model->searchExamStudents($exam_group_id, $exam_id, $class_id, $section_id, $session_id);

            $data['examList'] = $this->examgroup_model->getExamByExamGroup($exam_group_id, true);

            $data['exam_id'] = $exam_id;
            $data['exam_group_id'] = $exam_group_id;
        }
        $data['sch_setting'] = $this->sch_setting_detail;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/examresult/marksheet', $data);
        $this->load->view('layout/footer', $data);
    }

    public function printmarksheet() {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('post_exam_id', $this->lang->line('exam'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('post_exam_group_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('exam_group_class_batch_exam_student_id[]', $this->lang->line('students'), 'required|trim|xss_clean');
        $data = array();

        if ($this->form_validation->run() == false) {
            $data = array(
                'post_exam_id' => form_error('post_exam_id'),
                'post_exam_group_id' => form_error('post_exam_group_id'),
                'exam_group_class_batch_exam_student_id' => form_error('exam_group_class_batch_exam_student_id'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {
            $data['template'] = $this->marksheet_model->get($this->input->post('marksheet_template'));
            $post_exam_id = $this->input->post('post_exam_id');
            $post_exam_group_id = $this->input->post('post_exam_group_id');
            $students_array = $this->input->post('exam_group_class_batch_exam_student_id');
            $exam = $this->examgroup_model->getExamByID($post_exam_id);
            $data['exam'] = $exam;

            $exam_grades = $this->grade_model->getByExamType($exam->exam_group_type);
            $data['exam_grades'] = $exam_grades;
            $data['marksheet'] = $this->examresult_model->getExamResults($post_exam_id, $post_exam_group_id, $students_array);
            $data['sch_setting'] = $this->sch_setting_detail;
            $student_exam_page = $this->load->view('admin/examresult/_printmarksheet', $data, true);

 
            $array = array('status' => '1', 'error' => '', 'page' => $student_exam_page);
            echo json_encode($array);
        }
    }

    public function index() {
        if (!$this->rbac->hasPrivilege('exam_result', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Examinations');
        $this->session->set_userdata('sub_menu', 'Examinations/Examresult');
        $examgroup_result = $this->examgroup_model->get();
        $data['examgrouplist'] = $examgroup_result;

        $marksheet_result = $this->marksheet_model->get();
        $data['marksheetlist'] = $marksheet_result;

        $class = $this->class_model->get();
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';
        $data['examType'] = $this->exam_type;
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('session'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_group_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_id', $this->lang->line('exam'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            
        } else {
            $exam_group_id = $this->input->post('exam_group_id');
            $exam_id = $this->input->post('exam_id');
            $session_id = $this->input->post('session_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');

            $marksheet_template = $this->input->post('marksheet');
            $data['marksheet_template'] = $marksheet_template;
            $exam_details = $this->examgroup_model->getExamByID($exam_id);

            $studentList = $this->examgroupstudent_model->searchExamStudents($exam_group_id, $exam_id, $class_id, $section_id, $session_id);

            $exam_subjects = $this->batchsubject_model->getExamSubjects($exam_id);
            $data['subjectList'] = $exam_subjects;

            if (!empty($studentList)) {
                foreach ($studentList as $student_key => $student_value) {
                    $studentList[$student_key]->exam_title=$exam_details->exam;
                    $studentList[$student_key]->subject_results = $this->examresult_model->getStudentResultByExam($exam_id, $student_value->exam_group_class_batch_exam_student_id);
                }
            }
          
 
            $data['studentList'] = $studentList;
  
            $exam_grades = $this->grade_model->getByExamType($exam_details->exam_group_type);
            $data['exam_grades'] = $exam_grades;
            $data['exam_details'] = $exam_details;
            $data['exam_id'] = $exam_id;
            $data['exam_group_id'] = $exam_group_id;
        }   
        
        $data['sch_setting'] = $this->sch_setting_detail;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/examresult/index', $data);
        $this->load->view('layout/footer', $data);
    }

    public function getStudentByClassBatch() {
        $class_id = $this->input->post('class_id');
        $section_id = $this->input->post('section_id');
        $session_id = $this->input->post('session_id');
        $data['studentList'] = $this->examgroupstudent_model->searchStudentByClassSectionSession($class_id, $section_id, $session_id);
        echo json_encode($data);
    }

    public function getExamGroupByStudent() {
        $student_id = $this->input->post('student_id');

        $data['examgrouplist'] = $this->examgroup_model->getExamGroupByStudent($student_id);
        echo $this->db->last_query();
        die;
        echo json_encode($data);
    }

    public function studentresult() {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('exam_group_id', 'exam_group_id', 'required|trim|xss_clean');
        $this->form_validation->set_rules('student_id', 'student_id', 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'exam_group_id' => form_error('exam_group_id'),
                'student_id' => form_error('student_id'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {

            $student_id = $this->input->post('student_id');
            $exam_group_id = $this->input->post('exam_group_id');
            $exam_group_exam_id = $this->input->post('exam_id');

            $examresult = array();
            $exam_grades = array();
            if ($exam_group_exam_id != "") {
                $examresult = $this->examgroup_model->getExamResultDetailStudent($exam_group_exam_id, $exam_group_id, $student_id);

                $data['examresult'] = $examresult;
                $exam_grades = $this->grade_model->getByExamType($examresult->exam_type);
                $data['exam_grades'] = $exam_grades;
                $examresult = $this->load->view('admin/examresult/_getExam', $data, true);
            } else {
                $exam_group = $this->examgroup_model->get($exam_group_id);
                $data['exam_group'] = $exam_group;

                $exam_grades = $this->grade_model->getByExamType($exam_group->exam_type);
                $data['exam_grades'] = $exam_grades;

                $exam_result = $this->examgroup_model->getExamGroupExamsResultByStudentID($exam_group_id, $student_id);
                $data['examresult'] = $exam_result;
                $exam_connections = $this->examgroup_model->getExamGroupConnection($exam_group_id);
                $data['exam_connections'] = $exam_connections;
                $examresult = $this->load->view('admin/examresult/_getExamGroupResult', $data, true);
            }

            $data['exam_grades'] = $exam_grades;

            $array = array('status' => '1', 'result' => $examresult, 'message' => $this->lang->line('success_message'));
            echo json_encode($array);
        }
    }

    public function getStudentCurrentResult() {
        $this->form_validation->set_rules('student_session_id', $this->lang->line('student') . " " . $this->lang->line('id'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {

            $msg = array(
                'student_session_id' => form_error('student_session_id'),
            );

            $array = array('status' => 0, 'error' => $msg);
        } else {
            $student_session_id = $this->input->post('student_session_id');
            $data['exam_grades'] = $this->grade_model->get();
            $exam_groups_attempt = $this->examgroup_model->getExamGroupByStudentSession($student_session_id);

            $data['exam_groups_attempt'] = $exam_groups_attempt;
            $examresult = $this->load->view('admin/examresult/_getExamGroupResult', $data, true);
            $array = array('status' => 1, 'error' => '', 'result' => $examresult);
        }
        echo json_encode($array);
    }

    public function generatemarksheet() {
        $this->form_validation->set_rules('exam_id', $this->lang->line('exam') . " " . $this->lang->line('id'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('check[]', $this->lang->line('students'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {

            $msg = array(
                'exam_id' => form_error('exam_id'),
                'check' => form_error('check'),
            );

            $array = array('status' => 0, 'error' => $msg);
        } else {
            echo "<pre/>";
            $exam_id = $this->input->post('exam_id');
            $students = $this->input->post('check');
            $exam = $this->examgroup_model->getExamByID($exam_id);
            $exam_id = $exam->id;
            $students_result = array();
            if (!empty($students)) {
                foreach ($students as $student_key => $student_value) {
                    print_r($student_value);
                    exit();

                    $students_result[] = $this->examresult_model->getStudentExamResult($exam_id, $student_value);
                }
            }
            print_r($students_result);
            exit();

            exit();
        }
        echo json_encode($array);
    }

    public function rankreport() {
        if (!$this->rbac->hasPrivilege('rank_report', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'Reports/examinations');
        $this->session->set_userdata('subsub_menu', 'Reports/examinations/rankreport');
        $examgroup_result = $this->examgroup_model->get();
        $data['examgrouplist'] = $examgroup_result;

        $marksheet_result = $this->marksheet_model->get();
        $data['marksheetlist'] = $marksheet_result;

        $class = $this->class_model->get();
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';
        $data['examType'] = $this->exam_type;
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('session'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_group_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_id', $this->lang->line('exam'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            
        } else {
            $exam_group_id = $this->input->post('exam_group_id');
            $exam_id = $this->input->post('exam_id');
            $session_id = $this->input->post('session_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');

            $marksheet_template = $this->input->post('marksheet');
            $data['marksheet_template'] = $marksheet_template;
            $exam_details = $this->examgroup_model->getExamByID($exam_id);

            $studentList = $this->examgroupstudent_model->searchExamStudents($exam_group_id, $exam_id, $class_id, $section_id, $session_id);
            $exam_subjects = $this->batchsubject_model->getExamSubjects($exam_id);
            $data['subjectList'] = $exam_subjects;

            if (!empty($studentList)) {
                foreach ($studentList as $student_key => $student_value) {
                    $studentList[$student_key]->subject_results = $this->examresult_model->getStudentResultByExam($exam_id, $student_value->exam_group_class_batch_exam_student_id);
                }
            }

            $data['studentList'] = $studentList;

            $exam_grades = $this->grade_model->getByExamType($exam_details->exam_group_type);
            $data['exam_grades'] = $exam_grades;
            $data['exam_details'] = $exam_details;
            $data['exam_id'] = $exam_id;
            $data['exam_group_id'] = $exam_group_id;
        }
        $data['sch_setting'] = $this->sch_setting_detail;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/examresult/rankreport', $data);
        $this->load->view('layout/footer', $data);
    }

  
    function notifyResult()  {
    $message="";
    
    $notify=@$_POST['notify'];    
    $Results=@$_POST['Results']; 
    $final_res=@$_POST['final_res']; 
    if($notify){
        $index=0;
        $wa_messages=array();
        $sms_messages=array();
        $email_messages=array();
        foreach ($Results as $student_ids => $Result) {

            $Result=json_decode($Result,true);  
            $student_id=$Result['student_id'];
            $passfail=$final_res[$student_id];
            $mobileno=isset($_POST['SMSTO'][$student_id]) && !empty($_POST['SMSTO'][$student_id]) ? $_POST['SMSTO'][$student_id]:"+923099914748";
            $name=$Result['firstname']." ".$Result['lastname'];
            $email=$Result['email']; //"unis.panwar@gmail.com"; 
            $exam_title=$Result['exam_title'];
            $ResultData_WA="*$exam_title*\n---------------\n*Name*: $name \n";
             $ResultData_SMS="Exam Name: $exam_title\nName: $name \n";
            $ResultData_EMAIL="<table border='1' width='90%'>";
           
                 
               
            $ResultData_EMAIL.="<tr>
                 <td colspan='2'>Student Name</td>
               
                 <td colspan='3'>{$name}</td>
                 </tr>";
            $ResultData_EMAIL.="<tr>
                 <td colspan='2'>Student Phone</td>
               
                 <td colspan='3'>{$mobileno}</td>
                 </tr>";
            $ResultData_EMAIL.="<tr>
                 <td colspan='2'>Email</td>
               
                 <td colspan='3'>{$email}</td>
                 </tr>";
                 
            
            $ResultArr=$Result['subject_results'];
           
            if($ResultArr){
                $grand_total=0;
                $grand_obtain=0;
                $ResultData_EMAIL.="<tr>
                <th>Sr#</th>
                <th>Subject Name</th>
                <th>Subject Code</th>
                <th>Obtain</th>
                <th>Total</th>
                </tr>";
                $sr=1;
                foreach ($ResultArr as $key => $res) {

                   $grand_obtain+= $obtain=floor($res['get_marks']);
                    $grand_total+=$total=floor($res['max_marks']);
                    $ResultData_WA.="*{$res['name']}*: $obtain/$total\n";
                    $ResultData_SMS.="{$res['name']}: $obtain/$total\n";
                    $ResultData_EMAIL.="<tr>
                <td>$sr</td>
                <td>{$res['name']}</td>
                <td>{$res['name']}</td>
                <td>{$obtain}</td>
                <td>{$total}</td>
                </tr>";
                $sr++;
                    
                }
                
                $percentage=floor($grand_obtain/$grand_total*100);
                 $ResultData_WA.="*Result:* $grand_obtain/$grand_total ($percentage%)\n";
                 $ResultData_WA.="*Status:*  $passfail\n";
                 

                 //SMS
                 $ResultData_SMS.="*Status:*  $passfail\n";

                 //email
                 $ResultData_EMAIL.="<tr>
                 <td colspan='3'>Total</td>
               
                 <td>{$grand_obtain}</td>
                 <td>{$grand_total}</td>
                 </tr>";
                 $ResultData_EMAIL.="<tr>
                 <td colspan='4'>Percentage</td>
               
                 <td>{$percentage}</td>
                 </tr>";
                 $ResultData_EMAIL.="<tr>
                 <td colspan='4'>Result</td>
               
                 <td>{$passfail}</td>
                 </tr>";
               
                 
              
               
            }
           $notice_via=isset($notify[$student_id])? $notify[$student_id] :array();
           if(in_array("whatsapp",$notice_via)){ 
               $result=array("to"=>$mobileno,"text"=>$ResultData_WA);
                array_push($wa_messages,$result);

                 }
           if(in_array("sms",$notice_via)){ 
               $result_SMS=array("to"=>$mobileno,"text"=>$ResultData_SMS);
                array_push($sms_messages,$result_SMS);

                 }
               
           if(in_array("email",$notice_via)){ 
               $result_EMAIL=array("to"=>$email,"text"=>$ResultData_EMAIL);
                array_push($email_messages,$result_EMAIL);

                 }

                 
  
    }
   
   
            
}
    
 //Send Bulk Data
 if($wa_messages){
    $this->sendWhatsapptext($wa_messages,true);
    $message.="=> Whatsapp has been sent<br>" ;   
         }
       if($sms_messages){
   $this->sendSMS($sms_messages,true); 
   $message.="=> SMS has been sent<br>" ;     
         }
       if($email_messages){
   foreach ($email_messages as $key => $email) {
   $message_title="$exam_title";
   $this->mailer->send_mail($email['to'], $message_title, $email['text']);
   sleep(1);
   $message.="=> Email has been sent<br>" ;  
   }
   
  }
       

if($message){
    echo json_encode(array("code"=>200,"message"=>"$message"));
}else{
    echo json_encode(array("code"=>404,"message"=>"Nothing to sent"));

}
    }

}
