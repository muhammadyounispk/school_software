<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class Accounts extends Admin_Controller
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
       
       
    }

    public function index()
    {


        $this->session->set_userdata('top_menu', 'HR');
        $this->session->set_userdata('sub_menu', 'admin/accounts');
        
        $data['title'] = 'Student List';
        $student_result = $this->student_model->get();
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $data['studentlist'] = $student_result;
        $this->load->view('layout/header', $data);
        $this->load->view('accounts/chart-accounts', $data);
        $this->load->view('layout/footer', $data);
    }



    public function trailBalance()
    {


        $this->session->set_userdata('top_menu', 'HR');
        $this->session->set_userdata('sub_menu', 'admin/accounts');
        
        $data['title'] = 'Student List';
        $student_result = $this->student_model->get();
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $data['studentlist'] = $student_result;
        $this->load->view('layout/header', $data);
        $this->load->view('accounts/trailBalance', $data);
        $this->load->view('layout/footer', $data);
    }
    public function trailBalancebyDate()
    {


        $this->session->set_userdata('top_menu', 'HR');
        $this->session->set_userdata('sub_menu', 'admin/accounts');
        
        $data['title'] = 'Student List';
        $student_result = $this->student_model->get();
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $data['studentlist'] = $student_result;
        $this->load->view('layout/header', $data);
        $this->load->view('accounts/trailBalancebyDate', $data);
        $this->load->view('layout/footer', $data);
    }


    public function loadChartSheet()
    {
        
        $this->load->view('accounts/accounts-rows', $data);
       
    }
    

    function accountStatement()  {
        extract($this->input->get());
     
         $id=str_decode($auth);
         $ac=db::getRecord("SELECT * FROM `accounts_head` WHERE id=$id  ");
        ob_start();
        $this->load->view('accounts/accountStatement', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
    function addAccount()  {
        extract($this->input->get());
     
         $group=str_decode($auth_id);
        ob_start();
        $this->load->view('accounts/addAccount', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }


    function cashDeposit()  {
        extract($this->input->get());
         $id=str_decode($auth);
        ob_start();
        $this->load->view('accounts/cashDeposit', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }



    function loadTransactions()  {
        ob_start();
        extract($_POST);

        $from=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[0])));
        $to=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[1])));
      
  
              $account=getInstAccount($account_id);
            $sql="SELECT* from transactions where account=$account and date >= '$from' and date <='$to' order by id DESC ";
           $trs=db::getRecords($sql);
          
        

        $this->load->view('accounts/transactions_statement', get_defined_vars());
        echo  $html_content = ob_get_clean();
       
        
    }
    function printVoucher()  {
        extract($_REQUEST);
       
        echo  getVoucherHTML($student_id,"STUDENT COPY",$fee_month,false);
      
        
    }


    function transferNow()
    {
        extract($_REQUEST);
        $from=getInstAccount($from);
        $deposit_to=getInstAccount($deposit_to);
        $balance=getOpeningBalance($from);
        $to_balance=getOpeningBalance($deposit_to);
        $accountant = $this->payroll_model->searchEmployee("", "", "", "Accountant");
       
        $date=date("d F Y h:i:s");
        if($tr_type==1){
            if($deposit > $balance){
                echo json_encode(array('code' => 201, 'message' => "Low CR Balance to proceed transaction"));
                die;
            }
             //DR
        $narration="Amount PKR ".nf($deposit)." has been SENT to A/C: $deposit_to TITLE: ".getAccountTitle($_POST['deposit_to'])." on $date  VIA INTERNAL TRANSFER"; 
        makeTransaction($from,-$deposit,$narration,'INTERNAL-TRANSACTION');
        if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }
        //CR
        $narration="Amount PKR ".nf($deposit)." has been RECEIVED from A/C: $from  TITLE: ".getAccountTitle($_POST['from'])." & Credited in ".getAccountTitle($_POST['deposit_to'])." [A/C:$deposit_to] on $date  VIA INTERNAL TRANSFER"; 
        makeTransaction($deposit_to,$deposit,$narration,'INTERNAL-TRANSACTION');
        if($alert){
            if($accountant){
            foreach ($accountant as $key => $staff) {
                sendSMS($staff['contact_no'],$narration,"".$staff['name']. " ".$staff['surname']);
            }
           }
        }

        }else{
            if($deposit > $to_balance){
                echo json_encode(array('code' => 201, 'message' => "Low DR Balance to proceed transaction"));
                die;
            }

                  //DR
        $narration="Amount PKR ".nf($deposit)." has been SENT to A/C: $from TITLE: ".getAccountTitle($_POST['from'])." on $date  VIA INTERNAL TRANSFER"; 
        makeTransaction($deposit_to,-$deposit,$narration,'INTERNAL-TRANSACTION');
        
        if($alert){
            if($accountant){
            foreach ($accountant as $key => $staff) {
                sendSMS($staff['contact_no'],$narration,"".$staff['name']. " ".$staff['surname']);
            }
           }
        }


         //CR
         $narration="Amount PKR ".nf($deposit)." has been RECEIVED from A/C: $from  TITLE: ".getAccountTitle($_POST['from'])." & Credited in ".getAccountTitle($_POST['deposit_to'])." [A/C:$deposit_to] on $date  VIA INTERNAL TRANSFER"; 
         makeTransaction($deposit_to,$deposit,$narration,'INTERNAL-TRANSACTION');
        


        //CR
        if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }
        $narration="Amount PKR ".nf($deposit)." has been RECEIVED from A/C: $deposit_to  TITLE: ".getAccountTitle($_POST['deposit_to'])."on $date  VIA INTERNAL TRANSFER"; 
        makeTransaction($from,$deposit,$narration,'INTERNAL-TRANSACTION');
        if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }
        
        }
      
        echo json_encode(array('code' => 200, 'message' => "Transaction has been posted Successfully"));



       
    }


    function transferCashNow()
    {
        extract($_REQUEST);
        $from=getInstAccount($from);
        $deposit_to=getInstAccount($deposit_to);
        $to_balance=getOpeningBalance($deposit_to);
        $date=date("d F Y h:i:s");
        if($tr_type==1){
        $narration="Amount PKR ".nf($deposit)." has been Credited CASH-HAND on $date  [$narration]"; 
        makeTransaction($deposit_to,$deposit,$narration,'CASH-DEPOSIT');
        if($alert){
            sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
           }
 
        }else{

            if($deposit > $to_balance){
                echo json_encode(array('code' => 201, 'message' => "Low DR Balance to proceed transaction"));
                die;
            }
                //DR
                $narration="Amount PKR ".nf($deposit)." has been DROWN-CASH on $date [$narration]"; 
                makeTransaction($deposit_to,-$deposit,$narration,'CASH-WITHDRAWAL');
  
 
        
        }
      
        echo json_encode(array('code' => 200, 'message' => "Transaction has been posted Successfully"));



       
    }


    function saveAccount()  {
        
        extract($_POST);
        if($title){
            $db['title'] = $title;
            $db['category'] = $category;
            $db['is_cash_transfer'] = $is_cash_transfer;
            $db['is_active'] = 1;
            $db['school_id'] = getSchoolID();
            $sql = db::prepInsertQuery($db, 'accounts_head');
            $id = db::insertRecord($sql);
            echo json_encode(array('code' => 200, 'message' => "Account has been saved Successfully"));

        }else{
            echo json_encode(array('code' => 201, 'message' => "Title is missing"));

        }


    }


    function diableAccounts()  {
        extract($_POST);
        $up['is_active']=0;
        $sql=db::prepUpdateQuery($up,'accounts_head','id',$account_id);
        db::updateRecord($sql);
        echo json_encode(array('code' => 200, 'message' => "Account has been Trashed","$sql"));

        
    }

    


}





