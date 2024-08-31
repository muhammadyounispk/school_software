<div class="container">
    <style>
        th:nth-child(2),
        td:nth-child(2) {
            position: sticky;
            left: 0;
            z-index: 1;
            width: 300px;
            background-color: white;
        }
    </style>
    <form role="form" action="<?php echo site_url('FeeManagement') ?>" method="post" class="" id="search_fee_form2">
    <div class="row">
        <div class="col-md-12">
        <button class="btn btn-primary btn-sm pull-right" style="margin-bottom: 10px;"><i class="fa fa-check"></i> Update Fees</button>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-primary">
                <div class="box-body" style="overflow: auto;">
                    
                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr style="background-color: pink;">
                                    <th>Sr</th>
                                    <th width="5%">Name</th>
                                    <th>Father Name</th>
                                    <th>Phone</th>
                                    <th>Class/Section</th>
                                    <th>Arrears</th>
                                    <?php
                                    $fees = getFeeAccounts();
                                    foreach ($fees as $key => $fee) {
                                    ?>
                                        <th>
                                            <?= $fee['title']; ?><br><br>
                                            <input class="header-input" data-index="<?= $key; ?>" style="width: 100px;color:black">
                                        </th>
                                    <?php
                                    } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $sr = 1;
                                foreach ($students as $key => $student) {
                                    $id = $student['student_id'];
                                ?>

                                    <tr>
                                        <td><?= $sr; ?>
                                            <input hidden name="student[]" value="<?= $id; ?>">
                                        </td>
                                        <td><?= $student['firstname']; ?> <?= $student['lastname']; ?></td>
                                        <td><?= $student['father_name']; ?></td>
                                        <td>
                                    
                                        <input name="fee[<?= $id; ?>][mobile_no]" value="<?= $student['mobileno']; ?>"  >

                                    </td>
                                        <td><?= $student['class']; ?>/<?= $student['section']; ?></td>
                                        <td><input name="fee[<?= $id; ?>][arrears]" value="<?= $student['arrears']; ?>"  ></td>
                                        <?php
                                        $fees = getFeeAccounts();
                                        foreach ($fees as $key => $fee) {

                                            $sql = "SELECT * FROM `students_fee` where accounts_id='{$fee['id']}' and student_id='{$student['student_id']}' ";
                                            $fees = db::getRecord($sql);
                                             $current_value=0;
                                            if (isset($fees['payable_amount'])) {
                                                $current_value=$fees['payable_amount'];

                                            }
                                        ?>
                                            <td>
                                                <input name="fee[<?= $id; ?>][fee_id][]" value="<?= $fee['id']; ?>" hidden style="width: 100px;color:black">
                                                <input name="fee[<?= $id; ?>][fee_title][]" value="<?= $fee['title']; ?>" hidden style="width: 100px;color:black">
                                                <input name="fee[<?= $id; ?>][fee][]" class="fee-input" data-index="<?= $key; ?>" style="width: 100px;color:black" value="<?=$current_value;?>">
                                            </td>
                                        <?php
                                        } ?>
                                    </tr>
                                <?php
                                    $sr++;
                                }
                                ?>
                            </tbody>
                        </table>

                     
                     


                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            // Event listener for header input change
            $('.header-input').on('input', function() {
                var index = $(this).data('index');
                var value = $(this).val();
                $('.fee-input[data-index="' + index + '"]').val(value);
            });
        });


        $(document).ready(function() {
            $('#search_fee_form2').submit(function(e) {
                e.preventDefault(); // Prevent the default form submission
                var formData = new FormData(this); // Create FormData object
                Loader(true, "Searhing Students ");
                $.ajax({
                    type: 'POST',
                    url: '<?= base_url() . 'FeeManagement/bulkFeeUpdate'; ?>', // Get the form's action attribute
                    data: formData, // Send FormData object
                    contentType: false, // Prevent jQuery from setting content type
                    processData: false, // Prevent jQuery from processing data
                    success: function(response) {
                        var d = JSON.parse(response);

                        if (d.code == 200) {
                            successMsg(d.message);
                            LoadHomeNow();
                            $('#fancyboxmodel').modal('toggle').modal('hide');
                        } else if (d.code == 201) {
                            errorMsg(d.message);
                        } else if (d.code == 202) {
                            successMsg(d.message);
                        }



                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText); // Log any errors to the console
                        Loader(false, "Saving Information");
                    }
                });


            });


        });
    </script>