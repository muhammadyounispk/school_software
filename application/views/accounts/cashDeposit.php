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
                        <legend>Transfer Cash</legend>
                        <div class="row">

                        <div class="col-md-12">
                                <label><input name="alert" type="checkbox" checked> Send Confirmation SMS to Institute Owner</label>
                            </div>

                        <div class="col-sm-3">
                            <label>Tr Type</label> <small class="req"> *</small>
                            <br>
                            <select name="tr_type" class=" form-control">
                                <option value="1">Credit (Transfer Cash Value)</option>
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

                        <div class="col-sm-3">
                            <label>Reason / Purpose / Narration</label> <small class="req"> *</small>
                            <br>
                            <input type="text" name="narration" class="validate[required] form-control" value="">
                        </div>

                        

                        <div class="col-sm-2">
                            <label>Deposit amount</label> <small class="req"> *</small>
                            <br>
                            <input type="number" name="deposit" class="validate[required] form-control" value="">
                        </div>
                        <div class="col-sm-2"><br>
                            <center><button class="btn btn-primary btn-sm"><i class="fa fa-money"></i> Transfer</button></center>
                        </div>
                    </div>
                    </fieldset>
                </form>
                
                <fieldset>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-4">
                        <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; ">
                            <i class="fa fa-calendar"></i>&nbsp;
                            <span></span> <i class="fa fa-caret-down"></i>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button onclick="loadTransactions()" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> Statement</button>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                        <legend>Account Statement</legend>
                        <div id="transactions"></div>
                </fieldset>
                
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
            if(confirm('Are you sure you want to deposit?')) {
            var formData = new FormData(this); // Create FormData object
            Loader(true, "Loading... ");
            $.ajax({
                type: 'POST',
                url: '<?= base_url() . 'Accounts/transferCashNow'; ?>', // Get the form's action attribute
                data: formData, // Send FormData object
                contentType: false, // Prevent jQuery from setting content type
                processData: false, // Prevent jQuery from processing data
                success: function(response) {
                    var data = JSON.parse(response);
                    console.log(response);
                     if (data.code == 200) {
                         successMsg(data.message);
                         $("#deposit_fund_form").trigger("reset");
                         loadTransactions();
                         loadChartAccount();
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
    function loadTransactions() {
        var datarange = $('#reportrange span').html();
        console.log(datarange);
        $.post('<?= base_url('Accounts/loadTransactions'); ?>', {
            account_id: '<?= $id; ?>',
            date_range: datarange
        }, function(data) {
            $('#transactions').html(data);
        });
    }
   
    loadTransactions();
    $(function() {
        var start = moment().subtract(29, 'days');
        var end = moment();
        function cb(start, end) {
            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            opens: 'left',
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);
        cb(start, end);
    });
</script>

