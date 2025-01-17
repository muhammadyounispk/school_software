<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Expense extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('Customlib');
        $this->config->load('app-config');
    }

    public function index()
    {

        if (!$this->rbac->hasPrivilege('expense', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Expenses');
        $this->session->set_userdata('sub_menu', 'expense/index');
        $data['title']      = 'Add Expense';
        $data['title_list'] = 'Recent Expenses';
        $this->form_validation->set_rules('exp_head_id', $this->lang->line('expense_head'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('date', $this->lang->line('date'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('documents', $this->lang->line('documents'), 'callback_handle_upload');
        if ($this->form_validation->run() == false) {
        } else {
            $data = array(
                'exp_head_id' => $this->input->post('exp_head_id'),
                'name'        => $this->input->post('name'),
                'date'        => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'amount'      => $this->input->post('amount'),
                'invoice_no'  => $this->input->post('invoice_no'),
                'note'        => $this->input->post('description'),
            );

            $insert_id = $this->expense_model->add($data);

            if (isset($_FILES["documents"]) && !empty($_FILES['documents']['name'])) {
                $fileInfo = pathinfo($_FILES["documents"]["name"]);
                $img_name = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["documents"]["tmp_name"], "./uploads/school_expense/" . $img_name);
                $data_img = array('id' => $insert_id, 'documents' => 'uploads/school_expense/' . $img_name);

                $this->expense_model->add($data_img);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
            redirect('admin/expense/index');
        }
        $expense_result      = $this->expense_model->get();
        $data['expenselist'] = $expense_result;
        $expnseHead          = $this->expensehead_model->get();
        $data['expheadlist'] = $expnseHead;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/expense/expenseList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function download($documents)
    {
        $this->load->helper('download');
        $filepath = "./uploads/school_expense/" . $this->uri->segment(6);
        $data     = file_get_contents($filepath);
        $name     = $this->uri->segment(6);
        force_download($name, $data);
    }

    public function handle_upload()
    {

        $image_validate = $this->config->item('file_validate');
        $result = $this->filetype_model->get();
        if (isset($_FILES["documents"]) && !empty($_FILES['documents']['name'])) {

            $file_type         = $_FILES["documents"]['type'];
            $file_size         = $_FILES["documents"]["size"];
            $file_name         = $_FILES["documents"]["name"];
            $allowed_extension = array_map('trim', array_map('strtolower', explode(',', $result->file_extension)));
            $allowed_mime_type = array_map('trim', array_map('strtolower', explode(',', $result->file_mime)));
            $ext               = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

            if ($files = filesize($_FILES['documents']['tmp_name'])) {

                if (!in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_upload', 'File Type Not Allowed');
                    return false;
                }

                if (!in_array($ext, $allowed_extension) || !in_array($file_type, $allowed_mime_type)) {
                    $this->form_validation->set_message('handle_upload', 'Extension Not Allowed');
                    return false;
                }
                if ($file_size > $result->file_size) {
                    $this->form_validation->set_message('handle_upload', $this->lang->line('file_size_shoud_be_less_than') . number_format($image_validate['upload_size'] / 1048576, 2) . " MB");
                    return false;
                }
            } else {
                $this->form_validation->set_message('handle_upload', "File Type / Extension Error Uploading  Image");
                return false;
            }

            return true;
        }
        return true;
    }

    public function view($id)
    {
        if (!$this->rbac->hasPrivilege('expense', 'can_view')) {
            access_denied();
        }
        $data['title']   = 'Fees Master List';
        $expense         = $this->expense_model->get($id);
        $data['expense'] = $expense;
        $this->load->view('layout/header', $data);
        $this->load->view('expense/expenseShow', $data);
        $this->load->view('layout/footer', $data);
    }

    public function getByFeecategory()
    {
        $feecategory_id = $this->input->get('feecategory_id');
        $data           = $this->feetype_model->getTypeByFeecategory($feecategory_id);
        echo json_encode($data);
    }

    public function getStudentCategoryFee()
    {
        $type     = $this->input->post('type');
        $class_id = $this->input->post('class_id');
        $data     = $this->expense_model->getTypeByFeecategory($type, $class_id);
        if (empty($data)) {
            $status = 'fail';
        } else {
            $status = 'success';
        }
        $array = array('status' => $status, 'data' => $data);
        echo json_encode($array);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('expense', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Fees Master List';
        $this->expense_model->remove($id);
        redirect('admin/expense/index');
    }

    public function create()
    {
        if (!$this->rbac->hasPrivilege('expense', 'can_add')) {
            access_denied();
        }
        $data['title'] = 'Add Fees Master';
        $this->form_validation->set_rules('expense', $this->lang->line('fees_master'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('expense/expenseCreate', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'expense' => $this->input->post('expense'),
            );
            $this->expense_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
            redirect('expense/index');
        }
    }

    public function edit($id)
    {
        if (!$this->rbac->hasPrivilege('expense', 'can_edit')) {
            access_denied();
        }
        $data['title']       = 'Edit Fees Master';
        $data['id']          = $id;
        $expense             = $this->expense_model->get($id);
        $data['expense']     = $expense;
        $data['title_list']  = 'Fees Master List';
        $expense_result      = $this->expense_model->get();
        $data['expenselist'] = $expense_result;
        $expnseHead          = $this->expensehead_model->get();
        $data['expheadlist'] = $expnseHead;
        $this->form_validation->set_rules('exp_head_id', $this->lang->line('expense_head'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('documents', $this->lang->line('documents'), 'callback_handle_upload');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('date', $this->lang->line('date'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/expense/expenseEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id'          => $id,
                'exp_head_id' => $this->input->post('exp_head_id'),
                'name'        => $this->input->post('name'),
                'invoice_no'  => $this->input->post('invoice_no'),
                'date'        => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'amount'      => $this->input->post('amount'),
                'note'        => $this->input->post('description'),
            );
            $insert_id = $this->expense_model->add($data);
            if (isset($_FILES["documents"]) && !empty($_FILES['documents']['name'])) {
                $fileInfo = pathinfo($_FILES["documents"]["name"]);
                $img_name = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["documents"]["tmp_name"], "./uploads/school_expense/" . $img_name);
                $data_img = array('id' => $id, 'documents' => 'uploads/school_expense/' . $img_name);
                $this->expense_model->add($data_img);
            }
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');
            redirect('admin/expense/index');
        }
    }

    public function expenseSearch()
    {
        if (!$this->rbac->hasPrivilege('search_expense', 'can_view')) {
            access_denied();
        }
        $data['searchlist']  = $this->customlib->get_searchtype();
        $data['search_type'] = '';
        $this->session->set_userdata('top_menu', 'Expenses');
        $this->session->set_userdata('sub_menu', 'expense/expensesearch');
        $data['title'] = 'Search Expense';


        $search = $this->input->post('search');
        if ($search == "search_filter") {
            $this->form_validation->set_rules('search_type', $this->lang->line('search') . " " . $this->lang->line('type'), 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
            } else {

                $search              = $this->input->post('search_type');
                $data['search_type'] = $_POST['search_type'];

                if (isset($_POST['search_type']) && $_POST['search_type'] != '') {

                    if ($_POST['search_type'] == 'all') {

                        $dates = $this->customlib->get_betweendate('this_year');
                    } else {
                        $dates = $this->customlib->get_betweendate($_POST['search_type']);
                    }
                } else {
                    $dates               = $this->customlib->get_betweendate('this_year');
                    $data['search_type'] = '';
                }

                $dateformat = $this->customlib->getSchoolDateFormat();

                $date_from         = date('Y-m-d', strtotime($dates['from_date']));
                $date_to           = date('Y-m-d', strtotime($dates['to_date']));
                $data['exp_title'] = 'Expense Result From ' . date($dateformat, strtotime($date_from)) . " To " . date($dateformat, strtotime($date_to));
                $date_from         = date('Y-m-d', $this->customlib->dateYYYYMMDDtoStrtotime($date_from));
                $date_to           = date('Y-m-d', $this->customlib->dateYYYYMMDDtoStrtotime($date_to));

                $resultList         = $this->expense_model->search("", $date_from, $date_to);
                $data['resultList'] = $resultList;
            }
        } else {
            $data['exp_title'] = 'Expense Result';
            $this->form_validation->set_rules('search_text', $this->lang->line('search_text'), 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
            } else {

                $search_text        = $this->input->post('search_text');
                $resultList         = $this->expense_model->search($search_text, "", "");
                $data['resultList'] = $resultList;
            }
        }
        $this->load->view('layout/header', $data);
        $this->load->view('admin/expense/expenseSearch', $data);
        $this->load->view('layout/footer', $data);
    }

    function all_rows()
    {
        extract($this->input->post());

        $this->load->view('admin/expense/all_rows', get_defined_vars());
    }


    function proceedTransaction()
    {

        extract($this->input->get());
        $id = str_decode($auth);
        ob_start();
        $this->load->view('admin/expense/addTransaction', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }




    function transferCashNow()
    {
        extract($_REQUEST);
        $from = getInstAccount($from);
        $ac=db::getRecord("SELECT * FROM `accounts_head` WHERE id=$deposit_to  ");
        $deposit_to = getInstAccount($deposit_to);
        $date = date("d F Y h:i:s");
      
            $narration = "Amount PKR " . nf($deposit) . " has been DEDUCT-CASH @ [{$ac['title']}] on $date [$narration]";
           $tr_id= makeTransaction($deposit_to, -$deposit, $narration, 'CASH-WITHDRAWAL',array(), $dateTrs);
           if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }
           if (isset($_FILES["attachment"]) && !empty($_FILES['attachment']['name'])) {
            $allowedExtensions = array("png", "jpeg", "jpg");
            $uploaddir = './uploads/expenses/';
            
            if (!is_dir($uploaddir) && !mkdir($uploaddir)) {
                die("Error creating folder $uploaddir");
            }
            
            $fileInfo = pathinfo($_FILES["attachment"]["name"]);
            $extension = strtolower($fileInfo['extension']);
            
            if (in_array($extension, $allowedExtensions)) {
                $filename = "$id" . time() . getSchoolID() . '.' . $extension;
                $img_name = $uploaddir . $filename;
                
                if (move_uploaded_file($_FILES["attachment"]["tmp_name"], $img_name)) {
                    $url = base_url("uploads/expenses/$filename");
                    $d['file'] = $url;
                    $update = db::prepUpdateQuery($d, "transactions", 'id', $tr_id);
                    db::updateRecord($update);
                } else {
                 
                     echo json_encode(array('code' => 201, 'message' =>  "Upload does not completed."));

                }
            } else {
                 echo json_encode(array('code' => 201, 'message' =>  "Invalid file format. Only PNG, JPEG, and JPG files are allowed."));
            }
        } 
         
        echo json_encode(array('code' => 200, 'message' => "Transaction has been posted Successfully"));
    }


    function ACstatement()
    {
        ob_start();
        extract($this->input->get());
        $account_id=str_decode($auth);
        $account = getInstAccount($account_id);
        $sql = "SELECT* from transactions where account=$account and date >= '$from' and date <='$to' order by id DESC ";
        $trs = db::getRecords($sql);
        $this->load->view('admin/expense/transactions_statement', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }


    
}
