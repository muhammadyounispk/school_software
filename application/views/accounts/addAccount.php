<div class="row">
    <div class="col-lg-12 col-12">
        <div class="box box-primary">
            <div class="box-body" style="  overflow-x: auto;height:500px">
                <form role="form" action="<?php echo site_url('Accounts') ?>/deposit_fund_form" method="post" class="validate" id="deposit_fund_form">
                  
                    <?php
                    echo $this->customlib->getCSRF(); ?>
                    <fieldset>
                        <legend>Create New Account</legend>
                        <div class="row">

                        <div class="col-md-2">
                            <label>Enter Account Title: </label> <small class="req"> *</small>
                            <br>
                            <input type="text" name="title" id="title" class="form-control" placeholder="Enter Account Title">
                        </div>

                        <div class="col-sm-3">
                            <label>Category</label> <small class="req"> *</small>
                            <br>
                            <select name="category" class=" form-control">
                                <option><?=$group;?></option>
                                
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label>Can Add Hard Cash</label> <small class="req"> *</small>
                            <br>
                            <select name="is_cash_transfer" class=" form-control">
                                <option value="0">No</option>
                                <option value="1">Yes</option>
                               
                                
                            </select>
                        </div>
                        
                       

                        

                      
                        <div class="col-sm-2"><br>
                            <center><button class="btn btn-primary btn-sm"><i class="fa fa-check"></i> Create Account</button></center>
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
            if(confirm('Are you sure you want to Add Account?')) {
            var formData = new FormData(this); // Create FormData object
            Loader(true, "Adding Account ");
            $.ajax({
                type: 'POST',
                url: '<?= base_url() . 'Accounts/saveAccount'; ?>', // Get the form's action attribute
                data: formData, // Send FormData object
                contentType: false, // Prevent jQuery from setting content type
                processData: false, // Prevent jQuery from processing data
                success: function(response) {
                    var data = JSON.parse(response);
                    console.log(response);
                     if (data.code == 200) {
                         successMsg(data.message);
                         $("#deposit_fund_form").trigger("reset");
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

   
   
</script>

