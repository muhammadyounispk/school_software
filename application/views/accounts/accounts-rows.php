<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>

        <div class="row">
            <?php $system = getSystemAccounts();
            $dropdown = [];
            foreach ($system as $key => $sys_ac) {
           
                $dropdown[$sys_ac['category']][$sys_ac['id']]  = array('title'=>$sys_ac['title'],'is_cash_transfer'=>$sys_ac['is_cash_transfer']);;
            }
            foreach ($dropdown as $group => $drp) {
            ?>
                <div class="col-md-4">
                    <div class="box box-primary">
                        
                        <div class="box-header with-border">
                            <h3 class="box-title"><?= $group; ?> </h3> 
                            <a class="pull-right fancybox" style="color: white;" href="<?=base_url('Accounts/addAccount?auth_id='.str_encode($group));?>" >Add Account</a>
                        </div>
                       
                        <div class="box-body" style="height: 300px;overflow:scroll">
                            <table  width="100%">
                            <?php
                            foreach ($drp as $key => $title) {
                               
                            ?>
                            <tr>
                                <td>
                                    <div style="padding: 5px;">
                                    <b><?=$title['title'];?></b>
                                    <br>
                                (A/C: <?=getInstAccount($key);?>)<br>
                                <b>Balance: </b> <?=$currency_symbol." ".getOpeningBalance(getInstAccount($key));?>
                                </div>
                            </td>
                                <td>
                                    <?php if($title['is_cash_transfer']){?>
                                    <a style="float: right; "  href="<?=base_url("Accounts/cashDeposit?auth=".str_encode($key));?>" class="btn btn-primary fancybox btn-sm"><i class="fa fa-money"></i>Add cash</a>

                                    <?php }?>
                                    <a style="float: right; margin-right: 2px;"  href="<?=base_url("Accounts/accountStatement?auth=".str_encode($key));?>" class="btn btn-primary fancybox btn-sm"><i class="fa fa-arrow-right"></i> Trs & Statment</a>
                                  
                                </td>
                            </tr>
                          
                                
                    
                            
                            <?php
                            }
                            ?>
                            </table>
                        </div>
                    </div>
                </div>
            <?php
            }
            ?>
        </div><!--./row-->
