<div class="content">
    <!-- <style>
        th:nth-child(5),
        td:nth-child(5) {
            position: sticky;
            left: 0;
            z-index: 1;
            width: 300px;
            background-color: white;
        }
    </style> -->
    <dive class="row">

        <div class="col-md-8  " style="
    background: #62bddd;
    padding: 9px;
    display: flex;
    justify-content: center;
">

            <button class="btn btn-primary btn-sm" onclick="window.location='<?= base_url('FeeManagement/exportPaidlist?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'">Paid list</button>
            <button class="btn btn-primary btn-sm" onclick="window.location='<?= base_url('FeeManagement/exportUnPaidlist?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'">unpaid list</button>
            <button class="btn btn-primary btn-sm" onclick="window.location='<?= base_url('FeeManagement/exportDefaulterList?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'">Defaultrer list</button>
            <button class="btn btn-primary btn-sm" onclick="window.location='<?= base_url('FeeManagement/exportDisabledist?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'">Disabled Student Dues</button>
            <button class="btn btn-primary btn-sm" onclick="window.location='<?= base_url('FeeManagement/exportVouchers?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'">3T-Vouchers</button>
            <button class="btn btn-primary btn-sm" onclick="window.location='<?= base_url('FeeManagement/export1TVouchers?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'">1T-Vouchers</button>







        </div>
        <div class="col-md-4 " style="
    background: #62bddd;
    padding: 9px;
    display: flex;
    justify-content: center;
