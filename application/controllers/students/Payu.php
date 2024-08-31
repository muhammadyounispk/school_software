<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Payu extends Student_Controller {

    function __construct() {
        parent::__construct();
        $this->setting = $this->setting_model->get();
    }

    public function index() {
        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'book/index');
        $pre_session_data = $this->session->userdata('params');
        $txnid = substr(hash('sha256', mt_rand() . microtime()), 0, 20);
        $pre_session_data['txn_id'] = $txnid;
        $this->session->set_userdata("params", $pre_session_data);
        $session_data = $this->session->userdata('params');
        $session_data['name'] = ($session_data['name'] != "") ? $session_data['name'] : "noname";
        $session_data['email'] = ($session_data['email'] != "") ? $session_data['email'] : "noemail@gmail.com";
        $session_data['guardian_phone'] = ($session_data['guardian_phone'] != "") ? $session_data['guardian_phone'] : "0000000000";
        $session_data['address'] = ($session_data['address'] != "") ? $session_data['address'] : "noaddress";
        $pay_method = $this->paymentsetting_model->getActiveMethod();
        //payumoney details
        $amount = round(number_format((float)($session_data['fine_amount_balance']+$session_data['total']), 2, '.', ''));
        $customer_name = $session_data['name'];
        $customer_emial = $session_data['email'];
        $customer_mobile = $session_data['guardian_phone'];
        $customer_address = $session_data['address'];
        $product_info = $session_data['payment_detail']->fee_group_name . " - " . $session_data['payment_detail']->code;
        $MERCHANT_KEY = $pay_method->api_secret_key;
        $SALT = $pay_method->salt;


        //optional udf values 
        $udf1 = '';
        $udf2 = '';
        $udf3 = '';
        $udf4 = '';
        $udf5 = '';

        $hashstring = $MERCHANT_KEY . '|' . $txnid . '|' . $amount . '|' . $product_info . '|' . $customer_name . '|' . $customer_emial . '|' . $udf1 . '|' . $udf2 . '|' . $udf3 . '|' . $udf4 . '|' . $udf5 . '||||||' . $SALT;
        $hash = strtolower(hash('sha512', $hashstring));

        $success = base_url('students/payu/success');
        $fail = base_url('students/payu/success');
        $cancel = base_url('students/payu/success');
        $data = array(
            'mkey' => $MERCHANT_KEY,
            'tid' => $txnid,
            'hash' => $hash,
            'amount' => $amount,
            'fee_group_name' => $session_data['payment_detail']->fee_group_name,
            'fee_code' => $session_data['payment_detail']->code,
            'name' => $customer_name,
            'productinfo' => $product_info,
            'mailid' => $customer_emial,
            'phoneno' => $customer_mobile,
            'address' => $customer_address,
            'action' => "https://secure.payu.in", //for live change action  https://secure.payu.in
            'sucess' => $success,
            'failure' => $fail,
            'cancel' => $cancel
        );
        $data['session_data'] = $session_data;
        $data['setting'] = $this->setting;
        $this->load->view('student/payu', $data);
    }

    function checkout() {

        $this->form_validation->set_rules('firstname', 'Customer Name', 'required|trim|xss_clean');
        $this->form_validation->set_rules('phone', 'Mobile No', 'required|trim|xss_clean');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email|trim|xss_clean');
        $this->form_validation->set_rules('amount', 'Amount', 'required|trim|xss_clean');
        $this->form_validation->set_rules('easypaisa_account_no', 'Easypaisa Account Number ', 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'firstname' => form_error('firstname'),
                'phone' => form_error('phone'),
                'email' => form_error('email'),
                'amount' => form_error('amount'),
                'easypaisa_account_no' => form_error('easypaisa_account_no')
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {

              $phone=$this->input->post("phone");
              $email=$this->input->post("email");
              $amount=$this->input->post("amount");
              $txnid=$this->input->post("txnid");
              $account=$this->input->post("easypaisa_account_no");
              $message="";
              $url="";

$orderid=$txnid;
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => "https://easypay.easypaisa.com.pk/easypay-service/rest/v4/initiate-ma-transaction",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 120,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n\t\"orderId\":\"$orderid\",\n\t\"storeId\":\"87627\",\n\t\"accountNum\":\"123134764\",\n\t\"transactionAmount\":\"$amount\",\n\t\"transactionType\":\"MA\",\n\t\"mobileAccountNo\":\"$account\",\n\t\"emailAddress\":\"$email\"\n\t\n\t\n}",
  CURLOPT_HTTPHEADER => array(
    "cache-control: no-cache",
    "content-type: application/json",
    "credentials: UGFud2FyVW5pb25JVENlbnRlcjpiNGRlMmRkNjg3NzEwYTgwOGY5OGU3YzFkNTU0NWU1ZA==",
    "postman-token: b3df2efb-74b6-419f-4ce9-3b03535f70ee"
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
$message="CRUL ERROR happend";
$code=201;

} else {
  
  
$data=json_decode($response,true);

 $status=$data['responseDesc'];
  $code=$data['responseCode'];
   $tid=isset($data['transactionId']) ? $data['transactionId'] :null ;

  
 if($status=="SUCCESS"){
  

           $session_data = $this->session->userdata('params');
                  $transactionid = $txnid;
                  $txn_id = $session_data['txn_id'];
  
                  if ($txn_id == $transactionid) {
                      $params = $this->session->userdata('params');
                      $json_array = array(
                          'amount' => $params['total'],
                          'date' => date('Y-m-d'),
                          'amount_discount' => 0,
                          'amount_fine' => $params['fine_amount_balance'],
                          'description' => "Online Paid by Easypaisa Transaction  ID : $tid ",
                          'received_by' => '',
                          'payment_mode' => 'PayU',
                      );
                      
                      $data = array(
                          'student_fees_master_id' => $params['student_fees_master_id'],
                          'fee_groups_feetype_id' => $params['fee_groups_feetype_id'],
                          'amount_detail' => $json_array
                      );
                      $send_to = $params['guardian_phone'];
                      $inserted_id = $this->studentfeemaster_model->fee_deposit($data, $send_to);
                      if ($inserted_id) {
                        $invoice_detail = json_decode($inserted_id);
                        $url=base_url("user/user/getfees");
                    }
                    

                    }

                    $message="PAYMENT IS RECEIVED SUCCESSFULLY";
                    $errorcode=200;
                


 }else if($status=='LOW BALANCE'){
      
    $message="Sorry You have Low Balance in your Easypaisa Account. Please Recharge your account";
    $errorcode=201;
 }
 else if($status=='SYSTEM ERROR'){
    $message="You have Entered incorrect Easypaisa Account Number ";
$errorcode=201;
      
 }else if($status='REQUIRED FIELD MISSING'){
    $message="You have Entered incorrect Easypaisa Account Number ";
    $errorcode=201;
 }
  
  
}
 if($errorcode!=200){
                $data = array(
                    'easypaisa_account_no' => $message
                );
                $array = array('status' => 'fail', 'error' => $data,"message"=>$message,"code"=>$errorcode,"redirect"=> $url);
                echo json_encode($array);
            }else{
                $array = array('status' => 'success', 'error' => '',"message"=>$message,"code"=>$errorcode,"redirect"=> $url);
                echo json_encode($array);
            }
            
        }
    }

    public function success($trixid) {

            $session_data = $this->session->userdata('params');

            if ($this->input->post('status') == "success") {
               
                $transactionid = $trixid;
                $txn_id = $session_data['txn_id'];

                if ($txn_id == $transactionid) {
                    $params = $this->session->userdata('params');
                    $json_array = array(
                        'amount' => $params['total'],
                        'date' => date('Y-m-d'),
                        'amount_discount' => 0,
                        'amount_fine' => $params['fine_amount_balance'],
                        'description' => "Online Paid by Easypaisa",
                        'received_by' => '',
                        'payment_mode' => 'PayU',
                    );
                    
                    $data = array(
                        'student_fees_master_id' => $params['student_fees_master_id'],
                        'fee_groups_feetype_id' => $params['fee_groups_feetype_id'],
                        'amount_detail' => $json_array
                    );
                    $send_to = $params['guardian_phone'];
                    $inserted_id = $this->studentfeemaster_model->fee_deposit($data, $send_to);

                   
                } else {
                    redirect(base_url('students/payment/paymentfailed'));
                }
            } else {

                redirect(base_url('students/payment/paymentfailed'));
            }
        
    }

}
