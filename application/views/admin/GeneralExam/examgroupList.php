<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">  

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-lg-12">


            </div>
        </div>


        <div class="row">

                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"> <?php echo $this->lang->line('exam') . " " . $this->lang->line('group') . " " . $this->lang->line('list') ?></h3>
                        <div class="box-tools pull-right">


                            <?php
                            if ($this->rbac->hasPrivilege('exam_group', 'can_add')) {
                            ?>
                            <a href="<?=base_url().'admin/GeneralExam/addExamGroup';?>" id="add_exam_group" type="button" class="btn btn-primary fancybox"> <i class="fa fa-plus-circle"></i> Add New  </a>
                       <?php }?>

                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="mailbox-messages table-responsive">
                            <div class="download_label"> <?php echo $this->lang->line('exam') . " " . $this->lang->line('group') . " " . $this->lang->line('list') ?></div>
                            <table class="table table-hover table-striped table-bordered example">
                                <thead>
                                    <tr>
                                        <th width="40%"><?php echo $this->lang->line('name'); ?></th>
                                        <th width="20%"><?php echo $this->lang->line('description'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (empty($examgrouplist)) {
                                        ?>

                                        <?php
                                    } else {
                                        foreach ($examgrouplist as $examgroup) {
                                            ?>
                                            <tr>
                                                <td class="mailbox-name">
                                                    <?php echo $examgroup->name; ?><br>


                                                    <?php
                                                 if ($this->rbac->hasPrivilege('exam_group', 'can_edit')) {
                                                        ?>
                                                        <a   data-placement="top" href="<?php echo site_url('admin/GeneralExam/addExamGroup/' . $examgroup->id); ?>" class="btn btn-default btn-xs fancybox"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                            <i class="fa fa-pencil"></i>
                                                        </a>
                                                        <?php
                                                    }
                                                    if ($this->rbac->hasPrivilege('exam_group', 'can_delete')) {
                                                        ?>
                                                        <a data-placement="top" href="<?php echo site_url('admin/GeneralExam/delete/' . $examgroup->id); ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                            <i class="fa fa-remove"></i>
                                                        </a>
                                                    <?php } ?>
                                                    <hr>

                                                </td>
                                                <td><?php echo $examgroup->description; ?></td>



                                                <td class="mailbox-date pull-right">
                                                    <?php if ($this->rbac->hasPrivilege('exam_reporting', 'can_view')) { ?>
                                                        <a  data-toggle="modal" data-target="#exampleModal" data-examname="<?php echo $examgroup->name; ?>"   data-url="<?php echo base_url(); ?>admin/GeneralExam/addexam/<?php echo $examgroup->id ?>"
                                                           class="btn btn-primary btn-sm result_entry_btn" data-toggle="tooltip" title="Result Entery">
                                                            <i class="fa fa-plus"></i> Result Entry & Modification
                                                        </a>
                                                    <?php }?>




                                            <?php if ($this->rbac->hasPrivilege('res_reporting', 'can_view')) { ?>
                                                    <a  data-toggle="modal" data-target="#resultreportingModal"   data-url="<?php echo base_url(); ?>admin/GeneralExam/reporting/<?php echo $examgroup->id ?>"
                                                        class="btn btn-primary btn-sm reporting" data-toggle="tooltip" title="Exam Results & Reports">
                                                        <i class="fa fa-file"></i> Reporting
                                                    </a>

                                                <?php }?>


                                                </td>
                                            </tr>
                                            <?php
                                        }
                                    }
                                    ?>

                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div><!--/.col (left) -->

        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<style>
    .modal-dialog {
        width: 100%;
        height: 90%;
        margin: 0;
        padding: 0;
    }

    .modal-content {
        height: auto;
        min-height: 100%;
        border-radius: 0;
    }



    /* Important part */
    .modal-dialog{
        overflow-y: initial !important
    }
    .modal-body{
        height: 80vh;
        overflow-y: auto;
    }

</style>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exam_name_title">Exam Entry & Modification</h5>
                <button    type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" onclick="document.getElementById('entry_screen_model').innerHTML=''">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="entry_screen_model">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="resultreportingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Exam Results & Reporting</h5>
                <button  onclick="document.getElementById('body-reporting').innerHTML=''" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="body-reporting">
                ...
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>




<script type="text/javascript">



    $(document).ready(function () {
        $(".close_subject_model").click(function () {
            $('#subjectModal').modal('hide');
        });
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';


        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });
    });
