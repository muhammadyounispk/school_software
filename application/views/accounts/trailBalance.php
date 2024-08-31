<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<style type="text/css">
    @media print {

        .no-print,
        .no-print * {
            display: none !important;
        }
    }
</style>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?> <small><?php echo $this->lang->line('student1'); ?></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
            <button type="button" style="margin-right: 48px;"   class="btn btn-primary btn-sm pull-right exportPDF" data-title="Profit & Loss Report" data-pdfname="profit-loss-report.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>

            </div>
            <div class="pdf_content">
            <?php
            $currency_symbol = $this->customlib->getSchoolCurrencyFormat();
            ?>

            <div class="row">

                <table border="1" width="90%" align="center" style="border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th>Sr</th>
                            <th>Title</th>
                            <th>Balance</th>

                        </tr>
                    </thead>
                    <tbody>

                        <?php $system = getSystemAccounts();
                        $dropdown = [];

                        foreach ($system as $key => $sys_ac) {

                            $dropdown[$sys_ac['category']][$sys_ac['id']]  = array('title' => $sys_ac['title'], 'is_cash_transfer' => $sys_ac['is_cash_transfer']);;
                        }
                        $ac_data = array();
                        foreach ($dropdown as $group => $drp) {
                            $balance = 0;
                        ?>

                            <tr>
                                <th colspan="4">
                                    <center><?= $group; ?></center>
                                </th>

                            </tr>





                            <?php
                            $sr = 1;
                            foreach ($drp as $key => $title) {
                                $bal = getOpeningBalance(getInstAccount($key));
                                $balance += $bal;
                                $ac_data[$group] += $bal;

                            ?>

                                <tr>
                                    <td><?= $sr; ?></td>
                                    <td><?= $title['title']; ?></td>
                                    <td>
                                        <?= $currency_symbol . " " . $bal; ?>
                                    </td>

                                </tr>



                            <?php
                                $sr++;
                            }
                            ?>

                            <tr>
                                <th colspan="2">
                                    <div style="text-align: right;margin-right:12px">Total</div>
                                </th>
                                <th><?= nf($balance); ?></th>
                            </tr>

                        <?php
                        }
                        ?>

                </table>
                <br>

                <table border="1" width="90%" align="center" style="border-collapse: collapse;">
                    <tr>
                        <th>Sr</th>
                        <th>Group</th>
                        <th>Balance</th>
                    </tr>
                    <?php
                    $sr = 1;
                    $profit = 0;
                    foreach ($ac_data as $key => $value) {
                        $profit += $value;
                        echo "
       <tr>
       <td>$sr</td>
       <td>$key</td>
       <td>".nf($value)."</td>
   </tr>";
                        $sr++;
                    }
                    echo "
    <tr>
    
    <td colspan='2'>Profit & Loss </td>
    <th>".nf($profit)."</th>
</tr>";


                    ?>

                </table>

                </di>
            </div><!--./row-->


        </div>
</div><!--./box box-primary -->
</div>
</div>
<div class="row">
    <div class="col-12">
        <div id="listresult"></div>
    </div>
</div>
</section>
</div>