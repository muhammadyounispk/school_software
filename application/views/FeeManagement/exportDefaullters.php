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
                        <div style="font-size: 20px;text-align: center; ">
                            <center><?= $school['name']; ?></center>
                        </div>
                        <div style="margin-top: -5px;margin-bottom: 5px;">
                            <b>Phone</b>: <?= $school['phone']; ?> <b>Email</b>: <?= $school['email']; ?><br>
                            <b>Address</b>: <?= $school['address']; ?><br>
                            <b>Website</b>: <?= $school['host']; ?><br>
                            <table  width="100%">
                            <tr>
                                <td colspan="8"><center><h1>Student Defaulter List</h1></center></td>
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
        <tr style="background-color: black; color:white">
            <th>Sr</th>
            <th>Fee A/C#</th>
            <th width="5%">Name</th>
            <th>Father Name</th>
            <th>Phone</th>
            <th>class/Section</th>
            <th>Arrears</th>
            <th>Month Fee</th>
            <th>DF Month(s)</th>
            <th>Month Name(s) DF</th>
            <th>Total Payable</th>
            

        </tr>
    </thead>
    <tbody>
        <?php
        $total = 0;
        $pending = 0;
        $fee = 0;
        if ($students) {
            $sr = 1;
            foreach ($students as $key => $student) {
               $missed=count($student['unpaid']);
             
            if($student['fee']>0){
                if($missed){
                    $total_payable=($missed*$student['fee'])+$student['arrears'];
                }else{
                    $total_payable=($student['fee'])+$student['arrears'];
                }
               
                $total+= $total_payable; 
                $pending+= $student['arrears'];
                $fee+= $student['fee'];
        ?>
                <tr></tr>
                    <td><?= $sr; ?></td>
                    <td><?= getFeeAccount($student['id']); ?></td>
                    <td><?= $student['firstname']; ?></td>
                    <td><?= $student['father_name']; ?></td>
                    <td><?= $student['guardian_phone']; ?></td>
                    <td><?= $student['class']; ?>/<?= $student['section']; ?></td>
                    <td><?= $student['arrears']; ?></td>
                    <td><?= $student['fee']; ?></td>
        
                        <td> <?= $missed;?> </td>
                        <td><?php
                        foreach ($student['unpaid'] as $key => $fee_months) {
                            
                            echo date('F Y',strtotime($fee_months))."<br>";
                        }
                        ?></td>
                        <td><?= nf($total_payable); ?></td>
                     
                      
                 
                </tr>
               
    <?php 
     $sr++;
}

            }

                  
                

                
            }
            
            
            ?>
    </tbody>
</table> 
<table align="right"  width="40%" style="border-bottom: 1px solid black;">

<tr>
    <th>Total Fee</th>
    <td><?=nf($fee);?>/=</td>
</tr>
<tr>
    <th>Total Arrears</th>
    <td><?=nf($pending);?>/=</td>
</tr>
<tr>
    <th>Total Students</th>
    <td><?=$sr-1;?></td>
</tr>
<tr>
    <th>Total Payable</th>
    <td><?=nf($total);?></td>
</tr>
<tr>
    <th>Total Payable</th>
    <td><?=nf($total);?><br><small><?=convertNumberToWord($total);?></small></td>
</tr>

    
</table>
</center>