</script>

<script>
    $(document).on('change', '.school_class', function (e) {
        $('#section_id').html("");
        var class_id = $(this).val();
        if(class_id!=''){
            LoadSection(class_id);
            LoadSubjects();
        }

    });

    function LoadSection(class_id){
        var base_url = '<?php echo base_url() ?>';
        var selector=$("#section_id");
        selector.html("");
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "sections/getByClass",
            data: {'class_id': class_id},
            dataType: "json",
            beforeSend: function () {
                selector.addClass('dropdownloading');
            },
            success: function (data) {
                $.each(data, function (i, obj)
                {
                    var sel = "";
                    if (section_id == obj.section_id) {
                        sel = "selected";
                    }
                    div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                });
                selector.append(div_data);
            },
            complete: function () {
                selector.removeClass('dropdownloading');
            }
        });
    }
    function LoadSubjects(){
        var base_url = '<?php echo base_url() ?>';

        var selector=$("#subject_id");
        selector.html("");
        var div_data = '<option value="">-- All Subjects --</option>';
        $.ajax({
            type: "GET",
            url: base_url + "admin/subject/getSubjects",
            data: {'class_id': ""},
            dataType: "json",
            beforeSend: function () {
                selector.addClass('dropdownloading');
            },
            success: function (data) {
                $.each(data, function (i, obj)
                {
                    div_data += "<option value=" + obj.id + " >" + obj.name + "</option>";
                });
                selector.append(div_data);
            },
            complete: function () {
                selector.removeClass('dropdownloading');
            }
        });
    }
    function LoadExamName(exam_group_id){
        var base_url = '<?php echo base_url() ?>';

        var selector=$("#exam_name");

        var div_data = '<option value="">-- Select Exam --</option>';
        $.ajax({
            type: "GET",
            url: base_url + "admin/GeneralExam/getExamName",
            data: {exam_group_id:exam_group_id},
            dataType: "json",
            beforeSend: function () {
                selector.addClass('dropdownloading');
            },
            success: function (data) {
                $("#exam_name").html("");
                $.each(data, function (i, obj)
                {
                    div_data += "<option value='"+obj.name+"'>" + obj.name + "</option>";
                });
                selector.append(div_data);
            },
            complete: function () {
                selector.removeClass('dropdownloading');
            }
        });
    }

    function LoadExamNames(){
        var base_url = '<?php echo base_url() ?>';

        var selector=$("#subject_id");
        selector.html("");
        var div_data = '<option value="">-------</option>';
        $.ajax({
            type: "GET",
            url: base_url + "admin/subject/getSubjects",
            data: {'class_id': ""},
            dataType: "json",
            beforeSend: function () {
                selector.addClass('dropdownloading');
            },
            success: function (data) {

                $.each(data, function (i, obj)
                {
                    div_data += "<option value=" + obj.id + " >" + obj.name + "</option>";
                });
                selector.append(div_data);
            },
            complete: function () {
                selector.removeClass('dropdownloading');
            }
        });
    }

    $(".result_entry_btn").click(function(e){
        var url=$(this).data("url");
        var examname=$(this).data("examname");
        $("#exam_name_title").html(examname);
        $("#entry_screen_model").html('');
        $.post(url,{},function(res){
            $("#entry_screen_model").html(res);
            $("#body-reporting").html('');
        });

    });

    $(".reporting").click(function(e){
        var url=$(this).data("url");
        $("#body-reporting").html('');
        $.post(url,{},function(res){
            $("#entry_screen_model").html('');
            $("#body-reporting").html(res);
        });

    });









</script>

