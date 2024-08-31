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
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <div class="box-body">

                        <?php if ($this->session->flashdata('msg')) { ?> <div class="alert alert-success"> <?php echo $this->session->flashdata('msg') ?> </div> <?php } ?>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <form role="form" action="<?php echo site_url('FeeManagement') ?>" method="post" class="" id="search_fee_form">
                                        <?php
                                        echo $this->customlib->getCSRF(); ?>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                             
                                                <label><?php echo $this->lang->line('class'); ?></label> <small class="req"> *</small>
                                                <select autofocus="" id="class_id" name="class_id" class="form-control">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                    <?php
                                                    echo displayDropDown($classlist, "", "id,class");
                                                    ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label><?php echo $this->lang->line('section'); ?></label>
                                                <select id="section_id" name="section_id" class="form-control">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Date</label> <small class="req"> *</small>
                                                <input value="<?= date('Y-m-d'); ?>"  name="date" placeholder="" type="date" class="form-control "  />
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label><input name="is_paid" type="radio" value="all" checked> All </label>
                                                <label><input name="is_paid" type="radio" value="paid"> Paid </label>
                                                <label><input name="is_paid" type="radio" value="unpaid"> Un-Paid </label>
                                                <br>
                                                <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm  checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>

                                            </div>
                                        </div>


                                    </form>
                                </div>

                            </div><!--./col-md-6-->

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
<script type="text/javascript">
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
    
    


 
    function LoadHomeNow () {
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
