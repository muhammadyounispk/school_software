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
            <div id="loadDataInto"></div>

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
<script type="text/javascript">
    loadChartAccount();

    function loadChartAccount() {

        $.post('<?= base_url('Accounts/loadChartSheet'); ?>', {}, function(data) {
            console.log(data);
            $('#loadDataInto').html(data);
        });
    }

    function getSectionByClass(class_id, section_id) {
        if (class_id != "" && section_id != "") {
            $('#section_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        }
    }
    $(document).ready(function() {
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section_id') ?>';
        getSectionByClass(class_id, section_id);
        $(document).on('change', '#class_id', function(e) {
            $('#section_id').html("");
            var class_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "sections/getByClass",
                data: {
                    'class_id': class_id
                },
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, obj) {
                        div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        });
    });
    $(document).ready(function() {
        $('#search_fee_form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Create FormData object
            Loader(true, "Searhing Students ");
            $.ajax({
                type: 'POST',
                url: '<?= base_url() . 'FeeManagement/searchbyform'; ?>', // Get the form's action attribute
                data: formData, // Send FormData object
                contentType: false, // Prevent jQuery from setting content type
                processData: false, // Prevent jQuery from processing data
                success: function(response) {
                    $("#listresult").html(response);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // Log any errors to the console
                    Loader(false, "Saving Information");
                }
            });
        });
    });

    function LoadHomeNow() {
        $('#search_fee_form').submit();
    }

    function getPaidRowsHTML() {
        // Initialize an empty string to store the HTML content
        var paidRowsHTML = "";
        // Loop through each paid row
        $(".paid").each(function(index, element) {
            // Append the HTML content of the current paid row to the string
            paidRowsHTML += $(element).html();
        });
        // Return the concatenated HTML content of all paid rows
        return paidRowsHTML;
    }
</script>