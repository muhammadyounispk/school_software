<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
if($this->input->get('date_range')){
    $date_range=$this->input->get('date_range');
    $from=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[0])));
    $to=date('Y-m-d',strtotime(str_replace(' ','', explode("-",$date_range)[1])));
}
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
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-4">
                <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; ">
                    <i class="fa fa-calendar"></i>&nbsp;
                    <span></span> <i class="fa fa-caret-down"></i>
                </div>
            </div>
            <div class="col-md-2">
                <button onclick="loadTransactions()" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> Search</button>
            </div>
            <div class="col-md-3"></div>
        </div>

            <div class="col-md-12">
            <button type="button" style="margin-right: 48px;"  class="btn btn-primary btn-sm pull-right exportPDF" data-title="Profit & Loss Report (<?=$date_range;?>)" data-pdfname="profit-loss-report.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>

            </div>
            <div class="pdf_content">
            <?php
            $currency_symbol = $this->customlib->getSchoolCurrencyFormat();
            ?>

            <div class="row">
                
            <table border="1" width="90%" align="center" style="border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th>Report Name</th>
                            <td>Trail Balance </td>
                            <th>Period Search</th>
                            <td><?=$date_range;?></td>
                            

                        </tr>
                    </thead>
            </table>
            
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
                                $bal = getOpeningBalance(getInstAccount($key),$from,$to);
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


<script>
      function loadTransactions() {
        var datarange = $('#reportrange span').html();
       window.location='?date_range='+datarange;
       
    }

     $(function() {
        var start = moment().subtract(29, 'days');
        var end = moment();
        function cb(start, end) {
            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            opens: 'left',
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);
        cb(start, end);
    });
 


</script>

