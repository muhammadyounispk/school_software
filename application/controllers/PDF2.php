<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

   

class PDF extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        ini_set('memory_limit', '-1');
        $this->school = $this->setting_model->getSetting();
        $this->debug=$this->input->get('debug');
        $this->html="";
        $this->is_paid=true;
        $this->url=base_url();
        $this->schoo_logo=base_url()."uploads/school_content/logo/";
        $this->icon=base_url()."uploads/school_content/";
        $this->header_path=base_url()."uploads/print_headerfooter/student_receipt/". $this->school->voucher_header;
        $this->footer_note= $this->school->voucher_footer;
        if($this->debug){

            echo "<center><a class='btn' target='_BLANK' href='".getFullURL('debug')."'>Download PDF</a></center>";
        }
        
    }

function setHeader(){
    $this->html.='
    <link rel="stylesheet" href="'.base_url().'backend/bootstrap/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="'.base_url().'backend/dist/css/AdminLTE.min.css">';
}
function setCSS($css){
    $this->html.='
    <style>
    '.$css.'
    </style>';
}
function setHTML($html){
    $this->html.=$html;
}

    public function index()
    {
      //   pr($this->sch_setting_detail);
         create_pdf("ahsd","ok.pdf",true);

    }
     function download_vouchers()
    {
        $fee_types = $this->feetype_model->get();
        $fee_month=str_decode($this->input->get('fee_month'));
        $class=str_decode($this->input->get('class'));
        $section=str_decode($this->input->get('section'));
        if($this->input->get('student_id')){
            $student_id=str_decode($this->input->get('student_id'));
        }
        if(@$student_id){
            $students = $this->studentfeemaster_model->searchAssignFeeByStudentID($student_id, $fee_month);

        }else{
            $students = $this->studentfeemaster_model->searchAssignFeeByClassSection($class, $section, $fee_month);

        }
        $this->setHeader();
        $this->setCSS("table{font-size:0.8rem}
        .sub_header{font-size:9px} 
        .header{font-weight:bold;font-size:15px} 
        .copy_title{font-size:0.5rem; margin-left:50px} 
        .lft{text-align:left} 
        .rt{text-align:right} 
        .br{border-bottom:1px dotted} 
        .brs{border-bottom:1px solid; margin-top:5px} 
        .brd{border:1px solid; } 
        .brall tr{border:1px solid} 
        .upit{margin-top: -23px!important;} 
        th{text-align:center}
        .lpd{text-align:center}
        @page *{margin-top: 2.54cm;margin-bottom: 0cm;  margin-left: 3.175cm; margin-right: 3.175cm;}
        .paid {
            background: url('". $this->icon."/paid.png');
            background-repeat: no-repeat;
            background-size: contain;
            background-position-x: center;
        }
        .unpaid {
            background: url('". $this->icon."/unpaid.png');
            background-repeat: no-repeat;
            background-size: contain;
            background-position-x: center;
        }
        
       

        ");

        $html="
        <table width='100%' class='brd >
        <thead>
        <tr>
        <th><center><span class='copy_title'></span></center></th>
        <th><center><span class='copy_title'> </span></center></th>
        <th><center><span class='copy_title'> </span></center></th>
        <tr>
        </thead>

        <tbody>
      
        

        ";
foreach ($students as $key => $student) {

  $student_id= $student['id'];
  $full_name= $student['firstname'].''.$student['lastname'];
  $student_discount_fee = $this->studentfeemaster_model->getByStudentFeesMasterId($student['student_fees_master_id']);
  
$fee_voucher_name=$student_discount_fee->fees[0]->name; 
$fee_arr=(array)$student_discount_fee->fees;
$fine=array_sum(array_column($fee_arr,"fine_amount"));
$due_date=getMaxDateFromArray(array_column($fee_arr,"due_date"));
$fee=array_column($fee_arr,"amount","feetype_id");
if($fee_arr){
    foreach ($fee_arr as $k => $fee_info) {
      if(!$fee_info->amount_detail){
        $this->is_paid=false;
      }
    }
}


$sr=1;
$fee_rows="";

$sum=0;
foreach ($fee_types as $key => $value) {
    $amount=isset($fee[$value['id']])? $fee[$value['id']]:0;
    $sum+=$amount;
    $fee_rows.="<tr ><td width='5%' class='br'>$sr</td><td class='br lft '>{$value['type']}</td><td width='8%' class='br rt'> $amount</td></tr>";
    $sr++;
}
$after_due_date=$sum+$fine;
$to_words=convertNumberToWord($sum);
$after_due_date_word=convertNumberToWord($after_due_date);
$fine_word=convertNumberToWord($fine);
  if($this->is_paid){
    $status="PAID";
    $fee_table="<table width='93%' class='paid'>";
  }else{
    $fee_table="<table width='93%' class='unpaid'>";
    $status="UN-PAID";
  }


  $fee_table.="
  <tr>
  <th >SR #</th>
  <th class='lft '>{$this->lang->line('fee_type')}</th>
  <th><div class='rt'>{$this->lang->line('amount')}</div></th>
  </tr>
  $fee_rows
  <tr>
  <td class='br lft ' colspan='2'>Payable <small>(Till {$due_date})</small></td>
  <td class='br rt '>$sum</td>
  </tr>
  <tr>
  <td class='br lft ' colspan='2'>Surcharge </td>
  <td class='br rt '>$fine</td>
  </tr>
  <tr>
  <td class='br lft ' colspan='2'>Payable <small>(After {$due_date})</small></td>
  <td class='br rt '>$after_due_date </td>
  </tr>

  <tr>
  <td class='br' colspan='3'><b>Amount In words: {$this->school->currency_symbol} $to_words Only</b>{$this->footer_note}</td>
  </tr>
  <tr>
  <td class='br' colspan='3'>
 

  </td>
  </tr>
 
  </table>
 <div> <center> <img style='height: 150px;width:450px;' src='{$this->header_path}'> </center><div>


  <br><br>
  <br>  <br>
 


   
";




    $copy="
       <div >
        <table width='100%'  >
        <tr>
        <td width='20%'>
       <center> <img style='height: 40px;width:50px;margin-top: -40px;' src='{$this->schoo_logo}/{$this->school->image}'> </center>
        </td>
        <td>
        <center><span class='header'>{$this->school->name}</span> <center>
       
        <center>
        <span class='sub_header'><b class='lft'>Address:</b> {$this->school->address}<br><b>Phone:</b>{$this->school->phone}<br><b>Email:</b>{$this->school->email}
        
        </span>
        <br>
        <barcode height='0.30' code='".getFeeAccount($student_id)."' type='CODABAR' />
        <br>
        <b>$fee_voucher_name</b>
    
        </center>
      
        </td>
        </tr>
        </table>
     
        <center>
        
        <table width='95%' style='margin-top: 8px;' >
        <tbody>
        <tr>
        <th class='brs lft'>
         Fee Account/ Kuick Pay ID
        </th>
        <td class='brs rt' colspan='3'>
         ".getFeeAccount($student_id)."
        </td>
        </tr>
      

        <tr>
        <th class='brs lft'>
        Student Name
        </th>
        <td class='brs rt'>
         {$full_name}
        </td>
      
        <th class='brs  lpd'>
        Father Name
        </th>
        <td class='brs rt'>
         {$student['father_name']}
        </td>
        </tr>
        <tr>
        <th class='brs lft'>
        Class
        </th>
        <td class='brs rt'>
         {$student['class']}
        </td>
        
        <th class='brs  lpd'>
        Admission #
        </th>
        <td class='brs rt'>
         {$student['admission_no']}
         
        </td>
        </tr>
        

        </tbody>
        </table>
        <br>
    
        $fee_table
       
        <br>  
        
      

        </center>
        </div>
      
        

    ";

$html.="
       <tr><td>School Copy $copy</td><td>Bank Copy $copy</td><td >Student Copy $copy</td> </tr>
";
}
       $html.="
       
        </tbody>

        </table>



        
        ";
        $this->setHTML($html);


        
        if($this->debug){
            echo $this->html;
        }else{
     create_pdf($this->html,"all_$class($section)_Vouchers.pdf",true);
        }
   
   

    }
       
    

}
