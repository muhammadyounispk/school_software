<?php
$from=date("Y-m-01",strtotime($date));
$to=date("Y-m-t",strtotime($date));
$dates=get_dates_between($from,$to);



?>

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
                            <b>Printed @</b>: <?= date("d/m/Y h:i:s a"); ?><br>
                            <table  width="100%">
                            <tr>
                                <td colspan="8"><center><b>Student Register  <?=date('F Y', strtotime($date));?></b></center></td>
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
            <th>Name</th>
            <th>Father Name</th>
            <th>Phone</th>
            <th>Class</th>
            <th>Section</th>
            <?php
            foreach ($dates as $key => $date) {
                echo "<th>".date('d',strtotime($date))."</th>";
               
            }

            ?>
            <th>P</th>
            <th>A</th>
            <th>L</th>
          

        </tr>
    </thead>
    <tbody>
        <?php
    
        if ($students) {
            $sr = 1;
            foreach ($students as $key => $student) {
                $id = $student['id'];
               
        ?>
                <tr></tr>
                    <td><?= $sr; ?></td>
                    <td><?= $student['firstname'] . " ".$student['lastname']; ?></td>
                    <td><?= $student['father_name']; ?></td>
                    <td><?= $student['guardian_phone']; ?></td>
                    <td><?= getClass($student['class_id']); ?></td>
                    <td><?= getSecion($student['section_id']); ?></td>

                    <?php
                    $absent=0;
                    $leave=0;
                    $present=0;
            foreach ($dates as $key => $date) {
                $at=getAttendanceDay($student['id'],$date);
                if($at=='P'){
                    $present++;
                }else if($at== 'A'){
                    $absent++;
                }else if($at== 'L'){
                 $leave++;
                }

                ?>
                <td>
                    <?=$at?>
                </td>


                          <?php
               
               
            }

            ?>
            <td><?=$present;?></td>
            <td><?=$absent;?></td>
            <td><?=$leave;?></td>

           
                   
                 
                </tr>
               
    <?php 
     $sr++;
}

                  
                }

                
            
            
            
            ?>
    </tbody>
</table> 

</center>