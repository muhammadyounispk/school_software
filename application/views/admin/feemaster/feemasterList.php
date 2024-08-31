<style type="text/css">
    .liststyle1 {
        margin: 0;
        list-style: none;
        line-height: 28px;
    }
</style>

<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); 



// Get the current year and month
$currentYear = date('Y');
$currentMonth = date('n');
$daysInMonth = date('t'); // Get the total number of days in the current month

// Create an array of dates for the dropdown
$dateOptions = [];

for ($day = 1; $day <= $daysInMonth; $day++) {
    $dateOptions[] = $currentYear . '-' . str_pad($currentMonth, 2, '0', STR_PAD_LEFT) . '-' . str_pad($day, 2, '0', STR_PAD_LEFT);
}

?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php if ($this->rbac->hasPrivilege('fees_master', 'can_add')) {
            ?>
                <div class="col-md-4">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><?php echo $this->lang->line('add_fees_master') . " : " . $this->setting_model->getCurrentSessionName(); ?></h3>
                        </div><!-- /.box-header -->
                        <form id="form1" action="<?php echo base_url() ?>admin/feemaster" id="feemasterform" name="feemasterform" method="post" accept-charset="utf-8">
                            <div class="box-body">
                                <?php if ($this->session->flashdata('msg')) { ?>
                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>

                                <?php echo $this->customlib->getCSRF(); ?>

                             
                                <div class="row">
                                <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"><?php echo $this->lang->line('auto_generate') ?></label><small class="req"> *</small>
                                            
                                            <div  class="row">

                                            <div class="col-sm-4">
                                            <input id="auto_voucher_none" <?php echo set_radio('auto_voucher', '0', true); ?>  name="auto_voucher" checked placeholder="" type="radio"  value="0" />
                                            <span for="auto_voucher_none" class="text-danger"><?php echo $this->lang->line('none') ?></span>
                                            </div>

                                            <div class="col-sm-4">
                                            <input id="auto_voucher_monthly" <?php echo set_radio('auto_voucher', '1', set_value('1')); ?>name="auto_voucher" placeholder="" type="radio"  value="1" />
                                            <span for="auto_voucher_monthly" class="text-danger"><?php echo $this->lang->line('monthly') ?></span>
                                            </div> 

                                            <!-- <div class="col-sm-4">
                                            <input id="auto_voucher_yearly" <?php echo set_radio('auto_voucher', '2', set_value('2')); ?> name="auto_voucher" placeholder="" type="radio"  value="2" />
                                            <span for="auto_voucher_yearly" class="text-danger"><?php echo $this->lang->line('yearly') ?></span>
                                            </div> -->

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">


                                        <div class="form-group">
                                            <label for="exampleInputEmail1"><?php echo $this->lang->line('fee_month'); ?></label> <small class="req">*</small>
                                            <input value="<?=date('Y-m');?>"   value="<?php echo set_value('fee_month'); ?>" name="fee_month" placeholder="" type="text" class="form-control fee_month" value="<?php echo set_value('month_year'); ?>" />
                                            <span class="text-danger"><?php echo form_error('fee_month'); ?></span>
                                        </div>



                                        <div class="form-group">
                                            <label for="exampleInputEmail1"><?php echo $this->lang->line('fees_type'); ?></label><small class="req"> *</small>

                                            <select id="feetype_id" name="feetype_id" class="form-control">
                                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                <?php
                                                foreach ($feetypeList as $feetype) {
                                                ?>
                                                    <option value="<?php echo $feetype['id'] ?>" <?php
                                                                                                    if (set_value('feetype_id') == $feetype['id']) {
                                                                                                        echo "selected =selected";
                                                                                                    }
                                                                                                    ?>><?php echo $feetype['type'] ?></option>

                                                <?php
                                                    $count++;
                                                }
                                                ?>
                                            </select>
                                            <span class="text-danger"><?php echo form_error('feetype_id'); ?></span>
                                        </div>
                                    </div>


                                        

                                        <div class="form-group">
                                            <label for="exampleInputEmail1"><?php echo $this->lang->line('amount'); ?></label><small class="req"> *</small>
                                            <input id="amount" name="amount" placeholder="" type="text" class="form-control" value="<?php echo set_value('amount'); ?>" />
                                            <span class="text-danger"><?php echo form_error('amount'); ?></span>
                                        </div>

                                      


                                    


                                    


                                </div>



                            </div><!-- /.box-body -->

                            <div class="box-footer">

                                <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                            </div>
                        </form>
                    </div>

                </div><!--/.col (right) -->
                <!-- left column -->
            <?php } ?>
            <div class="col-md-<?php
                                if ($this->rbac->hasPrivilege('fees_master', 'can_add')) {
                                    echo "8";
                                } else {
                                    echo "12";
                                }
                                ?>">
                <!-- Horizontal Form -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('fees_master_list') . " : " . $this->setting_model->getCurrentSessionName(); ?></h3>

                    </div><!-- /.box-header -->

                    <div class="box-body">
                        <div class="download_label"><?php echo $this->lang->line('fees_master_list') . " : " . $this->setting_model->getCurrentSessionName(); ?></div>

                        <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home"><i class="fa fa-check"></i>  <?php echo $this->lang->line('active'); ?> <?php echo $this->lang->line('voucher'); ?></a></li>
  <li><a data-toggle="tab" href="#menu1"><i class="fa fa-lock"></i> <?php echo $this->lang->line('locked'); ?> <?php echo $this->lang->line('voucher'); ?></a></li>

</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
 
  <table class="table table-striped table-bordered table-hover example">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('fees_group'); ?></th>
                                            <th><?php echo $this->lang->line('fees'); ?></th>

                                            <th width='20%' class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        foreach ($feemasterList as $feegroup) {
                                       
                                        ?>
                                            <tr>
                                                <td class="mailbox-name">
                                                    <b><a href="#" data-toggle="popover" class="detail_popover"><?php echo $feegroup->group_name; ?></a></b> 
                                                    <i class="fa fa-calendar"></i> <?php echo $this->lang->line('expiry_date'); ?> : <span id="expiry_date"><?=empty($feegroup->due_date)? 'N/A':$feegroup->due_date?></span><br>
                                                    <i class="fa fa-money"></i> <?php echo $this->lang->line('fine'); ?> : <span id="fine_amount_value"><?=empty($feegroup->fine)? 'N/A':$feegroup->fine?></span>


                                                </td>


                                                <td class="mailbox-name">
                                                    <ul class="liststyle1">
                                                        <?php
                                                        foreach ($feegroup->feetypes as $feetype_key => $feetype_value) {
                                                         if($feetype_value->type!='Balance'){
                                                        ?>
                                                            <li>
                                                           <?=$feetype_value->auto_voucher > 0  ?  '<i data-toggle="tooltip" title="'.$this->lang->line('auto_generate').' : '.$this->lang->line($this->auto_voucher[$feetype_value->auto_voucher]).'" class="fa fa-repeat" ></i>' : null;?>

                                   
                                                                  <?php echo strtoupper($feetype_value->type). " " . $currency_symbol . $feetype_value->amount; ?> &nbsp;&nbsp;
                                                                <?php if ($this->rbac->hasPrivilege('fees_master', 'can_edit')) { ?>
                                                                    <a href="<?php echo base_url(); ?>admin/feemaster/edit/<?php echo $feetype_value->id ?>" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                                        <i class="fa fa-pencil"></i>
                                                                    </a>&nbsp;
                                                                <?php
                                                                }
                                                                if ($this->rbac->hasPrivilege('fees_master', 'can_delete')) {
                                                                ?>
                                                                    <a href="<?php echo base_url(); ?>admin/feemaster/delete/<?php echo $feetype_value->id ?>" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                                        <i class="fa fa-remove"></i>
                                                                    </a>
                                                                <?php } ?>

                                                            </li>
                                                        <?php
                                                        } }
                                                        ?>
                                                    </ul>
                                                </td>

                                                <td class="mailbox-date pull-right">
                                                    <?php if ($this->rbac->hasPrivilege('fees_group_assign', 'can_view')) { ?>
                                         


                                                        <a data-placement="left" href="<?php echo base_url(); ?>admin/feemaster/assign/<?php echo $feegroup->id ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('assign / view'); ?>">
                                                        <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-cogs"></i> <?php echo $this->lang->line('assign_vouchers'); ?></button>

                                                        </a>

                                                        <a  class="btn btn-default btn-xs" data-toggle="modal" data-target="#exampleModal"  title="<?php echo $this->lang->line('voucher_validity'); ?>">
                                                        <button type="button" class="btn btn-primary btn-sm open_model_validity"><i class="fa fa-calendar"></i> <?php echo $this->lang->line('voucher_validity'); ?></button>

                                                        </a>
                                                        
                                                    <?php } ?>
                                                    <?php if ($this->rbac->hasPrivilege('fees_master', 'can_delete')) { ?>
                                                        <a data-placement="left" href="<?php echo base_url(); ?>admin/feemaster/deletegrp/<?php echo $feegroup->id ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                        <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-close"></i> <?php echo $this->lang->line('delete'); ?></button>
                                                        </a>
                                                    <?php } ?>

                                                </td>
                                            </tr>
                                        <?php
                                        }
                                        ?>

                                    </tbody>
                                </table><!-- /.table -->
  
  
                            </div>
  
  
  
  
                            <div id="menu1" class="tab-pane fade">
   
    <table class="table table-striped table-bordered table-hover example">
                                    <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('fees_group'); ?></th>
                                            <th><?php echo $this->lang->line('fees'); ?></th>

                                            <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        foreach ($disactivefeemasterList as $feegroup) {
                                        ?>
                                            <tr>
                                                <td class="mailbox-name">
                                                    <a href="#" data-toggle="popover" class="detail_popover"><?php echo $feegroup->group_name; ?></a>


                                                </td>


                                                <td class="mailbox-name">
                                                    <ul class="liststyle1">
                                                        <?php
                                                        foreach ($feegroup->feetypes as $feetype_key => $feetype_value) {
                                                         if($feetype_value->type!='Balance'){
                                                        ?>
                                                            <li>
                                                           <?=$feetype_value->auto_voucher > 0  ?  '<i data-toggle="tooltip" title="'.$this->lang->line('auto_generate').' : '.$this->lang->line($this->auto_voucher[$feetype_value->auto_voucher]).'" class="fa fa-repeat" ></i>' : null;?>

                                   
                                                                  <?php echo strtoupper($feetype_value->type). " " . $currency_symbol . $feetype_value->amount; ?> &nbsp;&nbsp;
                                                                

                                                            </li>

                                                        <?php
                                                        } }
                                                        ?>
                                                    </ul>
                                                </td>

                                                <td class="mailbox-date pull-right">
                                                    <?php if ($this->rbac->hasPrivilege('fees_group_assign', 'can_view')) { ?>
                                                        <a data-placement="left" href="<?php echo base_url(); ?>admin/feemaster/assign/<?php echo $feegroup->id ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('assign_vouchers'); ?>">
                                                        <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-cogs"></i> <?php echo $this->lang->line('assign_vouchers'); ?></button>

                                                        </a>
                                                    <?php } ?>
                                                  

                                                </td>
                                            </tr>
                                        <?php
                                        }
                                        ?>

                                    </tbody>
                                </table><!-- /.table -->
  


</div>
  <div id="menu2" class="tab-pane fade">
    <h3>Menu 2</h3>
    
   


    
  </div>
</div>


                        <div class="mailbox-messages">
                            <div class="table-responsive">
                              
                            </div>
                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->


                    </form>
                </div>

            </div><!--/.col (right) -->
            <!-- left column -->


        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><?php echo $this->lang->line('voucher_validity'); ?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      <form id="set_validity">

                                           <div class="form-group">
                                            <label for="exampleInputEmail1"><?php echo $this->lang->line('due_date'); ?></label><small class="req"> *</small>

                                            <select id="due_date" name="due_date" class="form-control">
                                                <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                <?php foreach ($dateOptions as $dateOption){ ?>
                                              <option value="<?php echo $dateOption; ?>"><?php echo $dateOption; ?></option>
                                                <?php } ?>
                                            </select>
                                           
                                        </div>
                                        
                            


                                        

                                        <div class="form-group">
                                            <label for="exampleInputEmail1"><?php echo $this->lang->line('fine_amount'); ?></label><small class="req"> *</small>
                                            <input id="fine_amount_pkr" name="fine_amount_pkr" placeholder="" type="text" class="form-control" value="<?php echo set_value('fine_amount'); ?>" />
                                            <span class="text-danger"><?php echo form_error('fine_amount'); ?></span>
                                        </div>


      </form>



     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary update_validity"><?=$this->lang->line('update');?></button>
      </div>
    </div>
  </div>
</div>




<script type="text/javascript">
    $(document).ready(function() {
        var account_type = "<?php echo set_value('account_type', 0); ?>";
        load_disable(account_type);


    });

    $(document).on('change', '.finetype', function() {

        calculatefine();
    });


    $(document).on('keyup', '#amount,#fine_percentage', function() {

        calculatefine();
    });


    function load_disable(account_type) {
        if (account_type === "percentage") {
            $('#due_date_error').html(' *');
        //    $('#fine_amount').prop('readonly', true);
            $('#fine_percentage').prop('readonly', false);
        } else if (account_type === "fix") {
            $('#due_date_error').html(' *');
            $('#fine_amount').prop('readonly', false);
            $('#fine_percentage').prop('readonly', true);
        } else {
            $('#due_date_error').html('');
            $('#fine_amount').prop('readonly', true);
            $('#fine_percentage').prop('readonly', true);
        }
    }



    function calculatefine() {
        var amount = $('#amount').val();
        var fine_percentage = $('#fine_percentage').val();

        var finetype = $('input[name=account_type]:checked', '#form1').val();

        if (finetype === "percentage") {
            $('#due_date_error').html(' *');
            fine_amount = ((amount * fine_percentage) / 100).toFixed(2);
            $('#fine_amount').val(fine_amount).prop('readonly', true);
            $('#fine_percentage').prop('readonly', false);
        } else if (finetype === "fix") {
            $('#due_date_error').html(' *');
            $('#fine_amount').val("").prop('readonly', false);
            $('#fine_percentage').val("").prop('readonly', true);
        } else {
            $('#due_date_error').html('');
            $('#fine_amount').val("");
            $('#fine_percentage').val("");
            $('#fine_amount').prop('readonly', true);
            $('#fine_percentage').prop('readonly', true);
        }

    }

    $(document).ready(function() {
        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function() {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });


    });
    $(document).ready(function() {

        
        $(".open_model_validity").click(function() {

            var db_expiry_date=$("#expiry_date");
            var db_fine_amount_value=$("#fine_amount_value");
            if(db_expiry_date.html() && db_fine_amount_value.html()){
                $("#fine_amount_pkr").val(db_fine_amount_value.html());
                $("#due_date").val(db_expiry_date.html());
            }

        });     
        $(".update_validity").click(function() {
           
            // Data to be sent in the POST request (as an object)
            var due_date=$("#due_date").val();
            var fine_amount_pkr=$("#fine_amount_pkr").val();
            if(due_date && fine_amount_pkr){
            var postData = {
                due_date: due_date,
                fine_amount_pkr:fine_amount_pkr ,
               
            };

            $.post("feemaster/setVoucherValidity", postData, function(response) {
                $("#exampleModal").hide();
                var db_expiry_date=$("#expiry_date");
                var db_fine_amount_value=$("#fine_amount_value");
                db_fine_amount_value.html(fine_amount_pkr);
                db_expiry_date.html(due_date);
                $(".fade").removeClass('modal-backdrop');
                successMsg(response);
            })
            .fail(function(xhr, textStatus, errorThrown) {
               $("#exampleModal").hide();
               $(".fade").removeClass('modal-backdrop');
                errorMsg(errorThrown);
            });

        }else{
            errorMsg('Please Fill for correctly');
        }
        
        });

    

    });
</script>