">

            <a href="<?= base_url(); ?>/FeeManagement/collectionStatement" class="fancybox btn btn-primary btn-sm ">Statement </a>
            <a href="<?= base_url(); ?>/FeeManagement/FeeHeads" class="fancybox btn btn-primary btn-sm">F-Head </a>

            <a class="btn btn-primary btn-sm fancybox" href="<?= base_url('FeeManagement/ClosingVoucher?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Closing Voucher</a>


        </div>

    </dive>

    <div class="row">
        <div class="col-lg-9 col-md-3">
            <div class="box box-primary">

                <div class="box-body" style="  overflow-x: auto;height:500px">
                    <a href="<?= base_url('FeeManagement/bulkModification?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'" style="margin-bottom: 10px;" class="btn btn-primary btn-sm  fancybox"><i class="fa fa-pencil"></i> Bulk Fee Mdoification</a>
                    <a href="<?= base_url('FeeManagement/bulkFeeCollection?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'" style="margin-bottom: 10px;" class="btn btn-primary btn-sm  fancybox"><i class="fa fa-money"></i> Bulk Fee Collection</a>
                    <a href="<?= base_url('FeeManagement/collectionByParent?auth_request=' . str_encode(json_encode($_REQUEST))); ?>'" style="margin-bottom: 10px;" class="btn btn-primary btn-sm  fancybox"><i class="fa fa-user"></i> Collection by Parent</a>

                    <table class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                        <thead>
                            <tr style="background-color: pink;">
                                <th>Sr</th>
                                <th>Fee A/C#</th>
                                <th>TRs</th>

                                <th>Status</th>

                                <th>Action</th>
                                <th width="5%">Name</th>
                                <th>Father Name</th>
                                <th>Phone</th>
                                <th>Class</th>

                                <?php
                                $fees = getFeeAccounts();
                                foreach ($fees as $key => $fee) {
                                    echo "<th>" . $fee['title'] . "</th>";
                                } ?>
                                <th>Arrears</th>
                                <th>Total</th>
                                <th>Paid</th>
                                <th>Balance</th>



                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $collected = 0;
                            $total = 0;
                            $balance = 0;
                            $pending = 0;
                            $count_paid = 0;
                            $count_unpaid = 0;
                            if ($students) {
                                $sr = 1;
                                foreach ($students as $key => $student) {
                                    $id = $student['student_id'];
                                    $fee_month = getFeeMonth();
                                    $fee_year = getFeeYear();
                                    $sql = "SELECT* FROM transactions where student_id=$id and month='" . getFeeMonth() . "' and  year='" . getFeeYear() . "'";

                                    $transaction = db::getRecord($sql);
                                    $show = false;
                                    if ($is_paid == 'unpaid'  && !$transaction) {
                                        $show = true;
                                    } else if ($is_paid == 'paid' && $transaction) {
                                        $show = true;
                                    } else if ($is_paid == 'all') {
                                        $show = true;
                                    }

                                    if ($show) {

                            ?>

                                        <tr <?php if ($transaction) {
                                                echo "class='paid'";
                                            } else {
                                                echo "class='unpaid'";
                                            } ?>>
                                            <td><?= $sr; ?></td>
                                            <td><?php echo $ac = getFeeAccount($student['student_id']) . "<br>(Rs. " . getOpeningBalance(getFeeAccount($student['student_id'])) . ")"; ?> <br><a target="_blank" href="<?= base_url('/pay/fee/' . getFeeAccount($student['student_id'])); ?>">Online</a></td>
                                            <td> <a href="<?= base_url(); ?>/FeeManagement/transaction?id=<?= $student['id']; ?>&fee_month=<?= $_REQUEST['fee_month']; ?>" class="fancybox "><i class="fa fa-watch"></i>TR</a> </td>
                                            <td>
                                                <?php
                                                if ($transaction) {
                                                    $arr_data = json_decode($transaction['meta']);
                                                    $adjusted = $transaction['payment_from'];
                                                    if ($adjusted == 'ADJUSTMENT') {
                                                        $adjust = true;
                                                    } else {
                                                        $adjust = false;
                                                    }
                                                    $paid_details = array_column($arr_data, 'payable_amount', 'accounts_id'); ?>
                                                    <?php if ($adjust) { ?>ADJ<?php } else { ?> <i class="fa fa-check-circle"></i><?php } ?>
                                            <?php } else { ?>
                                                <span style="color: red;"><i class="fa fa-remove" title="Unpaid"></i></span>
                                            <?php } ?>


                                            </td>

                                            <?php if ($transaction) { ?>

                                                <td width="20%">
                                                    <?php if ($adjust) { ?>-<?php } else { ?> <a href="<?= base_url(); ?>/FeeManagement/deleteFee?auth_id=<?= str_encode($transaction['id']); ?>&student_id=<?= $student['id']; ?>&fee_month=<?= $_REQUEST['fee_month']; ?>" class="fancybox "><i class="fa fa-remove"></i></a>

                                                    <a href="<?= base_url(); ?>/FeeManagement/takeFee?id=<?= $student['id']; ?>&fee_month=<?= $_REQUEST['fee_month']; ?>&print=yes" class="fancybox "><i class="fa fa-print"></i></a>
                                                <?php } ?>

                                                </td>



                                                <td> <?= $student['firstname']; ?> <?= $student['lastname']; ?></td>
                                            <?php } else { ?>

                                                <td width="30%">
                                                    <a href="<?= base_url(); ?>/FeeManagement/takeFee?id=<?= $student['id']; ?>&fee_month=<?= $_REQUEST['fee_month']; ?>" class="fancybox "><i class="fa fa-check-circle"></i></a>
                                                    <a href="<?= base_url(); ?>/student/createPopUp?id=<?= $student['id']; ?>" class="fancybox "><i class="fa fa-pencil"></i></a>
                                                </td>



                                                <td><a href="<?= base_url(); ?>/FeeManagement/takeFee?id=<?= $student['id']; ?>&fee_month=<?= $_REQUEST['fee_month']; ?>" class="fancybox "><?= $student['firstname']; ?> <?= $student['lastname']; ?></a></td>
                                            <?php } ?>
                                            <td><?= $student['father_name']; ?></td>
                                            <td><?= $student['guardian_phone']; ?></td>
                                            <td><?= $student['class']; ?> (<?= $student['section']; ?>)</td>

                                            <?php
                                            if ($transaction) {

                                                $fees = getFeeAccounts();
                                                foreach ($fees as $key => $fee) {
                                                    if (isset($paid_details[$fee['id']])) {
                                                        $payable = $paid_details[$fee['id']];
                                                        echo "<td>" . nf($payable) . "</td>";
                                                    } else {
                                                        echo "<td>0</td>";
                                                    }
                                                }

                                                //
                                                $collected += - ($transaction['amount']);
                                                $balance += $transaction['balance'];
                                                $total += $transaction['total'];
                                                $count_paid++;


                                            ?>


                                                <td> <?= nf($transaction['arrears']); ?></td>
                                                <td><?= nf($transaction['total']); ?></td>
                                                <td><?= nf(-$transaction['amount']); ?></td>
                                                <td><?= nf($transaction['balance']); ?></td>









                                            <?php  } else {

                                                $fees = getFeeAccounts();

                                                foreach ($fees as $key => $fee) {
                                                    $sql = "SELECT * FROM `students_fee` where accounts_id='{$fee['id']}' and student_id='{$student['student_id']}' ";
                                                    $fees = db::getRecord($sql);

                                                    if (isset($fees['payable_amount'])) {
                                                        echo "<td>{$fees['payable_amount']}</td>";
                                                    } else {
                                                        echo "<td>0</td>";
                                                    }
                                                }
                                                $pending += $student['fee'] + $student['arrears'];
                                                $total += $pending;
                                                $count_unpaid++;

                                            ?>

                                                <td> <?= $student['arrears']; ?></td>
                                                <td><?= $student['fee'] + $student['arrears']; ?></td>
                                                <td><?= $transaction['amount'] > 0 ? $transaction['amount'] : '-'; ?></td>
                                                <td><?= $transaction['total'] > 0 ? $transaction['total'] + $student['arrears'] : '-'; ?></td>




                                        </tr>
                        <?php }
                                            $sr++;
                                        }
                                    }
                                } ?>

                        </tbody>
                    </table>





                </div>
            </div>

        </div>
        <div class="col-lg-3 col-md-3">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-check-circle"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Collected</span> (No. of Students: <?= $count_paid; ?>)
                    <span class="info-box-number">Rs. <?= nf($collected); ?></span>
                </div>
            </div>

            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-remove"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Pending</span>(No. of Students: <?= $count_unpaid; ?>)
                    <span class="info-box-number">Rs. <?= nf($pending); ?> </span>
                </div>
            </div>
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-percent"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Progress</span>Fee Collection Performamce
                    <span class="info-box-number"> <?= round($collected / $total * 100, 2); ?>% </span>

                </div>
            </div>

            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-arrow-right"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Carray forward</span>*Payable in Next Month
                    <span class="info-box-number">Rs. <?= nf($balance + $pending); ?> </span>

                </div>
            </div>


        </div>


    </div>

</div>