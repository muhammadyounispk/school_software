<div class="container">
  
 
<div class="row">
    <div id="openService">


    <div class="sfborder">  
                                    <div class="col-md-2">
                                        <div class="row">
                                            <?php
                                            $image = $result['image'];
                                            if (!empty($image)) {

                                                $file = $result['image'];
                                            } else {

                                                $file = "no_image.png";
                                            }
                                            ?>
                                            <img width="115" height="115" class="round5" src="<?php echo base_url() . "uploads/staff_images/" . $file ?>" alt="No Image">
                                        </div>
                                    </div>  

                                    <div class="col-md-10">
                                        <div class="row">
                                            <table class="table mb0 font13">
                                                <tbody>
                                                    <tr>
                                                        <th class="bozero"><?php echo $this->lang->line("name"); ?></th>
                                                        <td class="bozero"><?php echo $result["name"] . " " . $result["surname"] ?></td>												
                                                        <th class="bozero"><?php echo $this->lang->line('staff_id'); ?></th>
                                                        <td class="bozero"><?php echo $result["employee_id"] ?></td>												
                                                    </tr>
                                                    <tr>
                                                        <?php if ($sch_setting->staff_phone) { ?>
                                                            <th><?php echo $this->lang->line('phone'); ?></th>
                                                        <?php } ?>
                                                        <td><?php echo $result["contact_no"] ?></td>
                                                        <th><?php echo $this->lang->line('email'); ?></th>
                                                        <td><?php echo $result["email"] ?>                                   </td>
                                                    </tr>
                                                    <tr>
                                                        <?php if ($sch_setting->staff_epf_no) { ?>
                                                            <th><?php echo $this->lang->line('epf_no'); ?></th>
                                                            <td><?php echo $result["epf_no"] ?></td>
                                                        <?php } ?>
                                                        <th><?php echo $this->lang->line('role'); ?></th>
                                                        <td><?php echo $result["user_type"] ?></td>                                  
                                                    </tr>
                                                    <tr>
                                                        <?php if ($sch_setting->staff_department) { ?>
                                                            <th><?php echo $this->lang->line('department'); ?></th>
                                                            <td><?php echo $result["department"] ?></td>
                                                        <?php } if ($sch_setting->staff_designation) { ?>
                                                            <th><?php echo $this->lang->line('designation'); ?></th>
                                                            <td><?php echo $result["designation"] ?>   </td>
                                                        <?php } ?>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
        <?php
        $arr = array("green", "blue", "yellow", "green", "blue", "yellow", "green", "blue", "yellow");
        foreach (getSalaryHeads('DR') as $key => $account) {
        ?>
            <div class="col-md-4 col-sm-6" onclick="ProceedTransaction('<?=$account['target_account'];?>','<?=$account['id'];?>')">
                <div class="info-box">
                  
                        <span class="info-box-icon bg-<?= $arr[$key]; ?>"><i class="fa fa-money"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text"><?= $account['title']; ?></span>
                            <span class="info-box-number">Rs.<?php
                            echo getOpeningBalance(getStaffPersonalAccount($result['id'],$account['id']));
                            ?></span>
                            <br>
                            <button class="btn btn-primary btn-sm"><i class="fa fa-arrow-right"></i> Proceed Transaction  </button>

                        </div>
                  
                </div>
            </div>

        <?php } ?>


        

    </div>

    </div>

    <div id="mydiv" class="proceed_transaction hide">
        <form role="form" action="<?php echo site_url('Accounts') ?>/deposit_fund_form" method="post" class="validate" id="deposit_fund_form">
            <input hidden name="staff_id" value="<?= $result['id']; ?>">
       
            <?php
            echo $this->customlib->getCSRF(); ?>
            <fieldset>
                <legend>Transfer Funds</legend>
                <div class="row">
                    
 <div class="col-md-12">
                                <label><input name="alert" type="checkbox" checked> Send Confirmation SMS to Institute Owner</label>
                            </div>

                    <div class="col-md-2">
                        <label>Select A/c:</label> <small class="req"> *</small>
                        <br>
                        <select id="from_account" name="from" class="form-control">
                            <?php $system = getSystemAccounts();
                            $dropdown = [];
                            foreach ($system as $key => $sys_ac) {
                                $dropdown[$sys_ac['category']][$sys_ac['id']] = $sys_ac['title'];
                            }
                            foreach ($dropdown as $group => $drp) {
                                echo "<optgroup label='$group'>";
                                foreach ($drp as $key => $title) {
                                   
                                        echo "<option   value='{$key}'>{$title}</option>";
                                    
                                }
                                echo "</optgroup>";
                            }
                            ?>
                        </select>
                    </div>

                    <div class="col-sm-1">
                            <label>Tr Type</label> <small class="req"> *</small>
                            <br>
                            <select name="tr_type" class=" form-control">
                                <option value="1">Credit </option>
                                <option value="2">Debit </option>
                            </select>
                        </div>

                  

                    <div class="col-md-3">
                        <label>Target A/C:</label> <small class="req"> *</small>
                        <br>
                        <select id="deposit_to" name="deposit_to" class="form-control">
                            <?php $system = getSalaryHeads('DR');
                                foreach ($system as $key => $ac) {
                                        echo "<option   value='{$ac['id']}'>{$ac['title']}</option>";
                                    
                                }
                               
                            
                            ?>
                        </select>
                    </div>



                    <div class="col-sm-2">
                        <label>Deposit amount</label> <small class="req"> *</small>
                        <br>
                        <input type="number" name="deposit" class="validate[required] form-control" value="">
                    </div>
                    <div class="col-sm-2"><br>
                        <center><button class="btn btn-primary btn-sm"><i class="fa fa-money"></i> Transfer</button></center>
                        
                    </div>
                    <div class="col-sm-2">
                        <br>
                    <button type="button" onclick="ProceedTransaction()" class="btn btn-primary btn-sm "><i class="fa fa-arrow-left"></i> Go Back</button>

                    </div>
                </div>
            </fieldset>
        </form>


        <fieldset>
                <div class="row">
                <div class="col-md-3">

                        <label>Select A/C </label> <small class="req"> *</small>
                        <br>
                        <select id="search_account" name="search_account" class="form-control">
                            <?php $system = getSalaryHeads('DR');
                                foreach ($system as $key => $ac) {
                                        echo "<option   value='".getStaffPersonalAccount($result['id'],$ac['id'])."'>{$ac['title']}</option>";
                                    
                                }
                               
                            
                            ?>
                        </select>
                    </div>
                    <div class="col-md-4">
                    <label>Enter Date Range </label> <small class="req"> *</small>
                        <br>
                        <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; ">
                            <i class="fa fa-calendar"></i>&nbsp;
                            <span></span> <i class="fa fa-caret-down"></i>
                        </div>
                    </div>
                    <div class="col-md-2">
                    <label>Proceed to search ..</label> <small class="req"> *</small>
                        <br>
                        <button onclick="loadTransactions()" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> Statement</button>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                        <legend>Account Statement</legend>
                        <div id="transactions"></div>
                </fieldset>


    </div>


