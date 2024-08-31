

    <?php      
    $ini_banks=db::getRecords("SELECT name, id from banks order by name"); 
    $default=db::getRecord("SELECT * FROM `withdrawal` where school_id='".getSchoolID()."' and is_default=1"); 
    if(! $default){
        $default['bank']='';
        $default['title']='';
        $default['account']='';
        $default['is_default']='1';
    }
    $currency_symbol = $this->customlib->getSchoolCurrencyFormat();?>
    <section class="content">
        <div class="row">
            <?php if ($this->rbac->hasPrivilege('complaint', 'can_add')) { ?>
                <div class="col-md-4">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('new'); ?> <?php echo $this->lang->line('Widthdraw'); ?></h3>
                        </div><!-- /.box-header -->

                        <form id="form1" action="<?php echo site_url('admin/WithDrawal') ?>"   method="post" accept-charset="utf-8" enctype="multipart/form-data" >
                            <div class="box-body">
                                <?php echo $this->session->flashdata('msg') ?>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('bank'); ?></label>
                                    <select required name="bank" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>  
                                       <?=displayDropDown($ini_banks,$default['bank_id']) ;?>                                    
                                    </select>
                                    <span class="text-danger"><?php echo form_error('bank'); ?></span>

                                </div>

                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('account'); ?> <?php echo $this->lang->line('title'); ?></label> <small class="req"> *</small> 
                                    <input required type="text" class="form-control" value="<?php echo $default['title']; ?>"  id="input_title"  name="title">
                                    <span class="text-danger"><?php echo form_error('title'); ?></span>
                                </div>
                                <div class="form-group">
                                    <label for="email"><?php echo $this->lang->line('account'); ?> <?php echo $this->lang->line('number'); ?> <small class="req"> *</small> </label> 
                                    <input required type="text" class="form-control" value="<?php echo $default['account']; ?>" id="input_account"   name="account">
                                    <span class="text-danger"><?php echo form_error('account'); ?></span>
                                </div>
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="pwd"><?php echo $this->lang->line('amount'); ?>  <small class="req"> *</small> (<?=$this->lang->line('balance');?>: <?=$currency_symbol." ".nf(getBalance(getSchoolID()));?>)</label>    
                                        <input  type="number" class="form-control " value="<?php echo set_value('amount')?>"  id="input_amount"   name="amount" id="amount" >
                                        <span class="text-danger"><?php echo form_error('amount'); ?></span>
                                    </div>
                                </div>
                               <input  <?php if($default['is_default']) { echo "checked";}?> name="set_is_default" id="is_default" type="checkbox"><label for="is_default"><?=$this->lang->line('is_default');?></label>
                            </div><!-- /.box-body -->


                            <div class="box-footer">
                                <button   type="button" onclick="loadData()"  class="btn btn-info pull-right loadconfirm"><?php echo $this->lang->line('Widthdraw'); ?></button>
                            </div>
                        </form>
                    </div>

                </div><!--/.col (right) -->
                <!-- left column -->
            <?php } ?>
            <div class="col-md-<?php
            if ($this->rbac->hasPrivilege('complaint', 'can_add')) {
                echo "8";
            } else {
                echo "12";
            }
            ?>">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('Widthdraw'); ?> <?php echo $this->lang->line('list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('Widthdraw'); ?> <?php echo $this->lang->line('list'); ?></div>
                        <div class="mailbox-messages table-responsive">
                            <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th> # </th>
                                        <th><?php echo $this->lang->line('account'); ?> <?php echo $this->lang->line('title'); ?></th>
                                        <th><?php echo $this->lang->line('account'); ?> <?php echo $this->lang->line('number'); ?></th>
                                        <th><?php echo $this->lang->line('bank'); ?></th>
                                        <th><?php echo $this->lang->line('opeing_balance'); ?></th>
                                        <th><?php echo $this->lang->line('amount'); ?></th>
                                        <th><?php echo $this->lang->line('closing_balance'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('status'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('date'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('remarks'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('download'); ?></th>
                                    </tr>
                                </thead>
                             
                                    <tbody id="loadDataMy"></tbody>
                                           
                                
                            </table><!-- /.table -->
                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div><!--/.col (left) -->
            <!-- right column -->
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->


</div><!-- /.content-wrapper -->



<!-- Modal -->
<div class="modal fade" id="ConfirmModel" tabindex="-1" role="dialog" aria-labelledby="ConfirmModelLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ConfirmModelLabel"><?php echo $this->lang->line('confirm'); ?> <?php echo $this->lang->line('Widthdraw'); ?></h5>
        <button type="button" class="close dismiss_model" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="confirm_screen">
       <center>
        <table width='95%' border="1">
            <tr>
                <th colspan="2">ِ<center><?php echo $this->lang->line('Widthdraw_Info'); ?></th>
                
            </tr>
            <tr>
                <th width='20%'><?php echo $this->lang->line('bank'); ?></th>
                <td><center><span id="bank_show"></td>
            </tr>
            <tr>
                <th width='20%'><?php echo $this->lang->line('account'); ?> <?php echo $this->lang->line('title'); ?></th>
                <td><center><span id="title_show"></td>
            </tr>
            <tr>
                <th width='20%'><?php echo $this->lang->line('account'); ?> <?php echo $this->lang->line('number'); ?></th>
                <td><center><span id="account_show"></td>
            </tr>
            <tr>
                <th width='20%'><?php echo $this->lang->line('amount'); ?></th>
                <td><center><?=$currency_symbol;?><span id="amount_show"></td>
            </tr>

        </table>
      
  
       </center>
        </div>
        <div class="otp_screen " style="display: none;"><br> 
        <div class="form-group">
            
                                    <label for="pwd"><?php echo $this->lang->line('enter'); ?> <?php echo $this->lang->line('otp'); ?></label> <small class="req"> *</small> 
                                    <input required type="text" class="form-control"   name="otp">
                                    </div>
        </div>
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-secondary dismiss_model" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary sendotp"><?php echo $this->lang->line('send'); ?> <?php echo $this->lang->line('otp'); ?></button>
       <button style="display: none;" type="button" class="btn btn-primary confirm_otp otp_screen"><?php echo $this->lang->line('confirm'); ?> <?php echo $this->lang->line('otp'); ?></button>

    </div>
    </div>
  </div>
</div>

<?php $bal=getBalance(getSessionID());
?>
<script type="text/javascript">

<?php

?>
        function loadData() {
            
             console.log("feeding");
            var selected_bank=$("select[name=bank] option:selected").text();
            var selected_title=$("#input_title").val();
            var selected_account=$("#input_account").val();
            var selected_amount=$("#input_amount").val();
            console.log(selected_bank);
            console.log(selected_title);
            console.log(selected_account);
            console.log(selected_amount);
            if(selected_title && selected_account && selected_amount){
            if(parseInt(selected_amount)>=500 && parseInt(selected_amount) <=<?=getBalance(getSchoolID()) ? getBalance(getSchoolID()):0;?>){

            $("input[name=otp]").val('');
            $("#bank_show").html(selected_bank);
            $("#title_show").html(selected_title);
            $("#account_show").html(selected_account);
            $("#amount_show").html(selected_amount);
            $('#ConfirmModel').modal('show'); 

            }else{
                if(<?=getBalance(getSchoolID()) ? getBalance(getSchoolID()):0;?>>0){
                    errorMsg('Amount must be greater than 500 & Equal or less than <?=getBalance(getSchoolID()) ? getBalance(getSchoolID()):0;?>'); 

                }else{
                    errorMsg('Insufficient Account Balance');
                }
            }

            }else{
                errorMsg('Please fill form Correctly');
            }
        }
        $(".sendotp").click(function (e) {
            var form = $('#form1');
             // Serialize the form data into a query string
           var formData = form.serialize();
        
           $.post('<?php echo base_url();?>admin/WithDrawal/sendOTP',formData,function (data) {
           Loader(false);
            var d=JSON.parse(data);
            if(d.code==200){
             successMsg(d.message);
             $(".sendotp").html('<?php echo $this->lang->line('resend'); ?> <?php echo $this->lang->line('otp'); ?>')
            
            $('.otp_screen').show(); 
                
            }else{
                errorMsg(d.message);
                
            
            }

     
            
           }) ;
        });
        $(".confirm_otp").click(function (e) {
            var user_otp=$("input[name=otp]").val();
          if(user_otp){
           $.post('<?php echo base_url();?>admin/WithDrawal/confirmOTP',{user_otp:user_otp},function (data) {
            Loader(false);
            var d=JSON.parse(data);
            if(d.code==200){
                successMsg(d.message);
                $('#ConfirmModel').modal('hide'); 
                loadWithdrawalData();
               var form = $('#form1');// Reset the form
               form.trigger('reset');
            }else{
                errorMsg(d.message);
            }
           }) ;

        }else{
            errorMsg('Enter OTP please');
        }
        });
        $(".dismiss_model").click(function (e) {
          
           var form = $('#form1');// Reset the form
            form.trigger('reset');
        });

        function loadWithdrawalData() {
            $.post('<?php echo base_url();?>admin/WithDrawal/loadWithdrawalData',{},function (data) {
               $("#loadDataMy").html(data);
               console.log(data);
        });
    }

    $(document).ready(function () {
        loadWithdrawalData();
    });



    
</script>

