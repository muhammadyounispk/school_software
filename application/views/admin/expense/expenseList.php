<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-credit-card"></i> <?php echo $this->lang->line('expenses'); ?> <small><?php echo $this->lang->line('student_fee'); ?></small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content bg-white">
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



        <div id="divData"></div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->


<script>
    function loadTransactions() {
        var datarange = $('#reportrange span').html();
        console.log(datarange);
        $.post('<?= base_url('admin/expense/all_rows'); ?>', {
            date_range: datarange
        }, function(data) {
            $('#divData').html(data);
        });
    }

    setTimeout(() => {
        loadTransactions();
    }, 2000);

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
</script>