<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Homework extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->model("homework_model");
        $this->load->model("staff_model");
        $this->load->model("classteacher_model");
        $this->config->load("app-config");
        $this->load->library('mailsmsconf');
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $this->role;
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('homework', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Homework');
        $this->session->set_userdata('sub_menu', 'homework');
        $data["title"] = "Create Homework";

        $class             = $this->class_model->get();
        $data['classlist'] = $class;

        $userdata                 = $this->customlib->getUserData();
        $carray                   = array();
        $data['class_id']         = "";
        $data['section_id']       = "";
        $data['subject_group_id'] = "";
        $data['subject_id']       = "";

        $homeworklist = $this->homework_model->get();

        $data["homeworklist"] = array();

        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {

        } else {

            $class_id                 = $this->input->post("class_id");
            $section_id               = $this->input->post("section_id");
            $subject_group_id         = $this->input->post("subject_group_id");
            $subject_id               = $this->input->post("subject_id");
            $data['class_id']         = $class_id;
            $data['section_id']       = $section_id;
            $data['subject_group_id'] = $subject_group_id;
            $data['subject_id']       = $subject_id;
            $homeworklist             = $this->homework_model->search_homework($class_id, $section_id, $subject_group_id, $subject_id);

            $data["homeworklist"] = $homeworklist;

            foreach ($data["homeworklist"] as $key => $value) {
                $report                                     = $this->homework_model->getEvaluationReport($value["id"]);
                $data["homeworklist"][$key]["report"]       = $report;
                $create_data                                = $this->staff_model->get($value["created_by"]);
                $eval_data                                  = $this->staff_model->get($value["evaluated_by"]);
                $created_by                                 = $create_data["name"] . " " . $create_data["surname"];
                $evaluated_by                               = $eval_data["name"] . " " . $create_data["surname"];
                $data["homeworklist"][$key]["created_by"]   = $created_by;
                $data["homeworklist"][$key]["evaluated_by"] = $evaluated_by;
            }
        }

        $this->load->view("layout/header", $data);
        $this->load->view("homework/homeworklist", $data);
        $this->load->view("layout/footer", $data);
    }

    public function homework_docs($id)
    { 
        $docs = $this->homework_model->get_homeworkDocByid($id);;
        $docs = json_decode($docs);

        $dt_data = array();
        if (!empty($docs->data)) {
            $doc="";
            foreach ($docs->data as $key => $value) {
                if($value->docs!==''){
                    $doc='<a class="btn btn-default btn-xs" href="'.base_url().'homework/assigmnetDownload/'.$value->docs.'"  data-original-title='.$this->lang->line("evaluation").'>
                <i class="fa fa-download"></i></a>';
                }

                $row = array();
                $row[] = $this->customlib->getFullName($value->firstname,$value->middlename,$value->lastname,$this->sch_setting_detail->middlename,$this->sch_setting_detail->lastname) . " (" . $value->admission_no . ")";;
                $row[] = $value->message;
                $row[] = $doc;
               


                $dt_data[] = $row;
            }
        }

        $json_data = array(
            "draw" => intval($docs->draw),
            "recordsTotal" => intval($docs->recordsTotal),
            "recordsFiltered" => intval($docs->recordsFiltered),
            "data" => $dt_data,
        );
        echo json_encode($json_data);
        
    }

    public function create()
    {
        if (!$this->rbac->hasPrivilege('homework', 'can_add')) {
            access_denied();
        }

        $data["title"]      = "Create Homework";
        $class              = $this->class_model->get();
        $data['classlist']  = $class;
        $data['class_id']   = "";
        $data['section_id'] = "";
        $userdata           = $this->customlib->getUserData();
        $this->form_validation->set_rules('record_id', $this->lang->line('record_id'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('modal_class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('modal_section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('modal_subject_group_id', $this->lang->line('subject') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('modal_subject_id', $this->lang->line('subject'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('homework_date', $this->lang->line('homework_date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('submit_date', $this->lang->line('submission_date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', $this->lang->line('description'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('userfile', $this->lang->line('image'), 'callback_handle_upload');
        if ($this->form_validation->run() == false) {

            $msg = array(
                'record_id'              => form_error('record_id'),
                'modal_class_id'         => form_error('modal_class_id'),
                'modal_section_id'       => form_error('modal_section_id'),
                'modal_subject_group_id' => form_error('modal_subject_group_id'),
                'modal_subject_id'       => form_error('modal_subject_id'),
                'homework_date'          => form_error('homework_date'),
                'submit_date'            => form_error('submit_date'),
                'description'            => form_error('description'),
                'userfile'               => form_error('userfile'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');

        } else {

            $session_id = $this->setting_model->getCurrentSession();
            
       

            $record_id  = $this->input->post('record_id');
            $data       = array(
                'id'                       => $record_id,
                'session_id'               => $session_id,
                'class_id'                 => $this->input->post("modal_class_id"),
                'section_id'               => $this->input->post("modal_section_id"),
                'homework_date'            => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('homework_date'))),
                'submit_date'              => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('submit_date'))),
                'staff_id'                 => $userdata["id"],
                'subject_group_subject_id' => $this->input->post("modal_subject_id"),
                'description'              => $this->input->post("description"),
                'create_date'              => date("Y-m-d"),
                'created_by'               => $userdata["id"],
                'evaluated_by'             => '',
            );

            $id = $this->homework_model->add($data);

            if ($record_id > 0) {
                $id = $record_id;
            } else {

            }

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

            if ($record_id == 0) {
                $homework_detail = $this->homework_model->get($id);
                $this->docs=base_url()."uploads/homework/".$homework_detail['document'];
                if(file_exists($this->docs)){
                    $this->img=true;
                }else{
                    $this->img=false;
                }
                $this->submittion_date=base_url()."uploads/homework/".$homework_detail['document'];
                $this->school = $this->sch_setting_detail;
                $this->logo = base_url() . "uploads/school_content/logo/" . $this->school->app_logo;
                $this->base_url = base_url();
                $this->class=getClass($homework_detail['class_id']);
                $this->section=getSecion($homework_detail['section_id']);
                $this->subject=getSubject($homework_detail['subject_id']);
                $this->title="Home Work Information";
                $this->homework_detail=$homework_detail;
                $this->home_work=$this->input->post("description");
                $this->staff=getStaff($homework_detail['staff_id']);
                $this->submit_date=$homework_detail['submit_date'];
                $html=$this->LoadTemplate("home_work.html");
                $link=$this->create_pdf($html,"home_work_$id.pdf",true);
                $link= $link['url'];
                $notify=$this->input->post("notify");
                $students = $this->studentsession_model->searchMultiStudentByClassSection($homework_detail['class_id'], $homework_detail['section_id']);
                    $messages=array();
                    if($students){
                        foreach ($students as $key => $student) {
                     
                           
                            $text="Dear   {$student['firstname']} {$student['lastname']},\\n_Please find Home work for Subject {$this->subject} , dated: {$homework_detail['homework_date']} in above PDF file & submit *before {$homework_detail['submit_date']}*_ \\n*Regards*\\n {$this->staff['name']} {$this->staff['surname']} ";
                            if($notify=='Whatsapp'){
                            $file_name=$this->subject."_home_work.pdf";
                            $msg=array("to"=>$student['mobileno'],"text"=>$text,'filename'=>$file_name,'link'=>$link);
                            $this->sendWhatsappFile($msg,true);

                        }else{
                            $text="Dear   {$student['firstname']} {$student['lastname']},\nPlease find Home work for Subject {$this->subject} , dated: {$homework_detail['homework_date']} in  PDF file & submit  before {$homework_detail['submit_date']} \nPDF file can be downloaded from $link\nRegards,\n {$this->staff['name']} {$this->staff['surname']} ";
                            $message=array('text'=>$text,'to'=>$student['mobileno']);
                            array_push($messages,$message);

                        }

                          

                            
                        }
                        if($notify=='SMS'){
                           $this->sendSMS($messages,true);

                        }
                    }
                    


               
               


              
            }
     
 
            $msg   = $this->lang->line('success_message');
            $array = array('status' => 'success', 'error' => '', 'message' => $msg,'link'=>$link);
        }

        echo json_encode($array);
    }

    function test()  {
      
        $this->unis='unis';
        $data= $this->LoadTemplate("receipt.html");
        //echo $data;
      $this->create_pdf($data,"unis.pdf",false,['format'=>'A4']);
   


    }

    public function handle_upload()
    {
        $image_validate = $this->config->item('file_validate');
        $result         = $this->filetype_model->get();
        if (isset($_FILES["userfile"]) && !empty($_FILES['userfile']['name'])) {

            $file_type = $_FILES["userfile"]['type'];
            $file_size = $_FILES["userfile"]["size"];
            $file_name = $_FILES["userfile"]["name"];

            $allowed_extension = array_map('trim', array_map('strtolower', explode(',', $result->file_extension)));
            $allowed_mime_type = array_map('trim', array_map('strtolower', explode(',', $result->file_mime)));
            $ext               = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

            if ($files = filesize($_FILES['userfile']['tmp_name'])) {

                if (!in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_upload', $this->lang->line('file_type_not_allowed'));
                    return false;
                }
                if (!in_array($ext, $allowed_extension) || !in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_upload', $this->lang->line('file_type_not_allowed'));
                    return false;
                }
                if ($file_size > $result->file_size) {
                    $this->form_validation->set_message('handle_upload', $this->lang->line('file_size_shoud_be_less_than') . number_format($image_validate['upload_size'] / 1048576, 2) . " MB");
                    return false;
                }
            } else {
                $this->form_validation->set_message('handle_upload', $this->lang->line('file_type_not_allowed'));
                return false;
            }

            return true;
        }
        return true;
    }

    public function getRecord()
    {
        if (!$this->rbac->hasPrivilege('homework', 'can_edit')) {
            access_denied();
        }
        $id             = $this->input->post('id');
        $result         = $this->homework_model->get($id);
        $data["result"] = $result;

        echo json_encode($result);
    }

    public function edit()
    {

        if (!$this->rbac->hasPrivilege('homework', 'can_edit')) {
            access_denied();
        }
        $id            = $this->input->post("homeworkid");
        $data["title"] = "Edit Homework";

        $class              = $this->class_model->get();
        $data['classlist']  = $class;
        $result             = $this->homework_model->get($id);
        $data["result"]     = $result;
        $data['class_id']   = $result["class_id"];
        $data['section_id'] = $result["section_id"];
        $data['subject_id'] = $result["subject_id"];
        $data["id"]         = $id;
        $userdata           = $this->customlib->getUserData();
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('subject_id', $this->lang->line('subject'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('homework_date', $this->lang->line('homework_date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', $this->lang->line('description'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            $msg = array(
                'class_id'      => form_error('class_id'),
                'section_id'    => form_error('section_id'),
                'subject_id'    => form_error('subject_id'),
                'homework_date' => form_error('homework_date'),
                'description'   => form_error('description'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {

            if (isset($_FILES["userfile"]) && !empty($_FILES['userfile']['name'])) {
                $uploaddir = './uploads/homework/';
                if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                    die("Error creating folder $uploaddir");
                }
                $fileInfo = pathinfo($_FILES["userfile"]["name"]);
                $document = basename($_FILES['userfile']['name']);
                $img_name = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["userfile"]["tmp_name"], $uploaddir . $img_name);
            } else {

                $document = $this->input->post("document");
            }

            $data = array(
                'id'            => $id,
                'class_id'      => $this->input->post("class_id"),
                'section_id'    => $this->input->post("section_id"),
                'subject_id'    => $this->input->post("subject_id"),
                'homework_date' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('homework_date'))),
                'submit_date'   => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('submit_date'))),
                'staff_id'      => $userdata["id"],
                'subject_id'    => $this->input->post("subject_id"),
                'description'   => $this->input->post("description"),
                'create_date'   => date("Y-m-d"),
                'document'      => $document,
            );

            $this->homework_model->add($data);
            $msg   = $this->lang->line('update_message');
            $array = array('status' => 'success', 'error' => '', 'message' => $msg);
        }

        echo json_encode($array);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('homework', 'can_delete')) {
            access_denied();
        }
        if (!empty($id)) {

            $this->homework_model->delete($id);
            redirect("homework");
        }
    }

    public function download($id, $doc)
    {
        $this->load->helper('download');
        $name     = $this->uri->segment(4);
        $ext      = explode(".", $name);
        $filepath = "./uploads/homework/" . $id . "." . $ext[1];
        $data     = file_get_contents($filepath);
        force_download($name, $data);
    }

    public function evaluation($id)
    {
        if (!$this->rbac->hasPrivilege('homework_evaluation', 'can_view')) {
            access_denied();
        }
        $data["title"]        = "Homework Evaluation";
        $data["created_by"]   = "";
        $data["evaluated_by"] = "";
        $result               = $this->homework_model->getRecord($id);
        $class_id             = $result["class_id"];
        $section_id           = $result["section_id"];
        $studentlist          = $this->homework_model->getStudents($id);

        $data["studentlist"] = $studentlist;
        $data["result"]      = $result;
        $data['sch_setting'] = $this->setting_model->getSetting();
        if (!empty($result)) {
            $create_data = $this->staff_model->get($result["created_by"]);
            $eval_data   = $this->staff_model->get($result["evaluated_by"]);

            $created_by           = $create_data["name"] . " " . $create_data["surname"];
            $evaluated_by         = $eval_data["name"] . " " . $eval_data["surname"];
            $data["created_by"]   = $created_by;
            $data["evaluated_by"] = $evaluated_by;
        }

        $this->load->view("homework/evaluation_modal", $data);
    }

    public function add_evaluation()
    {

        if (!$this->rbac->hasPrivilege('homework_evaluation', 'can_add')) {
            access_denied();
        }
        $userdata = $this->customlib->getUserData();
        $this->form_validation->set_rules('evaluation_date', $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('student_list[]', $this->lang->line('students'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $msg = array(
                'evaluation_date' => form_error('evaluation_date'),
                'student_list[]'  => form_error('student_list[]'),
            );

            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $insert_prev  = array();
            $insert_array = array();
            $homework_id  = $this->input->post("homework_id");
            $students     = $this->input->post("student_list");
            $home_id      = $this->input->post("homework_id");
            foreach ($students as $std_key => $std_value) {
                if ($std_value == 0) {
                    $insert_array[] = $std_key;
                } else {
                    $insert_prev[] = $std_value;
                }
            }
            $evaluation_date = $this->customlib->dateFormatToYYYYMMDD($this->input->post('evaluation_date'));
            $evaluated_by    = $this->customlib->getStaffID();
            $this->homework_model->addEvaluation($insert_prev, $insert_array, $homework_id, $evaluation_date, $evaluated_by);
            $msg   = $this->lang->line('evaluation_completed_message');
            $array = array('status' => 'success', 'error' => '', 'message' => $msg);
        }
        echo json_encode($array);
    }

    public function evaluation_report()
    {
        if (!$this->rbac->hasPrivilege('homehork_evaluation_report', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'Reports/student_information');
        $this->session->set_userdata('subsub_menu', 'Reports/student_information/evaluation_report');
        $class                    = $this->class_model->get();
        $data['classlist']        = $class;
        $userdata                 = $this->customlib->getUserData();
        $carray                   = array();
        $data['class_id']         = $class_id         = "";
        $data['section_id']       = $section_id       = "";
        $data['subject_id']       = $subject_id       = "";
        $data['subject_group_id'] = $subject_group_id = "";

        $class_id                 = $this->input->post("class_id");
        $section_id               = $this->input->post("section_id");
        $subject_group_id         = $this->input->post("subject_group_id");
        $subject_id               = $this->input->post("subject_id");
        $data['class_id']         = $class_id;
        $data['section_id']       = $section_id;
        $data['subject_group_id'] = $subject_group_id;
        $data['subject_id']       = $subject_id;
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('subject_group_id', $this->lang->line('subject') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('subject_id', $this->lang->line('subject'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {

            $data['resultlist'] = array();
            $data["report"]     = array();
        } else {

            $data['resultlist'] = $this->homework_model->search_homework($class_id, $section_id, $subject_group_id, $subject_id);

            foreach ($data['resultlist'] as $key => $value) {

                $report                       = $this->count_percentage($value["id"], $value["class_id"], $value["section_id"]);
                $data["report"][$value['id']] = $report;
            }
        }

        $this->load->view("layout/header");
        $this->load->view("homework/homework_evaluation", $data);
        $this->load->view("layout/footer");
    }

    public function getreport($id = 1)
    {

        $result = $this->homework_model->getEvaluationReport($id);
        if (!empty($result)) {
            $data["result"]       = $result;
            $class_id             = $result[0]["class_id"];
            $section_id           = $result[0]["section_id"];
            $create_data          = $this->staff_model->get($result[0]["created_by"]);
            $eval_data            = $this->staff_model->get($result[0]["evaluated_by"]);
            $created_by           = $create_data["name"] . " " . $create_data["surname"];
            $evaluated_by         = $eval_data["name"] . " " . $eval_data["surname"];
            $data["created_by"]   = $created_by;
            $data["evaluated_by"] = $evaluated_by;
            $studentlist          = $this->homework_model->getStudents($class_id, $section_id);
            $data["studentlist"]  = $studentlist;
            $this->load->view("homework/evaluation_report", $data);
        } else {
            echo "<div class='row'><div class='col-md-12'><br/><div class='alert alert-info'>".$this->lang->line('no_record_found')."</div></div></div>";
        }
    }

    public function count_percentage($id, $class_id, $section_id)
    {
        $data               = array();
        $count_students     = $this->homework_model->count_students($class_id, $section_id);
        $count_evalstudents = $this->homework_model->count_evalstudents($id, $class_id, $section_id);
        if ($count_students > 0) {
            $total_students     = $count_students;
            $total_evalstudents = $count_evalstudents['total'];
            $count_percentage   = ($total_evalstudents / $total_students) * 100;
            $data["total"]      = $total_students;
            $data["completed"]  = $total_evalstudents;
            $data["percentage"] = round($count_percentage, 2);
        }

        return $data;
    }

    public function getClass()
    {
        $class = $this->class_model->get();
        echo json_encode($class);
    }

    public function assigmnetDownload($doc)
    {
        $this->load->helper('download');
        $name     = $this->uri->segment(5);
        $ext      = explode(".", $name);
        $filepath = "./uploads/homework/assignment/" . $doc;
        $data     = file_get_contents($filepath);
        force_download($name, $data);
    }
    
    
    

}
