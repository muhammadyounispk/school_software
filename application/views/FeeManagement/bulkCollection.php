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


   
    <form role="form" action="<?php echo site_url('FeeManagement') ?>" method="post" class="validate" id="search_fee_form2">
    <div class="row">
                                            <div class="col-md-12">
                                                 <label><input type="checkbox" name="alert" checked> Send SMS/Whatsapp</label>

                                                </div>
                                        </div>    
    <div class="row">
            <div class="col-md-12">
                <input  name="fee_month" hidden value="<?php echo $fee_month; ?>" />
                <label>Deposit to</label> <small class="req"> *</small>
                <select  name="deposit_to">
                    <?php $system = getSystemAccountsForFee();
                    $dropdown = [];
                    foreach ($system as $key => $sys_ac) {
                        $dropdown[$sys_ac['category']][$sys_ac['id']] = $sys_ac['title'];
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
                <button class="btn btn-primary btn-sm pull-right" style="margin-bottom: 10px;"><i class="fa fa-check"></i> Save Fee</button>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-body" style="overflow: auto;">

                        <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr style="background-color: pink;">
                                    <th>Action</th>
                                    <th>Sr</th>

                                    <th width="5%">Name</th>
                                    <th>Father Name</th>
                                    <th>Phone</th>
                                    <th>Class/Section</th>
                                    <?php
                                    $fees = getFeeAccounts();
                                    foreach ($fees as $key => $fee) {
                                    ?>
                                        <th>
                                            <?= $fee['title']; ?><br><br>

                                        </th>
                                    <?php
                                    } ?>
                                    <th>Fee</th>
                                    <th>Arrears</th>
                                    <th>Total</th>
                                    <th>Set Paid</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $sr = 1;
                                foreach ($students as $key => $student) {
                                    $id = $student['student_id'];
                                    $total = $student['fee'] + $student['arrears'];
                                    $fee = explode("-", $fee_month);
                                    $fee_month = $fee[1];
                                    $fee_year = $fee[0];
                                    $sql = "SELECT* FROM transactions where student_id=$id and month='" . $fee_month  . "' and  year='" . $fee_year  . "'";
                                    $transaction = db::getRecord($sql);
                                   if(!$transaction){

                                ?>

                                    <tr>
                                        <td><input type="checkbox" name="student[]" value="<?= $id; ?>"></td>
                                        <td><?= $sr; ?>

                                        </td> 
                                        <td><?= $student['firstname']; ?> <?= $student['lastname']; ?></td>
                                        <td><?= $student['father_name']; ?></td>
                                        <td><?= $student['guardian_phone']; ?></td>
                                        <td><?= $student['class']; ?>/<?= $student['section']; ?></td>
                                        <?php
                                        $fees = getFeeAccounts();
                                        foreach ($fees as $key => $fee) {

                                            $sql = "SELECT * FROM `students_fee` where accounts_id='{$fee['id']}' and student_id='{$student['student_id']}' ";
                                            $fees = db::getRecord($sql);
                                            $current_value = 0;
                                            if (isset($fees['payable_amount'])) {
                                                $current_value = $fees['payable_amount'];
                                            }
                                        ?>
                                            <td>

                                                <?= $current_value; ?>
                                            </td>
                                        <?php
                                        } ?>
                                        <td><?= $student['arrears']; ?></td>
                                        <td><?= $student['fee']; ?></td>
                                        <td><?= $total; ?></td>
                                        <td>
                                            <input class="validate[required]" name="paid[<?= $id; ?>]">
                                            <input value="<?= $total; ?>" hidden class="validate[required]" name="total[<?= $id; ?>]">
                                        </td>
                                    </tr>
                                <?php
                                    $sr++;
                                } 

                            }
                                ?>
                            </tbody>
                        </table>
                        <div id="res"></div>





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
                url: '<?= base_url() . 'FeeManagement/bulkFeeCollectionSave'; ?>', // Get the form's action attribute
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
                        LoadHomeNow();
                        $('#fancyboxmodel').modal('toggle').modal('hide');
                    } else if (d.code == 202) {
                        successMsg(d.message);
                        LoadHomeNow();
                        $('#fancyboxmodel').modal('toggle').modal('hide');
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