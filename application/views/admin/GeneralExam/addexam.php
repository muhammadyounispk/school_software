



<div class="box box-primary" >

    <div class="box-body">

        <div class="row" >
            <div class="col-md-12">
                <form role="form" id="allotStudentForm" action="<?php echo site_url('admin/examgroup/examstudent') ?>" method="post" >
                    <input type="hidden" name="exam_id" value="0" class="exam_group_class_batch_exam_id">
                    <input type="hidden" name="auth_id"  >

                    <div class="row" id="search_form_s">
                        <div class="row">
                            <div class="col-sm-5 col-md-5">



                                <?php if ($this->rbac->hasPrivilege('exam_reporting', 'can_add')) { ?> <label><input name="action" type="radio" checked value="1"> Add Result</label>  <?php }?>
                             <?php if($this->rbac->hasPrivilege('exam_reporting', 'can_view')){?>  <label><input name="action" type="radio" value="2"> View Result</label><?php }?>
                                <?php if ($this->rbac->hasPrivilege('examdatesheet', 'can_view')) { ?>      <label><input name="action" type="radio" value="3"> Exam  Datesheet</label><?php }?>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="exam_name_response">

                                <label><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('name'); ?></label><small class="req"> *</small>
                            <?php if ($this->rbac->hasPrivilege('exam_name', 'can_view')) { ?>
                            <img id="add_exam_name" style="height: 15px;margin-top: -1px;" src="<?=DIGIS_HTTP.'add.png';?>">
                             <img id="delete_exam_name" style="height: 15px;margin-top: -1px; display: none" src="<?=DIGIS_HTTP.'delete.png';?>">
                             <?php }?>

                            </div>





                                <select name="exam_name" class="form-control" id="exam_name" >

                                </select>

                            <div id="add_exam_name_form" style="display: flex; display: none">

                                <input  id="form_exam_name" class="form-control">
                                <br>
                                <button id="add_exam_name_now" type="button"><img id="add_exam_name" style="height: 15px;" src="<?=DIGIS_HTTP.'tick.png';?>"> Add Exam Name</button>

                            </div>



                        </div>
                        <div id="other_element_exam">

                        <div class="col-sm-2">
                            <div class="form-group">
                                <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                <select   name="class_id" class="form-control school_class" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                    <?php
                                    foreach ($classlist as $class) {
                                        ?>
                                        <option value="<?php echo $class['id'] ?>" <?php
                                        if (set_value('class_id') == $class['id']) {
                                            echo "selected=selected";
                                        }
                                        ?>><?php echo $class['class'] ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>


                                <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('section'); ?></label><small class="req"> *</small>
                                <select  id="section_id" name="section_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                                <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                            </div>
                        </div>
                        <div class="make_date_sheet">
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('subject'); ?></label><small class="req"> *</small>
                                <select  id="subject_id" name="subject_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                                <span class="text-danger"><?php echo form_error('subject_id'); ?></span>
                            </div>
                        </div>

                        <div id="add_result">
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('marks'); ?></label><small class="req"> *</small>
                                <input class="form-control" name="total_marks" type="number">
                                <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                <input class="form-control " type="date" name="exam_date"   >
                                <span class="text-danger"><?php echo form_error('exam_date'); ?></span>
                            </div>
                        </div>
                        </div>

                        <div id="view_result" class="hide">

                            <div class="col-sm-1">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('from'); ?> <?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input class="form-control " name="from_date"   type="date">
                                    <span class="text-danger"><?php echo form_error('from_date'); ?></span>
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('to'); ?> <?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input class="form-control " name="to_date"    type="date">
                                    <span class="text-danger"><?php echo form_error('to_date'); ?></span>
                                </div>
                            </div>
                        </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="form-group text-left"  style="margin-top: 22px">
                                <button id="load_students"  type="button" name="search" value="search_filter" class="btn btn-primary pull-left mt-4 btn-sm checkbox-toggle "><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                            </div>
                        </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                         <div id="students_view"></div>

                        </div>
                    </div>
                </form>





            </div>


        </div>
    </div><!-- /.box-body -->
</div>

<script  src="<?php echo base_url(); ?>backend/js/jquery.min.js?rand=<?=refresh_code()?>"></script>

<script>






    $("#load_students").click(function (e) {

        console.log("load_students")
        loadStudents();
    });

    function loadStudents(auth_id=''){

        $("#search_form").removeClass("hide");
        var class_id=$("select[name=class_id] option:selected").val();
        var section_id=$("select[name=section_id]:selected").val();
        var total_marks=$("input[name=total_marks]").val();
        var exam_date=$("input[name=exam_date]").val();
        var subject_id=$("select[name=subject_id]:selected").val();
        var action=$("input[name=action]:checked").val();
        var from_date=$("input[name=from_date]").val();
        var to_date=$("input[name=to_date]").val();
        var exam_name=$("select[name=exam_name]:selected").val();
        var check_update=$("input[name=auth_id]").val();



        if(action=='1' && check_update=='') {
            if (class_id == '' ||
                section_id == '' ||
                subject_id == '' ||
                exam_date == '' ||
                total_marks == '' ||
                exam_name == '') {
                errorMsg('Please Select Exam Name,  Class ,  Section , Subject, Total Marks & Exam Date ');
                return false;
            }
        }else  if(action=='1' && check_update!=''){
            var  valueToCheck=2;  //Modify
            $('input[name=action][value="' + valueToCheck + '"]').prop('checked', true);
            $("input[name=auth_id]").val('');
            loadStudents();

        }
        if(action=='3'){
            $(".make_date_sheet").hide();

        }else{
            $(".make_date_sheet").show();
        }
        if(auth_id!=''){
           var  valueToCheck=1;  //Modify
            $('input[name=action][value="' + valueToCheck + '"]').prop('checked', true);
            $("input[name=auth_id]").val(auth_id);
        }

        Loader(true);
        var base_url = '<?php echo base_url() ?>';
        $("#students_view").html("");
        var selector=$("#students_view");
        var form=$('#allotStudentForm');


        $.ajax({
            type: "GET",
            url: base_url + "admin/GeneralExam/getStudents?exam_group_id=<?=$exam_group_id;?>",
            data: form.serialize(),
            beforeSend: function () {
                selector.addClass('dropdownloading');
            },
            success: function (data) {
                selector.html(data);
                Loader(false);
            },
            complete: function () {
                selector.removeClass('dropdownloading');
            }
        });
    }

    $(document).on('click', '.select_all', function (e) {

        if (this.checked) {
            $(this).closest('table').find('[class=checkbox]').prop('checked', true);
        } else {
            $(this).closest('table').find('[class=checkbox]').prop('checked', false);
        }
    });
    $(document).on('click', '.notify_all', function (e) {

        if (this.checked) {
            $(this).closest('table').find('[class=notify]').prop('checked', true);
        } else {
            $(this).closest('table').find('[class=notify]').prop('checked', false);
        }
    });

    $(document).on('click', 'input[name=action]', function (e) {

        if ($(this).val()=='1') {
            $("#view_result").addClass('hide');
            $("#add_result").removeClass('hide');
            $(".make_date_sheet").attr('style','display:block');
            loadStudents();
        } else {
            $("#add_result").addClass('hide');
            $("#view_result").removeClass('hide');
            loadStudents();
        }
    });

    $(document).on('click', '#save_result', function (e) {
        e.preventDefault();
        var class_id=$(".school_class option:selected").val();
        var section_id=$("#section_id").val();
        var total_marks=$("input[name=total_marks]").val();
        var exam_date=$("input[name=exam_date]").val();
        var subject_id=$("select[name=subject_id]").val();
        var auth_id=$("input[name=auth_id]").val();
        var  exam_name=$("#exam_name option:selected").text();
        console.log(exam_name);

        var form = $("#addresult");
        if(!auth_id) {
            if (subject_id == '' || exam_date == '' || total_marks == '' || exam_name == '') {
                errorMsg("Missing of  these =>  Select Exam Name, Subject , Enter Total marks and Exam Date ");
                return false;
            }

            form.append('exam_name',exam_name);
            form.append('subject_id',subject_id);
            form.append('total_marks',total_marks);
            form.append('exam_date',exam_date);
            form.append('subject_name',$("select[name=subject_id]:selected").text());

        }




        Loader(true);
        $.post('<?php echo base_url();?>admin/GeneralExam/save_result?exam_name='+exam_name, form.serialize(), function (res) {
              var data=JSON.parse(res);
              if(data.status==200){
                  successMsg(data.message);
                  loadStudents();
                  $(".modal-body").animate({ scrollTop: 0 }, 'slow');




              }else if(data.status==404){
                  errorMsg(data.message);
              }

                Loader(false);
            });


    });

    function checkInputValues(className) {
        var hasOne = false;
        $('.' + className).each(function() {
            var value = $(this).val();
            if (value === '1') {
                hasOne = true;
                return false; // Exit the loop early if 1 is found
            }
        });
        return !hasOne;
    }


    $(document).on('click', '#delete_result', function (e) {
        e.preventDefault();
        if(confirm("Are you sure to delete?")){
            var auth_id=$(this).data('auth_id');
            $.post('<?php echo base_url() ?>admin/GeneralExam/delete_res',{'auth_id':auth_id},function (res){
                loadStudents();
            });
        }

    });

    //
    $(document).on('click', '#modify_result', function (e) {
    var auth_id=$(this).data('auth_id');

        loadStudents(auth_id);
        $("#search_form").addClass("hide");

    });

    $(document).on('click', '#add_exam_name', function (e) {
     $("#exam_name").hide();
     $("#add_exam_name").hide();
     $("#other_element_exam").hide();
     $("#add_exam_name_form").show();

    });
    $(document).on('click', '#add_exam_name_now', function (e) {
     $("#exam_name").show();
     $("#exam_name").removeClass('hide');
     $("#add_exam_name").show();
     $("#other_element_exam").show();
     $("#add_exam_name_form").hide();
     var exam_name=$("#form_exam_name").val();
     if(exam_name) {
         $.post('<?php echo base_url() ?>admin/GeneralExam/addExamName', {
             exam_name: exam_name,
             exam_group_id: '<?=$exam_group_id;?>'
         }, function () {
             successMsg("Exam Name created Success");
             $("#form_exam_name").val('')
             $("#exam_name").html("");
             LoadExamName('<?=$exam_group_id;?>');
         });
     }

    });
    LoadExamName('<?=$exam_group_id;?>');

    $("#exam_name").change(function (e) {
        console.log("exam_name")
        if($(this).val()){
            $("#delete_exam_name").show();
        }else{
            $("#delete_exam_name").hide();
        }
    });

    $("#delete_exam_name").click(function (e) {
        var delete_id=$("#exam_name").val();
        var exam_name=$("#exam_name option:selected").text();
        if(confirm("Are you sure to Delete "+exam_name+"?\nPlease Note that All Exams will be removed saved inside this Exam Name")){
            LoadExamName('<?=$exam_group_id;?>');
            $.post('<?php echo base_url() ?>admin/GeneralExam/removeExamName', {
                exam_name: delete_id,
                exam_group_id:<?=$exam_group_id;?>

            }, function () {
                successMsg("Exam Name is removed");
                LoadExamName('<?=$exam_group_id;?>');
            });


            $("#delete_exam_name").hide();
        }
    });



</script>









