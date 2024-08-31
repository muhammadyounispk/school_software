<div class="container">
    <?php
    $id=$_GET['id'];
    $action=$_GET['action'];
    $payable=$_GET['payable'];
    $print=$_GET['print'];
    $auth_id=$_GET['auth_id']; 
    $sql="select* from students where id='".$id."'";

     $student=db::getRecord($sql);
  
    ?>
<div class="row">
        <div class="col-lg-11 col-md-11">
            <div class="box box-primary">

                <div class="box-body" style="  overflow-x: auto;height:500px">
                 <?php if($print!='yes'){?>
                <form role="form" action="<?php echo site_url('FeeManagement') ?>/depostFee" method="post" class="validate" id="deposit_fee_form">
                                   <input hidden name="student_id" value="<?=$student['id'];?>">
                                   <input hidden name="fee_month" value="<?=$_GET['fee_month'];?>">
                                   <input hidden name="action" value="<?=$action;?>">
                                   <input hidden name="payable" value="<?=$payable;?>">
                                   <input hidden name="auth_id" value="<?=$auth_id;?>">
                                  
                                   <?php
                                        echo $this->customlib->getCSRF(); ?>
                                        <div class="row">
                                            <div class="col-md-12">
                                                 <label><input type="checkbox" name="alert" checked> Send SMS/Whatsapp</label>
                                                 <label><input type="checkbox"  name="take_print" checked>Take Print</label>

                                                </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label><input name="payment_from" type="radio" value="by_hand" checked> By Hand Deposit </label>
                                                <label><input name="payment_from" type="radio" value="online"> Online Depoit </label>
                                                <label><input name="payment_from" type="radio" value="account" > Pay  Student Account  # <?php echo $ac=getFeeAccount($student['id']); ;?> (Balance: <?=nf(getOpeningBalance($ac));?>) </label><br>
                                            
                                            <label>Account Title</label> <small class="req"> *</small>
                                            <input name="account_tile" value="<?=$student['firstname'];?>">

                                            
                                               
                                            <label>Deposit to</label> <small class="req"> *</small>
                                        <select name="deposit_to">
                                            <?php $system=getSystemAccountsForFee();
                                            $dropdown=[];
                                            foreach ($system as $key => $sys_ac) {
                                                $dropdown[$sys_ac['category']][$sys_ac['id']]=$sys_ac['title'];
                                            }

                                            foreach ($dropdown as $group => $drp) {
                                                echo "<optgroup label='$group'>";
                                                foreach ($drp as $key => $title) {
                                                   
                                                        echo "<option  value='{$key}'>{$title}</option>";
                                                   
                                                   
                                                }
                                                echo "</optgroup>";
                                                
                                            }

                                           
                                            ?>

                                        </select>
                                 

                                           
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                        <label>Total</label> <small class="req"> *</small>
                                            <input readonly name="total" value="<?=$payable>0 ? $payable: $student['fee']+$student['arrears'];?>">
                                        </div>
                                        <div class="col-sm-2">
                                        <label>Deposit payable</label> <small class="req"> *</small>
                                            <input name="deposit" class="validate[required]" value="<?=$payable>0 ? $payable: $student['fee']+$student['arrears'];?>">
                                        </div>

                                        <div class="col-sm-2">
                                       
                                        <br>
                                        <button class="btn btn-primary btn-sm">Deposit Fee</button>
                                        
                                        </div>

                                        </div>
                                       
                                     
                                     


                                    </form>

                                    <?php }?>

                                    <hr>
                                    <br>
              
                      


                                    <button type="button"    class="btn btn-primary btn-sm  exportPDF" data-title="Fee Voucher <?=$_GET['fee_month'];?>" data-pdfname="fee_voucher.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>

                                    <div id="loadVoucher" class="pdf_content"></div>

              </div>
            </div>

        </div>
        <div class="col-lg-1 col-md-1">

       
          
        </div>
    </div>

</div>


</div>

<script>
    $(document).ready(function() {
        $('#deposit_fee_form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Create FormData object
                Loader(true, "Searhing Students ");
                $.ajax({
                    type: 'POST',
                    url: '<?= base_url() . 'FeeManagement/depositFee'; ?>', // Get the form's action attribute
                    data: formData, // Send FormData object
                    contentType: false, // Prevent jQuery from setting content type
                    processData: false, // Prevent jQuery from processing data
                    success: function(response) {
                        var data = JSON.parse(response);

                    if (data.code == 200) {
                        
                        successMsg(data.message);
                        LoadPrintVoucher();
                        $("#deposit_fee_form").trigger("reset");
                        LoadHomeNow();
                        

       
      
  
    setTimeout(() => {
        $('#fancyboxmodel').modal('toggle').modal('hide');
        if (data.take_print) {
            $('.exportPDF').click();
            successMsg("Vocuher is downloading ...");
            console.log("Checked");
        }else{
            console.log("No Checked");
        }
    }, 3000);


                    } else {
                        errorMsg(data.message);
                    }
                       
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText); // Log any errors to the console
                        Loader(false, "Saving Information");
                    }
                });
            

        });


    });


    function LoadPrintVoucher() {
        $.post('<?=base_url('FeeManagement/printVoucher');?>',{student_id:'<?=$student['id'];?>',fee_month:'<?=$_GET['fee_month'];?>'}, function (data) {
            $('#loadVoucher').html(data);
        });
        
    }

    LoadPrintVoucher();
</script>