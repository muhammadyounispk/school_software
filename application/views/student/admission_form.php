<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?> <small><?php echo $this->lang->line('student1'); ?></small></h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-info" style="padding:5px;">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('import_admission_form'); ?></h3>
                        <div class="pull-right box-tools">   
                            <a href="../student/Sampleadmissionform">
                         <button class="btn btn-primary btn-sm"><i class="fa fa-download"></i> <?php echo $this->lang->line('sample_download_admission_form'); ?></button>
                     </a>
                            <?php if(isAdmissionFom()){
                                ?>
                                   <a href="<?=ADMISSION_FORM_HTTPS?>">
                                <button class="btn btn-primary btn-sm"><i class="fa fa-download"></i> <?php echo $this->lang->line('download_admission_form'); ?></button>
                            </a>
                            
                            <?php }?>

                                <a href="../student/create">
                                <button class="btn btn-primary btn-sm"><i class="fa fa-arrow-left"></i> <?php echo $this->lang->line('back'); ?></button>
                            </a>
                                                    
                         
                        </div>
                    </div>
                    <div class="box-body">      
                     
                   

                    <form action="<?php echo site_url('student/importform') ?>"  id="employeeform" name="employeeform" method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="row">
                                <div class="col-md-10">
                                <?php if ($this->session->flashdata('msg')) { ?> <div>  <?php echo $this->session->flashdata('msg') ?> </div> <?php } ?>

                                </div>
                            </div>
                            <div class="row">
                              
                                <div class="col-md-2 text-center"></div>
                                <div class="col-md-5 text-center">

                                    <div class="form-group">

                                        <label for="exampleInputFile"><?php echo $this->lang->line('select_docx_file'); ?></label><small class="req"> *</small>
                                        <div><input accept=".docx"   class="filestyle form-control" type='file' name='file' id="file" size='20' />
                                            <span class="text-danger"><?php echo form_error('file'); ?></span></div>
                                    </div></div>
                                <div class="col-md-3 pt20">
                                    <?php if(isAdmissionFom()){?>
                                    
                                        <button type="submit" class="btn btn-info "><?php echo $this->lang->line('re_import_admission_form'); ?></button>
                                    <?php }else{?>
                                    <button type="submit" class="btn btn-info "><?php echo $this->lang->line('upload'); ?></button>
                                <?php }?>
                                </div>   
                                <div class="col-md-2 text-center"></div>  

                            </div>
                        </div>


                    </form>

                    <div>



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
                            data: {'class_id': class_id},
                            dataType: "json",
                            success: function (data) {
                                $.each(data, function (i, obj)
                                {
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
                $(document).ready(function () {
                    $("#sampledata").DataTable({
                        searching: false,
                        ordering: false,
                        paging: false,
                        bSort: false,
                        info: false, });

                    var class_id = $('#class_id').val();
                    var section_id = '<?php echo set_value('section_id') ?>';
                    getSectionByClass(class_id, section_id);
                    $(document).on('change', '#class_id', function (e) {
                        $('#section_id').html("");
                        var class_id = $(this).val();
                        var base_url = '<?php echo base_url() ?>';
                        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
                        $.ajax({
                            type: "GET",
                            url: base_url + "sections/getByClass",
                            data: {'class_id': class_id},
                            dataType: "json",
                            success: function (data) {
                                $.each(data, function (i, obj)
                                {
                                    div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                                });
                                $('#section_id').append(div_data);
                            }
                        });
                    });
                });
            </script>