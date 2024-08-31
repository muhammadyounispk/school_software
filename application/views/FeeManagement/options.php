<div class="container">
    <?php
   $fee_collection=base_url()."/FeeManagement/takeFee?".$_SERVER['QUERY_STRING'];

    ?>
    <div class="row">
        <div class="col-lg-9 col-md-3">
            <div class="box box-primary">
                <div class="box-body" style="  overflow-x: auto;height:500px">

                    <div class="row">
                        <div class="col-md-4">

                            <div class="info-box">
                                <a class="fancybox" href="<?=$fee_collection;?>">


                                    <span class="info-box-icon bg-green"><i class="fa fa-money"></i></span>Collect Fee
                                    <div class="info-box-content">
                                        <span class="info-box-text">Monthly Fees Collection</span>
                                        <span class="info-box-number">Rs.500</span>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </div>



                </div>
            </div>

        </div>
        <div class="col-lg-3 col-md-3">
            <div class="box box-primary">
                <div class="box-body" style="  overflow-x: auto;height:500px">


                </div>
            </div>


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
                    alert(response);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // Log any errors to the console
                    Loader(false, "Saving Information");
                }
            });


        });


    });
</script>