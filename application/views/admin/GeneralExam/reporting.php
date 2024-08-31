
<style>
    .wrimagecard{
        margin-top: 0;
        margin-bottom: 1.5rem;
        text-align: left;
        position: relative;
        background: #fff;
        box-shadow: 12px 15px 20px 0px rgba(46,61,73,0.15);
        border-radius: 4px;
        transition: all 0.3s ease;
    }
    .wrimagecard .fa{
        position: relative;
        font-size: 70px;
    }
    .wrimagecard-topimage_header{
        padding: 20px;
    }
    a.wrimagecard:hover, .wrimagecard-topimage:hover {
        box-shadow: 2px 4px 8px 0px rgba(46,61,73,0.2);
    }
    .wrimagecard-topimage a {
        width: 100%;
        height: 100%;
        display: block;
    }
    .wrimagecard-topimage_title {
        padding: 20px 24px;
        height: 80px;
        padding-bottom: 0.75rem;
        position: relative;
    }
    .wrimagecard-topimage a {
        border-bottom: none;
        text-decoration: none;
        color: #525c65;
        transition: color 0.3s ease;
    }


</style>




<div id="exam_reporting_form" style="display: none"   class="box box-primary"  >

    <div class="box-body" style="overflow: auto">
        <div class="row" >
            <div class="col-md-12">
                <form role="form" id="examreportingStudentForm" action="<?php echo site_url('admin/examgroup/examstudent') ?>" method="post" >
                    <input type="hidden" name="is_by_student" value="0" >

                    <div class="row" id="search_form">
                        <div class="row">
                            <div class="col-sm-5 col-md-5">
                                <button type="button" class="btn btn-primary new_report btn-sm"><i class="fa fa-arrow-circle-left"></i> Go Back </button>
                                <input name="action" hidden="">

                                <label style="margin-left: 40px"> <input name="search_by" value="1" checked type="radio">Search by Exam Name(s)</label>
                                <label> <input name="search_by" value="2"  type="radio">Search by Date Range</label>
                                <br>
                            </div>
                        </div>

                        <div id="by_exam_name">
                            <div class="col-sm-2">

                                <label><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('name'); ?></label><small class="req"> *</small>

                                    <?php    $exam_name=getExamName($exam_group_id);  ?>

                                    <select class="form-control" name="exam_name" >
                                        <?php

                                        if($exam_name){
                                            foreach ($exam_name as $key => $exam){
                                                echo "<option>".$exam['exam_name']."</option>";
                                            }
                                        }

                                        ?>
                                    </select>



                            </div>
                        </div>
                        <div  style="display: none" id="by_date_range" >
                            <div class="col-sm-1">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('from'); ?> <?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input type="date" class="form-control " name="from_date"   >
                                    <span class="text-danger"><?php echo form_error('from_date'); ?></span>
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"><?php echo $this->lang->line('to'); ?> <?php echo $this->lang->line('date'); ?></label><small class="req"> *</small>
                                    <input type="date" class="form-control " name="to_date"   >
                                    <span class="text-danger"><?php echo form_error('to_date'); ?></span>
                                </div>
                            </div>
                        </div>
                        <div id="byclass" >
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
                        </div>
                        <div id="bystudent"  style="display: none">
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label for="student_id"><?php echo $this->lang->line('search'); ?> <?php echo $this->lang->line('student'); ?></label><small class="req"> *</small>
                                    <input data-toggle="tooltip" data-placement="bottom"  title="<?php echo $this->lang->line('search_by_student_name'); ?>"  class="form-control   student_search" name="student_id" id="student_id"   >

                                    <div id="show_student_search"></div>
                                    <span class="text-danger"><?php echo form_error('student_id'); ?></span>
                                </div>
                            </div>


                        </div>
                        <div class="col-sm-2" style="display: none" id="bysubject">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('subject'); ?></label><small class="req"> *</small>
                                <select  id="subject_id" name="subject_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                </select>
                                <span class="text-danger"><?php echo form_error('subject_id'); ?></span>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="form-group text-left"  style="margin-top: 22px">
                                <button id="load_added_results"  type="button" name="search" value="search_filter" class="btn btn-primary pull-left mt-4 btn-sm checkbox-toggle "><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                            </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="students_view2"></div>

                        </div>
                    </div>
                </form>





            </div>


        </div>
    </div><!-- /.box-body -->
