<div class="container">
    <?php
    $id=str_decode($_GET['auth_id']);
    $sql="select* from transactions where id='".$id."'";

     $tr=db::getRecord($sql);

  
    ?>
<div class="row">
        <div class="col-lg-12 col-md-3">
            <div class="box box-primary">

                <div class="box-body" style="  overflow-x: auto;height:500px">
                <form role="form" action="<?php echo site_url('FeeManagement') ?>/confirmDelete" method="post" class="validate" id="deposit_fee_form">
                                   <input hidden name="auth_id" value="<?=$auth_id;?>">
                                  
                            
                                        <div class="row">
                                       <div class="col-md-10">
                                       <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-check"></i></span>
                <div class="info-box-content">
                   <h1>Un paid Student will be bound to pay their fee in next month , amount will be consider as  arrear</hq>

                   
  
                </div>
            </div>
                                        
                                       </div>
                                        <div class="col-sm-2">
                                        <br>
                                        <button class="btn btn-primary btn-sm">Confirm Close voucher</button>
                                        </div>

                                        </div>
                                       
                                     
                                     


                                    </form>
              
                      





              </div>
            </div>

        </div>
        <div class="col-lg-3 col-md-3">
          
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
                    url: '<?= base_url() . 'FeeManagement/ProceedClosing'; ?>', // Get the form's action attribute
                    data: formData, // Send FormData object
                    contentType: false, // Prevent jQuery from setting content type
                    processData: false, // Prevent jQuery from processing data
                    success: function(response) {

                        var data = JSON.parse(response);

if (data.code == 200) {
    
    successMsg(data.message);
   
    $('#fancyboxmodel').modal('toggle').modal('hide');
    


} else {
    errorMsg(data.message);
}
                     


                       LoadHomeNow();
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText); // Log any errors to the console
                        Loader(false, "Saving Information");
                    }
                });
            

        });


    });
</script>