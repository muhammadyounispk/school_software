<div class="row">
    <div class="col-lg-12 col-12">
        <div class="box box-primary">
            <div class="box-body" style="  overflow-x: auto;height:500px">
                <form role="form" action="<?php echo site_url('Accounts') ?>/deposit_fund_form" method="post" class="validate" id="deposit_fund_form">
                    <input hidden name="student_id" value="<?= $student['student_id']; ?>">
                    <input hidden name="fee_month" value="<?= $_GET['fee_month']; ?>">
                    <?php
                    echo $this->customlib->getCSRF(); ?>
                    <fieldset>
                        <legend>Transfer Funds</legend>
                        <div class="row">
                            <div class="col-md-12">
                                <label><input name="alert" type="checkbox" checked> Send Confirmation SMS to Institute Owner</label>
                            </div>
                        <div class="col-sm-2">
                            <label>Date</label> <small class="req"> *</small>
                            <br>
                            <input type="date"  name="dateTrs" class="validate[required] form-control" value="<?=date('Y-m-d');?>">
                        </div>

                        

                        <div class="col-sm-2">
                            <label>Tr Type</label> <small class="req"> *</small>
                            <br>
                            <select name="tr_type" class=" form-control">
                                <option value="2">Debit (Withdrawal Cash Value)</option>
                            </select>
                        </div>
                        
                        <div class="col-md-2">
                            <label>Deposit to</label> <small class="req"> *</small>
                            <br>
                            <select name="deposit_to" class="form-control">
                                <?php $system = getSystemAccounts();
                                $dropdown = [];
                                foreach ($system as $key => $sys_ac) {
                                    $dropdown[$sys_ac['category']][$sys_ac['id']] = $sys_ac['title'];
                                }
                                foreach ($dropdown as $group => $drp) {
                                    echo "<optgroup label='$group'>";
                                    foreach ($drp as $key => $title) {
                                        if ($key == $id) {
                                            echo "<option   value='{$key}'>{$title}</option>";
                                        } else {
                                            echo "<option disabled  value='{$key}'>{$title}</option>";
                                        }
                                    }
                                    echo "</optgroup>";
                                }
                                ?>
                            </select>
                        </div>

                       
                        <div class="col-sm-2">
                            <label>Reason / Purpose / Narration</label> <small class="req"> *</small>
                            <br>
                            <input type="text" name="narration" class="validate[required] form-control" value="">
                        </div>

                        

                        <div class="col-sm-2">
                            <label>Amount</label> <small class="req"> *</small>
                            <br>
                            <input type="number" name="deposit" class="validate[required] form-control" value="">
                        </div>
                        <div class="col-sm-2"><br>
                            <center><button class="btn btn-primary btn-sm"><i class="fa fa-money"></i> Make Transaction</button></center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="margin-top: 16px;border: 1px solid;">
                            <label for="fileattach">Invoices / Proof/ Attachment</label>
                            <input  id="fileattach" class="filestyle" style="opacity:1;margin-bottom: 20px;" type="file" name="attachment" class="form-control">
                        </div>
                    </div>
                    </fieldset>
                </form>
                
                
                
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
<script>
    $(document).ready(function() {
        $('#deposit_fund_form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            if(confirm('Are you sure you want to procced?')) {
            var formData = new FormData(this); // Create FormData object
            Loader(true, "Searhing Students ");
            $.ajax({
                type: 'POST',
                url: '<?= base_url() . 'admin/expense/transferCashNow'; ?>', // Get the form's action attribute
                data: formData, // Send FormData object
                contentType: false, // Prevent jQuery from setting content type
                processData: false, // Prevent jQuery from processing data
                success: function(response) {
                    var data = JSON.parse(response);
                    console.log(response);
                     if (data.code == 200) {
                         successMsg(data.message);
                         $("#deposit_fund_form").trigger("reset");
                         $('#fancyboxmodel').modal('toggle').modal('hide');
                         loadTransactions();
                        
                       
                 } else {
                         errorMsg(data.message);
                     }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // Log any errors to the console
                    Loader(false, "Saving Information");
                }
            });
        }
        });
        
    });
 
   

   

</script>

