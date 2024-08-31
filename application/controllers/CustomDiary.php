<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class CustomDiary extends Admin_Controller
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
        $this->load->view('diary-management/Diary-managemt', $data);
        $this->load->view('layout/footer', $data);
    }
    function searchbyform()
    {

        extract($_REQUEST);
        $homeworklist             = $this->homework_model->search_homework($class_id, $section_id, $subject_group_id, $subject_id);
        $classlist = $this->class_model->get();
       
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        $this->load->view('diary-management/diarymanagementlist', get_defined_vars());
    }
    function addDiary()
    {

        $json = $this->input->get('auth_request');
        $req = json_decode(str_decode($json), true);
        extract($req);

        $subject_group = $this->subjectgroup_model->getGroupByClassandSection($class_id, $section_id);
    

        $this->load->view('diary-management/addDiary', get_defined_vars());
    }



    function saveDiary()
    {
        $userdata           = $this->customlib->getUserData();
        $data       = array(

            'school_id'               => getSchoolID(),
            'session_id'               => getSessionID(getSchoolID()),
            'class_id'                 => $this->input->post("class_id"),
            'section_id'               => $this->input->post("section_id"),
            'homework_date'            => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('homework_date'))),
            'submit_date'              => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('submit_date'))),
            'staff_id'                 => $userdata["id"],
            'subject_group_subject_id' => $this->input->post("subject_id"),
            // 'subject_id' => $this->input->post("subject_group_id"), 
            'description'              => $this->input->post("description"),
            'create_date'              => date("Y-m-d"),
            'created_by'               => $userdata["id"],
            'evaluated_by'             => '',
        );
        pr($data);

        $id = $this->homework_model->add($data);




        if (isset($_FILES["userfile"]) && !empty($_FILES['userfile']['name'])) {
            $uploaddir = './uploads/homework/';
            if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                die("Error creating folder $uploaddir");
            }
            $fileInfo = pathinfo($_FILES["userfile"]["name"]);
            $document = basename($_FILES['userfile']['name']);

            $img_name = $id . '.' . $fileInfo['extension'];
            move_uploaded_file($_FILES["userfile"]["tmp_name"], $uploaddir . $img_name);

            $upload_data = array('id' => $id, 'document' => $img_name);
            $this->homework_model->add($upload_data);
        } else {

            $document = "";
        }

        echo json_encode(array('code'=>200,'message'=>"Diary has been added"));
    }
}
