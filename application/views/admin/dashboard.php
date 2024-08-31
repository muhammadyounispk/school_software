<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<script type="text/javascript" src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>

<style type="text/css">
    .borderwhite {
        border-top-color: #fff !important;
    }

    .box-header>.box-tools {
        display: none;
    }

    .sidebar-collapse #barChart {
        height: 100% !important;
    }
</style>
<div class="content-wrapper" style="min-height: 946px;">
    <section class="content">
        <div class="">

            <?php if ($mysqlVersion && $sqlMode && strpos($sqlMode->mode, 'ONLY_FULL_GROUP_BY') !== FALSE) { ?>
                <div class="alert alert-danger">
                    Smart School may not work properly because ONLY_FULL_GROUP_BY is enabled, consult with your hosting provider to disable ONLY_FULL_GROUP_BY in sql_mode configuration.
                </div>
            <?php } ?>

            <?php


            $show = false;
            $role = $this->customlib->getStaffRole();
            $role_id = json_decode($role)->id;
            foreach ($notifications as $notice_key => $notice_value) {

                if ($role_id == 7) {
                    $show = true;
                } elseif (date($this->customlib->getSchoolDateFormat()) >= date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($notice_value->publish_date))) {
                    $show = true;
                }
                if ($show) {
            ?>

                    <div class="dashalert alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="alertclose close close_notice" data-dismiss="alert" aria-label="Close" data-noticeid="<?php echo $notice_value->id; ?>"><span aria-hidden="true">&times;</span></button>

                        <a href="<?php echo site_url('admin/notification') ?>"><?php echo $notice_value->title; ?></a>
                    </div>

            <?php
                }
            }
            ?>

        </div>
        <style>
            .card {
                width: 300px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgb(1 3 16);
                border-radius: 8px;
                overflow: hidden;
            }

            .card-header {
                background-color: #3F0E6E;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            .card-body {
                padding: 20px;
                text-align: center;
            }

            .student-count {
                font-size: 25px;
                font-weight: bold;
            }

            .subtitle {
                font-size: 18px;
                color: #666;
            }

            .single-chart {
                width: 33%;
                justify-content: space-around;
            }

            .circular-chart {
                display: block;
                margin: 10px auto;
                height: 188px;
            }

            .circle-bg {
                fill: none;
                stroke: #eee;
                stroke-width: 3.8;
            }

            .circle {
                fill: none;
                stroke-width: 2.8;
                stroke-linecap: round;
                animation: progress 1s ease-out forwards;
            }

            @keyframes progress {
                0% {
                    stroke-dasharray: 0 100;
                }
            }

            .circular-chart.orange .circle {
                stroke: #ff9f00;
            }

            .circular-chart.green .circle {
                stroke: #4CC790;
            }

            .circular-chart.blue .circle {
                stroke: #3c9ee5;
            }

            .percentage {
                fill: #666;
                font-family: sans-serif;
                font-size: 0.5em;
                text-anchor: middle;

            }

            .sub_head_show_at {
                text-align: center;
                font-size: 21px;
            }
        </style>
        <?php

        $student_total = db::getCell("SELECT count(*) from students where is_active='yes' and school_id=" . getSchoolID());
        $families = db::getCell("SELECT count(*) FROM `guardians` WHERE school_id=" . getSchoolID());
        $families_this_month = db::getCell("SELECT count(*) FROM `guardians` WHERE reg_date between '" . date('Y-m-01') . "' and '" . date('Y-m-t') . "' and school_id=" . getSchoolID());
        $student_total_this_month = db::getCell("SELECT count(*) from students where is_active='yes' and created_at between '" . date('Y-m-01') . "' and '" . date('Y-m-t') . "'  and school_id=" . getSchoolID());

        $student_total_disabled = db::getCell("SELECT count(*) from students where is_active='no' and school_id=" . getSchoolID());
        $student_total_disabled_this_month = db::getCell("SELECT count(*) from students where is_active='no' and created_at between '" . date('Y-m-01') . "' and '" . date('Y-m-t') . "' and  school_id=" . getSchoolID());



        ?>

        <div class="row">
            <div class="col-md-4">
                <div class="card" style="width: 100%;">
                    <div class="card-header">
                        <h2>Students (Active)</h2>
                    </div>
                    <div class="card-body">
                        <div class="student-count"><?= $student_total; ?></div>
                        <div class="subtitle"><i class="fa fa-arrow-up"></i> This Month <?= $student_total_this_month; ?></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 100%;">
                    <div class="card-header">
                        <h2>Student (Discharge)</h2>
                    </div>
                    <div class="card-body">
                        <div class="student-count"><?= $student_total_disabled; ?></div>
                        <div class="subtitle"><i class="fa fa-arrow-up"></i> This month <?= $student_total_disabled_this_month; ?></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="width: 100%;">
                    <div class="card-header">
                        <h2>Families</h2>
                    </div>
                    <div class="card-body">
                        <div class="student-count"><?= $families; ?></div>
                        <div class="subtitle"><i class="fa fa-arrow-up"></i> This month <?= $families_this_month; ?></div>
                    </div>
                </div>
            </div>


        </div>






        <div class="row" style="margin-top: 10px;">

            <div class="col-lg-7 col-md-7 col-sm-12 col60">

                <div class="box box-info borderwhite">
                    <div class="box-header with-border">
                        <h3 class="box-title">Attendance Stats <?= date('d F Y'); ?> </h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="single-chart">
                                    <svg viewBox="0 0 36 36" class="circular-chart green">
                                        <path class="circle-bg" d="M18 2.0845
          a 15.9155 15.9155 0 0 1 0 31.831
          a 15.9155 15.9155 0 0 1 0 -31.831" />
                                        <path class="circle" stroke-dasharray="<?php echo round(getAttendance(1) / $student_total * 100); ?>, 100" d="M18 2.0845
          a 15.9155 15.9155 0 0 1 0 31.831
          a 15.9155 15.9155 0 0 1 0 -31.831" />
                                        <text x="18" y="20.35" class="percentage"><?php echo round(getAttendance(1) / $student_total * 100); ?>% </text>
                                    </svg>
                                </div>
                                <div class="sub_head_show_at"><?= getAttendance(1); ?> <?php echo $this->lang->line('present'); ?></div>
                            </div>
                            <div class="col-md-4">
                                <div class="single-chart">
                                    <svg viewBox="0 0 36 36" class="circular-chart orange">
                                        <path class="circle-bg" d="M18 2.0845
          a 15.9155 15.9155 0 0 1 0 31.831
          a 15.9155 15.9155 0 0 1 0 -31.831" />
                                        <path class="circle" stroke-dasharray="<?php echo round(getAttendance(2) / $student_total * 100); ?>, 100" d="M18 2.0845
          a 15.9155 15.9155 0 0 1 0 31.831
          a 15.9155 15.9155 0 0 1 0 -31.831" />
                                        <text x="18" y="20.35" class="percentage"><?php echo round(getAttendance(2) / $student_total * 100); ?>% </text>
                                    </svg>
                                </div>
                                <div class="sub_head_show_at"><?= getAttendance(2); ?> <?php echo $this->lang->line('absent'); ?></div>
                            </div>

                            <div class="col-md-4">

                                <div class="single-chart">
                                    <svg viewBox="0 0 36 36" class="circular-chart blue">
                                        <path class="circle-bg" d="M18 2.0845
          a 15.9155 15.9155 0 0 1 0 31.831
          a 15.9155 15.9155 0 0 1 0 -31.831" />
                                        <path class="circle" stroke-dasharray="<?php echo round(getAttendance(3) / $student_total * 100); ?>, 100" d="M18 2.0845
          a 15.9155 15.9155 0 0 1 0 31.831
          a 15.9155 15.9155 0 0 1 0 -31.831" />
                                        <text x="18" y="20.35" class="percentage"><?php echo round(getAttendance(3) / $student_total * 100); ?>%</text>
                                    </svg>
                                </div>
                                <div class="sub_head_show_at"><?= getAttendance(3); ?> <?php echo $this->lang->line('leave'); ?></div>


                            </div>
                        </div>












                    </div>


                </div>

            </div><!--./col-lg-7-->
            <script type="text/javascript">
                window.onload = function() {

                    var option = {
                        title: {
                            text: ""
                        },
                        data: [{
                            type: "pie",
                            startAngle: 45,
                            showInLegend: "true",
                            legendText: "{label}",
                            indexLabel: "{label} ({y})",
                            yValueFormatString: "#,##0.#" % "",

                            dataPoints: [
                                <?php $fee_collection = getSystemAccountsForFee();
                                foreach ($fee_collection as $key => $account) {
                                ?> {
                                        label: "<?= $account['title']; ?>",
                                        y: <?= getTotalCredit(getInstAccount($account['id']), date("Y-m-01"), date('Y-m-t')); ?>
                                    },
                                <?php }

                                ?>


                            ]
                        }]
                    };
                    $("#chartContainer").CanvasJSChart(option);

                }
            </script>


            <div class="col-lg-5 col-md-5 col-sm-12 col40">

                <div class="box box-primary borderwhite">
                    <div class="box-header with-border">
                        <h3 class="box-title"><?php echo  "Institute Revenue  - " . $this->lang->line(strtolower(date('F'))) . " " . date('Y');;
                                                ?></h3>
                    </div>


                    <div class="box-body">
                        <div id="chartContainer" style="height: 239px; width: 100%;"></div>


                    </div>

                </div><!--./col-md-6-->

            </div><!--./col-lg-5-->

        </div><!--./row-->

        <div class="row">



            <div class="col-lg-7 col-md-7 col-sm-12 col60">

                <div class="box box-primary borderwhite">
                    <div class="box-header with-border">
                        <h3 class="box-title">Account Balance by Group </h3>

                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>

                    <div class="box-body">



                        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                        <script type="text/javascript">
                            google.charts.load("current", {
                                packages: ['corechart']
                            });
                            google.charts.setOnLoadCallback(drawChart);

                            function drawChart() {
                                var data = google.visualization.arrayToDataTable([
                                    ["Element", "Rs.", {
                                        role: "style"
                                    }],
                                    <?php

                                    $trs = getAccountBalancebyCategory();


                                    if ($trs) {
                                        $sr = 1;
                                        foreach ($trs as $key => $transaction) {
                                    ?>


                                            ["<?= $key; ?>", <?= $transaction; ?>, "#b87333"],

                                    <?php }
                                    } ?>



                                ]);
                                var view = new google.visualization.DataView(data);
                                view.setColumns([0, 1,
                                    {
                                        calc: "stringify",
                                        sourceColumn: 1,
                                        type: "string",
                                        role: "annotation"
                                    },
                                    2
                                ]);

                                var options = {
                                    title: "",
                                    width: 700,
                                    height: 300,
                                    bar: {
                                        groupWidth: "95%"
                                    },
                                    legend: {
                                        position: "none"
                                    },
                                };
                                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                                chart.draw(view, options);
                            }
                        </script>
                        <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
                    </div>

                </div>

            </div><!--./col-lg-7-->


            <div class="col-lg-5 col-md-5 col-sm-12 col40">
                <div class="card" style="width: 100%;height: 144px;">
                    <div class="card-header">
                        <h2>Profit & Loss</h2>
                    </div>
                    <div class="card-body">
                        <div class="student-count"><?= nf(getProfitLoss()); ?></div>
                    </div>
                </div>
                <br>
                <div class="card" style="width: 100%;height: 144px;">
                    <div class="card-header">
                        <h2><?= date("F"); ?> Salaries</h2>
                    </div>
                    <div class="card-body">
                        <div class="student-count"><?= nf(getTotalDebit(getInstAccount(11), date("Y-m-01"), date("Y-m-t"))); ?></div>
                    </div>
                </div>
            </div><!--./col-lg-5-->
          <?php

$data=SoftwareBilling(getSchoolID());

if(!$data['tr']){


?>
                <div class="showAlert" style="padding: 10px;">
                    <div>


                        <h4>Your Plan <?= $data['name']; ?> as <?=$data['duration'];?> Plan Activatedis near to Expire  , Total amount need to pay <?= nf($data['price']); ?> /= </h4>
                        <p>
                            <center>
                                <a class="fancybox btn btn-primary" href="<?= base_url('SoftwareBill/Html'); ?>">Click to Pay now</a>
                            </center>

                        </p>

                    </div>

                </div>

                <?php }?>
            


        </div><!--./row-->













</div>


<script>
    $(document).ready(function() {

        $(document).on('click', '.close_notice', function() {
            var data = $(this).data();
            $.ajax({
                type: "POST",
                url: base_url + "admin/notification/read",
                data: {
                    'notice': data.noticeid
                },
                dataType: "json",
                success: function(data) {
                    if (data.status == "fail") {

                        errorMsg(data.msg);
                    } else {
                        successMsg(data.msg);
                    }

                }
            });
        });
    });
</script>