 <?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class GeneralExam extends Admin_Controller
{

    public $exam_type = array();
    private $sch_current_session = "";

    public function __construct()
    {

        parent::__construct();

        $this->load->library('encoding_lib');
        $this->load->library('mailsmsconf');
        $this->exam_type = $this->config->item('exam_type');
        $this->sch_current_session = $this->setting_model->getCurrentSession();
        $this->attendence_exam = $this->config->item('attendence_exam');
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $check = getGrades();
        if (!$check) {
            $this->session->set_flashdata('msg', '<div class="alert alert-danger text-left">Please Add Grade first before you use general Exam</div>');
            redirect('admin/grade');
        }


    }

    public function exportformat()
    {
        $this->load->helper('download');
        $filepath = "./backend/import/import_marks_sample_file.csv";
        $data = file_get_contents($filepath);
        $name = 'import_marks_sample_file.csv';
        force_download($name, $data);
    }

    public function uploadfile()
    {

        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('file', $this->lang->line('image'), 'callback_handle_upload');
        if ($this->form_validation->run() == false) {
            $data = array(
                'file' => form_error('file'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {
            $return_array = array();
//====================
            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {

                $fileName = $_FILES["file"]["tmp_name"];
                if (isset($_FILES["file"]) && !empty($_FILES['file']['name']) && $_FILES["file"]["size"] > 0) {

                    $file = fopen($fileName, "r");
                    $flag = true;
                    while (($column = fgetcsv($file, 10000, ",")) !== false) {
                        if ($flag) {
                            $flag = false;
                            continue;
                        }
                        if (trim($column['0']) != "" && trim($column['1']) != "" && trim($column['2']) != "") {
                            $return_array[] = json_encode(
                                array(
                                    'adm_no' => $column['0'],
                                    'attendence' => $column['1'],
                                    'marks' => number_format($column['2'], 2, '.', ''),
                                    'note' => $this->encoding_lib->toUTF8($column['3']),
                                )
                            );
                        }
                    }
                }

                $array = array('status' => '1', 'error' => '', 'student_marks' => $return_array);
                echo json_encode($array);
            }
            //=============
        }
    }

    public function handle_upload()
    {

        $image_validate = $this->config->item('csv_validate');

        if (isset($_FILES["file"]) && !empty($_FILES['file']['name']) && $_FILES["file"]["size"] > 0) {

            $file_type = $_FILES["file"]['type'];
            $file_size = $_FILES["file"]["size"];
            $file_name = $_FILES["file"]["name"];
            $allowed_extension = $image_validate['allowed_extension'];
            $ext = pathinfo($file_name, PATHINFO_EXTENSION);
            $allowed_mime_type = $image_validate['allowed_mime_type'];
            $finfo = finfo_open(FILEINFO_MIME_TYPE);
            $mtype = finfo_file($finfo, $_FILES['file']['tmp_name']);
            finfo_close($finfo);

            if (!in_array($mtype, $allowed_mime_type)) {
                $this->form_validation->set_message('handle_upload', 'File Type Not Allowed');
                return false;
            }

            if (!in_array($ext, $allowed_extension) || !in_array($file_type, $allowed_mime_type)) {
                $this->form_validation->set_message('handle_upload', 'Extension Not Allowed');
                return false;
            }
            if ($file_size > $image_validate['upload_size']) {
                $this->form_validation->set_message('handle_upload', $this->lang->line('file_size_shoud_be_less_than') . number_format($image_validate['upload_size'] / 1048576, 2) . " MB");
                return false;
            }

            return true;
        } else {
            $this->form_validation->set_message('handle_upload', 'Please choose a file to upload.');
            return false;
        }
    }

    public function index($id = '')
    {
        if (!$this->rbac->hasPrivilege('exam_group', 'can_view')) {
            access_denied();
        }
        $id = $this->uri->segment(4);
        if ($id) {
            $examgroup = $this->examgroup_model->get($id);
            $data['examgroup'] = $examgroup;
        }


        $this->session->set_userdata('top_menu', 'GeneralExam');
        $this->session->set_userdata('sub_menu', 'GeneralExam/GeneralExam');
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';
        $data['examType'] = $this->exam_type;
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_type', $this->lang->line('exam') . " " . $this->lang->line('type'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {

        } else {
            $is_active = 0;
            $update_id = $this->input->post('update_id');
            $data = array(
                'name' => $this->input->post('name'),
                'exam_type' => $this->input->post('exam_type'),
                'is_active' => $is_active,
                'description' => $this->input->post('description'),
            );

            if ($update_id) {
                $data['id'] = $update_id;
            }
            $insert_id = $this->examgroup_model->add($data);


            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
            redirect('admin/GeneralExam');
        }
        $examgroup_result = $this->examgroup_model->get();
        $data['examgrouplist'] = $examgroup_result;

        $this->load->view('layout/header', $data);
        $this->load->view('admin/GeneralExam/examgroupList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function getExamByExamgroup()
    {
        $exam_group_id = $this->input->post('exam_group_id');
        $data = $this->examgroup_model->getExamByExamGroup($exam_group_id, true);
        echo json_encode($data);
    }

    public function deleteExam()
    {

        $data['title'] = 'deleteExam';
        $id = $this->input->post('id');
        if (!$this->examgroup_model->delete_exam($id)) {
            echo json_encode(array('status' => 0, 'message' => $this->lang->line('something_wrong')));
        } else {
            echo json_encode(array('status' => 1, 'message' => $this->lang->line('record_deleted_successfully')));
        }
    }

    public function exam($id)
    {
        $data = array();
        $data['examgroupDetail'] = $this->examgroup_model->getExamByID($id);
        $data['exam_subjects'] = $this->batchsubject_model->getExamSubjects($id);
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $data['current_session'] = $this->sch_current_session;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/GeneralExam/exam', $data);
        $this->load->view('layout/footer', $data);
    }

    public function examresult($id)
    {
        $data = array();

        $data['id'] = $id;
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $exam_subject_id = $this->input->post('exam_group_class_batch_exam_subject_id');
            $class_id = $this->input->post('class_id');
            $batch_id = $this->input->post('batch_id');
            $data['class_id'] = $this->input->post('class_id');
            $data['batch_id'] = $this->input->post('batch_id');
            $data['exam_group_class_batch_exam_subject_id'] = $this->input->post('exam_group_class_batch_exam_subject_id');

            $data['exam_subjects'] = $this->batchsubject_model->getExamSubjects($id);
            $resultlist = $this->batchsubject_model->examGroupExamResult($class_id, $batch_id, $id);

            $data['resultlist'] = $resultlist;
        }

        $this->load->view('layout/header', $data);
        $this->load->view('admin/GeneralExam/examresult', $data);
        $this->load->view('layout/footer', $data);
    }

    public function addmark($id)
    {
        $data = array();

        $data['exam_subjects'] = $this->batchsubject_model->getExamSubjects($id);
        $data['id'] = $id;
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        if ($this->input->server('REQUEST_METHOD') == 'POST') {

            $exam_subject_id = $this->input->post('exam_group_class_batch_exam_subject_id');
            $data['exam_group_class_batch_exam_subject_id'] = $this->input->post('exam_group_class_batch_exam_subject_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
            $session_id = $this->input->post('session_id');
            $data['class_id'] = $this->input->post('class_id');
            $data['section_id'] = $this->input->post('section_id');
            $data['session_id'] = $this->input->post('session_id');
            $resultlist = $this->examgroupstudent_model->examGroupSubjectResult($exam_subject_id, $class_id, $section_id, $session_id);
            $subject_detail = $this->batchsubject_model->getExamSubject($exam_subject_id);
            $data['subject_detail'] = $subject_detail;
            $data['attendence_exam'] = $this->attendence_exam;
            $data['resultlist'] = $resultlist;
        }

        $this->load->view('layout/header', $data);
        $this->load->view('admin/GeneralExam/addmark', $data);
        $this->load->view('layout/footer', $data);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('exam_group', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Delete Batch';
        $this->examgroup_model->remove($id);
        redirect('admin/GeneralExam');
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('exam', 'can_edit')) {
            access_denied();
        }

        $data['id'] = $id;
        $examgroup = $this->examgroup_model->get($id);
        $data['examgroup'] = $examgroup;
        $data['examType'] = $this->exam_type;
        $examgroup_result = $this->examgroup_model->get();
        $data['examgrouplist'] = $examgroup_result;

        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/GeneralExam/examgroupEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $is_active = 0;

            $data = array(
                'id' => $this->input->post('id'),
                'name' => $this->input->post('name'),
                'exam_type' => $this->input->post('exam_type'),
                'is_active' => $is_active,
                'description' => $this->input->post('description'),
            );
            $insert_id = $this->examgroup_model->add($data);

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');
            redirect('admin/GeneralExam/index');
        }
    }

    public function getByClassSection()
    {
        $section_id = $this->input->post('section_id');
        $data = $this->examgroup_model->getStudentBatch($section_id);
        echo json_encode($data);
    }

    public function addexam($id)
    {

        $add_result=  $this->rbac->hasPrivilege('manage_result', 'enable_add');
        $edit_result=  $this->rbac->hasPrivilege('manage_result', 'enable_edit');
        $delete_result=  $this->rbac->hasPrivilege('manage_result', 'enable_delete');

        $this->session->set_userdata('top_menu', 'Examinations');
        $this->session->set_userdata('sub_menu', 'Examinations/examgroup');
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';

        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $data['examType'] = $this->exam_type;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $subjectlist = $this->subject_model->get();
        $data['subjectlist'] = $subjectlist;

        $data['current_session'] = $this->sch_current_session;
        $data['examgroup'] = $this->examgroup_model->get($id);
        $data['exam_group_id'] = $id;



        $this->load->view('admin/GeneralExam/addexam', $data);

    }

    public function reporting($id)
    {

        if (!$this->rbac->hasPrivilege('exam', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Examinations');
        $this->session->set_userdata('sub_menu', 'Examinations/examgroup');
        $data['title'] = 'Add Batch';
        $data['title_list'] = 'Recent Batch';

        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $data['examType'] = $this->exam_type;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $subjectlist = $this->subject_model->get();
        $data['subjectlist'] = $subjectlist;

        $data['current_session'] = $this->sch_current_session;
        $data['examgroup'] = $this->examgroup_model->get($id);
        $data['exam_group_id'] = $id;


        $this->load->view('admin/GeneralExam/reporting', $data);

    }

    public function getNotAppliedDiscount($student_session_id)
    {
        return $this->feediscount_model->getDiscountNotApplied($student_session_id);
    }

    public function subjectstudent()
    {
        $this->form_validation->set_error_delimiters('<p>', '</p>');
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('subject_id', $this->lang->line('subject'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('session'), 'required|trim|xss_clean');
        $userdata = $this->customlib->getUserData();
        $role_id = $userdata["role_id"];
        $can_edit = 1;
        if (isset($role_id) && ($userdata["role_id"] == 2) && ($userdata["class_teacher"] == "yes")) {
            $myclasssubjects = $this->subjecttimetable_model->canAddExamMarks($userdata["id"], $this->input->post('class_id'), $this->input->post('section_id'), $this->input->post('teachersubject_id'));
            $can_edit = $myclasssubjects;
        }


        if ($this->form_validation->run() == false) {
            $data = array(
                'class_id' => form_error('class_id'),
                'section_id' => form_error('section_id'),
                'session_id' => form_error('session_id'),
                'subject_id' => form_error('subject_id'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } elseif ($can_edit == 0) {
            $msg = array('lesson' => $this->lang->line('not_authoried'));
            $array = array('status' => 0, 'error' => $msg);
            echo json_encode($array);
        } else {

            $exam_subject_id = $this->input->post('subject_id');
            $data['exam_group_class_batch_exam_subject_id'] = $exam_subject_id;
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
            $session_id = $this->input->post('session_id');
            $data['class_id'] = $this->input->post('class_id');
            $data['section_id'] = $this->input->post('section_id');
            $data['session_id'] = $this->input->post('session_id');
            $resultlist = $this->examgroupstudent_model->examGroupSubjectResult($exam_subject_id, $class_id, $section_id, $session_id);

            $subject_detail = $this->batchsubject_model->getExamSubject($exam_subject_id);

            $data['subject_detail'] = $subject_detail;
            $data['attendence_exam'] = $this->attendence_exam;
            $data['resultlist'] = $resultlist;
            $data['sch_setting'] = $this->sch_setting_detail;
            $student_exam_page = $this->load->view('admin/GeneralExam/_partialstudentmarkEntry', $data, true);

            $array = array('status' => '1', 'error' => '', 'page' => $student_exam_page);
            echo json_encode($array);
        }
    }

    public function examstudent()
    {
        $this->form_validation->set_error_delimiters('<li>', '</li>');
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'required|trim|xss_clean');

        $data['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;
        $data['sch_setting'] = $this->sch_setting_detail;
        if ($this->form_validation->run() == false) {
            $msg = array(
                'class_id' => form_error('class_id'),
                'section_id' => form_error('section_id'),
                // 'exam_id'    => form_error('exam_id'),
            );
            $array = array('status' => 0, 'error' => $msg);
            echo json_encode($array);
        } else {

            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');

            $data['class_id'] = $this->input->post('class_id');
            $data['section_id'] = $this->input->post('section_id');
            $data['exam_id'] = $this->input->post('exam_id');
            $resultlist = $this->examstudent_model->searchExamStudents($data['class_id'], $data['section_id'], $data['exam_id']);

            $data['resultlist'] = $resultlist;
            $student_exam_page = $this->load->view('admin/GeneralExam/_partialexamstudent', $data, true);
            $array = array('status' => '1', 'error' => '', 'page' => $student_exam_page);
            echo json_encode($array);
        }
    }

    public function ajaxaddexam()
    {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('exam', $this->lang->line('exam'), 'required|trim|xss_clean');
        $this->form_validation->set_rules('session_id', $this->lang->line('session'), 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'exam' => form_error('exam'),
                'session_id' => form_error('session_id'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {

            $exam_id = $this->input->post('exam_id');
            $is_active = $this->input->post('is_active');
            $is_publish = $this->input->post('is_publish');

            if (isset($is_active)) {
                $is_active = 1;
            } else {
                $is_active = 0;
            }

            if (isset($is_publish)) {
                $is_publish = 1;
            } else {
                $is_publish = 0;
            }

            $postarray = array(
                'exam' => $this->input->post('exam'),
                'exam_group_id' => $this->input->post('exam_group_id'),
                'session_id' => $this->input->post('session_id'),
                'is_active' => $is_active,
                'is_publish' => $is_publish,
                'description' => $this->input->post('description'),
            );

            if ($exam_id != 0) {
                $postarray['id'] = $exam_id;
            }

            $inserted_id = $this->examgroup_model->add_exam($postarray);
            $exam_data = $this->examgroup_model->getExamByID($exam_id);
            if ($is_publish) {

                $exam_students = $this->examgroupstudent_model->searchExamStudentsByExam($exam_id);
                $student_exams = array('exam' => $exam_data, 'exam_result' => $exam_students);
                $s = $this->mailsmsconf->mailsms('exam_result', $student_exams);
            }

            if ($exam_id != 0) {
                $array = array('status' => '1', 'error' => '', 'message' => $this->lang->line('update_message'));
            } else {
                $array = array('status' => '1', 'error' => '', 'message' => $this->lang->line('success_message'));
            }

            echo json_encode($array);
        }
    }

    public function getExamsByExamGroup()
    {
        $exam_group_id = $this->input->post('exam_group_id');
        $exams = $this->examgroup_model->getExamByExamGroup($exam_group_id, true);

        $array = array('status' => '1', 'error' => '', 'result' => $exams);
        echo json_encode($array);
    }

    public function entrymarks()
    {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('exam_group_class_batch_exam_subject_id', 'Subject', 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'exam_group_class_batch_exam_subject_id' => form_error('exam_group_class_batch_exam_subject_id'),
            );
            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {

            $exam_group_student_id = $this->input->post('exam_group_student_id');
            $insert_array = array();
            $update_array = array();
            if (!empty($exam_group_student_id)) {
                foreach ($exam_group_student_id as $exam_group_student_key => $exam_group_student_value) {
                    $attendance_post = $this->input->post('exam_group_student_attendance_' . $exam_group_student_value);
                    if (isset($attendance_post)) {
                        $attendance = $this->input->post('exam_group_student_attendance_' . $exam_group_student_value);
                    } else {
                        $attendance = "present";
                    }
                    $array = array(
                        'exam_group_class_batch_exam_subject_id' => $this->input->post('exam_group_class_batch_exam_subject_id'),
                        'exam_group_class_batch_exam_student_id' => $exam_group_student_value,
                        'attendence' => $attendance,
                        'get_marks' => $this->input->post('exam_group_student_mark_' . $exam_group_student_value),
                        'note' => $this->input->post('exam_group_student_note_' . $exam_group_student_value),
                    );
                    $insert_array[] = $array;
                }
            }

            $this->examgroupstudent_model->add_result($insert_array);
            $array = array('status' => '1', 'error' => '', 'message' => $this->lang->line('success_message'));
            echo json_encode($array);
        }
    }

    public function getexam()
    {
        $examgroup_id = $this->input->post('examgroup_id');
        $data['examList'] = $this->examgroup_model->getExamByExamGroup($examgroup_id);

        $data['exam_page'] = $this->load->view('admin/GeneralExam/_partialexamList', $data, true);

        echo json_encode($data);
    }

    public function connectexams()
    {
        $examgroup_id = $this->input->post('examgroup_id');
        $data['examList'] = $this->examgroup_model->getExamByExamGroupConnection($examgroup_id);
        $data['examgroup_id'] = $examgroup_id;

        $data['exam_page'] = $this->load->view('admin/GeneralExam/_partialexamListConnection', $data, true);
        echo json_encode($data);
    }

    public function getExamByID()
    {
        $exam_id = $this->input->post('exam_id');
        $result = $this->examgroup_model->getExamByID($exam_id);
        if (!empty($result)) {
            $result->date_from = $this->customlib->dateformat($result->date_from);
            $result->date_to = $this->customlib->dateformat($result->date_to);
        }
        $data['exam'] = $result;
        echo json_encode($data);
    }

    public function getexamSubjects()
    {
        $exam_id = $this->input->post('exam_id');
        $class_batch_id = $this->input->post('class_batch_id');
        $exam_group_ids = $this->input->post('exam_group_id');
        $data['examgroupDetail'] = $this->examgroup_model->getExamByID($exam_id);
        $data['exam_subjects'] = $this->batchsubject_model->getExamSubjects($exam_id);
        $data['batch_subjects'] = $this->subject_model->get();

        $data['exam_id'] = $exam_id;
        $data['exam_subjects_count'] = count($data['exam_subjects']);

        $data['batch_subject_dropdown'] = $this->load->view('admin/GeneralExam/_partialexamSubjectDropdown', $data, true);

        $data['subject_page'] = $this->load->view('admin/GeneralExam/_partialexamSubjects', $data, true);

        echo json_encode($data);
    }

    public function getSubjectByExam()
    {
        $data = array();
        $id = $this->input->post('recordid');
        $data['examgroupDetail'] = $this->examgroup_model->getExamByID($id);

        $data['exam_subjects'] = $this->batchsubject_model->getExamSubjects($id);

        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $session = $this->session_model->get();
        $data['sessionlist'] = $session;
        $data['current_session'] = $this->sch_current_session;
        $data['subject_page'] = $this->load->view('admin/GeneralExam/_getSubjectByExam', $data, true);
        echo json_encode($data);
    }

    public function addexamsubject()
    {

        $student_id = '';
        $this->form_validation->set_rules('examgroup_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('exam_group_class_batch_exam_id', $this->lang->line('exam') . " " . $this->lang->line('id'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('rows[]', $this->lang->line('subject'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {

            $msg = array(
                'examgroup_id' => form_error('examgroup_id'),
                'exam_group_class_batch_exam_id' => form_error('exam_group_class_batch_exam_id'),
                'rows' => form_error('rows[]'),
            );

            $array = array('status' => '0', 'error' => $msg, 'message' => '');
        } else {
            $insert_array = array();
            $update_array = array();
            $subject_array = array();

            $not_be_del = array();

            $rows = $this->input->post('rows');
            foreach ($rows as $row_key => $row_value) {

                $update_id = $this->input->post('prev_row[' . $row_value . ']');
                if ($update_id == 0) {

                    if ($this->input->post('exam_group_class_batch_exam_id') != "" && $this->input->post('subject_' . $row_value) != "" && $this->input->post('date_from_' . $row_value) != "" && $this->input->post('time_from' . $row_value) != "" && $this->input->post('duration' . $row_value) != "" && $this->input->post('max_marks_' . $row_value) != "" && $this->input->post('min_marks_' . $row_value) != "") {

                        $insert_array[] = array(
                            'exam_group_class_batch_exams_id' => $this->input->post('exam_group_class_batch_exam_id'),
                            'subject_id' => $this->input->post('subject_' . $row_value),
                            'credit_hours' => $this->input->post('credit_hours' . $row_value),
                            'date_from' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date_from_' . $row_value))),
                            'time_from' => $this->input->post('time_from' . $row_value),
                            'duration' => $this->input->post('duration' . $row_value),
                            'room_no' => $this->input->post('room_no_' . $row_value),
                            'max_marks' => $this->input->post('max_marks_' . $row_value),
                            'min_marks' => $this->input->post('min_marks_' . $row_value),
                        );
                    }
                } else {
                    $not_be_del[] = $update_id;
                    $update_array[] = array(
                        'id' => $update_id,
                        'credit_hours' => $this->input->post('credit_hours_' . $row_value),
                        'exam_group_class_batch_exams_id' => $this->input->post('exam_group_class_batch_exam_id'),
                        'subject_id' => $this->input->post('subject_' . $row_value),
                        'date_from' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date_from_' . $row_value))),
                        'time_from' => $this->input->post('time_from' . $row_value),
                        'duration' => $this->input->post('duration' . $row_value),
                        'room_no' => $this->input->post('room_no_' . $row_value),
                        'max_marks' => $this->input->post('max_marks_' . $row_value),
                        'min_marks' => $this->input->post('min_marks_' . $row_value),
                    );
                }
            }

            $this->examsubject_model->add($insert_array, $update_array, $not_be_del, $this->input->post('exam_group_class_batch_exam_id'));

            $array = array('status' => '1', 'error' => '', 'message' => $this->lang->line('success_message'));
        }

        echo json_encode($array);
    }

    public function assign($id)
    {
        if (!$this->rbac->hasPrivilege('fees_group_assign', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Batch');
        $this->session->set_userdata('sub_menu', 'examgroup/index');
        $data['id'] = $id;
        $data['title'] = 'student fees';
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $examgroup = $this->examgroup_model->getExamGroupDetailByID($id);

        $data['examgroup'] = $examgroup;
        $session_result = $this->session_model->get();
        $data['sessionlist'] = $session_result;

        if ($this->input->server('REQUEST_METHOD') == 'POST') {

            $data['class_id'] = $this->input->post('class_id');
            $data['section_id'] = $this->input->post('section_id');
            $data['session_id'] = $this->input->post('session_id');
            $data['examgroup_id'] = $this->input->post('examgroup_id');

            $resultlist = $this->examgroupstudent_model->searchExamGroupStudents($data['examgroup_id'], $data['class_id'], $data['section_id'], $data['session_id']);

            $data['resultlist'] = $resultlist;
        }

        $this->load->view('layout/header', $data);
        $this->load->view('admin/GeneralExam/assign', $data);
        $this->load->view('layout/footer', $data);
    }

    public function addstudent()
    {
        $this->form_validation->set_rules('exam_group', $this->lang->line('exam') . " " . $this->lang->line('group'), 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'exam_group' => form_error('exam_group'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {
            $array_insert = array();
            $array_delete = array();
            $exam_group = $this->input->post('exam_group');

            $students_id = $this->input->post('students_id');
            $all_students = $this->input->post('all_students');
            $students = array();
            if (!isset($students_id)) {
                $students_id = array();
            }
            if (!empty($all_students)) {
                foreach ($all_students as $all_students_key => $all_students_value) {
                    if (in_array($all_students_value, $students_id)) {

                        $array_insert[] = array(
                            'exam_group_id' => $exam_group,
                            'student_id' => $all_students_value,
                            'student_session_id' => $all_students_value,
                        );
                    } else {
                        $array_delete[] = $all_students_value;
                    }
                }
            }

            $this->examgroupstudent_model->add($array_insert, $array_delete, $exam_group);

            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
            echo json_encode($array);
        }
    }

    public function ajaxConnectForm()
    {
        if (isset($_POST['action'])) {
            if ($this->input->post('action') == "reset") {
                $exam_group_id = $this->input->post('examgroup_id');
                $this->examgroup_model->deleteExamGroupConnection($exam_group_id);
                $array = array('status' => 1, 'error' => '', 'message' => $this->lang->line('update_message'));
                echo json_encode($array);
            } elseif ($this->input->post('action') == "save") {

                $this->form_validation->set_error_delimiters('', '');
                $this->form_validation->set_rules('examgroup_id', $this->lang->line('exam') . " " . $this->lang->line('group'), 'required|trim|xss_clean');

                if ($this->form_validation->run() == false) {
                    $data = array(
                        'examgroup_id' => form_error('examgroup_id'),
                    );
                    $array = array('status' => 0, 'error' => $data);
                    echo json_encode($array);
                } else {
                    $array = array();
                    $exam_array = $this->input->post('exam[]');
                    if (!empty($exam_array)) {
                        if (count($exam_array) <= 1) {
                            $array = array('status' => 0, 'error' => '', 'message' => $this->lang->line('please_select_atleast_two_or_more_exams'));
                        } else {

                            $exam_group = $this->examgroup_model->verifyExamConnection($exam_array);

                            if ($exam_group['no_record']) {
                                if (count($exam_group['exam_subject_array']) != count($exam_array)) {
                                    $array = array('status' => 0, 'error' => '', 'message' => $this->lang->line('please_check_exam_subjects'));
                                    $insert_success = 0;
                                } else {

                                    reset($exam_group['exam_subject_array']);
                                    $result = key($exam_group['exam_subject_array']);

                                    $insert_success = 1;
                                    foreach ($exam_group['exam_subject_array'] as $exam_subject_key => $exam_subject_value) {

                                        $compair_result = $this->compare_multi_Arrays($exam_group['exam_subject_array'][$result], $exam_group['exam_subject_array'][$exam_subject_key]);

                                        if ($compair_result) {

                                            if (!empty($compair_result['more']) || !empty($compair_result['less']) || !empty($compair_result['diff'])) {
                                                $array = array('status' => 0, 'error' => '', 'message' => $this->lang->line('please_check_exam_subjects'));
                                                $insert_success = 0;
                                                break;
                                            }
                                        } else {
                                            $array = array('status' => 0, 'error' => '', 'message' => $this->lang->line('please_check_exam_subjects'));
                                            $insert_success = 0;
                                            break;
                                        }
                                    }
                                }
                            } else {
                                $array = array('status' => 0, 'error' => '', 'message' => $this->lang->line('exams_subject_may_be_empty_please_check_exam_subjects'));
                                $insert_success = 0;
                            }

                            if ($insert_success) {
                                $insert_array = array();
                                $exam_group_id = $this->input->post('examgroup_id');
                                if (!empty($exam_array)) {
                                    foreach ($exam_array as $exam_key => $exam_value) {

                                        $insert_array[] = array(
                                            'exam_group_id' => $exam_group_id,
                                            'exam_group_class_batch_exams_id' => $exam_value,
                                            'exam_weightage' => $this->input->post('exam_' . $exam_value),
                                        );
                                    }
                                }

                                $this->examgroup_model->connectExam($insert_array, $exam_group_id);
                                $array = array('status' => 1, 'error' => '', 'message' => $this->lang->line('exam_connected_successfully'));
                            }
                        }
                    } else {
                        $array = array('status' => 0, 'error' => '', 'message' => $this->lang->line('no_exams_selected'));
                    }

                    echo json_encode($array);
                }
            }
        }
    }

    public function compare_multi_Arrays($array1, $array2)
    {
        if (!empty($array1) && !empty($array2)) {
            $result = array("more" => array(), "less" => array(), "diff" => array());
            foreach ($array1 as $k => $v) {
                if (is_array($v) && isset($array2[$k]) && is_array($array2[$k])) {
                    $sub_result = compare_multi_Arrays($v, $array2[$k]);

                    foreach (array_keys($sub_result) as $key) {
                        if (!empty($sub_result[$key])) {
                            $result[$key] = array_merge_recursive($result[$key], array($k => $sub_result[$key]));
                        }
                    }
                } else {
                    if (isset($array2[$k])) {
                        if ($v !== $array2[$k]) {
                            $result["diff"][$k] = array("from" => $v, "to" => $array2[$k]);
                        }
                    } else {
                        $result["more"][$k] = $v;
                    }
                }
            }
            foreach ($array2 as $k => $v) {
                if (!isset($array1[$k])) {
                    $result["less"][$k] = $v;
                }
            }
            return $result;
        }
        return false;
    }

    public function getExamGroupByClassSection()
    {
        $exam_group = array();
        $class_id = $this->input->post('class_id');
        $section_id = $this->input->post('section_id');
        $session_id = $this->input->post('session_id');
        $exam_group = $this->examgroup_model->getExamGroupByClassSection($class_id, $section_id, $session_id);
        echo json_encode(array('status' => 1, 'exam_group' => $exam_group));
    }

    public function entrystudents()
    {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('exam_group_class_batch_exam_id', $this->lang->line('exam'), 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {

            $data = array(
                'exam_group_class_batch_exam_id' => form_error('exam_group_class_batch_exam_id'),
            );

            $array = array('status' => 0, 'error' => $data);
            echo json_encode($array);
        } else {
            $check_alreay_inserted_students = array();
            $state = 1;
            $exam_group_class_batch_exam_id = $this->input->post('exam_group_class_batch_exam_id');
            $student_session = $this->input->post('student_session_id');
            $all_students = $this->input->post('all_students');
            $insert_array = array();
            if (isset($student_session) && !empty($student_session)) {
                foreach ($student_session as $student_key => $student_value) {
                    $check_alreay_inserted_students[] = $this->input->post('student_' . $student_value);
                    $insert_array[] = array(
                        'exam_group_class_batch_exam_id' => $exam_group_class_batch_exam_id,
                        'student_id' => $this->input->post('student_' . $student_value),
                        'student_session_id' => $student_value,
                    );
                }
            }

            // if (!empty($check_alreay_inserted_students)) {
            //     $student_exists = $this->examstudent_model->checkStudentExists($check_alreay_inserted_students, $exam_group_class_batch_exam_id);
            //     if (!empty($student_exists)) {
            //         $state = 0;
            //     }
            // }
            // if ($state) {
            $this->examstudent_model->add_student($insert_array, $exam_group_class_batch_exam_id, $all_students);
            $array = array('status' => '1', 'error' => '', 'message' => $this->lang->line('success_message'));
            // } else {
            //     $array = array('status' => '0', 'error' => '', 'message' => $this->lang->line('some_students_are_already_added_in_other_session'));
            // }

            echo json_encode($array);
        }
    }

    function getStudents()
    {
        $this->base_url = base_url();
        pullData('entry_lock', true);  //after return entry lock will be open
        $this->action = $this->input->get('action');
        $this->from_date = $this->input->get('from_date');
        $this->to_date = $this->input->get('to_date');
        $this->auth_id = $this->input->get('auth_id');
        $this->exam_name = $this->input->get('exam_name');
        $this->school = $this->sch_setting_detail;
        $this->logo = base_url() . "uploads/school_content/logo/" . $this->school->admin_logo;
        $this->grades = getGrades();
        $this->session_id = getSessionID(getSchoolID());




        $this->class_id = $class_id = $this->input->get('class_id');
        $this->exam_group_id = $this->input->get('exam_group_id');
        $this->exam_group_id = $this->input->get('exam_group_id');
        $this->exam_group_name = db::getCell("SELECT name from exam_groups where id={$this->exam_group_id}");
        $this->class_name = db::getCell("SELECT class from classes where id=$class_id");
        $this->section_id = $section_id = $this->input->get('section_id');
        $this->section_name = db::getCell("SELECT section from sections where id=$section_id");
        $this->total_marks = $this->input->get('total_marks');
        $this->exam_date = $this->input->get('exam_date');
        $this->subject_id = $this->input->get('subject_id');
        if($this->subject_id){
            $this->subject_name = db::getCell("SELECT name from subjects where id=" . $this->subject_id . " ");
        }
        $this->exam_no = db::getCell("SELECT exams from exam_groups where id='" . $this->exam_group_id . "'") + 1;

        if ($this->action == 1) {


            if ($this->auth_id) {

                $sql = "select* , ss.id as exam_id , s.id as sid from students s inner join general_exam_results  ss on s.id=ss.student_id  where ss.school_id='" . getSchoolID() . "' and ss.class_id='$class_id' and ss.section_id='$section_id' and ss.auth_id='" . $this->auth_id . "' ";
                $this->students = db::getRecords($sql);


            } else {
                $this->students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);

            }


            $this->tpl = TPL_PATH;
            if ($this->students) {
                $html = $this->LoadTemplate('students/add_general_result.html');
                echo $html;
            }
        } else if ($this->action == '2') {
            $where = "";
            if ($this->subject_id) {
                $where .= " AND e.subject_id=" . $this->subject_id;
            }
            if ($this->exam_name) {
                $where .= " AND e.exam_name='" . $this->exam_name . "'";
            }

            $sql = "SELECT * ,
                  (SELECT count(id) from general_exam_results where auth_id=e.auth_id  ) as total_attendant,
                  (SELECT count(id) from general_exam_results where percentage < 30 and  auth_id=e.auth_id  ) as fail_students 
                   FROM  general_exam_results e  
                   where e.exam_group_id='" . $this->exam_group_id . "' and
                     e.school_id='" . getSchoolID() . "' and 
                     e.class_id='$class_id' and
                      e.section_id='$section_id' and 
                      e.exam_date BETWEEN '" . date('Y-m-d', strtotime($this->from_date)) . "' and '" . date('Y-m-d', strtotime($this->to_date)) . "' 
                      $where  group by e.auth_id  ";


            $this->view_results = db::getRecords($sql);


            $html = $this->LoadTemplate('students/view_general_result.html');
            echo $html;
        } else if ($this->action == '3') {

            $this->subjectlist = $this->subject_model->get();
            $school_id = getSchoolID();
            if($class_id && $section_id) {
                $where = " WHERE exam_group_id ='{$this->exam_group_id}' and exam_name='{$this->exam_name}' and school_id='$school_id' AND class_id={$this->class_id} and section_id={$this->section_id} ";
                $this->date_sheet = db::getRecords("SELECT* from date_sheet $where");
                $html = $this->LoadTemplate('make_date_sheet.html');
                echo $html;
            }else{
               echo  $html = $this->LoadTemplate('no_result.html');

            }
        }


    }

    function save_result()
    {
        $exist = pullData('entry_lock', false);
        if (!$exist) {
            pushData('entry_lock', true);

        }
        if ($exist) {
            echo json_encode(array('status' => 201, 'message' => "Result processed CODE=201"));
            die;
        }
        $students = $this->input->post('student');
        $exam_name = $this->input->get('exam_name');
        $auth_id = $this->input->post('auth_id');
        $results = $this->input->post('result');
        $notify = $this->input->post('notify');
        $save = $this->input->post('save');
        $exam_group_id = $this->input->post('$exam_group_id');
        $exam_no = str_encode(getSchoolID() . time() . rand(1111, 9999));

        if ($students) {
            $messages = array();
            foreach ($students as $student_id => $student) {

                $student = json_decode($student);
                $result = $results[$student->id];
                $id = isset($result['exam_id']) ? $result['exam_id'] : '';
                unset($result['exam_id']);
                if ($result['obtain'] == '') {
                    $result['obtain'] = 'ABS';
                }
                if (isset($result['exam_date'])) {
                    $result['exam_date'] = date('Y-m-d', strtotime($result['exam_date']));
                }
                $result['auth_id'] = $exam_no;
                $result['school_id'] = getSchoolID();
                $result['exam_name'] = $exam_name;
                $result['session_id'] = getSessionID(getSchoolID());
                $result['added_by'] = $this->session->userdata['admin']['username'];

                if ($save[$student_id]) {
                    if ($auth_id) {
                        //update
                        $query = db::prepUpdateQuery($result, 'general_exam_results', 'id', $id);

                        db::updateRecord($query);
                        $result_id = true;
                    } else {
                        $query = db::prepInsertQuery($result, 'general_exam_results');

                        $result_id = db::insertRecord($query);
                    }

                } else {
                    $result_id = true;
                }

                if ($notify[$student_id]) {
                    $text = "*{$result['exam_group_name']} Result*\n*_Exam Name:_* {$result['exam_name']}\n*Dated*:{$result['exam_date']}\n*Name*: {$student->firstname}\n*Roll #*: {$student->roll_no}\n*Class*: {$result['class_name']}\n*------*\n*Subject Name*: {$result['subject_name']}\n*Obtain Marks*: {$result['obtain']}\n*Total marks*: {$result['total']}\n*Percentage*: {$result['percentage']}\n*Grade*: {$result['grade']}\n*------*\nNote: System generated result- if error , accepted";
                    $phone = $student->mobileno;
                    array_push($messages, array('to' => $phone, 'text' => $text));

                }


            }

            if ($messages) {
                $this->sendSMS($messages, true);
                $this->sendWhatsapptext($messages, true);
            }

            if ($result_id) {


                echo json_encode(array('status' => 200, 'message' => "Result processed"));
            } else {
                echo json_encode(array('status' => 404, 'message' => "Error while saving result"));
            }


        }

    }

    function delete_res()
    {
        $auth_id = $this->input->post('auth_id');
        db::query("DELETE FROM general_exam_results WHERE auth_id='$auth_id' ");
        echo json_encode(array('status' => 200, 'message' => "Result Deleted"));

    }

    function getreporting($exam_group_id)
    {
        $this->school = $this->sch_setting_detail;
        $this->logo = base_url() . "uploads/school_content/logo/" . $this->school->admin_logo;
        $this->base_url = base_url();
        $this->exam_title = "";
        $this->grades = getGrades();
        $this->print_date = date('d/m/Y h:i:s a');
        $this->class_id = $class_id = $this->input->post('class_id');
        $this->exam_group_id = $this->input->post('exam_group_id');
        $this->exam_group_id = $this->input->post('exam_group_id');
        if($this->exam_group_id) {
            $this->exam_group_name = db::getCell("SELECT name from exam_groups where id={$this->exam_group_id}");
        }
       if($class_id)
           $this->class_name = db::getCell("SELECT class from classes where id=$class_id");
        $this->section_id = $section_id = $this->input->post('section_id');
       if($this->section_id)
           $this->section_name = db::getCell("SELECT section from sections where id=$section_id");
        $this->total_marks = $this->input->post('total_marks');
        $this->exam_date = $this->input->post('exam_date');
        $this->subject_id = $this->input->post('subject_id');
        if($this->subject_id)
            $this->subject_name = db::getCell("SELECT name from subjects where id=" . $this->subject_id . " ");




        $this->req = $req = (object)$this->input->post();

        //  pr($req);
        $search_by = $req->search_by;
        $where = " WHERE ";
        if ($search_by == 2) {
            if (empty($req->from_date)) {
                $this->showResponse(201, array('message' => "From Date not given"));
                die;
            }
            if (empty($req->to_date)) {
                $this->showResponse(201, array('message' => "To Date not Given"));
                die;
            }
            $where .= "e.exam_date BETWEEN '" . date('Y-m-d', strtotime($req->from_date)) . "' AND '" . date('Y-m-d', strtotime($req->to_date)) . "' AND";
            $this->exam_title = "** Exam Result {$req->from_date} to {$req->to_date} **";
        } else if ($search_by == 1) {
            if (empty($req->exam_name)) {
                $this->showResponse(201, array('message' => "Exam not given"));
                die;
            }
            $where .= "  e.exam_name ='{$req->exam_name}' AND";
            $this->exam_title = "** " . $req->exam_name . " **";
        }

        if ($req->is_by_student == 1) {

        } else {
            if($req->class_id) {
                $where .= "  e.class_id ='{$req->class_id}' AND e.section_id ='{$req->section_id}' AND ";
            }
            }

        $where .= ' e.school_id=' . getSchoolID() . ' AND e.session_id =' . getSessionID(getSchoolID()) . ' ';


        switch ($req->action) {
            case 1:
                $query = "SELECT* from students where id='{$req->student_id}' and  school_id='" . getSchoolID() . "'  ";

                $result = db::getRecords($query);

                if (!$result) {
                    $this->showResponse(201, array('message' => 'Student Roll number Incorrect'));
                    die;
                }
                foreach ($result as $key => $student) {
                    $sql_results_query = "SELECT* from general_exam_results e $where  and e.student_id='{$student['id']}' order by e.exam_date ";
                    $results = db::getRecords($sql_results_query);

                    $result[$key]['results'] = $results;
                    $total = 0;
                    $obtain = 0;
                    $absent = 0;
                    $absent_subjetc = "";
                    foreach ($results as $r => $res) {
                        $total += $res['total'];
                        if ($res['obtain'] == 'ABS') {
                            $absent++;
                            $absent_subjetc .= $res['subject_name'] . " ,";
                        } else {
                            $obtain += $res['obtain'];
                        }
                    }

                    $result[$key]['total_marks'] = $total;
                    $result[$key]['obtain_marks'] = $obtain;
                    $result[$key]['pecentage'] = $per = round($obtain / $total * 100, 2);
                    $result[$key]['grade'] = getMyGrade($per);
                    $result[$key]['remarks'] = getExamRemarks($per);
                    if (!$results) {
                        unset($result[$key]);
                    }


                }
                $this->res = $result;

                $html = $this->LoadTemplate('results/bulk_student_result.html');
                echo $html;


                break;

            case 2:
                $this->students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
                $result = (array)$this->students;

                if (!$result) {
                    $this->showResponse(201, array('message' => 'Student Roll number Incorrect'));
                    die;
                }
                foreach ($result as $key => $student) {
                    $sql_results_query = "SELECT* from general_exam_results e $where  and e.student_id='{$student['id']}' order by e.exam_date ";
                    $results = db::getRecords($sql_results_query);

                    $result[$key]['results'] = $results;
                    $total = 0;
                    $obtain = 0;
                    $absent = 0;
                    $absent_subjetc = "";
                    foreach ($results as $r => $res) {
                        $total += $res['total'];
                        if ($res['obtain'] == 'ABS') {
                            $absent++;
                            $absent_subjetc .= $res['subject_name'] . " ,";
                        } else {
                            $obtain += $res['obtain'];
                        }
                    }

                    $result[$key]['total_marks'] = $total;
                    $result[$key]['obtain_marks'] = $obtain;
                    $result[$key]['pecentage'] = $per = round($obtain / $total * 100, 2);
                    $result[$key]['grade'] = getMyGrade($per);
                    $result[$key]['remarks'] = getExamRemarks($per);
                    if (!$results) {
                        unset($result[$key]);
                    }


                }
                $this->res = $result;
                $this->exam_title=$this->exam_title;

                $html = $this->LoadTemplate('results/bulk_student_result.html');
                echo $html;


                break;
            case 3:

                    $sql_results_query = "
                    SELECT
    e.student_id,
    sum(e.obtain) as obtain,
    sum(e.total) as total,
    ROUND((sum(e.obtain)/sum(e.total)*100),2) as per,
    (SELECT name FROM `grades` where ROUND((sum(e.obtain)/sum(e.total)*100),2) >=mark_upto limit 1 ) as grade,
  s.firstname,s.lastname,
    s.roll_no,
    s.father_name,
    s.mobileno,
     RANK() OVER (ORDER BY sum(e.obtain) DESC) AS rank
    
FROM
    general_exam_results e
INNER JOIN
    students s ON s.id = e.student_id
$where
GROUP BY
    e.student_id  ORDER by rank;
                    ";






                    $results = db::getRecords($sql_results_query);
                  
                    foreach($results as $key=>$res){
                        $student_id=$res['student_id'];
                        $subjects=db::getRecords("SELECT distinct e.subject_name from general_exam_results e $where");
                        $myresult=array();

                        foreach ($subjects as $sid=>$subject){
                            $exam_sql="SELECT sum(e.obtain) as obtain ,
                            ROUND((sum(e.obtain)/sum(e.total)*100),2) as per,
                            (SELECT name FROM `grades` where ROUND((sum(e.obtain)/sum(e.total)*100),2) >=mark_upto limit 1 ) as grade
                             sum(e.total) as total from general_exam_results e $where and e.student_id=$student_id and e.subject_name='{$subject['subject_name']}'";
                            $myresult[$subject['subject_name']]=db::getRecord($exam_sql);
                        }
                        $results[$key]['results']=  $myresult;
                    }


                $this->res = $results;

                $html = $this->LoadTemplate('results/awardlist.html');
                echo $html;


                break;
            case 4:

                    $sql_results_query = "
                    SELECT
    e.student_id,
    sum(e.obtain) as obtain,
    sum(e.total) as total,
    ROUND((sum(e.obtain)/sum(e.total)*100),2) as per,
    s.mobileno,
    (SELECT name FROM `grades` where ROUND((sum(e.obtain)/sum(e.total)*100),2) >=mark_upto limit 1 ) as grade,
   s.firstname,s.lastname,
    s.roll_no,
    s.father_name,
     RANK() OVER (ORDER BY sum(e.obtain) DESC) AS rank
    
FROM
    general_exam_results e
INNER JOIN
    students s ON s.id = e.student_id
$where
GROUP BY
    e.student_id  ORDER by rank;
                    ";



                    $results = db::getRecords($sql_results_query);






                foreach($results as $key=>$res){
                        $student_id=$res['student_id'];
                        $subjects=db::getRecords("SELECT distinct e.subject_name from general_exam_results e $where");
                        $myresult=array();
                        $this->sub_count=count($subjects);
                        $this->sub=$subjects;

                       $mygrade['ashole'][$res['grade']]=$mygrade['ashole'][$res['grade']]+1;

                        foreach ($subjects as $sid=>$subject){
                            $exam_sql="SELECT sum(e.obtain) as obtain ,
                            ROUND((sum(e.obtain)/sum(e.total)*100),2) as per,
                            (SELECT name FROM `grades` where ROUND((sum(e.obtain)/sum(e.total)*100),2) >=mark_upto limit 1 ) as grade,
                             sum(e.total) as total from general_exam_results e $where and e.student_id=$student_id and e.subject_name='{$subject['subject_name']}'";
                            $by_subject= db::getRecord($exam_sql);
                            $myresult[$subject['subject_name']]=$by_subject;

                            $mygrade['bysubject'][$subject['subject_name']][$by_subject['grade']]=$mygrade['bysubject'][$subject['subject_name']][$by_subject['grade']]+1;
                        }
                        $results[$key]['results']=  $myresult;

                    }
                $this->grade_stat=$mygrade;



                $this->res = $results;

                $html = $this->LoadTemplate('results/awardlist_detailed.html');
                echo $html;


                break;
            case 5:
                $this->report_title="Teaching Level Performance Report for {$this->class_name} {$this->section_name} ";

                    $sql_results_query = "
                    SELECT
    e.student_id,
    sum(e.obtain) as obtain,
    sum(e.total) as total,
    ROUND((sum(e.obtain)/sum(e.total)*100),2) as per,
    (SELECT name FROM `grades` where ROUND((sum(e.obtain)/sum(e.total)*100),2) >=mark_upto limit 1 ) as grade,
    CONCAT(s.firstname, ' ', s.lastname) AS student_name,
    s.roll_no,
    s.father_name,
     RANK() OVER (ORDER BY sum(e.obtain) DESC) AS rank
    
FROM
    general_exam_results e
INNER JOIN
    students s ON s.id = e.student_id
$where
GROUP BY
    e.student_id  ORDER by rank;
                    ";



                    $results = db::getRecords($sql_results_query);
                    $this->all_grades=getGrades();






                foreach($results as $key=>$res){
                        $student_id=$res['student_id'];
                        $subjects=db::getRecords("SELECT distinct e.subject_name from general_exam_results e $where");
                        $myresult=array();
                        $this->sub_count=count($subjects);
                        $this->per[$res['per']]=$res['per'];
                        $this->sub=$subjects;
                         $mygrade['ashole'][$res['grade']]=$mygrade['ashole'][$res['grade']]+1;

                         $mygrade['bypercentage'][$res['per']]= $mygrade['bypercentage'][$res['per']]+1;

                        foreach ($subjects as $sid=>$subject){
                            $exam_sql="SELECT sum(e.obtain) as obtain ,
                            ROUND((sum(e.obtain)/sum(e.total)*100),2) as per,
                            (SELECT name FROM `grades` where ROUND((sum(e.obtain)/sum(e.total)*100),2) >=mark_upto limit 1 ) as grade,
                             sum(e.total) as total from general_exam_results e $where and e.student_id=$student_id and e.subject_name='{$subject['subject_name']}'";
                            $by_subject= db::getRecord($exam_sql);
                            $myresult[$subject['subject_name']]=$by_subject;

                            $mygrade['bysubject'][$subject['subject_name']][$by_subject['grade']]=$mygrade['bysubject'][$subject['subject_name']][$by_subject['grade']]+1;
                            $mygrade['byperc'][$subject['subject_name']][$by_subject['per']]=$mygrade['byperc'][$subject['subject_name']][$by_subject['per']]+1;
                        }
                        $results[$key]['results']=  $myresult;



                    }
                $this->grade_stat=$mygrade;





                $this->res = $results;
               if($this->sub){
                $html = $this->LoadTemplate('results/tlpr.html');
                echo $html;
                   }else{
                   $html = $this->LoadTemplate('no_result.html');
                   echo $html;
               }


                break;
            case 6:

                $this->report_title="Examination Department  Date sheet";
                $date_sheet_sql="SELECT* , 
                (SELECT class from classes where id=e.class_id) as class_name,
                (SELECT section from sections where id=e.section_id) as section_name,
                (SELECT name from subjects where id=e.subject_id) as subject_name
                  from date_sheet e  $where order by e.class_id";



                $datesheet=db::getRecords($date_sheet_sql);



              if($datesheet){
                  $this->date_sheet=array();
                  foreach ($datesheet as $key=>$data){
                      $this->sheet_dates[$data['exam_date']]=$data['exam_date'];
                      $this->sheet_classes[$data['class_name']]=$data['class_name'];
                      $this->sheet_subjects[$data['class_name']][$data['exam_date']][]=$data['subject_name'];

                  }

                  $html = $this->LoadTemplate('results/nbt.html');
                  echo $html;




              }else{
                  $html = $this->LoadTemplate('no_result.html');
                  echo $html;
              }


                break;
            case 7:
                $this->report_title="Examination Department  Date sheet";
                $query = "SELECT* from students where id='{$req->student_id}' and  school_id='" . getSchoolID() . "'  ";

                $result = db::getRecords($query);

                if (!$result) {
                    $this->showResponse(201, array('message' => 'Student Roll number Incorrect'));
                    die;
                }
                foreach ($result as $key => $student) {

                    $date_sheet_sql = "SELECT* , 
                (SELECT class from classes where id=e.class_id) as class_name,
                (SELECT section from sections where id=e.section_id) as section_name,
                (SELECT name from subjects where id=e.subject_id) as subject_name
                  from date_sheet e  $where order by e.class_id";


                    $datesheet = db::getRecords($date_sheet_sql);
                    $result[$key]['datesheet']=$datesheet;

                }


                $this->res = $result;

                $html = $this->LoadTemplate('results/date_sheet_by_student.html');
                echo $html;


                break;
            case 8:
                $this->report_title="Examination Department  Date sheet";

                $this->students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
                $result = (array)$this->students;


                foreach ($result as $key => $student) {

                    $date_sheet_sql = "SELECT* , 
                (SELECT class from classes where id=e.class_id) as class_name,
                (SELECT section from sections where id=e.section_id) as section_name,
                (SELECT name from subjects where id=e.subject_id) as subject_name
                  from date_sheet e  $where order by e.class_id";


                    $datesheet = db::getRecords($date_sheet_sql);
                    $result[$key]['datesheet']=$datesheet;

                }


                $this->res = $result;

                $html = $this->LoadTemplate('results/date_sheet_by_student.html');
                echo $html;


                break;
        }

    }


    function save_date_sheet()
    {
        $req = $this->input->post('date_sheet');
        $class_id = $this->input->post('class_id');
        $class_name = $this->input->post('class_name');
        $section_id = $this->input->post('section_id');
        $exam_group_id = $this->input->post('exam_group_id');
        $exam_group_name = $this->input->post('exam_group_name');
        $exam_name = $this->input->post('exam_name');
        foreach ($req['subject'] as $key => $m) {
            $subject_id = $req['subject'][$key];
            if ($subject_id) {
                $exam_date = $req['exam_date'][$key];
                $instruction = $req['instruction'][$key];
                $data['subject_id'] = $subject_id;
                $data['exam_date'] = $exam_date;
                $data['class_id'] = $class_id;
                $data['section_id'] = $section_id;
                $data['exam_group_id'] = $exam_group_id;
                $data['session_id'] = $this->getSessionID(getSchoolID());
                $data['exam_group_name'] = $exam_group_name;
                $data['exam_name'] = $exam_name;
                $data['instruction'] = $instruction;
                $school_id = $data['school_id'] = getSchoolID();

                $where = " WHERE exam_group_id ='$exam_group_id' and exam_name='$exam_name' and school_id='$school_id' AND class_id=$class_id and section_id=$section_id and subject_id=$subject_id ";
                $date_sheet = db::getRecord("SELECT* from date_sheet $where");
                if ($date_sheet) {
                    $sql = db::prepUpdateQuery($data, 'date_sheet', 'id', $date_sheet['id']);
                    db::updateRecord($sql);

                } else {
                    $sql = db::prepInsertQuery($data, 'date_sheet');
                    db::insertRecord($sql);
                }


            }

        }

        $this->showResponse(200, array('message' => 'Date sheet Updated'));

    }

    function delete_date_sheet()
    {
        $id = $this->input->post('id');

        $date_sheet = db::getRecord("DELETE from  date_sheet WHERE  id=$id ");


    }


    function sendawardlist()
    {
        $phone=$this->input->post('phone');
        $message=$this->input->post('message');
        $sendsms=$this->input->post('sendsms');
        $messages=array();
        foreach ($phone as $key =>$to){
            if($sendsms[$key]) {
                array_push($messages, array('to' => $to, 'text' => $message[$key]));
            }


        }
        if($messages){
            $this->sendBothText($messages,false);
        }

    }


    function  addExamName()
    {
        $exam_name=$this->input->post('exam_name');
        $exam_group_id=$this->input->post('exam_group_id');
        $exist=db::getCell("SELECT id from exams where exam_group_id='$exam_group_id' and name='$exam_name'");
        if(!$exist) {
            $data = array('name' => $exam_name, 'exam_group_id' => $exam_group_id, 'school_id' => getSchoolID());
            $query = db::prepInsertQuery($data, 'exams');
            db::insertRecord($query);
        }


    }


    function getExamName()
    {
        $school_id=getSchoolID();
        $exam_group_id=$this->input->get('exam_group_id');
        $records=db::getRecords("SELECT name from exams where exam_group_id='$exam_group_id' and school_id='$school_id'");
        echo json_encode($records);
    }



    function removeExamName()
    {
        $exam_name=$this->input->post('exam_name');
        $exam_group_id=$this->input->post('exam_group_id');
        $sql="DELETE FROM exams where name='$exam_name' and exam_group_id='$exam_group_id'";
        db::query($sql);
        pr($sql);
    }


    function addExamGroup($id='')
    {
        $this->res = $result;
        $this->base_url=base_url();
        $this->data=db::getRecord("SELECT* from exam_groups where id='$id'");
        $html = $this->LoadTemplate('results/add_exam_group.html');
        echo $html;

    }



}