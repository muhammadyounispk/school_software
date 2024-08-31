<?php
if ($guardian['guardian_cnic']) {
    $fee = db::getCell("SELECT sum(fee) from students where father_cnic='{$guardian['guardian_cnic']}'");
    $total_count = db::getCell("SELECT count(*) from students where father_cnic='{$guardian['guardian_cnic']}'");
} else {
    $fee = 0;
    $total_count = 0;
}




?>



<div class="row" style="margin-left: 10px; padding-top: 10px; margin-right: 10px;background-color:white">
    <form class="validate" id="guardian_form">
        <input style="display: none;" name="id" id="guardian_id" class="form-control" value="<?= $guardian['id']; ?>">
        <div class="col-md-3">
            <div class="box box-primary">
                <div class="box-body">
                    <img id="imagePreview" class="profile-user-img img-responsive img-circle" src="<?= ST_IMG_PATH . $guardian['image']; ?>" alt="User profile picture">
                    <br>


                    <input style="opacity: 1;" id="fileInput" type="file" name="guardian_photo" class="form-control  <?php if (!$guardian['id']) { ?> validate[required]<?php } ?>" value="<?= $guardian['guardian_photo']; ?>">


                    <h3 class="profile-username text-center"><input name="guardian_name" class="form-control validate[required]" value="<?= $guardian['guardian_name']; ?>"></h3>
                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item listnoback">
                            <b>CNIC:</b> <a class="pull-right text-aqua"><input name="guardian_cnic" class="form-control validate[required] cnic" value="<?= $_REQUEST['guardian_cnic']; ?>"></a>
                        </li>
                        <li class="list-group-item listnoback">
                            <b>Phone:</b> <a class="pull-right text-aqua"><input name="guardian_mobileno" class="form-control validate[required] mob" value="<?= $guardian['guardian_mobileno']; ?>"></a>
                        </li>
                        <li class="list-group-item listnoback">
                            <b>Email:</b> <a class="pull-right text-aqua"><input name="guardian_email" class="form-control validate[required]" value="<?= $guardian['guardian_email']; ?>"></a>
                        </li>

                        <li class="list-group-item listnoback">
                            <b>Profession:</b> <a class="pull-right text-aqua"><input name="guardian_profession" class="form-control validate[required]" value="<?= $guardian['guardian_profession']; ?>"></a>
                        </li>
                        <li class="list-group-item listnoback">
                            <b>Caste:</b> <a class="pull-right text-aqua"><input name="caste" class="form-control validate[required]" value="<?= $guardian['caste']; ?>"></a>
                        </li>

                        <li class="list-group-item listnoback">
                            <b>Religion:</b> <a class="pull-right text-aqua"><input name="religion" class="form-control validate[required]" value="<?= $guardian['religion']; ?>"></a>
                        </li>
                        <li class="list-group-item listnoback">
                            <b>Address:</b> <a class="pull-right text-aqua"><input name="address" class="form-control validate[required]" value="<?= $guardian['address']; ?>"></a>
                        </li>


                        <li class="list-group-item listnoback">
                            <b>Balance:</b> <a class="pull-right text-aqua"><input name="balance" class="form-control " readonly value="<?= $guardian['balance']; ?>"></a>
                        </li>


                    </ul>
                    <div class="pull-right">
                        <button class="btn btn-sm btn-primary validate_btn" type="submit" id="btn_guardian"><i class="fa fa-save"></i> <? if ($guardian) {
                                                                                                                                            echo "Update Guardian ";
                                                                                                                                        } else {
                                                                                                                                            echo "Save Guardian";
                                                                                                                                        } ?></button>

                    </div>



    </form>

