<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <div class="box-body">
                        <form role="form" action="<?php echo site_url('admin/feemaster/assign/' . $id) ?>" method="post" class="row">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('class'); ?></label>
                                    <select autofocus="" id="class_id" name="class_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        <?php
                                        foreach ($classlist as $class) {
                                        ?>
                                            <option value="<?php echo $class['id'] ?>" <?php if (set_value('class_id') == $class['id']) echo "selected=selected" ?>><?php echo $class['class'] ?></option>
                                        <?php
                                            $count++;
                                        }
                                        ?>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label><?php echo $this->lang->line('section'); ?></label>
                                    <select id="section_id" name="section_id" class="form-control">
                                        <option value=""><?php echo $this->lang->line('select'); ?></option>
                                    </select>
                                    <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                </div>
                            </div>
                            <div class="col-sm-1 text-center">
                             <img style="height: 38px;margin-top: 19px;" src="https://<?php echo  $_SERVER['HTTP_HOST']."/uploads/or_icon.ico";?>">
                            </div>
                            <div class="col-sm-6">
                                    
                                        
                                                <label><?php echo $this->lang->line('search_by_keyword'); ?></label>
                                                <input type="text" name="search_text" class="form-control" value="<?php echo set_value('search_text'); ?>" placeholder="<?php echo $this->lang->line('search_by_student_name'); ?>">
                                        
                                        </div>

                                        
                                  
                               

                            <div class="col-sm-12">
                   
                           
                                <div class="form-group">
                                    <button type="submit" name="search" value="search_filter" class="btn btn-primary pull-right btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <form method="post" action="<?php echo site_url('studentfee/addfeegroup') ?>" id="assign_form">
                        <?php
                        if (isset($resultlist)) {
                            $feegroup=$feegroupList[0];
                           
                        ?>
                            <div class="box-header ptbnull"></div>
                            <div class="">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><i class="fa fa-users"></i> <?=$feegroup->group_name;?><br>
                                              
                                        <?php echo form_error('student'); ?></h3>
                                    <div class="box-tools pull-right">
                                        <?php if ($resultlist) { ?>
                                            <a href="../" class="btn btn-info btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('back'); ?>">
                                                <i class="fa fa-arrow-left"></i> <?php echo $this->lang->line('back'); ?>
                                            </a>
                                           

                                            <a onclick=" sendSMS();" class="btn btn-info btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('sms'); ?>/<?php echo $this->lang->line('whatsapp'); ?>">
                                                <i class="fa fa-envelope"></i> <?php echo $this->lang->line('send'); ?> <?php echo $this->lang->line('reminder'); ?> <?php echo $this->lang->line('sms'); ?> / <?php echo $this->lang->line('whatsapp'); ?> 
                                            </a>


                                           
                                        

                                            <a href="<?php echo base_url(); ?>PDF/download_vouchers?fee_month=<?php echo str_encode($fee_month); ?>&class=<?php echo str_encode($_REQUEST['class_id']); ?>&section=<?php echo str_encode($_REQUEST['section_id']); ?>&debug=1" class="btn btn-info btn-xs fancybox" data-toggle="tooltip" title="Print Vouchers">
                                                <i class="fa fa-print"></i> <?php echo $this->lang->line('print_chalan'); ?>
                                            </a>

                                            <a href="<?php echo base_url(); ?>report/finance?fee_month=<?php echo str_encode($fee_month); ?>&class=<?php echo str_encode($_REQUEST['class_id']); ?>&section=<?php echo str_encode($_REQUEST['section_id']); ?>&debug=1" class="btn btn-info btn-xs fancybox" data-toggle="tooltip" title="Print Vouchers">
                                                <i class="fa fa-file"></i> <?php echo $this->lang->line('finance'); ?> <?php echo $this->lang->line('report'); ?> 
                                            </a>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="">
                                            <?php
                                            foreach ($feegroupList as $feegroup) {
                                             
                                            ?>
                                                <input type="hidden" name="fee_session_groups" value="<?php echo $feegroup->id; ?>">
                                            <?php
                                            }
                                            ?>
                                            <div class="col-md-12">
                                            <i class="fa fa-calendar"></i> <?php echo $this->lang->line('expiry_date'); ?> : <span id="expiry_date"><?=empty($feegroup->due_date)? 'N/A':$feegroup->due_date?></span> 
                                                    <i class="fa fa-money"></i> <?php echo $this->lang->line('fine'); ?> : <span id="fine_amount_value"><?=empty($feegroup->fine)? 'N/A':$feegroup->fine?></span>
                                                <div class=" table-responsive">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <tr>
                                                            <?php if(isset($feegroup)){?>
                                                                <th>
                                                                    <div class="checkbox mb0 mt0">
                                                                        <label class="labelbold"><input type="checkbox" id="select_all" /> <?php echo $this->lang->line('all'); ?></label>
                                                                    </div>
                                                                </th>
                                                                <?php }?>
                                                                <th><?php echo $this->lang->line('fee_account'); ?></th>
                                                                <th><?php echo $this->lang->line('student_name'); ?></th>
                                                                <?php if ($sch_setting->father_name) { ?>
                                                                    <th><?php echo $this->lang->line('father_name'); ?></th>
                                                                <?php } ?>
                                                                <?php
                                                                if(isset($feegroup->feetypes)){
                                                                foreach ($feegroup->feetypes as $feetype_key => $feetype_value) {
                                                                  
                                                                    ?>
                                                                    <th style="width:55px!important"> <?= strtoupper($feetype_value->type); ?></th>
                                                                <?php } } ?>
                                                                <th><?php echo $this->lang->line('total'); ?></th>
                                                                <th><?php echo $this->lang->line('status'); ?></th>
                                                                <th><?php echo $this->lang->line('action'); ?></th>
                                                            </tr>
                                                            <?php
                                                            if (empty($resultlist)) {
                                                            ?>
                                                                <tr>
                                                                    <td colspan="7" class="text-danger text-center"><?php echo $this->lang->line('no_record_found'); ?></td>
                                                                </tr>
                                                                <?php
                                                            } else {
                                                                $count = 1;
                                                                foreach ($resultlist as $student) {
                                                                 $total_paid=isset($student['total_feetype_paid'])? $student['total_feetype_paid']:0;
                                                                 $is_receiving=isset($student['total_feetype_paid'])? true:false;
                                                                ?>
                                                                    <tr>
                                                                    <?php if(isset($feegroup)){?>
                                                                        <td>
                                                                            <?php
                                                                            if ($student['student_fees_master_id'] != 0) {
                                                                                $sel = "checked='checked'";
                                                                                $fee_individual =  $this->feesessiongroup_model->studentFeeMaster($student['student_fees_master_id']);
                                                                            } else {
                                                                                $sel = "";
                                                                            }
                                                                            ?>

                                                                            <input class="checkbox" type="checkbox" name="student_session_id[]" value="<?php echo $student['student_session_id']; ?>" <?php echo $sel; ?> />
                                                                            <input type="hidden" name="student_fees_master_id_<?php echo $student['student_session_id']; ?>" value="<?php echo $student['student_fees_master_id']; ?>">
                                                                            <input type="hidden" name="student_ids[]" value="<?php echo $student['student_session_id']; ?>">
                                                                        </td>

                                                                        <?php }?>
                                                                        <td><?php  $adm= $student['admission_no'];  echo getFeeAccount($student['id']) ?></td>
                                                                       <?php  $class=$student['class'] . "(" . $student['section'] . ")" ?>
                                                                        <td><?php echo $sname=$this->customlib->getFullName($student['firstname'], $student['middlename'], $student['lastname'], $sch_setting->middlename, $sch_setting->lastname); ?></td>
                                                                        <?php if ($sch_setting->father_name) { ?>
                                                                            <td><?php echo $student['father_name']; ?></td>
                                                                        <?php } ?>
                                                                        <?php  
                                                                        $available_fee=0;
                                                                        $total_fee=0;
                                                                        $msg="*Fee Remainder*\n";
                                                                        if(isset($feegroup->feetypes )){
                                                                            $msg.=$feegroup->group_name."\n";  
                                                                            $ac=getFeeAccount($student['id']);
                                                                            $msg.="Name:$sname\nClass:$class\nFee A/C:$ac\n*-------------*\n";
                                                                        foreach ($feegroup->feetypes as $feetype_key => $feetype_value) {
                                                                          
                                                                            isset($fee_individual[$feetype_value->feetype_id]) ? $amount = $fee_individual[$feetype_value->feetype_id] :  $amount = $feetype_value->amount;
                                                                            $msg.="".strtoupper($feetype_value->type)." ".round($amount)."\n";
                                                                            $total_fee+=round($amount);
                                                                       ?>
                                                                            <td>
                                                                                <?php  ?>
                                                                                <input  onMouseOut="this.style.border='none'"  onMouseOver="this.style.border='1px black solid'; this.focus()"  style="width:80px!important;border:none" tabindex="1" id="fee_<?= $feetype_key; ?>" type="text" class="form-control" name="fee[<?php echo $student['student_session_id']; ?>][<?= $feetype_value->feetype_id; ?>][amount]" value="<?= round($amount); ?>">
                                                                                <input type="hidden" class="form-control" name="fee[<?php echo $student['student_session_id']; ?>][<?= $feetype_value->feetype_id; ?>][feetype_id]" value="<?= $feetype_value->feetype_id; ?>">

                                                                            </td>
                                                                        <?php
                                                                         $available_fee++;
                                                                        }
                                                                    }
                                                                         ?>
                                                                                   <td><?=$total_fee;?>
                                                                                <?php 
                                                                                $fee_link="https://".$_SERVER['HTTP_HOST']."/pay/fee/$ac";
                                                                            $msg.="Total $total_fee\n*-------------*\n*Visit Following link to pay fee*\n$fee_link";
                                                                            ?>
                                                                                   <input type="hidden" class="form-control" name="fee[<?php echo $student['student_session_id']; ?>][text]" value="<?= $msg; ?>">
                                                                                   <input type="hidden" class="form-control" name="fee[<?php echo $student['student_session_id']; ?>][to]" value="<?= $student['mobileno']; ?>">
                                                                                </td>      
                                                                        <td>
                                                                            <?php if(!$is_receiving){

                                                                                echo ' <span class="label label-warning">No Isused</span>';

                                                                            }else{
                                                                           
                                                                            if($total_paid!=$available_fee){?>
                                                                            <?php if($total_paid){
                                                                                $status=1;
                                                                                
                                                                                ?>
                                                                                <span class="label label-danger">Partial Paid</span>
                                                                                <?php }else{ $status=2;
                                                                                    
                                                                                    ?>
                                                                                    <span class="label label-danger">Unpaid</span>


                                                                                    
                                                                            <?php } }else{  $status=3; ?>
                                                                                <span class="label label-success">Paid</span>
                                                                                <?php }
                                                                                
                                                                            }?>

<input type="hidden" class="form-control" name="fee[<?php echo $student['student_session_id']; ?>][status]" value="<?= @$status; ?>">


                                                                    </td>
                                                                        <td>
                                                                            <?php if($is_receiving){?>
                                                                                 <a target="_blank" href="<?php echo base_url(); ?>pay/fee/<?php echo $ac;?>" class="btn btn-info btn-xs  " data-toggle="tooltip" title="Print Guide">
                                                                                <i class="fa fa-download"></i></a>
                                                                                 <a href="<?php echo base_url(); ?>PDF/download_vouchers?fee_month=<?php echo str_encode($fee_month); ?>&student_id=<?php echo str_encode($student['id']); ?>&debug=1" class="btn btn-info btn-xs  fancybox" data-toggle="tooltip" title="Print Voucher">
                                                                                <i class="fa fa-print"></i></a>

                                                                                 <a href="<?php echo base_url(); ?>PDF/download_vouchers?fee_month=<?php echo str_encode($fee_month); ?>&student_id=<?php echo str_encode($student['id']); ?>&whatsapp=1&path=1" class="btn btn-info btn-xs  fancybox" data-toggle="tooltip" title="Share Voucher via Whatsapp">
                                                                                <i class="fa fa-whatsapp"></i></a>
                                                                                <?php if(isset($feegroup)){?>
                                                                                <a href="<?php echo base_url(); ?>studentfee/addfee/<?php echo $student['id']; ?>?fee_month=<?php echo str_encode($fee_month); ?>" class="btn btn-info btn-xs  fancybox" data-toggle="tooltip" title="Colelct Fee">
                                                                                <i class="fa fa-money"></i> Collect Fee</a>
                                                                                <?php }?>

                                                                                <?php }?>
                                                                        </td>
                                                                    </tr>
                                                            <?php
                                                                }
                                                                $count++;
                                                            }
                                                            ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <?php if(isset($feegroup)){?>
                                                    <div style="position: fixed; bottom:12px;">
                                                    <a style="position: fixed; bottom:12px" onclick="window.location.reload()" class="btn btn-info " data-toggle="tooltip" title="<?php echo $this->lang->line('refresh'); ?>">
                                                <i class="fa fa-refresh"></i> <?php echo $this->lang->line('refresh'); ?>
                                            </a>
                                                <button style="position: fixed; bottom:12px; right:12px" type="submit" class="allot-fees btn btn-primary btn-sm pull-right" id="load" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Please Wait.."> <i class="fa fa-refresh"></i> Sync Vouchers
                                                </button>
                                                    </div>
                                                <?php }?>
                                                <br />
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php
                        }
                        ?>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    //select all checkboxes
    $("#select_all").change(function() { //"select all" change 
        $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
    });
    //".checkbox" change 
    $('.checkbox').change(function() {
        //uncheck "select all", if one of the listed checkbox item is unchecked
        if (false == $(this).prop("checked")) { //if this item is unchecked
            $("#select_all").prop('checked', false); //change "select all" checked status to false
        }
        //check "select all" if all checkbox items are checked
        if ($('.checkbox:checked').length == $('.checkbox').length) {
            $("#select_all").prop('checked', true);
        }
    });

    function getSectionByClass(class_id, section_id) {
        if (class_id != "" && section_id != "") {
            $('#section_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        }
    }
    $(document).ready(function() {
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section_id') ?>';
        getSectionByClass(class_id, section_id);
        $(document).on('change', '#class_id', function(e) {
            $('#section_id').html("");
            var class_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        });
    });

  function sendSMS() {
if( confirm('Are you  sure  to send SMS? ')){
    console.log('Send SMS');

    // Serialize the form data
    var formData = $("#assign_form").serialize();

// Send an AJAX request to the server
$.ajax({
    type: "POST",
    url: "../sendRemainderSMS", // Replace with your server-side script URL
    data: formData,
    success: function(response) {
        // Display the response on the page
        var dt=JSON.parse(response);
        if(dt.code==200){
            successMsg(dt.message);
        }else{
            errorMsg(dt.message);
        }
    },
    error: function() {
        // Handle errors here
        alert("An error occurred.");
    }
});


}

    
    
  }

    $("#assign_form").submit(function(e) {
        if (confirm('<?php echo $this->lang->line('are_you_sure'); ?>')) {
            var $this = $('.allot-fees');
            //  $this.button('loading');
            $.ajax({
                type: "POST",
                dataType: 'Json',
                url: $("#assign_form").attr('action'),
                data: $("#assign_form").serialize(), // serializes the form's elements.
                success: function(data) {
                    if (data.status == "fail") {
                        var message = "";
                        $.each(data.error, function(index, value) {
                            message += value;
                        });
                        errorMsg(message);
                    } else {
                        successMsg(data.message);
                    }
                    //  $this.button('reset');
                }
            });
        }
        e.preventDefault();
    });
</script>