</div>
<div class="container-fluid"  id="exam_reports">
    <div class="row">
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="1" data-bystudent="true">
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>result_card.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Student Result Card (SRC)
                            <div class="pull-right badge">1</div></h4>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="2" >
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>class_result.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Class Result Report (CRR)
                            <div class="pull-right badge" id="WrControls">2</div></h4>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="3" >
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>res_all.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Award List Report (ALR)
                            <div class="pull-right badge" id="WrControls">3</div></h4>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="4" >
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>date_sheet_new.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Detailed Award List  (DWL)
                            <div class="pull-right badge" id="WrControls">4</div></h4>
                    </div>
                </a>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="5" >
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>tlpr (1).png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Teaching Level Performance Report(TLPR)
                            <div class="pull-right badge">5</div></h4>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="6" >
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>date_sheet.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Notice Board Datesheet
                            <div class="pull-right badge">6</div></h4>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="7" data-bystudent="true">
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>date_sheet_by_s.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Student Date Sheet (SDS)
                            <div class="pull-right badge">7</div></h4>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-md-3 col-sm-3">
            <div class="wrimagecard wrimagecard-topimage" data-action="8" >
                <a href="#">
                    <div class="wrimagecard-topimage_header" style="background-color:rgba(187, 120, 36, 0.1) ">
                        <img style="height: 72px" class="fitme" src="<?=DIGIS_HTTP?>class_date.png">
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4>Class Date Sheet (CDS)
                            <div class="pull-right badge">8</div></h4>
                    </div>
                </a>
            </div>
        </div>


    </div>
</div>



<script  src="<?php echo base_url(); ?>backend/js/jquery.min.js?rand=<?=refresh_code()?>"></script>
<!--Auto COMPLETE -->
<link rel="stylesheet" href="<?php echo base_url(); ?>backend/autocomplete/ac.css?rand=<?=refresh_code()?>">
<script  src="<?php echo base_url(); ?>backend/autocomplete/ac.js?rand=<?=refresh_code()?>"></script>



<script>
    $(".wrimagecard").on('click', function (e) {
        var action_id=$(this).data('action');
        var bystudent=$(this).data('bystudent');
        var bysubject=$(this).data('bysubject');
        if(bystudent){
            $("#byclass").hide();
            $("#bystudent").show();
            $("#students_view2").html('');
            $('#allotStudentForm').trigger("reset");
            $('input[name=is_by_student]').val(1);
        }else{
            $("#byclass").show();
            $("#bystudent").hide();
            $("#students_view2").html('');
            $('#allotStudentForm').trigger("reset");
            $('input[name=is_by_student]').val(0);

        }

        switch (action_id) {
            case 6:
             $("#byclass").hide();
                break;

        }


        if(bysubject){
            $("#bysubject").show();
        }else{
            $("#bysubject").hide();
        }
        $("input[name=action]").val(action_id);
        $("#exam_reports").hide();
        $("#exam_reporting_form").show();


    });
    $(".new_report").on('click', function (e) {
        $("#exam_reports").show();
        $("#exam_reporting_form").hide();


    });
    $("input[name=search_by]").on('click', function (e) {
        if($(this).val()==1){
            $("#by_exam_name").show();
            $("#by_date_range").hide();
        }else{
            $("#by_exam_name").hide();
            $("#by_date_range").show();
        }




    });

    $("#load_added_results").click(function (e) {
        console.log("load_students")
        loadStudents();
    });

    function loadStudents(){
        Loader(true);
        var base_url = '<?php echo base_url() ?>';
        $("#students_view2").html("");
        var selector=$("#students_view2");

        var div_data = '';
        $.ajax({
            type: "POST",
            url: base_url + "admin/GeneralExam/getreporting/<?=$exam_group_id;?>",
            data: $("#examreportingStudentForm").serialize(),
            beforeSend: function () {
                selector.addClass('dropdownloading');
            },
            success: function (data) {
                Loader(false);
                selector.html(data);
            },
            complete: function () {
                selector.removeClass('dropdownloading');
            }
        });
    }


    $(document).ready(function (e) {
        $("input[name=student_id]").on('input',function (event) {

        });
    });

    $(function() {
        $(".student_search").autocomplete({
            serviceUrl: '<?=base_url();?>student/autocomplete_search_student',
            onSelect: function( suggestion ) {
                $(this).val(suggestion.data);
            }
        });
    });









</script>



