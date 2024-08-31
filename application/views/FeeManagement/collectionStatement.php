<div class="container">

    <div class="row">
        <div class="col-lg-12 col-12">
            <div class="box box-primary">
                <div class="box-body" >


                    <div class="row">
                        <div class="col-md-3">
                            <label>Select A/C: </label> <small class="req"> *</small>
                            <select name="account" class="form-control">
                                <?php $system = getSystemAccounts();
                                $dropdown = [];
                                foreach ($system as $key => $sys_ac) {
                                    $dropdown[$sys_ac['category']][$sys_ac['id']] = $sys_ac['title'];
                                }

                                foreach ($dropdown as $group => $drp) {
                                    echo "<optgroup label='$group'>";
                                    foreach ($drp as $key => $title) {
                                        if ($key == 1) {
                                            echo "<option  value='{$key}'>{$title}</option>";
                                        } else {
                                            echo "<option disabled value='{$key}'>{$title}</option>";
                                        }
                                    }
                                    echo "</optgroup>";
                                }


                                ?>

                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>Select Date Range</label> <small class="req"> *</small>
                            <br>
                            <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; ">
                                <i class="fa fa-calendar"></i>&nbsp;
                                <span></span> <i class="fa fa-caret-down"></i>
                            </div>
                        </div>

                        <div class="col-md-3">

                            <label>Tr Type</label> <small class="req"> *</small>
                            <br>
                            <select name="tr_type" class=" form-control">
                                <option value="">All Transactions</option>
                                <option value="1">Credit</option>
                                <option value="2">Debit</option>
                            </select>

                        </div>

                        <div class="col-md-2">
                            <br>
                            <button onclick="loadTransactions()" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> Statement</button>
                        </div>


                    </div>

                    <br>


                    <div id="transactions" style="  overflow-x: auto;height:500px"></div>



                </div>


            </div>
        </div>
    </div>


</div>
</div>
</div>
<script>
    function loadTransactions() {
        var datarange = $('#reportrange span').html();
        var selectedValue = $('select[name="account"]').val();
        var account_title = $('select[name="account"] option:selected').text();
        var tr_type = $('select[name="tr_type"]').val();
        $.post('<?= base_url('FeeManagement/loadcollectionStatement'); ?>', {
            account: selectedValue,
            date_range: datarange,
            tr_type: tr_type,
            account_title: account_title,
        }, function(data) {
            $('#transactions').html(data);
        });

    }

    loadTransactions();

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