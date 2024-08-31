<button type="button" class="btn btn-primary btn-sm  exportPDF" data-title="DIGIS School Software Billing" data-pdfname="school_software_billing.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>

<div class="pdf_content" style="
    width: 90%; margin-left: 50px;">



    <table class="table table-striped table-bordered table-hover example" border="1" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Sr</th>
                <th>Billing Month-Year</th>
                <th>Cycle</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Payment Detail</th>


            </tr>
        </thead>

        <?php

        $school = db::getRecord("SELECT* from sch_settings s inner join plans p on p.id=s.plan where s.id= " . getSchoolID());

        if ($school['duration'] == 'Monthly') {

        ?>
            <?php
            $givenDate = $school['reg_date'];

            // Convert dates to DateTime objects
            $start = new DateTime($givenDate);
            $end = new DateTime($currentDate);

            // Get the interval
            $interval = new DateInterval('P1M');

            // Adjust the start date to the beginning of the month
            $start->modify('first day of this month');

            // Create a DatePeriod from the start month to the current month
            $period = new DatePeriod($start, $interval, $end);

            // Output months and years
            $sr=1; 
            foreach ($period as $date) {
                $startDate = date("Y-m-01", strtotime($date->format("Y-m-d")));
                $endDate = date("Y-m-t", strtotime($date->format("Y-m-d")));
                $sql="select* FROM transactions where type='2' and date between '$startDate' and '$endDate' and account='".getInstAccount(25)."'  ";
                $tr=db::getRecord($sql);
               

            ?>
                <tr>
                    <td><?=$sr;?></td>
                    <td><? echo $date->format('F Y') . "\n"; ?></td>
                    <td>Monthly</td>
                    <td><?=$school['price'];?></td>
                    <td><?php
                    if($tr){
                        echo "Paid";
                    }else{
                        echo "Unpaid";
                    }
                    
                    ?></td>
                    <td>
                        <?php 
                        
                        if($tr['narration']){
                            echo $tr['narration'];
 
                        }else{
                            ?>
                            <a href="<?=base_url('SoftwareBill/pay');?>";?" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i>  Click to Pay</a>
 

                             <?php
                        }
                        
                        ?>
                    
                    </td>
                </tr>


            <?php
           $sr++;
         }



            ?>


        <?php }else{



?>



<?php
            $start =date("mY",strtotime($school['reg_date'])) ;

            // Convert dates to DateTime objects
            $start = new DateTime($givenDate);
            $end = new DateTime($currentDate);

            // Get the interval
            $interval = new DateInterval('P1M');

            // Adjust the start date to the beginning of the month
            $start->modify('first day of this month');

            // Create a DatePeriod from the start month to the current month
            $period = new DatePeriod($start, $interval, $end);

            // Output months and years
            $sr=1; 
            foreach ($period as $date) {
                $startDate = date("Y-m-01", strtotime($date->format("Y-m-d")));
                $endDate = date("Y-m-t", strtotime($date->format("Y-m-d")));
                $sql="select* FROM transactions where type='2' and date between '$startDate' and '$endDate' and account='".getInstAccount(25)."'  ";
                $tr=db::getRecord($sql);
               

            ?>
                <tr>
                    <td><?=$sr;?></td>
                    <td><? echo $date->format('F Y') . "\n"; ?></td>
                    <td>Yearly</td>
                    <td><?=$school['price'];?></td>
                    <td><?php
                    if($tr){
                        echo "Paid";
                    }else{
                        echo "Unpaid";
                    }
                    
                    ?></td>
                    <td>
                        <?php 
                        
                        if($tr['narration']){
                            echo $tr['narration'];
 
                        }else{
                            ?>
                            <a href="<?=base_url('SoftwareBill/pay');?>";?" class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i>  Click to Pay</a>
 

                             <?php
                        }
                        
                        ?>
                    
                    </td>
                </tr>


            <?php
           $sr++;
         }



            ?>




      <?php  } ?>
        <tbody>



        </tbody>
    </table>





</div>