</div>
</div>
</div>
<div class="col-md-9">
    <div class="row">

        <div class="col-md-4 col-sm-6">
            <div class="info-box">

                <span class="info-box-icon bg-aqua"><i class="fa fa-user"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Student</span>
                    (Total No. of Childs)
                    <span class="info-box-number"><?= $total_count; ?></span>
                </div>

            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="info-box">

                <span class="info-box-icon bg-green"><i class="fa fa-money"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Total Fee</span>
                    (Payable Every Month)
                    <span class="info-box-number">Rs. <?= $fee; ?></span>
                </div>

            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="info-box">

                <span class="info-box-icon bg-red"><i class="fa fa-credit-card"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Balance </span> (Fee A/C: <?=getFatherAccount($guardian['id']);?>)
                    <span class="info-box-number">Rs.<?= empty($guardian['balance']) ? 0 :$guardian['balance'] ; ?> </span>
                    
                </div>

            </div>
        </div>



    </div>

    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">
              <?php if($guardian['guardian_name']){?>  
             <span id=title_here>  Guardian Name: <?= $guardian['guardian_name']; ?></span>  </h3>  (Last Updated: <?= $guardian['last_updated']; ?>)
             
            <div style="float:right" id="main_home">
                <a type="button" href="<?= base_url(); ?>/student/createPopUp" data-fancybox='Admission Form' class="btn btn-primary fancybox"><i class="fa fa-user"></i> New Admission</a>
            </div>
            <?php }?>
            <div style="float:right ; display:none" id="goback">
                <button type="button" onclick="showMain()" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Go Back</button>
                <button type="button" onclick="admissionForm()" class="btn btn-primary"><i class="fa fa-user"></i> New Admission</button>

            </div>
        </div>



        <div class="box-body">

            <?php if (!$guardian['id']) { ?>
                <img style="height: 180px;" src="<?= DIGIS_HTTP . 'reg_guardian.png'; ?>">
            <?php } ?>
            <div id="inner_result"></div>
        </div>
    </div>
</div>

</div>
</div>



<script>
    LoadFunctionality();
    $(document).ready(function(e) {
        $(".cnic").inputmask('99999-9999999-9');
        $(".mob").inputmask('+\\923999999999');
        LoadValidationEngine();




    });
</script>

<script>
    $("#search_guardian").click(function() {



    });


    function guardian_request() {
        var formData = $("#parent_form").serialize();
        // Send AJAX request
        Loader(true, "Loading Guardian Profile...");
        $.ajax({
            url: '<?= base_url(); ?>Guardians/search',
            type: 'POST',
            data: formData,
            success: function(response) {
                $("#result").html(response);

                // Loader(false);


            },
            error: function(xhr, status, error) {
                console.log("error");
                Loader(false, "");
            }
        });
    }

    function admissionForm() {
        showSub();
        setMyTitle('Admission Form');
        var formData = $("#parent_form").serialize();
        // Send AJAX request
        Loader(true, "Loading Admission form...");
        $.ajax({
            url: '<?= base_url(); ?>Guardians/admission_form',
            type: 'POST',
            data: formData,
            success: function(response) {
                $("#inner_result").html(response);
                Loader(false);

            },
            error: function(xhr, status, error) {
                console.log("error");
                Loader(false, "");
            }
        });
    }

    function LoadHomeNow() {

        // Send AJAX request
        Loader(true, "Loading Students..");
        $.ajax({
            url: '<?= base_url(); ?>Guardians/StudentListByGuardian?cnic=<?= $_REQUEST['guardian_cnic']; ?>',
            type: 'POST',
            data: $("#parent_form").serialize(),
            success: function(response) {
                $("#inner_result").html(response);
                Loader(false);

            },
            error: function(xhr, status, error) {
                console.log("error");
                Loader(false, "");
            }
        });
    }

    function setMyTitle(title = '') {
        $("#title_here").html(title);
    }

    function showMain() {
        setMyTitle("Students")
        //LoadHomeNow();
        $("#main_home").show();
        $("#goback").hide();
    }

    function showSub() {
        $("#main_home").hide();
        $("#goback").show();
    }


    $(document).ready(function() {
        $('#fileInput').change(function() {
            var file = this.files[0];
            if (file) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#imagePreview').attr('src', e.target.result);
                    $('#imagePreview').show(); // Display the image
                }

                reader.readAsDataURL(file);
            }
        });
    });



    $(document).ready(function() {
        $('#guardian_form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Create FormData object

            if ($(this).validationEngine('validate')) {
                Loader(true, "Saving Information");
                $.ajax({
                    type: 'POST',
                    url: '<?= base_url() . 'Guardians/create'; ?>', // Get the form's action attribute
                    data: formData, // Send FormData object
                    contentType: false, // Prevent jQuery from setting content type
                    processData: false, // Prevent jQuery from processing data
                    success: function(response) {
                        var d = JSON.parse(response);

                        if (d.status == 200) {
                            successMsg(d.message);
                            $("#search_guardian").trigger('click');



                        } else if (d.status == 201) {
                            errorMsg(d.message);


                        } else if (d.status == 202) {
                            successMsg(d.message);
                        }

                        Loader(false, "Saving Information");

                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText); // Log any errors to the console
                        Loader(false, "Saving Information");
                    }
                });
            } else {
                errorMsg("Please fill form correctly");
            }

        });


    });
</script>