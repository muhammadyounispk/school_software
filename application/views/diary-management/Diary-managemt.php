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
                        <h3 class="box-title"><i class="fa fa-book"></i> Diary Management System</h3>
                    </div> 
                    <div class="box-body">
  
                        <?php if ($this->session->flashdata('msg')) { ?> <div class="alert alert-success"> <?php echo $this->session->flashdata('msg') ?> </div> <?php } ?>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <form role="form"  action="<?php echo site_url('CustomAttendance') ?>" method="post" class="validate" id="search_fee_form">
                                        <?php
                                        echo $this->customlib->getCSRF(); ?>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                             
                                                <label><?php echo $this->lang->line('class'); ?></label> <small class="req"> *</small>
                                                <select autofocus=""  name="class_id" class="form-control validate[required]">
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
                                                <select  name="section_id" class="form-control validate[required]">
                                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                            </div>
                                        </div>

                                        




                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>From Date</label> <small class="req"> *</small>
                                                <input value="<?= date('Y-m-d'); ?>"  name="from" placeholder="" type="date" class="form-control "  />
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group"> 
                                                <label>To Date</label> <small class="req"> *</small>
                                                <input value="<?= date('Y-m-d'); ?>"  name="to" placeholder="" type="date" class="form-control "  />
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                              
                                                <br>
                                                <button style="margin-top: 5px;" type="submit" name="search"  value="search_filter" class="btn btn-primary btn-sm search_filter  checkbox-toggle"><i class="fa fa-search"></i>Search Diary</button>

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
     $(document).on('change', 'select[name=class_id]', function() {
        var class_id = $(this).val();
         getSectionByClass(class_id);
    });

    function getSectionByClass(class_id) {
        
    
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value="">-----</option>';
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
                      
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('select[name=section_id]').append(div_data);
                }
            });
        
    }
   

    
$(document).ready(function() {
   
        $('#search_fee_form').submit(function(e) {
            if($(this).validationEngine('validate')!=true){
                errorMsg("Please check valid  required options ");
                return false;
            }
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Create FormData object
                Loader(true, "Searhing Students ");
                $.ajax({
                    type: 'POST',
                    url: '<?= base_url() . 'CustomDiary/searchbyform'; ?>', // Get the form's action attribute
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




</script>
