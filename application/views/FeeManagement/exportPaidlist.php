<style>
   
    td{
        text-align: center;
    }
</style>

<center>
    <table width="95%"  >
        <tr>
            <th width="20%"><img style="float:right;height: 120px;width: auto;object-fit: fill;" src="<?= $logo; ?>"> </th>
            <td colspan="7" style="text-align: center" width="65%">
                <center>
                    <div style="text-align: center">
                        <div style="font-size: 34px;text-align: center; ">
                            <center><?= $school['name']; ?></center>
                        </div>
                        <div style="margin-top: -5px;margin-bottom: 5px;">
                            <b>Phone</b>: <?= $school['phone']; ?> <b>Email</b>: <?= $school['email']; ?><br>
                            <b>Address</b>: <?= $school['address']; ?><br>
                            <b>Website</b>: <?= $school['host']; ?><br>
                            <table  width="100%">
                            <tr>
                                <td colspan="8"><center><h1>Student Fee Received Report</h1></center></td>
                            </tr>
                        <tr>

                            <th>Class</th>
                            <td><?= $class; ?></td>
                            <th>Section</th>
                            <td><?= $section; ?></td>
                            <th>Fee month</th>
                            <td><?= $fee_month; ?></td>
                            <th>Date & Time Issued</th>
                            <td><?= date('d F Y h:i:s a'); ?></td>

                        </tr>
                    </table>



                        </div>
                    </div>
                </center>
              

            </td>

            <td width="15%" style="text-align: right; margin-right: 5px;">
                <img height="100px" width="100px" src="<?= $base_url; ?>/uploads/digis/qrcode.png">
            </td>
        </tr>



    </table>


</center>

<center>
    <table  cellspacing="0" width="100%" align="center" border="1" style="font-size: 0.6rem;">
    <thead>
        <tr style="background-color: pink;">
            <th>Sr</th>
            <th>Fee A/C#</th>
            <th width="5%">Name</th>
            <th>Father Name</th>
            <th>Phone</th>
            <th>Class/Section</th>
            <?php
            $fees = getFeeAccounts();
            foreach ($fees as $key => $fee) {
                echo "<th>" . $fee['title'] . "</th>";
            } ?>
            <th>Arrears</th>
            <th>Total</th>
            <th>Paid</th>
            <th>Balance</th>

        </tr>
    </thead>
    <tbody>
        <?php
        $collected = 0;
        $total = 0;
        $balance = 0;
        $pending = 0;
        $count_paid = 0;
        $count_unpaid = 0;
        if ($students) {
            $sr = 1;
            foreach ($students as $key => $student) {
                $id = $student['student_id'];
                $fee_month =explode("-",$fm)[1];
                $fee_year = explode("-",$fm)[0];
                 $sql = "SELECT* FROM transactions where student_id=$id and month='" . $fee_month . "' and  year='" . $fee_year . "'";
                $transaction = db::getRecord($sql);
             
                if ($transaction) {
        ?>
                <tr></tr>
                    <td><?= $sr; ?></td>
                    <td><?= getFeeAccount($student['id']); ?></td>
                    <td><?= $student['firstname']; ?></td>
                    <td><?= $student['father_name']; ?></td>
                    <td><?= $student['guardian_phone']; ?></td>
                    <td><?= $student['class']; ?>/<?= $student['section']; ?></td>
                    <?php
                  
                  $fees = getFeeAccounts();

                  foreach ($fees as $key => $fee) {
                      $sql = "SELECT * FROM `students_fee` where accounts_id='{$fee['id']}' and student_id='{$student['student_id']}' ";
                      $fees = db::getRecord($sql);

                      if (isset($fees['payable_amount'])) {
                          echo "<td>".nf($fees['payable_amount'])."</td>";
                      } else {
                          echo "<td>0</td>";
                      }
                  }
                        $collected += $transaction['amount'];
                        $balance += $transaction['balance'];
                        $total += $transaction['total'];
                        $per=round($collected/$total*100);
                    ?>
                        <td> <?= nf($transaction['arrears']); ?></td>
                        <td><?= nf($transaction['total']); ?></td>
                        <td><?= nf($transaction['amount']); ?></td>
                        <td><?= nf($transaction['balance']); ?></td>
                      
                 
                </tr>
               
    <?php 
     $sr++;
}

                  
                }

                
            }
            
            
            ?>
    </tbody>
</table> 
<table align="right"  width="20%" style="border-bottom: 1px solid black;">

<tr>
    <th>Total Amount</th>
    <td><?=nf($total);?>/=</td>
</tr>
<tr>
    <th>Total Amount Collected</th>
    <td><?=nf($collected);?>/=</td>
</tr>
<tr>
    <th>Total Balance</th>
    <td><?=nf($balance);?>/=</td>
</tr>
<tr>
    <th>Percentage Progress</th>
    <td><?=$per;?> %</td>
</tr>

    
</table>
</center>