</div>


<script>
    function ProceedTransaction(do_selected='',transaction_to='') {

      if(transaction_to){
        console.log(deposit_to);
        $('#deposit_to option[value="'+transaction_to+'"]').prop('selected', true);
        $('#deposit_to option').each(function() {
        if ($(this).val() !== transaction_to) {
            $(this).prop('disabled', true);
        }
        });

      }

        if(do_selected){


        $('#from_account option[value="'+do_selected+'"]').prop('selected', true);
        $('#from_account option').each(function() {
        if ($(this).val() !== do_selected) {
            $(this).prop('disabled', true);
        }
        });

        }else{
            $('#from_account option').each(function() {
        if ($(this).val() !== do_selected) {
            $(this).prop('disabled', false);
        }
        });
        }




        if ($('#mydiv').hasClass('hide')) {
        $('#mydiv').show();
        $('#openService').hide();
        $('#mydiv').removeClass('hide')
       
    }else{
        $('#mydiv').hide();
        $('#mydiv').addClass('hide');
        $('#openService').show();
    }
        
    }


    $('#deposit_fund_form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            if(confirm('Are you sure you want to deposit?')) {
            var formData = new FormData(this); // Create FormData object
            Loader(true, "Searhing Students ");
            $.ajax({
                type: 'POST',
                url: '<?= base_url() . 'admin/payroll/transferNow'; ?>', // Get the form's action attribute
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


        function loadTransactions() {
        var datarange = $('#reportrange span').html();
        console.log(datarange);
        $.post('<?= base_url('admin/payroll/loadTransactions'); ?>', {
            account_id: $("#search_account").val(),
            staff_id: '<?=$result['id'];?>',
            title: $("#search_account option:selected").text(),
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