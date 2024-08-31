
    <div class="row">
        <div class="col-lg-11 col-md-11">
            <div class="box box-primary">

                <div class="box-body" style="  overflow-x: auto;height:500px">
                    <?php if ($print != 'yes') { ?>
                        <form role="form" action="<?php echo site_url('FeeManagement') ?>/depostFee" method="post" class="validate" id="deposit_fee_form">


                            <?php
                            echo $this->customlib->getCSRF(); ?>

                            <div class="row">
                                <div class="col-sm-4">
                                  
                                    <label>Fee Title</label> <small class="req"> *</small>
                                    <input class="form-control"  name="fee_title">
                                </div>
                                
                                <div class="col-sm-2">
                                <label>Amount</label> <small class="req"> *</small>
                                    <input class="form-control"  name="amount">
                                </div>
                                <div class="col-sm-2">

                                    <br>
                                    <button class="btn btn-primary btn-sm">Add Fee Head</button>

                                </div>

                            </div>





                        </form>

                    <?php } ?>

                    <hr>
                    <br>




                    <button type="button" class="btn btn-primary btn-sm  exportPDF" data-title="Fee Voucher <?= $_GET['fee_month']; ?>" data-pdfname="fee_voucher.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>

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
                url: '<?= base_url() . 'FeeManagement/AddFeHead'; ?>', // Get the form's action attribute
                data: formData, // Send FormData object
                contentType: false, // Prevent jQuery from setting content type
                processData: false, // Prevent jQuery from processing data
                success: function(response) {
                    var data = JSON.parse(response);

                    if (data.code == 200) {

                        successMsg(data.message);
                     
                        $("#deposit_fee_form").trigger("reset");
                        loadFeeHead();
                        LoadHomeNow ();
                       
                         


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


    function loadFeeHead() {
        $.post('<?= base_url('FeeManagement/tableDataFeeHead'); ?>', {
            student_id: '<?= $student['id']; ?>',
            fee_month: '<?= $_GET['fee_month']; ?>'
        }, function(data) {
            $('#loadVoucher').html(data);
        });

    }

    loadFeeHead();
</script>