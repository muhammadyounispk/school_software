<?php
$language = $this->customlib->getLanguage();
$language_name = $language["short_code"];
?>
<link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Content Wrapper. Contains page content -->

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <i class="fa fa-flask"></i> <?php echo $this->lang->line('homework'); ?>
    </h1>
</section>
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>

        </div>


        <form id="formaddNow" method="post" class="ptt10" enctype="multipart/form-data">
            <input name="class_id" value="<?php echo $class_id ?>" hidden>
            <input name="section_id" value="<?php echo $section_id ?>" hidden>
            <div class="modal-body pt0 pb0">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">

                        <div class="row">

                            <?php
                            $subjects = db::getRecords('SELECT name, id from subjects where school_id= ' . getSchoolID());

                            ?>


                            
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('subject') ?></label><small class="req"> *</small>
                                    <select class="form-control" name="subject_group_id" id="subject_id">
                                        <option value=""><?php echo $this->lang->line('select') ?></option>
                                        <?= displayDropDown($subject_group); ?>


                                    </select>
                                    <span id="name_add_error" class="text-danger"><?php echo form_error('modal_subject_id'); ?></span>
                                </div>
                            </div>






                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('subject') ?></label><small class="req"> *</small>
                                    <select class="form-control" name="subject_id" id="subject_id">


                                    </select>
                                    <span id="name_add_error" class="text-danger"><?php echo form_error('modal_subject_id'); ?></span>
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('homework_date'); ?></label><small class="req"> *</small>
                                    <input type="text" name="homework_date" class="form-control" id="homework_date" value="<?php echo set_value('date', date($this->customlib->getSchoolDateFormat())); ?>" readonly="">
                                    <span id="date_add_error" class="text-danger"></span>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('submission_date'); ?></label><small class="req"> *</small>
                                    <input type="text" id="submit_date" name="submit_date" class="form-control" value="<?php echo set_value('follow_up_date', date($this->customlib->getSchoolDateFormat())); ?>" readonly="">
                                </div>
                            </div>
                            <div class="col-sm-3 ">
                                <div class="form-group">
                                    <label for="pwd"><?php echo $this->lang->line('attach_document'); ?></label>
                                    <input type="file" id="file" name="userfile" style="opacity: 1;" class="form-control filestyle">
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="email"><?php echo $this->lang->line('description'); ?></label><small class="req"> *</small>
                                    <textarea name="description" id="compose-textarea" class="form-control"><?php echo set_value('description'); ?> </textarea>
                                </div>
                            </div>








                        </div><!--./row-->

                    </div><!--./col-md-12-->

                </div><!--./row-->

            </div>
            <div class="box-footer">

                <div class="pull-right paddA10">
                    <button type="submit" class="btn btn-info pull-right" id="submit" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Please wait"><?php echo $this->lang->line('save') ?></button>

                </div>

            </div>
        </form>



</section>




<!-- -->
<script type="text/javascript">
    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'mmm' => 'M', 'Y' => 'yyyy']) ?>';

    $(document).ready(function() {

        var class_id = <?= $class_id; ?>;
        var section_id = <?= $section_id; ?>;
        if (class_id != "" && section_id != "") {

            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: 'POST',
                url: base_url + 'admin/subjectgroup/getGroupByClassandSection',
                data: {
                    'class_id': class_id,
                    'section_id': section_id
                },
                dataType: 'JSON',
                beforeSend: function() {
                    // setting a timeout
                    $('select[name=subject_group_id]').html("").addClass('dropdownloading');
                },
                success: function(data) {

                    $.each(data, function(i, obj) {
                        var sel = "";

                        div_data += "<option value=" + obj.subject_group_id + " " + sel + ">" + obj.name + "</option>";
                    });
                    $('select[name=subject_group_id]').append(div_data);
                },
                error: function(xhr) { // if error occured
                    alert("Error occured.please try again");

                },
                complete: function() {
                    $('select[name=subject_group_id]').removeClass('dropdownloading');
                }
            });
        }


        $("#homework_date").datepicker({
            format: date_format,
            autoclose: true,
            weekStart: start_week,
            language: '<?php echo $language_name ?>',
        }).on('changeDate', function(selected) {
            var minDate = new Date(selected.date.valueOf());
            $('#submit_date').datepicker('setStartDate', minDate);
        });

        $("#submit_date").datepicker({
            format: date_format,
            autoclose: true,
            weekStart: start_week,
            language: '<?php echo $language_name ?>',
        }).on('changeDate', function(selected) {
            var minDate = new Date(selected.date.valueOf());
            $('#homework_date').datepicker('setEndDate', minDate);
        });
    });


    $(document).ready(function() {

        $('#homeworkdate,#submitdate').datepicker({
            format: date_format,
            autoclose: true,
            language: '<?php echo $language_name ?>'
        });


        $("#btnreset").click(function() {
            $("#form1")[0].reset();
        });

    });

    function homework_docs(id) {

        $('#homework_docs').modal('show');
        (function($) {
            'use strict';
            $(document).ready(function() {
                initDatatable('all-list', 'homework/homework_docs/' + id, [], 100);
            });
        }(jQuery))

    }
</script>
<script>
    $(function() {

        $("#compose-textarea,#desc-textarea").wysihtml5();
    });
</script>

<script type="text/javascript">
   


    $(document).ready(function() {
        // Intercept form submission
        $('#formaddNow').submit(function(event) {
            // Prevent the default form submission
            event.preventDefault();

            // Serialize form data
            var formData = new FormData($(this)[0]);

            // Submit form data via AJAX
            $.ajax({
                type: 'POST',
                url: '<?= base_url('CustomDiary/saveDiary'); ?>', // Replace with your backend endpoint
                data: formData,
                processData: false,
                contentType: false,
                enctype: 'multipart/form-data',
                success: function(response) {
                    // Handle successful response
                    $('.search_filter').trigger('click');
                    $('#fancyboxmodel').modal('toggle').modal('hide');
                    console.log(response);
                },
                error: function(error) {
                    // Handle errors
                  errorMsg("Error in adding "+error);
                    console.error(error);
                }
            });
        });
    });

    $(document).on('change', 'select[name=subject_group_id]', function (e) {
     e.preventDefault();
        var subject_group_id = $(this).val();
        console.log(subject_group_id);
        getsubjectBySubjectGroup(subject_group_id);

    });

  function getsubjectBySubjectGroup(subject_group_id) {
  
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: 'POST',
                url: '<?=base_url();?>' + 'admin/subjectgroup/getGroupsubjects',
                data: {'subject_group_id': subject_group_id},
                dataType: 'JSON',
                beforeSend: function () {
                    // setting a timeout
                    $('select[name=subject_id]').html("").addClass('dropdownloading');
                },
                success: function (data) {
                    console.log(data);
                    $('select[name=subject_id]').html("");
                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                      
                        div_data += "<option value=" + obj.id + " " + sel + ">" + obj.name + "</option>";
                    });
                    $('select[name=subject_id]').append(div_data);
                },
                error: function (xhr) { // if error occured
                    alert("Error occured.please try again");

                },
                complete: function () {
                    $('select[name=subject_id]').removeClass('dropdownloading');
                }
            });
        
    }






    $("#notify_select").on('change', function() {
        if ($(this).val() == 'Whatsapp') {
            $(".wysihtml5-toolbar").show();
        } else {
            $(".wysihtml5-toolbar").hide();
        }

    });
</script>