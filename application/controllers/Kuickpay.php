<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Kuickpay extends Public_Controller
{


    public function __construct()
    {

        parent::__construct();
        define('DEBUG', false);
        error_reporting(E_ALL);
        ini_set('display_errors', DEBUG ? 'On' : 'Off');
        define('COMPANY_CODE', '03800');
        define('COMPANY_NAME', 'PANWAR UNION IT CENTER');
        define('COMPANY_USERNAME', 'PANWARITADMIN');
        define('COMPANY_PASSWORD', 'Admin@123');

        $this->load->helper('custom_helper');
        $this->body = json_decode(file_get_contents('php://input'));
        $this->headers = apache_request_headers();






        //SECURE THE API
        if (isset($this->headers['username'])) {
            if (!($this->headers['username'] == COMPANY_USERNAME
                && $this->headers['password'] == COMPANY_PASSWORD)) {
                echo $this->UnAuthorizedAccess();
                die;
            }
        } else {
            echo $this->UnAuthorizedAccess();
            die;
        }

        //SECURED WAY


    }







    public function BillInquiry()
    {

        switch ($this->getCase()) {
            case '01':
                //DIGIS School Billing
                 $student = $this->getStudentFeeforOnlinePayment($this->CustomerID());
             


                if ($student) {
                    KuickPayLog($student['school_id'], $this->CustomerID(), 'BillInquiry', $this->body->bank_mnemonic);
                    $title = $student['firstname'] . ' ' . $student['lastname'];
                    $amount_before = $student['payable_before'];
                    $amount_after = $student['payable_after'];
                    $due_date = $student['due_date']; 
                    $due_date = date('Ymd', strtotime($student['due_date']));
                
                    if ($amount_before > 0) {
                        echo $this->preparePay($title, $amount_before, $amount_after, $due_date);
                    } else {
                        echo $this->alreadyPaid();
                    }
                } else {
                    echo $this->incorrectID();
                }



                break;

            case '02':

                $bill =SoftwareBilling($this->CustomerID());
                $school_id=$this->CustomerID();
                $school_name=db::getCell("select name from sch_settings where id=$school_id");
               
                $tr=$bill['tr'];
               



                


                if (!$bill['tr']) { 
                    $title = $school_name;
                    $amount_before = 1; // $bill['price'];
                    $amount_after = 1; //$bill['price'];  
                    $due_date = date('Y-m-d');
                    $due_date = date('Ymd');
                    if ($amount_before > 0) {
                        echo $this->preparePay($title, $amount_before, $amount_after, $due_date);
                    } else {
                        echo $this->alreadyPaid($school_name);
                    }
                } else {
                    echo $this->alreadyPaid($school_name);
                }


                


                break;

            case '00':
                

                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => 'https://system.panwarunion.eu.org/api/public/kuickpay/'.$this->CustomerID() ,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'POST',
                    CURLOPT_POSTFIELDS => '',
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json',
                        'Cookie: PHPSESSID=3bc49ceb1a8eb8c0c1874acb1f8cb845'
                    ),
                ));

                 $response = curl_exec($curl);

                curl_close($curl);

                $bill = json_decode($response, true);

                if ($bill) {
                    $title = $bill['title'];
                    $amount_before = $bill['payable'];
                    $amount_after = $bill['payable'];
                    $due_date = $bill['due_date'];
                    $due_date = date('Ymd', strtotime($bill['due_date']));
                    if ($amount_before > 0) {
                        echo $this->preparePay($title, $amount_before, $amount_after, $due_date);
                    } else {
                        echo $this->alreadyPaid();
                    }
                } else {
                    echo $this->alreadyPaid();
                }

                break;

            default:
                echo $this->incorrectID();
                break;
        }
    }

    //callback when payment successs
    public function BillPayment()
    {

        switch ($this->getCallBackCase()) {
            case '01':
                $payment_from="1-LINK";
                $student = $this->getStudentFeeforOnlinePayment($this->CallBackCustomerID());
                $student_id=$student['id'];
               $total= $deposit=  $amount_before = $student['payable_before'];
               $school_id=$student['school_id'];
               $date = date("d F Y h:i:s a");
                if ($amount_before > 0) {
                    KuickPayLog($student['school_id'], $this->CallBackCustomerID(), 'BillPayment', $this->body->bankMnemonic, $this->body->authId, $this->body->amount);

               
                    $student = db::getRecord("SELECT* from students WHERE id=$student_id");
                    $student_accouunt = getFeeAccount($student_id);
                    
                
                    $activated_fee = db::getRecords("SELECT * FROM `students_fee` where  student_id='{$student_id}' ");
                    $meta = json_encode($activated_fee);
                    $deposit_to=27;
                    $system = getSystemAccounts();
                    $fee_month=date("F-Y");
                    $system_arr = array_column($system, 'title', 'id');
                    $system_ac = $system_arr[$deposit_to];
                    $narration = "An amount PKR $deposit SENT to Institute against [{$student['firstname']} {$student['lastname']}] FEE-COLLECTION~$fee_month via [{$this->body->bankMnemonic}]-[{$this->body->authId}]  at  $date via  $payment_from ";
                    $date=date("d/m/Y h:i:s a");
                        //cr
                        makeTransactionBySchoolID($school_id,$student_accouunt, $deposit, "AMOUNT PKR $deposit has been RECEIVED from INSTITUTE via [{$this->body->bankMnemonic}]-[{$this->body->authId}]  OVER $payment_from AGAINST FEE-DEPOSIT~$fee_month on $date   ", $payment_from);
                        $already_paid=db::getCell("SELECT id from transactions where student_id={$student['id']} and month='".date("m")."' and year='".date("Y")."' ");
                       if( $already_paid){

                           die;
                       } 

                    $opening_balance = getOpeningBalanceBYSchoolID($school_id,$student_accouunt);
                    $opening_balance = $opening_balance > 0 ? $opening_balance : 0;
                    $deposit = -$deposit;
                    $closing = $opening_balance + $deposit;
                    $arrear = $total + $deposit;
                  

                     


                    $transaction = array(
                        'school_id' => $student['school_id'],
                        'user_id' => '',
                        'account' => getFeeAccount($student_id),
                        'student_id' => $student_id,
                        'narration' => $narration,
                        'opening_balance' => $opening_balance,
                        'amount' => $deposit,
                        'total' => $total,
                        'type' => 2,
                        'closing_balance' => $closing,
                        'meta' => $meta,
                        'transit' => getInstAccountBySchoolID($deposit_to,$student['school_id']),
                        'month' => date("m"),
                        'year' => date("Y"),
                        'balance' => $total + $deposit,
                        'arrears' => $student['arrears'],
                        'payment_from' => $payment_from,  'date' => date('Y-m-d'),  'trasaction_at' => date('Y-m-d H:i:s')
                    );
                      //SMS & Whatsapp
                   
                      
                    $sql = db::prepInsertQuery($transaction, 'transactions');
                    $id = db::insertRecord($sql);
                    if ($id) {
                        //Credit
                        $deposit = -$deposit;
                        $st_account = getFeeAccount($student_id);
                        $date = date("d F Y h:i:s a");
                        makeTransactionBySchoolID($school_id,getInstAccountBySchoolID($deposit_to,$student['school_id']), $deposit, "AMOUNT PKR $deposit has been RECEIVED  via [{$this->body->bankMnemonic}]-[{$this->body->authId}]  from {$student['firstname']} A/C:  $st_account AGAINST FEE-DEPOSIT~$fee_month on $date   ", $payment_from);
                    } 
                    db::query("UPDATE students set arrears=$arrear where id=$student_id");

                   

                    $arrayVar = [

                        'Response_Code' => '00',
                        'Identification_Parameter' => $student['firstname'] . ' ' . $student['lastname'],
                        'Reserved' => $student['mobileno'] . '|' . $student['email'],

                    ];
                } else {
                    $arrayVar = [

                        'Response_Code' => '02',
                        'Identification_Parameter' => "",
                        'Reserved' => "",

                    ];
                }

                echo json_encode($arrayVar);

                break;
            case "02":
               
                $school_id=$this->CallBackCustomerID();
                $bill =SoftwareBilling($school_id);

                
                $school_name=db::getCell("select name from sch_settings where id=$school_id");
                
                if($bill['tr']){
                    echo $this->alreadyPaid($school_name);
                    die;
                }

 
                
                $deposit=$bill['price'];
                $date = date("d F Y h:i:s a");
                makeTransactionBySchoolID($school_id,getInstAccountBySchoolID(25,$school_id), $deposit, "AMOUNT PKR $deposit has been Credit   via [{$this->body->bankMnemonic}]-[{$this->body->authId}]   on $date   ","INSTITUTE-BILL");
                makeTransactionBySchoolID($school_id,getInstAccountBySchoolID(25,$school_id), -$deposit, "AMOUNT PKR $deposit has been Withdrawn by DIGIS-SCHOOL SOFTWARE CHARGES   via [{$this->body->bankMnemonic}]-[{$this->body->authId}]   on $date   ","INSTITUTE-BILL");
             
                $sql="update sch_settings set payment_issue=0 , valid_from='{$bill['from_extend']}',valid_till='{$bill['to_extend']}'  where id=$school_id";
                pr($sql);
                db::query($sql);

                break;
                case "00":
                    
                
                    $bank_name=$this->body->bankMnemonic;
                    $transaction_id=$this->body->authId;
                      
                   
                   
                    $curl = curl_init();
                    
                    curl_setopt_array($curl, array(
                    CURLOPT_URL =>"https://system.panwarunion.eu.org/api/public/kuickpay/deposit?key=kuickpaynow&bank_name=$bank_name&transaction_id=$transaction_id&phone=". $this->CallBackCustomerID(),
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'GET',
                    CURLOPT_POSTFIELDS => '',
                    CURLOPT_HTTPHEADER => array(
                        'Content-Type: application/json',
                        'Cookie: PHPSESSID=3bc49ceb1a8eb8c0c1874acb1f8cb845'
                    ),
                ));

              echo $res= curl_exec($curl);
               
                    break;
        }
    }




    public function KuickpayBillers()
    {

        echo json_encode(
            array(
                'Response_Code' => '00',
                'Institutions' =>
                array(
                    0 =>
                    array(
                        'InstitutionID' => COMPANY_CODE,
                        'InstitutionName' => COMPANY_NAME,
                        'Category' => ' Education',
                        'LogoURL' => 'https://apis.isdigitalschools.com/uploads/school_content/admin_small_logo/23.png',
                        'IsTopUp' => True,
                    ),
                ),
            )
        );
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
    }







    public function AN14($amount)
    {
        $amount = $amount . ".00";
        $minorUnits = number_format($amount * 100, 0, '', ''); // Convert to minor units
        $formattedAmount = str_pad($minorUnits, 13, '0', STR_PAD_LEFT); // Left-pad with zeros
        return $formattedAmount; // Add trailing zero



    }

    function getCase()
    {
        return $this->body->consumer_number[5] . $this->body->consumer_number[6];
    }
    function CustomerID()
    {
        return str_replace(COMPANY_CODE . $this->getCase(), '', $this->body->consumer_number);
    }
    function getCallBackCase()
    {
        return $this->body->consumerNumber[5] . $this->body->consumerNumber[6];
    }
    function CallBackCustomerID()
    {
        return str_replace(COMPANY_CODE . $this->getCallBackCase(), '', $this->body->consumerNumber);
    }

    function incorrectID()
    {

        $arrayVar = [
            "Response_Code" => "01",
            "Consumer_Detail" => "SAMPLE",
            "Bill_status" => "U",
            "Due_Date" => "20231031",
            "Amount_Within_DueDate" => "+" . $this->AN14(500),
            "Amount_After_DueDate" => "+" . $this->AN14(500),
            "Billing_Month" => "2310",
            "Date_Paid" => "",
            "Amount_Paid" => "",
            "Tran_Auth_Id" => "",
            "Reserved" => "",
        ];
        return  json_encode($arrayVar);
    }
    function UnAuthorizedAccess()
    {

        $arrayVar = [
            "Response_Code" => "201",
            "Message" => "KUICKPAY USERNAME OR PASSWORD INCORRECT",

        ];
        return  json_encode($arrayVar);
    }
    function alreadyPaid($name='',$amount='')
    {

        $arrayVar = [
            "Response_Code" => "00",
            "Consumer_Detail" => $name,
            "Bill_status" => "P",
            "Due_Date" => date("Ymd"),
            "Amount_Within_DueDate" => "+" . $this->AN14($amount),
            "Amount_After_DueDate" => "+" . $this->AN14($amount),
            "Billing_Month" => "2310",
            "Date_Paid" => "",
            "Amount_Paid" => "",
            "Tran_Auth_Id" => "",
            "Reserved" => "",
        ];
        return  json_encode($arrayVar);
    }

    function preparePay($mytitle = "MUHAMMAD YOUNIS", $amount_before = 1, $amount_after = 1, $due_date = "", $bill_month = "")
    {

      

        if(empty($bill_month)){ 
            $bill_month = date("ym");
         }
        if(empty($due_date)){ 
            $due_date = date("Ymd");
         }
 
        $arrayVar = [
            "Response_Code" => "00",
            "Consumer_Detail" => $mytitle,
            "Bill_status" => "U",
            "Due_Date" => $due_date,
            "Amount_Within_DueDate" => "+" . $this->AN14($amount_before),
            "Amount_After_DueDate" => "+" . $this->AN14($amount_after),
            "Billing_Month" => $bill_month,
            "Date_Paid" => "",
            "Amount_Paid" => "",
            "Tran_Auth_Id" => "",
            "Reserved" => "",
        ];
        return  json_encode($arrayVar);
    }


    function log($file_name = 'KuickPay')
    {
        file_put_contents(UPLOAD_DIR . '/digis/' . $file_name . '.txt', file_get_contents('php://input') . '/n' . json_encode($_SERVER));
    }


    function DeductOnlineAmount()  {
        extract($this->input->post());
        if($deposit and $school_id){
        $deposit_to=27;
        $date=date("d F Y h:i:s");
        makeTransactionBySchoolID($school_id,getInstAccountBySchoolID($deposit_to,$school_id), -$deposit, "AMOUNT PKR $deposit has been has been withdrawal  on $date  Remarks [$remarks]  Through ADMIN PANEL", "ADMIN-PANEL");
      echo json_encode(array("code"=>200,'message'=>"Withdrawal has done"));
    }
        
    }
}
