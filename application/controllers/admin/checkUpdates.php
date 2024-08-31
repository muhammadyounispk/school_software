<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class checkUpdates extends Admin_Controller {

    function __construct() {
        parent::__construct();
        
        $this->load->library('form_validation');
        $this->load->library('Mailer');
       
        $this->load->model("complaint_Model");
        $this->setting_result = $this->setting_model->getSetting();
        $this->is_locked=$this->setting_result->is_withdawal_locked;
       
       
       
    }

    public function index() {
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'admin/paymentsettings');
            $this->load->view('admin/widthdrawal/withdrawal', '');
     
    }

    function sendOTP()  {
        $sch=$this->setting_result;
        $otp=rand(100000,999999);
        if(time()-(int)getInput('time',false)>30){
        setInput('time',time());
        setInput('otp',$otp);
        setInput('request',$_REQUEST);
        $req=$_REQUEST;
        if($this->is_locked){
            $amount=nf($_REQUEST['amount']);
            $bank_title=getBankTitle($_REQUEST['bank']);
            $msg_m="Fund Transfer Of $amount to $bank_title  *A/c:* {$req['account']} *Title:* {$req['title']} has  *CANCELLED* due to you have already transaction in pending.";
            $this->SystemWhatsapp($sch->phone,$sch->name, $msg_m,'pending.png');
            $this->mailer->send_mail($sch->email,'Fund Withdrawal Cancelled',$msg_m);
            echo responseJson("Withdrawal request already in Progress, please wait untill it finish",201);
            $req=getInput('request');
            die;
        }


        $amount=nf($_REQUEST['amount']);
        $bank_title=getBankTitle($_REQUEST['bank']);
        $msg_m="Fund Transfer Of $amount to $bank_title *A/c:* {$_REQUEST['account']} *Title:* {$_REQUEST['title']} has required OTP, Please Enter *$otp* to Continue , In case Incorrect Information , Cancel the Transaction and make new one ";
        $this->SystemWhatsapp($sch->phone,$sch->name, $msg_m,'otp.png');
        $this->mailer->send_mail($sch->email,'Fund Withdrawal OTP',$msg_m);
        $msg= "OTP has been sent to Your Email " .$sch->email.' and Whatsapp sent to '.$sch->phone;
        echo responseJson($msg,200); 
        }else{
            echo responseJson("Please try again after 30 seconds ",201); 
        }

    }


    function confirmOTP()  {
        $req=getInput('request',false);

        $sch=$this->setting_result;
        if(!$req){
        echo responseJson("SESSION CLOSED pleae try again",201);
        die;

        }
        $amount=nf($req['amount']);
        $bank_title=getBankTitle($req['bank']);
        
    if($this->is_locked){
        $msg_m="Fund Transfer Of $amount to $bank_title  *A/c:* {$req['account']} *Title:* {$req['title']} has  *CANCELLED* due to you have already transaction in pending.";
        $this->SystemWhatsapp($sch->phone,$sch->name, $msg_m,'pending.png');
        $this->mailer->send_mail($sch->email,'Fund Withdrawal Cancelled',$msg_m);
        echo responseJson("Withdrawal request already in Progress, please wait untill it finish",201);
        $req=getInput('request');
        die;
    }
     $enter_otp=$this->input->post('user_otp');
     if($enter_otp==getInput('otp',false)){
        if(getInput('request',false)['amount']> getBalance(getSchoolID())){
            echo responseJson("Insufficient Balance to process request ",201);  
        }else{
       
       
        $obj['opening_balance']=getBalance(getSchoolID());
        $obj['closing_balance']=getBalance(getSchoolID())-$req['amount'];
        $obj['school_id']=getSchoolID();
        $obj['bank_id']=$req['bank'];
        $obj['title']=$req['title'];
        $obj['account']=$req['account'];
        $obj['amount']=$req['amount'];
        $obj['whatsapp']=$sch->phone;
        $obj['email']=$sch->email;
        $obj['remarks']="Transaction posted successfully, check status again";
        $obj['is_default']=$req['set_is_default']=='on'? 1:0;
        $procees_query=db::prepInsertQuery($obj,'withdrawal');
        $id= db::insertRecord($procees_query);
        db::query("UPDATE sch_settings set is_withdawal_locked=1 where id=".getSchoolID());
      
        $msg_m="Fund Transfer Of $amount to $bank_title  *A/c:* {$req['account']} *Title:* {$req['title']} has been received,  Your Transaction ID is $id , pleae wait while we process your amount into your Account , *Call us* if you want to Trace/cancel the Transaction on Urgent ";
        $this->SystemWhatsapp($sch->phone,$sch->name, $msg_m,'posted.png');

        $msg_m="Fund Withdrawal request  Of $amount to $bank_title  *A/c:* {$req['account']} *Title:* {$req['title']} received , Contact {$sch->phone}  OR {$sch->email} witth {$sch->name} for Further Quick reporting OR  please check MLA to proces the transaction ";
        $this->SystemWhatsapp(ADMIN_WA,'ADMIN-FINANCE', $msg_m,'payment_req.png');


        $this->mailer->send_mail($sch->email,'Fund Transfer request has been posted with ID [$id]',$msg_m);

        echo responseJson("Transaction ID:  $id has been made Successfully ",200);
        getInput('request');
        }
     
     }else{
        echo responseJson("OTP Not Correct",201);

     }
  
    }


    function loadWithdrawalData() {

        $data=db::getRecords("SELECT* , (SELECT name from banks where id=bank_id) as bank_name from withdrawal where school_id=".getSchoolID());
       if(  $data){
        
        $sr=1;
        $withdrawal_status=array("1"=>"Pending","2"=>"Processing","3"=>"Transfered","4"=>"Cancelled");
       
        foreach (  $data as $key => $transaction) {
            $status_id=$transaction['status'];
            $remarks=$transaction['remarks'];
            $status_text=$withdrawal_status[$status_id];
            $date=date('d/m/y h:i a',strtotime($transaction['created_at']));
            $amount=nf($transaction['amount']);
            $opening_balance=nf($transaction['opening_balance']); 
            $closing_balance=nf($transaction['closing_balance']); 
            $download=MLA_DOWNLOAD.$transaction['proof'];
            echo "<tr>
                    <td>$sr</td>
                    <td>{$transaction['title']}</td>
                    <td>{$transaction['account']}</td>
                    <td>{$transaction['bank_name']}</td>
                    <td><center>$opening_balance</center></td>
                    <td><center>$amount</center></td>
                    <td><center>$closing_balance</center></td>
                    <td><button data-after-text='$status_id' data-after-type='red badge top right' data-before-text='new' data-before-type='blue pill'>$status_text</button></td>
                   <td>$date</td>
                   ";
                 if($status_id==3 || $status_id==4){
                   echo "<td><center>$remarks</center></td>
                   <td><a class='btn btn-info btn-xs' href='$download' download><i class='fa fa-download'></i></center></td>";
                 }else{
                    echo "<td colspan='2'><center>$remarks</center></td>
                   ";
                 }

                   echo "</tr>";
            $sr++;
        }

       
       
       }
       
        
    }

}
