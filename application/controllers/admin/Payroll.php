<?php
class Payroll extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('file');
        $this->config->load("mailsms");
        $this->config->load("payroll");
        $this->load->library('mailsmsconf');
        $this->config_attendance = $this->config->item('attendence');
        $this->staff_attendance  = $this->config->item('staffattendance');
        $this->payment_mode      = $this->config->item('payment_mode');
        $this->load->model("payroll_model");
        $this->load->model("staff_model");
        $this->load->model('staffattendancemodel');
        $this->payroll_status     = $this->config->item('payroll_status');
        $this->sch_setting_detail = $this->setting_model->getSetting();
    }
    public function index()
    {
        if (!$this->rbac->hasPrivilege('staff_payroll', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'HR');
        $this->session->set_userdata('sub_menu', 'admin/payroll');
        $data["staff_id"]            = "";
        $data["name"]                = "";
        $data["month"]               = date("F", strtotime("-1 month"));
        $data["year"]                = date("Y");
        $data["present"]             = 0;
        $data["absent"]              = 0;
        $data["late"]                = 0;
        $data["half_day"]            = 0;
        $data["holiday"]             = 0;
        $data["leave_count"]         = 0;
        $data["alloted_leave"]       = 0;
        $data["basic"]               = 0;
        $data["payment_mode"]        = $this->payment_mode;
        $user_type                   = $this->staff_model->getStaffRole();
        $data['classlist']           = $user_type;
        $data['monthlist']           = $this->customlib->getMonthDropdown();
        $data['sch_setting']         = $this->sch_setting_detail;
        $data['staffid_auto_insert'] = $this->sch_setting_detail->staffid_auto_insert;
        $submit                      = $this->input->post("search");
        if (isset($submit) && $submit == "search") {
            $month    = $this->input->post("month");
            $year     = $this->input->post("year");
            $emp_name = $this->input->post("name");
            $role     = $this->input->post("role");
            $searchEmployee = $this->payroll_model->searchEmployee($month, $year, $emp_name, $role);
          
            $data["resultlist"] = $searchEmployee;
            $data["name"]       = $emp_name;
            $data["month"]      = $month;
            $data["year"]       = $year;
        }
        $data["payroll_status"] = $this->payroll_status;
        $this->load->view("layout/header", $data);
        $this->load->view("admin/payroll/stafflist", $data);
        $this->load->view("layout/footer", $data);
    }
    public function create($month, $year, $id)
    {
        $data["staff_id"]            = "";
        $data["basic"]               = "";
        $data["name"]                = "";
        $data["month"]               = "";
        $data["year"]                = "";
        $data["present"]             = 0;
        $data["absent"]              = 0;
        $data["late"]                = 0;
        $data["half_day"]            = 0;
        $data["holiday"]             = 0;
        $data["leave_count"]         = 0;
        $data["alloted_leave"]       = 0;
        $data['sch_setting']         = $this->sch_setting_detail;
        $data['staffid_auto_insert'] = $this->sch_setting_detail->staffid_auto_insert;
        $user_type                   = $this->staff_model->getStaffRole();
        $data['classlist']           = $user_type;
        $date = $year . "-" . $month;
        $searchEmployee = $this->payroll_model->searchEmployeeById($id);
        $data['result'] = $searchEmployee;
        $data["month"]  = $month;
        $data["year"]   = $year;
        $alloted_leave = $this->staff_model->alloted_leave($id);
        $newdate = date('Y-m-d', strtotime($date . " +1 month"));
        $data['monthAttendance'] = $this->monthAttendance($newdate, 3, $id);
        $data['monthLeaves']     = $this->monthLeaves($newdate, 3, $id);
        $data["attendanceType"] = $this->staffattendancemodel->getStaffAttendanceType();
        $data["alloted_leave"] = $alloted_leave[0]["alloted_leave"];
        $this->load->view("admin/payroll/create", $data);
    }
    public function payslipDownload($month, $year, $id)
    {

    

     
        $auth=$_GET['auth'];
        $data['transaction'] =db::getRecord("SELECT* from transactions where id=".str_decode($auth));
        $data["staff_id"]            = "";
        $data["basic"]               = "";
        $data["name"]                = "";
        $data["month"]               = "";
        $data["year"]                = "";
        $data["present"]             = 0;
        $data["absent"]              = 0;
        $data["late"]                = 0;
        $data["half_day"]            = 0;
        $data["holiday"]             = 0;
        $data["leave_count"]         = 0;
        $data["alloted_leave"]       = 0;
        $data['sch_setting']         = $this->sch_setting_detail;
        $data['staffid_auto_insert'] = $this->sch_setting_detail->staffid_auto_insert;
        $user_type                   = $this->staff_model->getStaffRole();
        $data['classlist']           = $user_type;
        $date = $year . "-" . $month;
        $searchEmployee = $this->payroll_model->searchEmployeeById($id);
        $data['result'] = $searchEmployee;
        $data["month"]  = $month;
        $data["year"]   = $year;
        $alloted_leave = $this->staff_model->alloted_leave($id);
        $newdate = date('Y-m-d', strtotime($date . " +1 month"));
        $data['monthAttendance'] = $this->monthAttendance($newdate, 3, $id);

        $data['monthLeaves']     = $this->monthLeaves($newdate, 3, $id);
        $data["attendanceType"] = $this->staffattendancemodel->getStaffAttendanceType();
        $data["alloted_leave"] = $alloted_leave[0]["alloted_leave"];
        $this->load->view("admin/payroll/payslip", $data);
    }
    public function employeeServices($id)
    {
        $searchEmployee = $this->payroll_model->searchEmployeeById($id);
        $data['result'] = $searchEmployee;
        $this->load->view("admin/payroll/employeeServices", $data);
    }
    public function monthAttendance($st_month, $no_of_months, $emp)
    {
        $record = array();
        for ($i = 1; $i <= $no_of_months; $i++) {
            $r     = array();
            $month = date('m', strtotime($st_month . " -$i month"));
            $year  = date('Y', strtotime($st_month . " -$i month"));
          
            foreach ($this->staff_attendance as $att_key => $att_value) {
                $s = $this->payroll_model->count_attendance_obj($month, $year, $emp, $att_value);
                $r[$att_key] = $s;
            }
            $record['01-' . $month . '-' . $year] = $r;
        }
        return $record;
    }
    public function monthLeaves($st_month, $no_of_months, $emp)
    {
        $record = array();
        for ($i = 1; $i <= $no_of_months; $i++) {
            $r           = array();
            $month       = date('m', strtotime($st_month . " -$i month"));
            $year        = date('Y', strtotime($st_month . " -$i month"));
            $leave_count = $this->staff_model->count_leave($month, $year, $emp);
            if (!empty($leave_count["tl"])) {
                $l = $leave_count["tl"];
            } else {
                $l = "0";
            }
            $record[$month] = $l;
        }
        return $record;
    }
    public function payslip()
    {

       

        if (!$this->rbac->hasPrivilege('staff_payroll', 'can_add')) {
            access_denied();
        }
        $date=date('d F Y h:i:s a');
      //Salary side
      $staff_id=$_POST['staff_id'];
      $allowance_type=$_POST['allowance_type'];
      $allowance_amount=$_POST['allowance_amount'];
      $salary_details=array();
      $credit_total=0;
      foreach ($allowance_amount as $key => $amount) {
        if(isset( $allowance_type[$key])){
        $credit_total+=$amount;
        $salary_details[]=array('code'=>$key,'name' => $allowance_type[$key],'type' => 'CR','amount' => $amount);
        }
    }
      //Deduction Side
      $deduction_type=$_POST['deduction_type'];
      $deduction_amount=$_POST['deduction_amount'];
      $deduction_id=$_POST['deduction_id'];
      $staff_id=$_POST['staff_id'];
      $deduction=array();
      $deduction_amount_total=0;
      foreach ($deduction_amount as $key => $amount) {
        if(isset($deduction_type[$key])) {
        $deduction_amount_total+=$amount;
        $staff_dr=getStaffPersonalAccount($staff_id, $deduction_id[$key]);
        $bal=getOpeningBalance($staff_dr);
        
            $salary_account=db::getRecord("SELECT * FROM `salary_components` where id='".$deduction_id[$key]."' ");
            $target_account=$salary_account['target_account'];
            $staff_cr_to=getInstAccount($target_account);
            $on_salary=$salary_account['on_salary'];
            $title=$salary_account['title'];
            $staff=getStaffbyID($staff_id);
            if($on_salary=='DR'){
                if($amount>$bal){

                    echo json_encode(array('code'=>201,'message'=>" {$deduction_type[$key]} DEDUCTION UNEXPECTED VALUE PLEASE UNDERSTAND VALID VALUE "));
                    die;
                }
                $data=db::getRecord("SELECT * FROM `accounts_head` where id=$target_account");
                //DR
                $narration="PKR $amount has been REFUNDED to A/c #: $staff_cr_to Title {$data['title']} on Date $date  ";
                makeTransaction($staff_dr,-$amount,$narration,"REFUND");
                //CR
                $narration="PKR $amount has been Received from  {$staff['name']} {$staff['surname']}  A/c #: $staff_cr_to Against $title  instruction by  REFUND on Date $date  ";
                makeTransaction($staff_cr_to,$amount,$narration,"REFUND");
            }
            if($on_salary=='CR'){
                //CR
                $narration="PKR $amount has been Deducted From  A/c #: ".getStaffAccount($staff_id)." Title  {$staff['name']} {$staff['surname']} Instruction By Deduction on Date $date  ";
                makeTransaction($staff_dr,$amount,$narration,"DEDUCTION");
            }
        
        $salary_details[]=array('code'=>$key,'name' => $deduction_type[$key],'type' => 'DR','amount' => $amount);
        }
    }
        $meta=array('detaill'=>$salary_details,'debit'=>$deduction,'credit_total'=>$credit_total,"debit_total"=>$deduction_amount_total);
        $net_salary      = $this->input->post("net_salary");
        $staff_id        = $this->input->post("staff_id");
        $month           = $this->input->post("month");
        $year            = $this->input->post("year");
        $from = getInstAccount($this->input->post("from"));
        $to=getStaffAccount($staff_id);
        $st=getStaff($staff_id);
        $balance=getOpeningBalance($from);
        if(  $net_salary> $balance){
            echo json_encode(array('code'=>201,'message'=>"Low Balance to Proceed Transaction"));
            die;
        }
        //dr   
        $custom_date=date('Y-m-d',strtotime("05 $month $year"));
        $narration="An amount of PKR $net_salary has been Sent to {$st['name']} {$st['surname']} $to Against Salary $month-$year on  $date";
        makeTransactionsSalary($from,-$net_salary,$narration,"SALARY",$meta,$month,$year);
        extract($_POST);
        if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }


        //cr
        $from = getInstAccount($this->input->post("from"));
        $narration="An amount of PKR $net_salary has been Received From A/C:  $from (institute Salary) Against  $month-$year on  $date";
       
        makeTransactionsSalary($to,$net_salary,$narration,"SALARY",$meta,$month,$year);
        if($alert){
            sendSMS($st['contact_no'],$narration,"".$st['name']);
           }
        echo json_encode(array('code'=>200,'message'=>"Salary has  been transfered"));
    }
    public function search($month, $year, $role = '')
    {
        $user_type         = $this->staff_model->getStaffRole();
        $data['classlist'] = $user_type;
        $data['monthlist'] = $this->customlib->getMonthDropdown();
        $searchEmployee = $this->payroll_model->searchEmployee($month, $year, $emp_name = '', $role);
        $data["resultlist"]     = $searchEmployee;
        $data["name"]           = $emp_name;
        $data["month"]          = $month;
        $data["year"]           = $year;
        $data['sch_setting']    = $this->sch_setting_detail;
        $data["payroll_status"] = $this->payroll_status;
        $data["resultlist"]     = $searchEmployee;
        $data["payment_mode"]   = $this->payment_mode;
        $this->load->view("layout/header", $data);
        $this->load->view("admin/payroll/stafflist", $data);
        $this->load->view("layout/footer", $data);
    }
    public function paymentRecord()
    {
        $month          = $this->input->get_post("month");
        $year           = $this->input->get_post("year");
        $id             = $this->input->get_post("staffid");
        $searchEmployee = $this->payroll_model->searchPayment($id, $month, $year);
        $data['result'] = $searchEmployee;
        $data["month"]  = $month;
        $data["year"]   = $year;
        echo json_encode($data);
    }
    public function paymentStatus($status)
    {
        $id          = $this->input->get('id');
        $updateStaus = $this->payroll_model->updatePaymentStatus($status, $id);
        redirect("admin/payroll");
    }
    public function paymentSuccess()
    {
        $payment_mode = $this->input->post("payment_mode");
        $date         = $this->input->post("payment_date");
        $payment_date = date('Y-m-d', strtotime($date));
        $remark       = $this->input->post("remarks");
        $status       = 'paid';
        $payslipid    = $this->input->post("paymentid");
        $this->form_validation->set_rules('payment_mode', $this->lang->line('payment') . " " . $this->lang->line('mode'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $msg = array(
                'payment_mode' => form_error('payment_mode'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $data = array('payment_mode' => $payment_mode, 'payment_date' => $payment_date, 'remark' => $remark, 'status' => $status);
            $this->payroll_model->paymentSuccess($data, $payslipid);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }
    public function payslipView()
    {
        if (!$this->rbac->hasPrivilege('staff', 'can_view')) {
            access_denied();
        }
        $data["payment_mode"] = $this->payment_mode;
        $this->load->model("setting_model");
        $setting_result      = $this->setting_model->get();
        $data['settinglist'] = $setting_result[0];
        $id                  = $this->input->post("payslipid");
        $result              = $this->payroll_model->getPayslip($id);
        $data['sch_setting'] = $this->sch_setting_detail;
        $data['staffid_auto_insert'] = $this->sch_setting_detail->staffid_auto_insert;
        if (!empty($result)) {
            $allowance                  = $this->payroll_model->getAllowance($result["id"]);
            $data["allowance"]          = $allowance;
            $positive_allowance         = $this->payroll_model->getAllowance($result["id"], "positive");
            $data["positive_allowance"] = $positive_allowance;
            $negative_allowance         = $this->payroll_model->getAllowance($result["id"], "negative");
            $data["negative_allowance"] = $negative_allowance;
            $data["result"]             = $result;
            $this->load->view("admin/payroll/payslipview", $data);
        } else {
            echo "<div class='alert alert-info'>No Record Found.</div>";
        }
    }
    public function payslippdf()
    {
        $this->load->model("setting_model");
        $setting_result             = $this->setting_model->get();
        $data['settinglist']        = $setting_result[0];
        $id                         = 15;
        $result                     = $this->payroll_model->getPayslip($id);
        $allowance                  = $this->payroll_model->getAllowance($result["id"]);
        $data["allowance"]          = $allowance;
        $positive_allowance         = $this->payroll_model->getAllowance($result["id"], "positive");
        $data["positive_allowance"] = $positive_allowance;
        $negative_allowance         = $this->payroll_model->getAllowance($result["id"], "negative");
        $data["negative_allowance"] = $negative_allowance;
        $data["result"]             = $result;
        $this->load->view("admin/payroll/payslippdf", $data);
    }
    public function payrollreport()
    {
        if (!$this->rbac->hasPrivilege('payroll_report', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Reports');
        $this->session->set_userdata('sub_menu', 'Reports/human_resource');
        $this->session->set_userdata('subsub_menu', 'Reports/attendance/attendance_report');
        $month                = $this->input->post("month");
        $year                 = $this->input->post("year");
        $role                 = $this->input->post("role");
        $data["month"]        = $month;
        $data["year"]         = $year;
        $data["role_select"]  = $role;
        $data['monthlist']    = $this->customlib->getMonthDropdown();
        $data['yearlist']     = $this->payroll_model->payrollYearCount();
        $staffRole            = $this->staff_model->getStaffRole();
        $data["role"]         = $staffRole;
        $data["payment_mode"] = $this->payment_mode;
        $this->form_validation->set_rules('year', $this->lang->line('year'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $this->load->view("layout/header", $data);
            $this->load->view("admin/payroll/payrollreport", $data);
            $this->load->view("layout/footer", $data);
        } else {
            $result         = $this->payroll_model->getpayrollReport($month, $year, $role);
            $data["result"] = $result;
            $this->load->view("layout/header", $data);
            $this->load->view("admin/payroll/payrollreport", $data);
            $this->load->view("layout/footer", $data);
        }
    }
    public function deletepayroll($payslipid, $month, $year, $role = '')
    {
        if (!$this->rbac->hasPrivilege('staff_payroll', 'can_delete')) {
            access_denied();
        }
        if (!empty($payslipid)) {
            $this->payroll_model->deletePayslip($payslipid);
        }
        redirect('admin/payroll/search/' . $month . "/" . $year . "/" . $role);
    }
    public function revertpayroll($payslipid, $month, $year, $role = '')
    {
        if (!$this->rbac->hasPrivilege('staff_payroll', 'can_delete')) {
            access_denied();
        }
        if (!empty($payslipid)) {
            $this->payroll_model->revertPayslipStatus($payslipid);
        }
        redirect('admin/payroll/search/' . $month . "/" . $year . "/" . $role);
    }
    function transferNow()
    {
        extract($_REQUEST);
        $title=staffACTitle($deposit_to);
        $deposit_to=getStaffPersonalAccount($staff_id,$deposit_to);
        $st=getStaff($staff_id);
       
        if($tr_type==1){
        $from=getInstAccount($from);
        $balance=getOpeningBalance($from);
        $date=date("d F Y h:i:s");
            if($deposit > $balance){
                echo json_encode(array('code' => 201, 'message' => "Low CR Balance to proceed transaction"));
                die;
            }
            
         //DR
        $narration="Amount PKR ".nf($deposit)." has been SENT to A/C: $deposit_to Title:$title @ [{$st['name']} {$st['surname']}]  on $date "; 
        makeTransaction($from,-$deposit,$narration,'LOAN-TRANSFER');

        if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }


        //CR
        $narration="Amount PKR ".nf($deposit)." has been RECEIVED from A/C: $from TITLE: ".getAccountTitle($_POST['from'])." & Credit Into $title on $date "; 
        makeTransaction($deposit_to,$deposit,$narration,'LOAN-TRANSFER');

        if($alert){
            sendSMS($st['contact_no'],$narration,"".$st['name']);
           }

        }else{

            $from=getInstAccount($from);
            $balance=getOpeningBalance($deposit_to);
            $date=date("d F Y h:i:s");
                if($deposit > $balance){
                    echo json_encode(array('code' => 201, 'message' => "Low DR Balance to proceed transaction"));
                    die;
                }
                
             //DR
            $narration="Amount PKR ".nf($deposit)." has been SENT to A/C: $from TITLE: ".getAccountTitle($_POST['from'])."   on $date "; 
            makeTransaction($deposit_to,-$deposit,$narration,'LOAN-TRANSFER');
            if($alert){
                sendSMS($st['contact_no'],$narration,"".$st['name']);
               }

          
    
    
            //CR
            $narration="Amount PKR ".nf($deposit)." has been RECEIVED from A/C: $deposit_to TITLE:  $title  @ [{$st['name']} {$st['surname']}] & Credit in $from TITLE: ".getAccountTitle($_POST['from'])." on $date "; 
            makeTransaction($from,$deposit,$narration,'LOAN-TRANSFER');
            if($alert){
                sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
               }
           



        }

        echo json_encode(array('code' => 200, 'message' => "Transaction has been posted Successfully"));
    }
    function loadTransactions()  {
        ob_start();
        extract($_POST);
        $from=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[0])));
        $to=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[1])));
            $sql="SELECT* from transactions where account=$account_id and date >= '$from' and date <='$to' order by id DESC ";
           $trs=db::getRecords($sql);
        $this->load->view('admin/payroll/transactions_statement', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
}
