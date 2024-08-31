<style>
   
    td{
        text-align: center;
    }
</style>


<center>
    <table  width="100%" align="center">

    <tbody>
        <?php
       
        if ($students) {
            $sr = 1;
            foreach ($students as $key => $student) {
                $id = $student['student_id'];
                $fee = $student['fee'];
              if($fee>0){
        ?>
                <tr>
                    <td>
                        <?=getVoucherHTML($id,"Studnt Copy",$fm);?>
                        <br> <br>  <br> <br>
                    </td>
                    <td>
                        <?=getVoucherHTML($id,"School Copy",$fm);?>
                        <br> <br>  <br> <br>
                    </td>
                    <td>
                        <?=getVoucherHTML($id,"Bank Copy",$fm);?>
                        <br> <br>  <br> <br>
                    </td>
                 
                     
                      
                 
                </tr>
               
    <?php 
     $sr++;
              }
}

                  
                }

                
            
            
            
            ?>
    </tbody>
</table> 