<button type="button"   class="btn btn-primary btn-sm  exportPDF" data-title="Salary Slip for <?=$month. ' - '.$year;?>" data-pdfname="payslip.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>
<?php
$data=json_decode($transaction['meta'],true);


?>
<div class="pdf_content" style="    width: 69%;
    margin-left: 211px;">
    <style>
      .sections{
        border-left:1px solid gray;
        border-top:1px solid gray;
        border-bottom:1px solid gray; 
      }
      .sections th{
        border-right:1px solid gray;
        border-bottom:1px solid gray;
        padding: 3px;
      }
      .sections td{
        border-right:1px solid gray;
        padding: 3px;
      }
      .sections .last td{
        border-bottom:1px solid gray;
      }
    </style>

      
      <table width="100%" style="border:1px solid gray;">
        <tbody><tr>
          <th align="left" width="10%"> 
            Code:
          </th>
          <td width="40%"> <?=$result['employee_id'];?></td>
          <th align="left" width="15%">
            Post:
          </th>
          <td width="35%">  <?=$result['designation'];?></td>
        </tr>
        <tr>
          <th align="left"> 
            Name:
          </th>
          <td> <?php echo $result["name"] . " " . $result["surname"] ?></td>
          <th align="left">
            Dept.:
          </th>
          <td> <?=$result['department'];?></td>
        </tr>
        <tr>
          <th align="left"> 
            CNIC:
          </th>
          <td> <?=$result['cnic'];?></td>
          <th align="left">
            Date Joined:
          </th>
          <td>  <?=$result['date_of_joining'];?></td>
        </tr>
        <tr>
          <th align="left"> 
            Mobile:
          </th>
          <td>  <?=$result['contact_no'];?></td>
          <th align="left">
            
          </th>
          <td></td>
        </tr>
      </tbody></table>
    
      <h3 style="margin: 0px 0px 5px 0px;">Payroll</h3>
      <table width="100%" class="sections" cellspacing="0">
        <tbody><tr style="background: #ccc;">
          <th width="6%">A/C #</th>
          <th>Sections</th>
          <th width="15%">Revenues</th>
          <th width="15%">Deductions</th>
        </tr>
        <?php 
        $deduction_statement=array();
        foreach ($data['detaill'] as $key => $value) {
          $title=$value['name'];
          $amount=$value['amount'];
          $type=$value['type'];
          if($title){
            $ac=getSalaryID($title);
            $staff_account=getStaffPersonalAccount($result['id'],$ac['id']);
            
            if($type=='DR'){ 
              $current_balance=getOpeningBalance($staff_account);
              $deduction_statement[]=array('balance'=>$current_balance,'title'=>$title,'account_id'=>$staff_account,'on_salary'=>$ac['on_salary']);

            } 

           

         ?>
        <tr>
          <td><?=$staff_account;?></td>
          <td><?=$title;?></td>
          <td align="right"><?php if($type=='CR'){ echo nf($amount);}?></td>
          <td align="right"><?php if($type=='DR'){ echo nf($amount); }  ?>
    </td>
        </tr>
     <?php }}?>
        <tr>
          <td>&nbsp;</td>
          <td></td>
          <td><div style="border-top:1px solid gray;border-bottom:2px solid gray;height: 2px;"></div></td>
          <td><div style="border-top:1px solid gray;border-bottom:2px solid gray;height: 2px;"></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right"><b>Totals</b></td>
          <td align="right"><div style="border-bottom:1px solid gray;padding-bottom: 3px;"><b><?=nf($data['credit_total']);?></b></div></td>
          <td align="right"><div style="border-bottom:1px solid gray;padding-bottom: 3px;"><b><?=nf($data['debit_total']);?></b></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </td>
          <td></td>
          <td></td>
        </tr>
       
        <tr class="last">
          <td>&nbsp;</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr style="background: #dfdfdf;">
          <th colspan="2" align="right">NET PAY</th>
          <th colspan="2" align="center"><?=nf($data['credit_total']-$data['debit_total']);?></th>
        </tr>
      </tbody></table>
      <table width="100%">
        <td width="50%">
         <center><b>Attendance Sumary</b></center> 
          <table   width="100%" border="1" style="border-collapse: collapse;" >
                                            <tr style="background: #dfdfdf;">
                                                <th  class="bozero"><?php echo $this->lang->line('month'); ?></th>
                                                <?php foreach ($attendanceType as $key => $value) { ?>
                                                    <th class="bozero"><span data-toggle="tooltip" title="<?php echo $value["type"]; ?>"><?php echo strip_tags($value["type"]); ?></span></th>  
                                                <?php }
                                                ?>

                                                <th class="bozero"><span data-toggle="tooltip" title="<?php echo $this->lang->line('approved'); ?> <?php echo $this->lang->line('leave'); ?>">Approved leaves<br> (Allowcated Leaves : <?=$alloted_leave;?>)</span></th>
                                            </tr>
                                            <?php
                                            foreach ($monthAttendance as $attendence_key => $attendence_value) {
                                                ?><tr>
                                                    <td><?php echo date("F", strtotime($attendence_key)); ?></td>
                                                    <td><?php echo $attendence_value['present'] ?></td>
                                                    <td><?php echo $attendence_value['late']; ?></td> 
                                                    <td><?php echo $attendence_value['absent']; ?></td> 
                                                    <td><?php echo $attendence_value['half_day']; ?></td> 
                                                    <td><?php echo $attendence_value['holiday']; ?></td>
                                                    <td><?php echo $monthLeaves[date("m", strtotime($attendence_key))]; ?></td>                                   
                                                </tr>
                                                <?php
                                            }
                                            ?>
                                          

                                        </table></td>

                                        <td width="50%">
         <center><b>Deduction Statement</b></center> 
          <table   width="100%" border="1" style="border-collapse: collapse;" >
                                            <tr style="background: #dfdfdf;">
                                                <th>A/C#</th>
                                                <th>Nature</th>
                                                <th>Title</th>
                                                <th>Balance</th>
                                          </tr>
                                            <?php
                                            foreach ($deduction_statement as $attendence_key => $statement) {
                                                ?><tr>
                                                   <td><?=$statement['account_id'];?></td>                                  
                                                   <td><?=$statement['on_salary'];?></td>                                  
                                                   <td><?=$statement['title'];?></td>                                  
                                                   <td  align="right"><?=nf($statement['balance']);?></td>                                  
                                                </tr>
                                                <?php
                                            }
                                            ?>
                                          

                                        </table></td>


                                       
                                        

                                       


      </table>
      <span style="font-size: 0.6rem;">* <?=$transaction['narration'];?></span>
     <style type="text/css">
      th, td {
            vertical-align: top; /* Align content from top */
        }
      </style>
     

    </div>
  



      
     
     