<?php
header('Access-Control-Allow-Origin: *');
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Kuickpay extends Public_Controller
{

    private $institute_name;
    private $institute_logo;
    private $settings;
    private $_CI;
    private $InstitutionID;
    private $kp_User_name = "kuickpay";
    private $kp_Password = "payx";
    private $username;
    private $password;
    private $institute_code;
    private $is_generate_voucher;
    private $body;
    private $student_id;
    private $amount = 0;
    private $paid_fine=0;

    private $project_id =1;
    




    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model("staff_model");
        $this->load->model("school_model");
        $this->load->library('Auth');
        $this->load->library('Enc_lib');
        $this->load->library('customlib');
        $this->load->library('captchalib');
        $this->load->library('mailsmsconf');
        $this->load->library('mailer');
        $this->load->config('ci-blog');
        $this->mailer;
        $this->sch_setting = $this->setting_model->getSetting();
        $this->settings = $this->paymentsetting_model->getActiveMethod();
        $this->headers = apache_request_headers();
        if (isset($this->settings->payment_type) and $this->settings->payment_type == 'payu' and $this->settings->is_active == 'yes') {

            $this->is_generate_voucher = true;
        } else {
            $this->is_generate_voucher = false;
        }

        if ($this->is_generate_voucher) {

            $this->institute_name = $this->setting_model->getSetting()->name;
            $this->institute_logo = $this->setting_model->getSetting()->image;

            if ($this->settings->is_puitc == 1) {
                $this->username = $this->settings->puitc_username;
                $this->password = $this->settings->puitc_password;
                $this->institute_code = $this->settings->institute_code;
            } else {

                $this->username = $this->settings->salt;
                $this->password = $this->settings->api_password;
                $this->institute_code = $this->settings->api_secret_key;
            }

        }
        if (isset($this->headers['username'])) {
            if (($this->headers['username'] == $this->username && $this->headers['password'] == $this->password)) {
                $this->is_logged = true;
            } else {
                $this->is_logged = false;
            }

            $this->body = json_decode(file_get_contents('php://input'), true);
            if (!isset($this->body['delete_transaction'])) {


                if (isset($this->body) && !empty($this->body)) {

                    $this->student_id = isset($this->body['consumer_number']) ? str_replace($this->institute_code . $this->project_id, "", $this->body['consumer_number']) : null;

                    $this->tran_auth_id = isset($this->body['tran_auth_id']) ? $this->body['tran_auth_id'] : null;
                    $this->student = $this->student_model->getByStudentSessionbyID($this->student_id);
                    $this->student_due_fee = $this->studentfeemaster_model->getStudentFees($this->student_id);
                    $this->student_discount_fee = $this->feediscount_model->getStudentFeesDiscount($this->student_id);


                    if (isset($this->student_due_fee)) {
                      
                        $due_date = "";
                        $feehead = array();
                        $feehead_amount = array();
                        $exp_date = array();
                         $paid_fine=0;

                        foreach ($this->student_due_fee as $key => $fee) {
                            if (isset($fee->fees) && count($fee->fees) > 0) {
                                foreach ($fee->fees as $keys => $student_fee) {




                                    $fee_paid = 0;
                                    $fee_discount = $fee_fine = 0;
                                    if (!empty($student_fee->amount_detail)) {
                                        $fee_deposits = json_decode(($student_fee->amount_detail));

                                        foreach ($fee_deposits as $fee_deposits_key => $fee_deposits_value) {

                                            $fee_paid = $fee_paid + $fee_deposits_value->amount;
                                            $fee_discount = $fee_discount + $fee_deposits_value->amount_discount;
                                             $paid_fine= $paid_fine+$fee_deposits_value->amount_fine;
                                             

                                        }
                                        
                                    }
                                    $this->paid_fine=  $paid_fine;
                                    
                                  
                                   
                                    

                                    $student_fee->amount = $student_fee->amount - $fee_paid;
                                         $myfee[$keys] = array(
                                        "fee_head" => $student_fee->type,
                                        "fee_amount" => $student_fee->due_date < date("Y-m-d")  ? $student_fee->fine_amount+$student_fee->amount:$student_fee->amount,
                                        "due_date" => $student_fee->due_date,
                                        
                                    );

                                }
                            }
                        }
                    }

                    if (isset($myfee) && !empty($myfee)) {
                        $amount = 0;
                        $counter = 1;
                        $other_payment = 0;
                       

                        foreach ($myfee as $key => $fee) {

                            $dateArray[] = $fee['due_date'];
                            $amount =  $amount + $fee['fee_amount'];
                           
                                
                            }


                            $counter++;
                          
                        
                        
                         $this->amount = $amount-$this->paid_fine;
                         
                        //geting due date
                        $timestampArray = array_map('strtotime', $dateArray);
                        $maxTimestamp = max($timestampArray);
                        $this->due_date = date("Ymd", $maxTimestamp);
                        $this->month = date("ym", $maxTimestamp);
                        $this->expiry_date = date("Ymd", strtotime('+3 days', $maxTimestamp));
                       
                       

                    }

                }
            }
        }

    }







    public function BillInquiry()
    {
        if (!$this->is_logged) {
            echo json_encode(array("response_Code" => "04", "message" => "Your Username or Password is Incorrect"));
            die;
        }

        if ($this->amount > 0) {

            $name = $this->student['firstname'] . " " . $this->student['lastname'];
            $name = substr($name, 0, 20);
            $phone = str_replace("+92", "0", $this->student['mobileno']);
            $email = str_replace("+92", "0", $this->student['email']);
            $pipe = "$phone | $email";


                $arrayVar = [
                    "Response_Code" => "00",
                    "Consumer_Detail" => $name,
                    "Bill_status" => "U",
                    "Due_Date" => $this->due_date,
                    "Amount_Within_DueDate" => "+" . $this->AN14($this->amount),
                    "Amount_After_DueDate" => "+" . $this->AN14($this->amount ),
                    "Billing_Month" => $this->month,
                    "Date_Paid" => "",
                    "Amount_Paid" => "",
                    "Tran_Auth_Id" => "",
                    "Reserved" => "$pipe",
                ];
          
        } else {

            $arrayVar = [
                "Response_Code" => "00",
                "Consumer_Detail" => "TEST",
                "Bill_status" => "P",
                "Due_Date" => "",
                "Amount_Within_DueDate" => "",
                "Amount_After_DueDate" => "",
                "Billing_Month" => "",
                "Date_Paid" => "",
                "Amount_Paid" => "",
                "Tran_Auth_Id" => "",
                "Reserved" => "",
            ];

          
        }
          echo json_encode($arrayVar);

    }
    
    
    
    

    public function BillPayment()
    {
        if (!$this->is_logged) {
            echo json_encode(array("response_Code" => "04", "message" => "Your Username or Password is Incorrect"));
            die;
        }

        if ($this->amount > 0) {

            $name = $this->student['firstname'] . " " . $this->student['lastname'];
            $name = substr($name, 0, 20);

            $phone = str_replace("+92", "0", $this->student['mobileno']);
            $email = $this->student['email'];
            $auth_id = mt_rand(100000, 999999);
            $pipe = "$phone | $email";


                $data = array(
                    "user_id" => $this->student_id,
                    "month" => date("ym", strtotime($this->body['tran_date'])),
                    "transaction_amount" => $this->body['transaction_amount'],
                    "tran_time" => $this->body['tran_time'],
                    "tran_date" => $this->body['tran_date'],
                    "transaction_id" => $this->body['tran_auth_id'],
                    "bank_name" => $this->body['bank_mnemonic'],

                );

                $this->paymentsetting_model->KuickPayPayments($data);
                $this->MarkAsFullPaid();
                  

                $arrayVar = [

                    'Response_Code' => '00',
                    'Identification_Parameter' => $name,
                    'Reserved' => $pipe,

                ];
               
            

            echo json_encode($arrayVar);
           
        } else {

            $arrayVar = [

                'Response_Code' => '02',
                'Identification_Parameter' => "",
                'Reserved' => "",

            ];

            echo json_encode($arrayVar);
        }


    }




    public function KuickpayBillers()
    {
        if (!$this->is_logged) {
            echo json_encode(array("Response_Code" => "04", "message" => "Your Username or Password is Incorrect"));
            die;
        }



        echo json_encode(
            array(
                'Response_Code' => '00',
                'Institutions' =>
                array(
                    0 =>
                    array(
                        'InstitutionID' => $this->institute_code,
                        'InstitutionName' => $this->institute_name,
                        'Category' => ' Education',
                        'LogoURL' => 'https://apis.isdigitalschools.com/uploads/school_content/admin_logo/' . $this->institute_logo,
                        'IsTopUp' => True,
                    ),
                ),
            )
        );



    }
    public function DeleteTransaction()
    {
        if (!$this->is_logged) {
            echo json_encode(array("Response_Code" => "04", "message" => "Your Username or Password is Incorrect"));
            die;
        }

        if (isset($this->body['delete_transaction']) && !empty($this->body['delete_transaction'])) {
            $this->paymentsetting_model->DeleteTransactionKuickPay($this->body['delete_transaction']);
            echo json_encode(array("Response_Code" => "00", "message" => "Transaction is Removed Successfully"));

        } else {
            echo json_encode(array("Response_Code" => "04", "message" => "Your Transaction ID is Invalid"));
        }






    }

    public function Index()
    {
        ?>
        <B>Use follwing methods</B><br>
        1- /BillInquiry<BR>2- /BillPayment <BR> 3- /KuickpayBillers
        <?php




    }
    public function MarkAsFullPaid()
    {
        
      
       
        
        $mode = $this->body['bank_mnemonic'];
        $txn_id = $this->body['tran_auth_id'];
        if (isset($this->student_due_fee)) {
            foreach ($this->student_due_fee as $key => $fee) {
                if (isset($fee->fees) && count($fee->fees) > 0) {
                    $index=0;
                    foreach ($fee->fees as $keys => $student_fee) {

                        if($student_fee->due_date < date("Y-m-d") ){
                            $fine=$student_fee->fine_amount;
                        }else{
                            $fine=0;
                        }
                        $send_to = $this->student['guardian_phone'];
                            $json_array = array(
                                'amount' => $student_fee->amount,
                                'date' => date('Y-m-d'),
                                'amount_discount' => 0,
                                'amount_fine' => $fine,
                                'description' => "Fee Paid Using $mode Transaction ID " . $txn_id,
                                'received_by' => '',
                                'payment_mode' => $mode,
                            );
                            $data = array(
                                'student_fees_master_id' => $student_fee->id,
                                'fee_groups_feetype_id' => $student_fee->fee_groups_feetype_id,
                                'amount_detail' => $json_array
                            );

                            $this->db->where('student_fees_master_id', $student_fee->id);
                            $this->db->where('fee_groups_feetype_id', $student_fee->fee_groups_feetype_id);
                            $q = $this->db->get('student_fees_deposite');
                            //prevent Dublicate entry
                           $already=$q->result_array();

                           
                            if(!$already){
                              
                                    $inserted_id = $this->studentfeemaster_model->fee_deposit($data, $send_to);

                        }
                      
                            
                    }
                }
            }
        }
    }







    public function AN14($amount)
    {
        $amount = $amount . ".00";
        $minorUnits = number_format($amount * 100, 0, '', ''); // Convert to minor units
        $formattedAmount = str_pad($minorUnits, 13, '0', STR_PAD_LEFT); // Left-pad with zeros
        return $formattedAmount; // Add trailing zero



    }

}