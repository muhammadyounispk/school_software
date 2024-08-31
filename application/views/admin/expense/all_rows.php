<div class="row" style="margin-top: 10px;">

<?php 

    $from=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[0])));
    $to=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[1])));


?>


<?php

$accounts=db::getRecords("SELECT * FROM `accounts_head` where category='Expenses'");

foreach ($accounts as $key=>$account) {
$arr = array("green", "blue", "yellow", "green", "blue", "yellow", "green", "blue", "yellow");
?>

    <div class="col-md-4 col-sm-6">
        <div class="info-box">
           
                <span class="info-box-icon bg-<?= $arr[$key]; ?>"><i class="fa fa-money"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"><?=$account['title'];?> <br> <small>(Total transactions : <?=getNoTrs(getInstAccount($account['id']),$from,$to);?>)</small></span>
                    <span class="info-box-number">Rs. <?=nf(getOpeningBalance(getInstAccount($account['id']),$from,$to));?><br>
               
                </span>
                
                <br>
                <div style="display: flex;">
                <a href="<?=base_url('admin/expense/proceedTransaction');?>?auth=<?=str_encode($account['id']);?>&from=<?=$from;?>&to=<?=$to?>" class="btn btn-primary btn-sm fancybox"><i class="fa fa-arrow-right"></i>TRs </a>
                <a href="<?=base_url('admin/expense/ACstatement');?>?auth=<?=str_encode($account['id']);?>&from=<?=$from;?>&to=<?=$to?>" class="btn btn-primary btn-sm fancybox"><i class="fa fa-arrow-right"></i>Statement </a>
                </div>
                </div>
            
        </div> 
    </div>

    <?php }?>




</div>