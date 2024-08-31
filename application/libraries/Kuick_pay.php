<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Kuick_pay
{

private  $institute_name;
    private $settings;
    private $_CI;
    private $InstitutionID;
    private $kp_User_name = "kuickpay";
    private $kp_Password = "payx";
    private $username;
    private $password;
    private $institute_code;
      private $is_generate_voucher;
      private $request;

    private $live = "https://app.kuickpay.com/KuickpayCoreAPI/API.asmx?WSDL";
    private $service;
    public function __construct()
    {
        $this->_CI = &get_instance();
        $this->settings = $this->_CI->paymentsetting_model->getActiveMethod();
        if(isset($this->settings->payment_type) and $this->settings->payment_type=='payu' and $this->settings->is_active=='yes'){
            $headers = apache_request_headers();
            $this->is_generate_voucher=true;
        }else{
            $this->is_generate_voucher=false;
        }

        if( $this->is_generate_voucher){
            ini_set("soap.wsdl_cache_enabled", 0);
            $this->service = new SoapClient($this->live);
          $this->institute_name = $this->_CI->setting_model->getSetting()->name;
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

    }

    public function getFunctions()
    {

        return $this->service->__getFunctions();


    }





    public function generateVoucher($id = 66)
    {
       
        if($this->is_generate_voucher){
  
        $student = $this->_CI->student_model->getByStudentSession($id);
        pr($student);
        $student_due_fee = $this->_CI->studentfeemaster_model->getStudentFees($id);
        $student_discount_fee = $this->_CI->feediscount_model->getStudentFeesDiscount($id);
   
        if (isset($student_due_fee)) {
            $fine = 0;
            $due_date = "";
            $feehead = array();
            $feehead_amount = array();
            $exp_date = array();
         
            foreach ($student_due_fee as $key => $fee) {
                if (isset($fee->fees) && count($fee->fees) > 0) {
                    foreach ($fee->fees as $keys => $student_fee) {
                        $fee_paid=0;
                        $fee_discount= $fee_fine=0;
                        if (!empty($student_fee->amount_detail)) {
                            $fee_deposits = json_decode(($student_fee->amount_detail));

                            foreach ($fee_deposits as $fee_deposits_key => $fee_deposits_value) {
                                pr($fee_deposits_value);
                                $fee_paid = $fee_paid + $fee_deposits_value->amount;
                                $fee_discount = $fee_discount + $fee_deposits_value->amount_discount;
                                $fee_fine = $fee_fine + $fee_deposits_value->amount_fine;
                            }
                        }

                        $student_fee->amount=$student_fee->amount-$fee_paid;
                        $myfee[$keys] = array(
                            "fee_head" => $student_fee->type,
                            "fee_amount" => $student_fee->amount,
                            "due_date" => $student_fee->due_date,
                            "fine" => $student_fee->fine_amount,
                        );

                    }
                }
            }
        }

        if ($myfee) {
 
            $amount = 0;
            $fine = 0;
            $counter = 1;
            $other_payment = 0;

            $head['userName'] = $this->kp_User_name;
            $head['password'] = $this->kp_Password;
            $head['InstitutionID'] = $this->institute_code;
            $head['RegistrationNumber'] = getSchoolID() . $student['id'];

            foreach ($myfee as $key => $fee) {
                $dateArray[] = $fee['due_date'];
                if ($counter < 10) {
                    isset($head["Head$counter"]) ? null : $head["Head$counter"] = substr($fee['fee_head'], 0, 20);
                    ;
                    isset($head["Amount$counter"]) ? null : $head["Amount$counter"] = $fee['fee_amount'];
                } else {
                    $other_payment = $other_payment + $fee['fee_amount'];
                }
                $fine = $fine + $fee['fine'];
                $amount = $amount + $fee['fee_amount'];
                $counter++;
            }
            //geting due date
            $timestampArray = array_map('strtotime', $dateArray);
            $maxTimestamp = max($timestampArray);
            $due_date = date("Y-m-d", $maxTimestamp);
            $month = date("m", $maxTimestamp);
            $year = date("Y", $maxTimestamp);
            $expiry_date = date("Y-m-d", strtotime('+3 days', $maxTimestamp));



            for ($i = 1; $i <= 9; $i++) {
                isset($head["Head$i"]) ? null : $head["Head$i"] = "";
                isset($head["Amount$i"]) ? null : $head["Amount$i"] = "0";
            }
            $head["Head10"] = !empty($others) ? "Others" : 'Others';
            $head["Amount10"] = $other_payment;
            $head['VoucherMonth'] = $month;
            $head['VoucherYear'] = $year;
            $head['IssueDate'] = date('Y-m-d');
            $head['DueDate'] = $due_date;
            $head['ExpiryDate'] = $expiry_date;
            $head['TotalAmount'] = $amount;
            $head['AmountAfterDueDate'] = $amount + $fine;


            $head['Name'] = strtoupper($student['firstname']. " " . $student['lastname']);
            $head['Mobile'] = str_replace("+92","0",$student['mobileno']);
            $head['Email'] = $student['email'];
            $head['Branch'] = getSchoolID().") ".$this->institute_name;
            ;

            pr($head);
         

            $response = $this->service->InsertVoucher($head);
            $voucherResult = $response->InsertVoucherResult;
            $res = (explode("-", $voucherResult));
           
            if($res[0]==00){
                pr($res);
            }else{
                pr($res);
                return false;
            }

        }
    }else{

        return false;
    }



    }
}