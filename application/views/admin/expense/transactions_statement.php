<?php
if($trs){

 $sql="SELECT * FROM `accounts_head`
 where id=$account_id";
$ac=db::getRecord($sql);



?>
<button type="button"   class="btn btn-primary btn-sm  exportPDF" data-title="Account Statement" data-pdfname="account-statement.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>

<div class="pdf_content" style="margin-left: 113px; width:80%" >

<table border="1" style="border-collapse: collapse;" width="100%">
<tr>
   
    <th>Account No</th> <td><?=$account;?></td>
    <th>Account Title</th> <td><?=$ac['title'];?></td>
    <th>Category</th> <td><?=$ac['category'];?></td>
    <th>Transaction Period</th> <td><?=$from;?> -- to -- <?=$to;?></td>
</tr>

</table>

<table class="table table-striped table-bordered table-hover example" border="1" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Sr</th>
                                <th>Date</th>
                                <th>Narration</th>
                                <th>Opening Balance</th>
                                <th>Transaction Amount</th>
                                <th>Transaction Type</th>
                                <th>Closing Balance</th>



                            </tr>
                        </thead>
                        <tbody>

                        <?php 
                        if($trs){
                            $sr=1;
                            $credit=0;
                            $debit=0;
                   foreach ($trs as $key => $transaction) {
                    if($transaction['type']==1){
                        $credit+=$transaction['amount'];
                    }else{
                        $debit+=$transaction['amount'];
                    }
                 

                            ?>

                            <tr class="unpaid">
                                <td><?=$sr;?></td>
                                <td><?php echo $transaction['trasaction_at'];?></td>
                                <td><?php echo $transaction['narration'];?></td>
                                <td><?php echo nf($transaction['opening_balance']);?></td>
                                <td><?php echo nf($transaction['amount']);?></td>
                                <td><?php echo $transaction['type']==1? 'CR':'DR';?></td>
                                <td><?php echo nf($transaction['closing_balance']);?></td>


                            </tr>


                            <?php 
                            $sr++;
                        }}?>

                        </tbody>
                    </table>
                   


                    <table border="1" align="right" style="border-collapse: collapse;" width="30%">
<tr>
    <th>Credit Amount</th> <td><?=nf($credit);?> /=</td>
</tr>
<tr>
    <th>Debit Amount</th> <td><?=nf($debit);?> /=</td>
    
</tr>
<tr>
    <th>Active Balance</th> <td><?=$debit+$credit;?> /=</td>
    
</tr>

</table>

</div>



 <?php 


                    }else{
                       
                        echo "<center><span style='color:red; font-size:20px'>No Transaction  $date_range</span> </center>";
                        
                    }?>




    
