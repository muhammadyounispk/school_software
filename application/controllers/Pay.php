<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Pay extends CI_Controller
{

   

    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->setting_result = $this->setting_model->getSetting();
     
        $this->load->helpers('custom_helper');
       
        
    }

    public function fee($id)
    {
      
  
$html=$this->getGuide($id);
$path=create_pdf($html,$id.".pdf",false,['format'=>'A4']);



    }

    function getGuide($account_no=null){
        empty($account_no)? $account_no=' Your Account # ': $account_no="$account_no";
        $student=db::getRecord("select* from students where id=".getIDbyAccount($account_no));
      if(!$student){
       
        $student['lastname']='';
        $student['firstname']='';
        $student['admission_no']='';
      }
    
        $pdf='
        
        <body style="font-family: jameel  noori nastaleeq"> 
        
        <table style="border-bottom: solid; " width="100%" align="center">
            <tr>
                <td width="10%">   </td>
                <td><center><span style="font-size: 25px"> '.$this->setting_result->name.'<br>'.$student['firstname'].' '.$student['lastname'].'<br><small>'.$student['admission_no'].'</small> </span></center>
               <div style="font-size:10px">
        <barcode code="A34698735B" type="CODABAR" />
        <BR><center>Fee A/C: '.$account_no.'<br>
        
        </center>
        </div>
                <div style="font-size:15px">
               Pleaase read Following Details we have deeply explained how you can pay your Fee  ,<br> If you are faing issues in paying your Fee  kindly feel free to contact us at<br>
                <div style="font-size:10px">
                Helpline:<a href="tel:'.$this->setting_result->phone.'">'.$this->setting_result->phone.'</a>
                 Email:<a href="mailto:'.$this->setting_result->email.'">'.$this->setting_result->email.'</a><br>Address: '.$this->setting_result->address.'
                 </div> 
                </div>
        
               
               
               
              
        
          </b>
          </td>
        <td></td>
        
            </tr>
        </table>
        
        ';
        $pdf.='
              <div class="row">
              <div class="col-md-12">
                  <div class="panel-group" id="accordion">
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseABL">
                              Allied Bank</a>
                              </h4>
                          </div>
                          <div id="collapseABL" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://login.abl.com/" target="_blank">click here to login now</a>)<br />
                              2. Select Pay Bills<br />
                              3. Select KuickPay as Category and then Select relevant biller name. In case the biller is listed with KuickPay but not showing in myABL, select others as biller name.<br />
                              4. Enter <U> '.$account_no.' </u>  and click Validate<br />
                              5. Confirm details and Pay<br /><br />
        
                              <b>Mobile Banking:</b><br />
                              1. Login to myABL Mobile App<br />
                              2. Select Pay Bills<br />
                              3. Select KuickPay as Category and then Select relevant biller name. In case the biller is listed with KuickPay but not showing in myABL, select others as biller name.<br />
                              4. Enter <U> '.$account_no.' </u>  and click Validate<br />
                              5. Confirm details and Pay<br />                                      
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseBAB">
                              Al Baraka Bank</a>
                              </h4>
                          </div>
                          <div id="collapseBAB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ibanking.albaraka.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Payments/Bill Payments<br />
                              3. Select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. Confirm details and click Pay Now to Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payment/Bill Payments<br />
                              3. Select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. Confirm details and click Pay Now to Pay<br />
                              </div>
                          </div>
                      </div>
                    
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseASK">
                              Askari Bank</a>
                              </h4>
                          </div>
                          <div id="collapseASK" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://secure.askaribank.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Payments and then Select Other Payments<br />
                              3. Select E-Commerce as Billing Type and then Select Kuick Pay as company<br />
                              4. Enter Order No  and click Proceed<br />
                              5. Confirm details and Select Account or Credit Card as Payment Mode<br />
                              6. Generate and enter Financial Pin<br />
                              7. Click Proceed to pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Bill Payments and then Select Account from PAY FROM option<br />
                              3. Select E-Commerce as Company Type and then Select Kuick Pay as Bill Company<br />
                              4. Enter or Select <U> '.$account_no.' </u>  and click Next<br />
                              5. Confirm details and click Next<br />
                              6. Generate and enter Financial Pin<br />
                              7. Click Submit to pay<br />                            
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseBAH">
                              Bank AL Habib</a>
                              </h4>
                          </div>
                          <div id="collapseBAH" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://netbanking.bankalhabib.com" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payment<br /> 
                              3. Select Register Biller and then Select Add New Biller<br />
                              4. Select Kuickpay as Biller Group and then Select Kuickpay as Biller<br />
                              5. Enter <U> '.$account_no.' </u>  and click Submit to confirm details<br />
                              6. Enter Financial Pin to complete Biller Registration<br />
                              7. Select Pay Bill<br />
                              8. Select Kuickpay - Relevant Bill Nick Name from Registered Billers<br /> 
                              9. Confirm details and Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Bill Payment<br /> 
                              3. Select Register Biller and then Select Add New Biller<br />
                              4. Select Kuickpay as Biller Group and then Select Kuickpay as Biller<br />
                              5. Enter <U> '.$account_no.' </u>  and click Submit to confirm details<br />
                              6. Enter Financial Pin to complete Biller Registration<br />
                              7. Select Pay Bill<br />
                              8. Select Kuickpay - Relevant Bill Nick Name from Registered Billers<br /> 
                              9. Confirm details and Pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit Bank AL Habib ATM and insert your Bank AL Habib ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select Kuickpay as Biller<br />
                              4. Enter <U> '.$account_no.' </u>  and click Submit<br />
                              5. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div> 
                     
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseBAF">
                              Bank Alfalah</a>
                              </h4>
                          </div>
                          <div id="collapseBAF" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://netbanking.bankalfalah.com" target="_blank">click here to login now</a>)<br />
                              2. Select Services and then Select Payments<br />
                              3. Select Others and then Select Kuickpay as Company<br />
                              4. Select Other as Beneficiary then Enter <U> '.$account_no.' </u>  and click Fetch Details<br />
                              5. Confirm details and Select Account or Credit Card<br />
                              6. Click Pay Now to Pay<br /><br /> 
                              <b>Mobile Banking:</b><br />
                              1. Login to your Alfa Mobile Banking App<br />
                              2. Expend (V) (down arrow) and select payments<br />                                        
                              3. Enter <U> '.$account_no.' </u>  as Other and click Fetch Title<br />
                              4. Confirm details and click Pay Now<br />
                              5. Select Account, Credit Card or Wallet<br />
                              6. Click Pay Now to Pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit Bank Alfalah ATM and insert your Bank Alfalah ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select Kuickpay as Biller in Others or Education<br />
                              4. Enter <U> '.$account_no.' </u>  and click Submit<br />
                              5. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseBIP">
                              BankIslami</a>
                              </h4>
                          </div>
                          <div id="collapseBIP" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://i.bankislami.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payments and then Select Bills / Payments Management<br /> 
                              3. Click Add Bill / Payments<br />
                              4. Select Others as Bill / Payment Category and then Select Kuickpay as Bill / Payment Company<br />
                              5. Enter <U> '.$account_no.' </u>  and then Enter Referance Name (for your own memorization). Click Next to confirm details<br />
                              6. Enter OTP and click Confirm to complete Bill Registration<br />
                              7. Select Pay Bills / Make Payments under Bill Payments<br />
                              8. Select Others as Bill / Payment Category and then Select Kuickpay as Bill / Payment Company<br />
                              9. Select Account and then Select Kuickpay - Referance Name from Beneficiary<br /> 
                              10. Click Next to Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments and then Select Bills<br /> 
                              3. Click (+) to Add Bill<br />    
                              4. Select Others as Bill Type and then Select Kuickpay as Company Type<br />
                              5. Enter <U> '.$account_no.' </u>  and click Confirm<br />
                              6. Enter Referance Name (for your own memorization) and then Enter OTP. Click Confirm<br />
                              7. Select Kuickpay - Relevant Bill Nick Name from Billing List<br /> 
                              8. Confirm details and Pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit BankIslami ATM and insert your BankIslami ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select Others and then Select Kuickpay<br />
                              4. Select Unregistered if paying for a new bill or Select Registered if the bill is previously registered, added or paid<br />
                              5. Enter <U> '.$account_no.' </u>  and click Continue<br />
                              6. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                    
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseBOP">
                              Bank of Punjab (BOP)</a>
                              </h4>
                          </div>
                          <div id="collapseBOP" style="font-size:10px">
                              <div class="panel-body">
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Bill Payments<br /> 
                              3. Click Add Bill Payee<br />    
                              4. Select Others as Payment Type, Select Others as Category, and then Select kuickpay as Company<br />
                              5. Enter <U> '.$account_no.' </u>  and click Next<br />
                              6. Confirm details and click Confirm<br />
                              7. Click OK to complete Add Bill Payee process<br />
                              8. Click on Bill Payment while staying on Bill Payments option<br />
                              9. Select your newly added Bill under Bill Payees<br />
                              10. Select Account and click Next<br />
                              11. Confirm details and click Confirm to Pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit BOP ATM and insert your BOP ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select Others and then Select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u> <br />
                              5. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseDIB">
                              Dubai Islamic Bank (DIB)</a>
                              </h4>
                          </div>
                          <div id="collapseDIB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ebank.dibpak.com/ebank" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payment<br /> 
                              3. Select Utility as Service Type, Select KPay as Service<br />
                              4. Select One Time Payment if paying for a new bill or Select Bill from Registered Bill if the bill is previously registered, added or paid<br />
                              5. Enter (for One Time Payment) or Select (for Bill from Registered Bill) <U> '.$account_no.' </u>  and click Get Bill<br />                                        
                              6. Confirm details and Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Bill Payment<br /> 
                              3. Select Utility as Service Type, Select KPay as Service<br />
                              4. Select One Time Payment if paying for a new bill or Select Bill from Registered Bill if the bill is previously registered, added or paid<br />
                              5. Enter (for One Time Payment) or Select (for Bill from Registered Bill) <U> '.$account_no.' </u>  and click Get Bill<br />                                        
                              6. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div> 
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseTMF">
                              EasyPaisa App</a>
                              </h4>
                          </div>
                          <div id="collapseTMF" style="font-size:10px">
                              <div class="panel-body">
                              <b>Mobile App:</b><br />
                              1. Login to your EasyPaisa Mobile App<br />
                              2. Select more<br /> 
                              3. Select Others under Bill Payment<br />    
                              4. Select KuickPay<br />
                              5. Enter <U> '.$account_no.' </u>  and click Next<br />
                              6. Confirm details and Pay<br /><br />
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseFBL">
                              Faysal Bank</a>
                              </h4>
                          </div>
                          <div id="collapseFBL" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://digi.faysalbank.com" target="_blank">click here to login now</a>)<br />
                              2. Select Payments and then Select Bill Payments<br />
                              3. Select Kuickpay as Category/Company<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. Confirm details and click Pay Now to Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments and then Select Bill Payments<br />
                              3. Select Kuickpay as Category/Company<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. Confirm details and click Pay Now to Pay<br />
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseFWB">
                              First Women Bank</a>
                              </h4>
                          </div>
                          <div id="collapseFWB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ibanking.fwbl.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payments<br />
                              3. Select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                  
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseHMB">
                              HabibMetro Bank (HMB)</a>
                              </h4>
                          </div>
                          <div id="collapseHMB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ib.habibmetro.com" target="_blank">click here to login now</a>)<br />
                              2. Select Online Payments/Bill Payments and then Select Utility/Others<br />
                              3. Select Educational Fee as Utility Type and then Select Kuick Pay as Utility Name<br />
                              4. Enter <U> '.$account_no.' </u>  and click Proceed<br />
                              5. Confirm details, Get and Enter Verification Code<br />
                              6. Click Proceed to pay<br /><br />                                        
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments & Transfers and then Select Payment<br />
                              3. Select Payment to Non-Beneficiary<br />
                              4. Select Educational Fee<br />
                              5. Select Kuick Pay as Company Name under Billing List<br />
                              6. Enter <U> '.$account_no.' </u>  and click Confirm<br />
                              7. Confirm details, if asked, Generate and Enter Verification Code/OTP<br />
                              8. Click Confirm and proceed to pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit HMB ATM and insert your HMB ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select Educational Fee/Others and then Select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u> <br />
                              5. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseHBL">
                              HBL</a>
                              </h4>
                          </div>
                          <div id="collapseHBL" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://www.hblibank.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Pay and then Select Add New Option<br />
                              3. Select KuickPay and then Select KuickPay<br />
                              4. Enter <U> '.$account_no.' </u>  and click Next<br />
                              5. Confirm details and then click Next<br />
                              6. Enter One Time Password and then enter Transaction Password<br /> 
                              7. Click Pay<br /><br />                                        
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select More<br />
                              3. Select KuickPay under Payments<br />
                              4. Click on (+) and then select KuickPay as Company<br />
                              5. Enter <U> '.$account_no.' </u>  and click Next<br />
                              6. Confirm Details and then click Next<br />
                              7. Enter One Time Password (OTP) and click Next to Pay<br />                                        
                              </div>
                          </div>
                      </div>
                     
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseWAS">
                              JazzCash App</a>
                              </h4>
                          </div>
                          <div id="collapseWAS" style="font-size:10px">
                              <div class="panel-body">
                              <b>Mobile App:</b><br />
                              1. Login to your JazzCash Mobile App<br />
                              2. Select corporate payments<br />
                              3. Select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. Enter MPIN and Proceed to pay<br />                                        
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseJSB">
                              JS Bank</a>
                              </h4>
                          </div>
                          <div id="collapseJSB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ib.jsbl.com" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payment and then Select Bill Registration<br />
                              3. Select Service Type as DIGITALPAYMETS and then Select Service as KUICKPAY<br />
                              4. Enter <U> '.$account_no.' </u>  and then enter Consumer Nick as per your convenience<br />
                              5. Generate and Enter email/mobile Tokens and Click Register<br />
                              6. Locate your newly Added Bill in the Registered Services list and Click on Pay Now<br />
                              7. Review your transaction details, Enter your Financial PIN and Click Confirm to Pay<br /><br />                                        
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Pay and then Select Corporate Payments<br />
                              3. Click on Add Payee then Select KUICKPAY as company<br />
                              4. Enter <U> '.$account_no.' </u>  and then enter Consumer Nick as per your convenience<br />
                              5. Generate and Enter email/mobile Tokens and Click Register<br />
                              6. Locate your newly Added Bill and proceed for Payment<br />
                              7. Review your transaction details, if asked, Enter your Financial PIN and proceed to Pay<br />
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseWEM">
                              Keenu App</a>
                              </h4>
                          </div>
                          <div id="collapseWEM" style="font-size:10px">
                              <div class="panel-body">
                              <b>Mobile App:</b><br />
                              1. Login to your Keenu Mobile App<br />
                              2. Select Mobile & Bill Payment<br />
                              3. Click (+) and then Click Add a Bill<br />
                              4. Select Digital Vouchers as Bill Type and then Select KuickPay as Company<br />
                              5. Enter <U> '.$account_no.' </u>  and then Enter Short Name as per your convenience<br />
                              6. Click Next and Enter One Time Password<br />
                              7. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div> <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseMCB">
                              MCB bank</a>
                              </h4>
                          </div>
                          <div id="collapseMCB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://online.mcb.com.pk/T001/channel.jsp" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payment<br /> 
                              3. Select Register Biller and then Click Add New Biller<br />
                              4. Select Customer and then Select Innovarge(Kuick Pay) as Biller<br />
                              5. Enter <U> '.$account_no.' </u>  and then Enter Nick Name as per your convenience<br />
                              6. Click Submit and then Click Confirm<br />
                              7. Enter Transaction Pin and then Click Submit<br />
                              8. Click OK to complete Biller Registration<br />
                              9. Select Pay Bill<br />
                              10. Select Customer and then Select your newly added KuickPay Bill as Biller, Select Account and then Click Submit<br />
                              11. Verify details and then Click Confirm to Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments and then Select Utility Bill Payment<br /> 
                              3. Select Add Beneficiary for new Bill or skip to step 9 for Payment of existing bill<br />
                              4. Select Utility Bill Payment under Add Payment Beneficiary<br />
                              5. Select KuickPay from the list<br />
                              6. Enter <U> '.$account_no.' </u>  and then Enter Beneficiary\'s Name as per your convenience. Click Submit<br />
                              7. Confirm Details and then Click Submit<br />
                              8. Enter OTP and then Click Submit to complete Add Payments Beneficiary process<br />
                              9. Select Payments from Main Menu then Select your newly added KuickPay bill, Click Next<br />
                              10. Verify details and Click Submit to Pay<br />
                              </div>
                          </div>
                      </div>
                     
                      
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseMIB">
                              MCB Islamic Bank</a>
                              </h4>
                          </div>
                          <div id="collapseMIB" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://online.mcbislamicbank.com/mib" target="_blank">click here to login now</a>)<br />
                              2. Select Payments and then Select Add Payee<br />
                              3. Select Utility as Payee Type and then Select KuickPay as Payee Name<br /> 
                              4. Enter <U> '.$account_no.' </u>  and complete the Bill Registration process<br />
                              5. Select Pay Bill and then Select your newly added KuickPay bill, Click Pay Now<br />
                              6. Verify details and Click Confirm to Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments and then Select Add Payee<br />
                              3. Select Utility as Payee Type and then Select KuickPay as Payee Name<br /> 
                              4. Enter <U> '.$account_no.' </u>  and complete the Bill Registration process<br />
                              5. Select Pay Bill and then Select your newly added KuickPay bill, Click Pay Now<br />
                              6. Verify details and Click Confirm to Pay<br />
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseNBP">
                          National Bank of Pakistan (NBP)</a>
                          </h4>
                      </div>
                      <div id="collapseNBP" style="font-size:10px">
                          <div class="panel-body">
                          <b>Mobile Banking:</b><br />
                          1. Login to your Mobile Banking App<br />
                          2. Select Payments<br /> 
                          3. Search and Select kuickpay as Biller/Company. (If asked, Register Bill)<br />
                          4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                          5. If asked, Enter PIN/OTP<br />
                          6. Confirm details and Pay<br />
                          </div>
                      </div>
                  </div>
                  <div class="panel panel-default">
                      <div class="panel-heading">
                          <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseNRS">
                          NRSP Bank</a>
                          </h4>
                      </div>
                      <div id="collapseNRS" style="font-size:10px">
                          <div class="panel-body">
                          <b>Internet Banking:</b><br />
                          1. Login to your Internet Banking (<a href="https://connect.nrspbank.com" target="_blank">click here to login now</a>)<br />
                          2. Select Payments/Bill Payments<br />
                          3. Search and Select kuickpay as Biller/Company. (If asked, Register Bill)<br />
                          4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                          5. If asked, Enter PIN/OTP<br />
                          6. Confirm details and Pay<br />
                          </div>
                      </div>
                  </div>
        
                  <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseMBL">
                              Meezan Bank</a>
                              </h4>
                          </div>
                          <div id="collapseMBL" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ebanking.meezanbank.com" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payments and then Select Add Bills & Mobile No<br />
                              3. Select KUICKPAY<br />
                              4. Enter <U> '.$account_no.' </u>  and then Enter nickname as per your convenience, Click Next<br />
                              5. Enter Passcode and then Click Next<br />
                              6. Click Pay Now on Bill Registration Confirmation screen<br />
                              7. Confirm details and Click Next<br />
                              8. Click Pay on Confirmation screen<br /><br />                                             
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Bills & Top up and then Select Add Bills & Mobile Number<br />
                              3. Select KUICKPAY<br />
                              4. Enter <U> '.$account_no.' </u>  and then Click Next<br />
                              5. Enter Nickname as per your convenience and then Click Add<br />
                              6. Click Pay Now on Bill Registration Confirmation screen<br />
                              7. Select your newly added KuickPay bill<br />
                              8. Verify details and Click Confirm to Pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit Meezan Bank ATM and insert your Meezan Bank ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select Others/Education and then Select Kuickpay<br />
                              4. Select NO if paying for a new bill or Select YES if the bill is previously registered, added or paid<br />
                              5. Enter <U> '.$account_no.' </u>  and click OK<br />
                              6. Confirm details and Click Continue to Pay<br />
                              </div>
                          </div>
                      </div>
                      
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseSAM">
                              SAMBA Bank</a>
                              </h4>
                          </div>
                          <div id="collapseSAM" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://digitalbanking.samba.com.pk/sambaclick" target="_blank">click here to login now</a>)<br />
                              2. Select Payments/Bill Payments<br />
                              3. Search and Select kuickpay as Biller/Company. (If asked, Register/Add Bill)<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. If asked, Enter PIN/OTP<br />
                              6. Confirm details and Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments/Bill Payments<br />
                              3. Search and Select kuickpay as Biller/Company. (If asked, Register/Add Bill)<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. If asked, Enter PIN/OTP<br />
                              6. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseSLK">
                              SilkBank</a>
                              </h4>
                          </div>
                         
                          <div id="collapseSLK" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://www.silkbankdirect.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payment<br />
                              3. Search and Select kuickpay as Billing Type<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. If asked, Generate/Enter PIN/OTP<br />
                              6. Confirm details and Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Bill Payments and then select Bill Payment<br />
                              3. Select kuickpay as Bill Type<br />
                              4. Select New <U> '.$account_no.' </u> and Enter <U> '.$account_no.' </u> <br />
                              5. Enter Beneficiary Name and Click Next<br />
                              6. Confirm details, Select Account or Credit Card as Payment Method<br />
                              7. Generate and Enter PIN<br />
                              8. Proceed to Pay<br />
                              </div>
                          </div>
                      </div>
                    
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseSBL">
                              Soneri Bank</a>
                              </h4>
                          </div>
                          <div id="collapseSBL" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://www.soneribankonline.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Payments/Bill Payments and Select Add Bill/Payee<br />
                              3. Select Utility as Bill Payee Type and then Select KuickPay as Bill Payee Name<br />
                              4. Enter <U> '.$account_no.' </u>  and fetch details<br />
                              5. If asked, Enter PIN/OTP<br />
                              6. Confirm details and Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments/Bill Payments and Select Add Bill/Payee<br />
                              3. Select Utility as Bill Payee Type and then Select KuickPay as Bill Payee Name<br />
                              4. Enter <U> '.$account_no.' </u>  and Click Next<br />
                              5. If asked, Enter PIN/OTP<br />
                              6. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div> 
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseSUM">
                              Summit Bank</a>
                              </h4>
                          </div>
                          <div id="collapseSUM" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet Banking:</b><br />
                              1. Login to your Internet Banking (<a href="https://ib.summitbank.com.pk" target="_blank">click here to login now</a>)<br />
                              2. Select Bill Payments<br />
                              3. Select KUICKPAY as Utility Type and then Select KUICKPAY as Company. (If asked, Register/Add Bill)<br />
                              4. Enter <U> '.$account_no.' </u>  and Click Get Bill<br />
                              5. If asked, Enter PIN/OTP<br />
                              6. Confirm details and Pay<br /><br />                                        
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments & Transfers and then Select Payment<br />
                              3. Select Payment to Non-Beneficiary<br />
                              4. Select KUICKPAY<br />
                              5. Select KUICKPAY as Company Name under Bill Information<br />
                              6. Enter Voucher/Token Number  and click Confirm<br />
                              7. Confirm details, if asked, Generate and Enter Verification Code/OTP<br />
                              8. Click Confirm and proceed to pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit Summit Bank ATM and insert your Summit Bank ATM Card<br />
                              2. Select Bill Payment<br /> 
                              3. Select KUICKPAY as Billing Company Categerory<br />
                              4. Select your Institution/Company from the list or Select KUICKPAY if your Institution/Company is not listed<br />
                              5. Enter <U> '.$account_no.' </u> <br />
                              6. Confirm details and Pay<br />
                              </div>
                          </div>
                      </div>
                      
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordion" href="#collapseUBL">
                              UBL</a>
                              </h4>
                          </div>
                          <div id="collapseUBL" style="font-size:10px">
                              <div class="panel-body">
                              <b>Internet/Net  Banking:</b><br />
                              1. Login to your Internet/Net Banking (<a href="https://www.ubldigital.com" target="_blank">click here to login now</a>)<br />
                              2. Select My Payments and then Select Business Payments<br />
                              3. Search KuickPay under Other Payments and Click Pay<br />
                              4. Enter Consumer #  and Click Display Detail<br />
                              5. Confirm details and Click Pay<br />
                              6. Enter One Time Password (OTP) and Click Confirm to Pay<br /><br />
                              <b>Mobile Banking:</b><br />
                              1. Login to your Mobile Banking App<br />
                              2. Select Payments and then Select Government & Online Payments<br />
                              3. Select Online payments and then select Kuickpay<br />
                              4. Enter <U> '.$account_no.' </u>  and click Review<br />
                              5. Confirm details, if asked, Enter OTP<br />
                              6. Click Pay<br /><br />
                              <b>ATM:</b><br />
                              1. Visit UBL ATM and insert your UBL ATM Card<br />
                              2. Select Bill Payments and then Select Others<br /> 
                              3. Select KUICKPAY<br />
                              4. Click New Bill<br />
                              5. Enter <U> '.$account_no.' </u>  and Click Yes to Continue<br />
                              6. Confirm details and Click Pay<br />                                        
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionSCB" href="#collapseSCB">
                              Standard Chartered Bank (SCB)</a>
                              </h4>
                          </div>
                          <div id="collapseSCB" style="font-size:10px">
                              <div class="panel-body">
                             <b>ATM:</b><br />
                              1. Visit Standard Chartered Bank ATM and insert your Standard Chartered Bank ATM Card<br />
                              2. Select Utility Bill Payment<br />
                              4. Select Kuickpay <br />
                              5. Enter <U> '.$account_no.' </u>  and click Submit<br />
                              6. Confirm details and Pay<br />
                              <br />                                                                         
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div> 
          <div class="row">
              <div class="col-md-12">
                  <h5>Over the Counter (OTC) Partners (Select the partner to see its process)</h5>                
              </div>
          </div>
          <div class="row">
              <div class="col-md-12">
                  <div class="panel-group" id="accordionOTC">
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseTCSOTC">
                              TCS</a>
                              </h4>
                          </div>
                          <div id="collapseTCSOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>TCS Express Centers:</b><br />
                              1. Visit the nearest TCS Express Center<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay payment reference number <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                                                                         
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseMBLOTC">
                              Meezan Bank</a>
                              </h4>
                          </div>
                          <div id="collapseMBLOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>Meezan Bank Branches:</b><br />
                              1. Visit the nearest Meezan Bank Branch<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay Reference/<U> '.$account_no.' </u> <br />
                              4. If asked, please fill the deposit slip with <U> '.$account_no.' </u> <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                              
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseHMBOTC">
                              HabibMetro Bank</a>
                              </h4>
                          </div>
                          <div id="collapseHMBOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>HabibMetro Bank Branches:</b><br />
                              1. Visit the nearest HabibMetro Bank Branch<br />
                              2. Inform the representative that you want to pay with kuickpay (under Education)<br />
                              3. Show Bill/SMS with kuickpay Reference/<U> '.$account_no.' </u> <br />
                              4. If asked, please fill the deposit slip with <U> '.$account_no.' </u> <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                              
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseBABOTC">
                              Al Baraka Bank</a>
                              </h4>
                          </div>
                          <div id="collapseBABOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>Al Baraka Bank Branches:</b><br />
                              1. Visit the nearest Al Baraka Bank Branch<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay Reference/<U> '.$account_no.' </u> <br />
                              4. If asked, please fill the deposit slip with <U> '.$account_no.' </u> <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                              
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseNRSPOTC">
                              NRSP Bank</a>
                              </h4>
                          </div>
                          <div id="collapseNRSPOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>NRSP Bank Branches:</b><br />
                              1. Visit the nearest NRSP Bank Branch<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay Reference/<U> '.$account_no.' </u> <br />
                              4. If asked, please fill the deposit slip with <U> '.$account_no.' </u> <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                              
                              </div>
                          </div>
                      </div>
                      <div style="page-break-after:always"></div> 
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseUBLOTC">
                              UBL Omni</a>
                              </h4>
                          </div>
                          <div id="collapseUBLOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>UBL Omni Agents:</b><br />
                              1. Visit the nearest UBL Omni Agent<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay payment reference number <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                                                                         
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseEPOTC">
                              EasyPaisa</a>
                              </h4>
                          </div>
                          <div id="collapseEPOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>EasyPaisa Agents:</b><br />
                              1. Visit the nearest EasyPaisa Agent<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay payment reference number <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                                                                         
                              </div>
                          </div>
                      </div>
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#accordionOTC" href="#collapseJazzCashOTC">
                              JazzCash</a>
                              </h4>
                          </div>
                          <div id="collapseJazzCashOTC" style="font-size:10px">
                              <div class="panel-body">
                              <b>JazzCash Agents:</b><br />
                              1. Visit the nearest JazzCash Agent<br />
                              2. Inform the representative that you want to pay with kuickpay<br />
                              3. Show Bill/SMS with kuickpay payment reference number <br />
                              4. Give cash as requested by the representative<br />
                              5. Confirm the payment<br />                                                                         
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
        </div>
        
        ';
        return $pdf;
        }
    }


      
   

  


        
    