<style type="text/css">
    .collect_grp_fees{
        font-size: 15px;
        font-weight: 600;
    }

    .fees-list {
        list-style: none;
        margin: 0;
        padding: 0;
    }
    .fees-list>.item {
        border-radius: 3px;
        -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        padding: 10px 0;
        background: #fff;
    }
    .fees-list>.item:before, .fees-list>.item:after {
        content: " ";
        display: table;
    }
    .fees-list>.item:after {
        clear: both;
    }
    .fees-list .product-img {
        float: left;
    }
    .fees-list .product-img img {
        width: 50px;
        height: 50px;
    }
    .fees-list .product-info {
        margin-left: 0px;
    }
    .fees-list .product-title {
        font-weight: 600;
        font-size: 15px;
        display: inline;
    }
    .fees-list .product-title span{

        font-size: 15px;
        display: inline;
        font-weight: 100 !important;
    }
    .fees-list .product-description {
        display: block;
        color: #999;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .fees-list-in-box>.item {
        -webkit-box-shadow: none;
        box-shadow: none;
        border-radius: 0;
        border-bottom: 1px solid #f4f4f4;
    }
    .fees-list-in-box>.item:last-of-type {
        border-bottom-width: 0;
    }
</style>
<div class="col-lg-12">
    <div class="form-horizontal">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-3 control-label"><?php echo $this->lang->line('date'); ?> <small class="req"> *</small></label>
            <div class="col-sm-9">
                <input id="date" value="<?=date("d/m/Y");?>" name="collected_date" placeholder="" type="text" class="form-control date_fee" value="" readonly="readonly" autocomplete="off">
                <span id="form_collection_collected_date_error" class="text text-danger"></span>
            </div>
        </div>


        <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label hide"> <?php echo $this->lang->line('payment') . " " . $this->lang->line('mode'); ?></label>
            <div class="col-sm-9 hide">
                <label class="radio-inline">
                    <input type="radio" name="payment_mode_fee" value="Cash" checked="checked"> <?php echo $this->lang->line('cash'); ?></label>
                <label class="radio-inline">
                    <input type="radio" name="payment_mode_fee" value="Cheque"> <?php echo $this->lang->line('cheque'); ?></label>
                <label class="radio-inline">
                    <input type="radio" name="payment_mode_fee" value="DD"><?php echo $this->lang->line('dd'); ?></label>
                <label class="radio-inline">
                    <input type="radio" name="payment_mode_fee" value="bank_transfer"><?php echo $this->lang->line('bank_transfer'); ?>
                </label>
                <label class="radio-inline">
                    <input type="radio" name="payment_mode_fee" value="upi"><?php echo $this->lang->line('upi'); ?>
                </label>
                <label class="radio-inline">
                    <input type="radio" name="payment_mode_fee" value="card"><?php echo $this->lang->line('card'); ?>
                </label>
                <span class="text-danger" id="payment_mode_error"></span>
            </div>
            <span id="form_collection_payment_mode_fee_error" class="text text-danger"></span>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-3 control-label hide"> <?php echo $this->lang->line('note') ?></label>

            <div class="col-sm-9 hide">
                <textarea class="form-control" rows="3" name="fee_gupcollected_note" id="description" placeholder="">By hand Paid</textarea>
                <span id="form_collection_fee_gupcollected_note_error" class="text text-danger"></span>
            </div>
        </div>

    </div>
</div>
<ul class="fees-list fees-list-in-box">
    <?php
    $row_counter = 1;
    $total_amount = 0;
    foreach ($feearray as $fee_key => $fee_value) {
        $amount_prev_paid = 0;
        $fees_fine_amount = 0;
        $fine_amount_status = false;
        $amount_to_be_pay = $fee_value->amount;

        if ($fee_value->is_system) {
            $amount_to_be_pay = $fee_value->student_fees_master_amount;
        }

        if (($fee_value->due_date != "0000-00-00" && $fee_value->due_date != NULL) && (strtotime($fee_value->due_date) < strtotime(date('Y-m-d')))) {
         $fees_fine_amount=$fee_value->fine_amount;
         $total_amount=$total_amount+$fee_value->fine_amount;
         $fine_amount_status=true;
        }

        if (is_string(($fee_value->amount_detail)) && is_array(json_decode(($fee_value->amount_detail), true))) {

            $amount_data = json_decode($fee_value->amount_detail);

            foreach ($amount_data as $amount_data_key => $amount_data_value) {
                $amount_prev_paid = $amount_prev_paid + ($amount_data_value->amount + $amount_data_value->amount_discount);
            }

            if ($fee_value->is_system) {
                $amount_to_be_pay = $fee_value->student_fees_master_amount - $amount_prev_paid;
            } else {

                $amount_to_be_pay = $fee_value->amount - $amount_prev_paid;
            }
        }
        $total_amount = $total_amount + $amount_to_be_pay;
        if ($amount_to_be_pay > 0) {
            ?>

            <li class="item">
                <input name="row_counter[]" type="hidden" value="<?php echo $row_counter; ?>">
                <input name="student_fees_master_id_<?php echo $row_counter; ?>" type="hidden" value="<?php echo $fee_value->id; ?>">
                <input name="fee_groups_feetype_id_<?php echo $row_counter; ?>" type="hidden" value="<?php echo $fee_value->fee_groups_feetype_id; ?>">
                 <input name="fee_groups_feetype_fine_amount_<?php echo $row_counter; ?>" type="hidden" value="<?php echo $fees_fine_amount; ?>">
                <input name="fee_amount_<?php echo $row_counter; ?>" type="hidden" value="<?php echo $amount_to_be_pay; ?>">
                <div class="product-info">
                    <a href="#"  onclick="return false;" class="product-title">  <?php echo $fee_value->type; ?>
                        <span class="pull-right"><?php echo $amount_to_be_pay; ?></span></a>
                         <span class="product-description">
                      
                        </span>
                        <?php 
if($fine_amount_status){
    ?>
                       <a href="#"  onclick="return false;" class="product-title text text-danger"><?php echo $this->lang->line('fine'); ?>
                        <span class="pull-right">
                            <?php echo $fees_fine_amount; ?>                                
                        </span>
                    </a>

    <?php
}
                         ?>
                </div>
            </li>

            <?php
        }

        $row_counter++;
    }
    ?>
</ul>

<div class="row collect_grp_fees">
    <div class="col-md-8">
    <span class="pull-left">
    <div><b><?php echo $this->lang->line('notify_alert');?></b></div>
                                <input name="send_com[]" checked type="checkbox" value="whatsapp">Whatsapp PDF
                                <input name="send_com[]" checked  type="checkbox" value="sms">SMS
                                <input name="send_com[]" checked  type="checkbox" value="email">Email
    
                                </span>
        <span class="pull-right">
            <?php echo $this->lang->line('total') . " " . $this->lang->line('pay'); ?>
        </span>
    </div>
    <div class="col-md-4">
        <span class="pull-right">
            <?php echo number_format((float) $total_amount, 2, '.', ''); ?>
        </span>

    </div>
</div>