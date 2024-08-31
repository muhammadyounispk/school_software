<?php
foreach ($childs as $key => $child) {

?>
    <div class="row" style="border-bottom: 1px solid #ddd;">
        <div class="col-md-2">
            <img id="imagePreview" class="profile-user-img img-responsive " src="<?= base_url() . $child['image'] ?>" alt="User profile picture">
        </div>
        <div class="col-md-6">
            <div style="font-size:21px;">
                <?= $child['firstname']; ?> <?= $child['lastname']; ?><br>
                <small>(Fee A/C:<?=getFeeAccount($child['id']);?>)</small>
            </div>
            <ul>
                <li>Class: <?= $child['class']; ?> </li>
                <li>Section: <?= $child['section']; ?> </li>
                <li>Admission No: <?= $child['admission_no']; ?> </li>
                <li>Roll No: <?= $child['roll_no']; ?> </li>

            </ul>

        </div>

            <div class="col-md-4">

               
                <div class="row">

                    <div class="col-md-8 col-sm-6">
                        <div class="info-box">
                            <div class="col-md-12 col-sm-12">
                              

                                    <span class="info-box-icon bg-green"><i class="fa fa-money"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Total Fee</span>
                                        <span class="info-box-number">Rs. <?= $child['fee']; ?></span>
                                    </div>

                              
                            </div>
                        </div>
                        <ul style="display: flex; list-style:none">
                    <li> <a href="<?= base_url(); ?>/student/createPopUp?id=<?= $child['id']; ?>" class="btn btn-primary btn-sm fancybox"><i class="fa fa-pencil"></i> Update</a></li>
                    <li> <a href="<?= base_url(); ?>/student/deleteStudent?id=<?= $child['id']; ?>" style="margin-left: 3px;" class="btn btn-primary btn-sm fancybox"><i class="fa fa-remove"></i> Delete</a></li>


                </ul>

                    </div>

                </div>


            </div>
            </div>

        <?php
    }



        ?>