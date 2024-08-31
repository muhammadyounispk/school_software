<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
class FeeManagement extends Admin_Controller
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
        $this->load->view('FeeManagement/fee-management', $data);
        $this->load->view('layout/footer', $data);
    }
    function searchbyform()
    {
        extract($_REQUEST);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        $this->load->view('FeeManagement/studentlist', get_defined_vars());
    }
    function takeFee()
    {
        extract($_REQUEST);
        $this->load->view('FeeManagement/depositFee', get_defined_vars());
    }
    function studentTransactions()
    {
        extract($_REQUEST);
        $this->load->view('FeeManagement/studentTransactions', get_defined_vars());
    }
    function depositFee()
    {
        extract($_REQUEST);
        $date = date('Y-m-d H:i:s');
        $student_accouunt = getFeeAccount($student_id);
        if ($payment_from != 'account') {
            makeTransaction($student_accouunt, $deposit, "AMOUNT PKR $deposit has been RECEIVED from INSTITUTE OVER $payment_from AGAINST FEE-DEPOSIT~$fee_month on $date   ", $payment_from);
        }
        $system = getSystemAccounts();
        $system_arr = array_column($system, 'title', 'id');
        if ($deposit > 0 && $deposit <= $total) {
            $student = db::getRecord("SELECT* from students WHERE id=$student_id");
            $opening_balance = getOpeningBalance($student_accouunt);
            $opening_balance = $opening_balance > 0 ? $opening_balance : 0;
            if ($payment_from == 'account' &&  $deposit > $opening_balance) {
                echo json_encode(array('code' => 201, 'message' => "Low Balance to proceed transaction {CURRENT BALANCE: $opening_balance} $student_accouunt"));
                die;
            }
            $activated_fee = db::getRecords("SELECT * FROM `students_fee` where  student_id='{$student_id}' ");
            $meta = json_encode($activated_fee);
            $system_ac = $system_arr[$deposit_to];
            $narration = "An amount PKR $deposit SENT to Institute against [{$student['firstname']} {$student['lastname']}] FEE-COLLECTION~$fee_month  at  $date via  $payment_from ";
            $deposit = -$deposit;
            $closing = $opening_balance + $deposit;
            $arrear = $total + $deposit;
            $transaction = array(
                'school_id' => getSchoolID(),
                'user_id' => getAuthUserID(),
                'account' => getFeeAccount($student_id),
                'student_id' => $student_id,
                'narration' => $narration,
                'opening_balance' => $opening_balance,
                'amount' => $deposit,
                'total' => $total,
                'type' => 2,
                'closing_balance' => $closing,
                'meta' => $meta,
                'transit' => getInstAccount($deposit_to),
                'month' => getFeeMonth(),
                'year' => getFeeYear(),
                'balance' => $total + $deposit,
                'arrears' => $student['arrears'],
                'payment_from' => $payment_from,  'date' => date('Y-m-d'),  'trasaction_at' => date('Y-m-d H:i:s')
            );
              //SMS & Whatsapp
              if($alert){
             sendSMS($student['mobileno'],$narration,$student['firstname']);
              }
            $sql = db::prepInsertQuery($transaction, 'transactions');
            $id = db::insertRecord($sql);
            if ($id) {
                //Credit
                $deposit = -$deposit;
                $st_account = getFeeAccount($student_id);
                $date = date("d F Y h:i:s a");
                makeTransaction(getInstAccount($deposit_to), $deposit, "AMOUNT PKR $deposit has been RECEIVED from {$student['firstname']} A/C:  $st_account AGAINST FEE-DEPOSIT~$fee_month on $date   ", $payment_from);
            }
            db::query("UPDATE students set arrears=$arrear where id=$student_id");
            echo json_encode(array('code' => 200, 'message' => "Fee deposit Successfully","take_print"=>$take_print));
        } else {
            echo json_encode(array('code' => 201, 'message' => "ERROR CODE=2134"));
        }
    }
    function transferNow()
    {
        extract($_REQUEST);
        $tr_auths = studentFullInfo($student_id);
        $st=db::getRecord("select* FROM students where id=$student_id");
        if($deposit_to){
            $title=getAccountTitle($deposit_to);
            $deposit_to=getInstAccount($deposit_to);
         
        }else{
            $deposit_to="";
        }
        $account_balance = $tr_auths['father_balance'];
        if ($payment_from == 'account' &&  $deposit > $account_balance) {
            echo json_encode(array('code' => 201, 'message' => "Low Balance to proceed transaction OR ONLY Credit Allowd"));
            die;
        }
        if ($payment_from == 'account') {
            $sender_account_id = getFatherAccount($tr_auths['father_id']);
        }

        if ($deposit > 0 && $narration) {
            $sql = "SELECT closing_balance from transactions where student_id='$student_id' and school_id='" . getSchoolID() . "' order by id DESC LIMIT 1";
            $current = db::getCell($sql);
            if ($tr_type == 2) {
                if ($payment_from == 'account' &&  $deposit > $current) {
                    echo json_encode(array('code' => 201, 'message' => "LOW CLOSING Balance to proceed DR transaction"));
                    die;
                }
            }
            $closing = $current + $deposit;
            $date=date("d F Y h:i:s a");
            $acd=getFeeAccount($student_id);
            $narration="Amount PKR $deposit has been received in Your Account A/C: $acd on $date [$narration] ";
            $transaction = array(
                'school_id' => getSchoolID(),
                'user_id' => getAuthUserID(),
                'student_id' => $student_id,
                'account' => $acd ,
                'narration' => $narration,
                'opening_balance' => $current,
                'amount' => $deposit,
                'total' => $total,
                'type' => $tr_type,
                'closing_balance' => $closing,
                'meta' => '',
                'month' => '',
                'year' => '',
                'balance' => 0,
                'arrears' => 0,
                'payment_from' => $payment_from,
                'date' => date('Y-m-d'),
                'trasaction_at' => date('Y-m-d H:i:s')
            );

            
            $sql = db::prepInsertQuery($transaction, 'transactions');
            $id = db::insertRecord($sql);

            if($alert){
                sendSMS($st['mobileno'],$narration,$st['firstname'] ." ".$st['lastname']);
                }


            if($deposit_to){
            //DR
            $st_ac=getFeeAccount($student_id);
            $narration="Amount PKR $deposit has been Sent to A/C: $deposit_to Title: $title  on $date ";
            makeTransaction( $st_ac,-$deposit,$narration,$payment_from);
            if($alert){
                sendSMS($st['mobileno'],$narration,$st['firstname'] ." ".$st['lastname']);
                }

            //CR
            $narration="Amount PKR $deposit Received from {$st['firstname']} {$st['lastname']} A/C:  $st_ac Agaist ACAD-UNFIXED on $date ";
            makeTransaction($deposit_to,$deposit,$narration,$payment_from);
            if($alert){
                sendSMS(getSchoolInfo('phone'),$narration,"".getSchoolInfo('name'));
               }


            }
            if ($payment_from == 'account' &&  $id) {
                db::query("UPDATE guardians set balance=balance-$deposit where id= {$tr_auths['father_id']}");
            }

            
            echo json_encode(array('code' => 200, 'message' => "Transaction has been posted Successfully"));
        } else {
            echo json_encode(array('code' => 201, 'message' => "ERROR CODE=2134"));
        }
    }
    function exportPaidlist()
    {
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/exportPaidlist', get_defined_vars());
        $html_content = ob_get_clean();
        $this->makePDF($html_content, 'paidlist_Detailed.pdf');
    }
    function exportUnPaidlist()
    {
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/exportUnPaidlist', get_defined_vars());
        $html_content = ob_get_clean();
        $this->makePDF($html_content, 'unpaidlist_Detailed.pdf');
    }


    function ProceedClosing()  {
        $json = $this->input->post('auth_id');
        $req = json_decode(str_decode($json), true);
        extract($req);
    
     
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        foreach ($students as $key => $student) {
            $month =explode("-",$fee_month)[1];
            $year = explode("-",$fee_month)[0];
           $student_id= $id=$student['id'];
           $acd=getFeeAccount($student_id);

             $sql = "SELECT* FROM transactions where student_id=$id and month='" . $month . "' and  year='" . $year . "'";
             $transaction = db::getRecord($sql);
            if(!$transaction){
                $current = getOpeningBalance($acd);
           
                $deposit=0;
                $closing = $current + $deposit;
                $date=date("d F Y h:i:s a");

                $activated_fee = db::getRecords("SELECT * FROM `students_fee` where  student_id='{$student_id}' ");
                $meta = json_encode($activated_fee);
                $total=$amount=$student['fee']+$student['arrears'];

              
                $narration="Fee Adjustment Carry forward  PKR: $amount on A/C: $acd added into arrears on $date ";
                $old_arrears=db::getCell("select arrears from students where id=$student_id");
                $trs = array(
                    'school_id' => getSchoolID(),
                    'user_id' => getAuthUserID(),
                    'student_id' => $student_id,
                    'account' => $acd ,
                    'narration' => $narration,
                    'opening_balance' => $current,
                    'amount' => $deposit,
                    'total' => $total,
                    'type' => $tr_type,
                    'closing_balance' => $closing,
                    'meta' => $meta,
                    'month' => $month,
                    'year' => $year,
                    'balance' => $total,
                    'arrears' => $old_arrears,
                    'payment_from' => "ADJUSTMENT",
                    'date' => date('Y-m-d'),
                    'trasaction_at' => date('Y-m-d H:i:s')
                );
                $amount=$student['fee'];
                db::query("UPDATE students set arrears=arrears+$amount where id=$student_id");
                
                 $sql = db::prepInsertQuery($trs, 'transactions');
                 db::insertRecord($sql);

               




            }

           


            
        }

        echo json_encode(array('code'=>200,'message'=>"Closing has been Done"));
        
    }
    function ClosingVoucher()
    {
    
        ob_start();
          $auth_id = $this->input->get('auth_request');
        $this->load->view('FeeManagement/closing_voucher', get_defined_vars());
       echo  $html_content = ob_get_clean();
             
        

    }
    function exportDefaulterList()
    {
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        if ($class_id and $section_id) {
            $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        } else {
            $students = $this->studentsession_model->searchMultiStudentByClassSection();
        }

        foreach ($students as $key => $student) {
            $unpaid = getUnPaidMonths($student['student_id']);

            $students[$key]['unpaid'] = $unpaid;
        }

        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/exportDefaullters', get_defined_vars());
        $html_content = ob_get_clean();
        $this->makePDF($html_content, 'def.pdf');
    }
    function exportDisabledist()
    {
        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        if ($class_id and $section_id) {
            $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id, 'no');
        } else {
            $students = $this->studentsession_model->searchMultiStudentByClassSection(null, null, 'no');
        }

        foreach ($students as $key => $student) {
            $unpaid = getUnPaidMonthsTillDate($student['student_id'], $student['disable_at']);

            $students[$key]['unpaid'] = $unpaid;
            $students[$key]['reason'] = db::getCell("SELECT reason from disable_reason where id='{$studen['dis_reason']}' ");
        }



        ob_start();
        $school = (array)$this->sch_setting_detail;
        $logo = base_url() . "uploads/school_content/logo/" . $school['admin_logo'];
        $base_url = base_url();
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/exportDisabled', get_defined_vars());
        $html_content = ob_get_clean();
        $this->makePDF($html_content, 'def.pdf');
    }


    function deleteFee()
    {
        ob_start();
        $this->load->view('FeeManagement/confirDialogDelete', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
    function deleteFeeConfirm()
    {
        $auth_id = str_decode($_REQUEST['auth_id']);
        $student_id = $_REQUEST['student_id'];
        $arrears_st = db::getCell("select arrears from students where id=$student_id");
        $arrears_tr = db::getCell("select arrears from transactions where id=$auth_id");
        $amount_tr = db::getCell("select amount from transactions where id=$auth_id");
        $amount_tr = db::getCell("select amount from transactions where id=$auth_id");
        $transit = db::getCell("select transit from transactions where id=$auth_id");
       if($amount_tr <= getOpeningBalance($transit) ){

       
        makeTransaction($transit,$amount_tr,"AMOUNT DEDUCTION AGAINST TRANSACTION ID $auth_id OVER FEE COLLECTION - DELETE PURPOSE","DELETE");
        makeTransaction(getFeeAccount($student_id),-$amount_tr,"AMOUNT REFUNED  AGAINST TRANSACTION ID $auth_id OVER FEE COLLECTION - DELETE PURPOSE","DELETE",array('student_id'=>$student_id));
        makeTransaction(getFeeAccount($student_id),$amount_tr,"AMOUNT DRAWN  AGAINST TRANSACTION ID $auth_id OVER FEE COLLECTION - DELETE PURPOSE","DELETE",array('student_id'=>$student_id));
        $arrears = $arrears_tr;
        $update['month']='';
        $update['year']='';
        $update_sql=db::prepUpdateQuery($update,"transactions","id",$auth_id);
        db::updateRecord($update_sql);
       
        $sql = "UPDATE students set arrears=$arrears where id=$student_id";
        db::query($sql);
        echo json_encode(array('code' => 200, 'message' => "Transaction has been reverted"));

       }else{
        echo json_encode(array('code' => 201, 'message' => "LOW TRANSIT A/C BALANCE TO PROCEED"));
       }

    }
    function exportVouchers()
    {

        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/exportVouchers', get_defined_vars());
        $html_content = ob_get_clean();
        $this->makePDF($html_content, 'paidlist_Detailed.pdf');
    }
    function studentCard()
    {

        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/studentCards', get_defined_vars());
        echo $html_content = ob_get_clean();
       
    }

    function export1TVouchers()
    {


        $json = $_GET['auth_request'];
        $req = json_decode(str_decode($json), true);
        extract($req);
        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        ob_start();
        $school = (array)$this->sch_setting_detail;
        $fm = $fee_month;
        $month = explode("-", $fm)[0];
        $year = explode("-", $fm)[1];
        $fee_month = date('F Y', strtotime($fee_month));
        $class = getClass($class_id);
        $section = getSecion($section_id);
        $this->load->view('FeeManagement/export1TVouchers', get_defined_vars());
        $html_content = ob_get_clean();
        $this->makePDF($html_content, 'paidlist_Detailed.pdf');
    }

    function transaction()
    {
        extract($this->input->get());
        ob_start();
        $this->load->view('FeeManagement/studentTransactions', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
    function collectionStatement()
    {
        extract($this->input->get());
        ob_start();
        $this->load->view('FeeManagement/collectionStatement', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
    function loadcollectionStatement()
    {
        ob_start();
        extract($_POST);
        $from = date('Y-m-d', strtotime(str_replace(' ', '', explode("-", $date_range)[0])));
        $to = date('Y-m-d', strtotime(str_replace(' ', '', explode("-", $date_range)[1])));
        $account = getInstAccount($account);
        if ($tr_type) {
            $sql = "SELECT* from transactions where account=$account and date >= '$from' and date <='$to' and type='$tr_type' and school_id='" . getSchoolID() . "' order by id DESC ";
        } else {
            $sql = "SELECT* from transactions where account=$account and date >= '$from' and date <='$to' and school_id='" . getSchoolID() . "'  order by id DESC ";
        }
        $trs = db::getRecords($sql);
        $this->load->view('FeeManagement/tbl_collectionStatement', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
    function loadTransactions()
    {
        ob_start();
        extract($_POST);
        $from = date('Y-m-d', strtotime(str_replace(' ', '', explode("-", $date_range)[0])));
        $to = date('Y-m-d', strtotime(str_replace(' ', '', explode("-", $date_range)[1])));
        $account = getFeeAccount($student_id);
        $sql = "SELECT* from transactions where account=$account and date >= '$from' and date <='$to' and school_id='" . getSchoolID() . "' order by id DESC ";
        $trs = db::getRecords($sql);
        $this->load->view('FeeManagement/st_transactions', get_defined_vars());
        echo  $html_content = ob_get_clean();
    }
    function printVoucher()
    {
        extract($_REQUEST);
        echo  getVoucherHTML($student_id, "STUDENT COPY", $fee_month, false);
    }



    function bulkModification()
    {
        $json = $this->input->get('auth_request');
        $req = json_decode(str_decode($json), true);
        extract($req);
      

        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        $this->load->view('FeeManagement/bulkModification', get_defined_vars());
    }
    function bulkFeeCollection()
    {
        $json = $this->input->get('auth_request');
        $req = json_decode(str_decode($json), true);
        extract($req);
    

        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        $this->load->view('FeeManagement/bulkCollection', get_defined_vars());
    }
    function collectionByParent()
    {
        $json = $this->input->get('auth_request');
        $req = json_decode(str_decode($json), true);
        extract($req);
    

        $students = $this->studentsession_model->searchMultiStudentByClassSection($class_id, $section_id);
        $this->load->view('FeeManagement/bulkCollectionByParent', get_defined_vars());
    }


    function bulkFeeUpdate()
    {
        ini_set('display_errors', '1');
        ini_set('display_startup_errors', '1');
        error_reporting(E_ALL);

        extract($_POST);

        foreach ($student as $key => $id) {
            $payable = 0;
            $fees = $fee[$id]['fee_id'];
            $phone = $fee[$id]['mobile_no'];
            $arrears = $fee[$id]['arrears'];

            if (count($fees) > 0) {
                db::deleteRecord('students_fee', 'student_id', $id);
            }

            foreach ($fees as $key => $fee_id) {
                $fee_amout = $fee[$id]['fee'][$key];
                $fee_title = $fee[$id]['fee_title'][$key];
                if ($fee_amout) {

                    $payable = $payable + $fee_amout;
                    $insert_db['accounts_id'] = $fee_id;
                    $insert_db['title'] = $fee_title;
                    $insert_db['student_id'] = $id;
                    $insert_db['payable_amount'] = $fee_amout;
              
                    $query = db::prepInsertQuery($insert_db, 'students_fee');
                    db::insertRecord($query);
                }
            }



            $db_up['fee'] = $payable;
            $db_up['mobileno'] = $phone ;
            $db_up['guardian_phone'] = $phone ;
            $db_up['arrears'] = $arrears;
            $update_sql = db::prepUpdateQuery($db_up, 'students', 'id', $id);
            db::updateRecord($update_sql);
        }

        echo json_encode(array('code' => 200, 'message' => "Bulk update successful"));
    }
    function bulkFeeCollectionSave()
    {
        ini_set('display_errors', '1');
        ini_set('display_startup_errors', '1');
        error_reporting(E_ALL);

        extract($_POST);
        if (isset($student) && !empty($student)) {
            foreach ($student as $key => $student_id) {

                $deposit = $_POST['paid'][$student_id];
                $total = $_POST['total'][$student_id];
                if($total < $deposit){
                    echo json_encode(array('code' => 201, 'message' => "ERROR:4545 (AMOUNT IS GREATER)"));
                    die;
                }
                if($deposit < 1){
                    echo json_encode(array('code' => 201, 'message' => "ERROR:4546 (AMOUNT NOT ENTER)"));
                    die;
                }

                if ($deposit) {


                    $payment_from = 'by_hand';
                    $date = date('Y-m-d H:i:s');
                    $student_accouunt = getFeeAccount($student_id);
                    if ($payment_from != 'account') {
                        makeTransaction($student_accouunt, $deposit, "AMOUNT PKR $deposit has been RECEIVED from INSTITUTE OVER $payment_from AGAINST FEE-DEPOSIT~$fee_month on $date   ", $payment_from);
                    }
                    $system = getSystemAccounts();
                    $system_arr = array_column($system, 'title', 'id');
                    if ($deposit > 0 && $deposit <= $total) {
                        $student = db::getRecord("SELECT* from students WHERE id=$student_id");
                        $opening_balance = getOpeningBalance($student_accouunt);
                        $opening_balance = $opening_balance > 0 ? $opening_balance : 0;
                        if ($payment_from == 'account' &&  $deposit > $opening_balance) {
                            echo json_encode(array('code' => 201, 'message' => "Low Balance to proceed transaction {CURRENT BALANCE: $opening_balance}"));
                            die;
                        }
                        $activated_fee = db::getRecords("SELECT * FROM `students_fee` where  student_id='{$student_id}' ");
                        $meta = json_encode($activated_fee);
                        $system_ac = $system_arr[$deposit_to];
                        $narration = "An amount PKR $deposit SENT to Institute against [{$student['firstname']} {$student['lastname']}] FEE-COLLECTION~$fee_month  at  $date via  $payment_from ";
                        $deposit = -$deposit;
                        $closing = $opening_balance + $deposit;
                        $arrear = $total + $deposit;
                        $transaction = array(
                            'school_id' => getSchoolID(),
                            'user_id' => getAuthUserID(),
                            'account' => getFeeAccount($student_id),
                            'student_id' => $student_id,
                            'narration' => $narration,
                            'opening_balance' => $opening_balance,
                            'amount' => $deposit,
                            'total' => $total,
                            'type' => 2,
                            'closing_balance' => $closing,
                            'meta' => $meta,
                            'transit' => getInstAccount($deposit_to),
                            'month' => getFeeMonth(),
                            'year' => getFeeYear(),
                            'balance' => $total + $deposit,
                            'arrears' => $student['arrears'],
                            'payment_from' => $payment_from,  'date' => date('Y-m-d'),  'trasaction_at' => date('Y-m-d H:i:s')
                        );

                        //SMS & Whatsapp
                        if($alert){
                        sendSMS($student['mobileno'],$narration,$student['firstname']);
                        }



                        $sql = db::prepInsertQuery($transaction, 'transactions');
                        $id = db::insertRecord($sql);
                        if ($id) {
                            //Credit
                            $deposit = -$deposit;
                            $st_account = getFeeAccount($student_id);
                            $date = date("d F Y h:i:s a");
                            makeTransaction(getInstAccount($deposit_to), $deposit, "AMOUNT PKR $deposit has been RECEIVED from {$student['firstname']} A/C:  $st_account AGAINST FEE-DEPOSIT~$fee_month on $date   ", $payment_from);
                        }
                        db::query("UPDATE students set arrears=$arrear where id=$student_id");

                    } else {
                        echo json_encode(array('code' => 201, 'message' => "ERROR CODE=2134"));
                        die;
                    }
                }




               
            }
            echo json_encode(array('code' => 200, 'message' => "Bulk update successful"));
        }else{
            echo json_encode(array('code' => 201, 'message' => "NO-STUDENT SELECTED TO DEPOSIT FEE"));

        }
    }

    function FeeHeads()  {
        ob_start();
      
        $this->load->view('FeeManagement/AccountHeads', get_defined_vars());
        echo $html_content = ob_get_clean();
        
    }
    function tableDataFeeHead()  {
        ob_start();
      
        $this->load->view('FeeManagement/loadFeeHeadTable', get_defined_vars());
        echo $html_content = ob_get_clean();
        
    }


    function AddFeHead()  {
        extract($this->input->post());
        $data['school_id']=getSchoolID();
        $data['title']=$fee_title;
        $data['amount']=$amount;
        $sql=db::prepInsertQuery($data,'accounts');
        db::insertRecord($sql);
        echo json_encode(array('code' => 200, 'message' => "Account has been added"));


        
    }
    function deleteFeeHead()  {
        extract($this->input->post());
       
        $data['is_active']=0;
        $sql=db::prepUpdateQuery($data,'accounts',"id",$id);
        db::updateRecord($sql);
        echo json_encode(array('code' => 200, 'message' => "Account has been added"));


        
    }
}
