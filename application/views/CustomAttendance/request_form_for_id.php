

<center>
    <table width="95%"  >
        <tr>
            <th width="20%"><img style="float:right;height: 90px;width: auto;object-fit: fill;" src="<?= $logo; ?>"> </th>
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
                                <td colspan="8"><center><b>Attendance Student ID Request form  <?=date('l d F Y', strtotime($date));?></b></center></td>
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


<table width="100%">
    <tr>
        <td><div style="font-size: 0.6rem; border:1px solid black; height:100px; margin-bottom:5px">

<b>Note: </b>Please Only Write those students ID(s)  who are <b>Absent</b>  

</div></td>
        <td><div style="font-size: 0.6rem; border:1px solid black; height:100px; margin-bottom:5px">

<b>Note: </b>Please Only Write those students ID(s)  who are  at <b>Leave</b> 

</div></td>
    </tr>
</table>

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
            <th>Student ID</th>
           
          

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
                    <td><?= $student['id']; ?></td>

          

           
                   
                 
                </tr>
               
    <?php 
     $sr++;
}

                  
                }

                
            
            
            
            ?>
    </tbody>
</table> 
<span style="font-size: 0.6rem;"> Printed @</b>: <?= date("d/m/Y h:i:s a"); ?></span>
</center>