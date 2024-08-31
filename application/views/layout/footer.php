<!-- <script src="<?php //echo base_url(); ?>backend/dist/js/moment.min.js?v=<?=refresh_code()?>"></script> -->




<div class="control-sidebar-bg"></div>
</div>
<script>
    var base_url='<?php echo base_url(); ?>';
    
</script>
<?php
$language = $this->customlib->getLanguage();
$language_name = $language["short_code"];
?>
<link href="<?php echo base_url(); ?>backend/toast-alert/toastr.css" rel="stylesheet"/>
<script src="<?php echo base_url(); ?>backend/toast-alert/toastr.js?v=<?=refresh_code()?>"></script>

<script src="<?php echo base_url(); ?>backend/bootstrap/js/bootstrap.min.js?v=<?=refresh_code()?>"></script>
<link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/select2/select2.min.css">
<script src="<?php echo base_url(); ?>backend/plugins/select2/select2.full.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/input-mask/jquery.inputmask.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/input-mask/jquery.inputmask.date.extensions.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/input-mask/jquery.inputmask.extensions.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/dist/js/moment.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/daterangepicker/daterangepicker.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/colorpicker/bootstrap-colorpicker.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/timepicker/bootstrap-timepicker.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/slimScroll/jquery.slimscroll.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/dist/js/jquery.mCustomScrollbar.concat.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/js/mask.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/js/common.js?v=<?=refresh_code()?>"></script>


<div class="modal fade" id="fancyboxmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width: 95%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fancy_title"></h5>
                <button  type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <img id="delete_exam_name" style="height: 32px; "  src="<?=DIGIS_HTTP.'delete.png';?>">
                </button>
            </div>
            <div class="fancymodel-content "   style="margin-top: 20px">

            </div>
            <div class="modal-footer">


            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
 
    $('body').tooltip({
        selector: '[data-toggle]',
        trigger: 'click hover',
        placement: 'top',
        delay: {
            show: 50,
            hide: 400
        }
    })



   
    


    $(document).ready(function(){
     $(":input").inputmask();
     $(".mob").inputmask('+\\923999999999');
     $("input[name=contactno]").inputmask('+\\923999999999');
     $("input[name=contact]").inputmask('+\\923999999999');
     $("input[name=driver_contact]").inputmask('+\\923999999999');
    $("input[name=cnic]").inputmask('99999-9999999-9');
    $("input[name=father_cnic]").inputmask('99999-9999999-9');

     $(".withdraw_me").attr('href','<?=base_url();?>admin/WithDrawal');




    });
</script>
<!--language js-->
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/js/bootstrap-select.min.js?v=<?=refresh_code()?>"></script>

<script type="text/javascript">
    $(function () {
        $('.languageselectpicker').selectpicker();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {

    // WARNING: For GET requests, body is set to null by browsers.
var data = new FormData();

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {

    var checker=JSON.parse(this.responseText);

    if(checker.sms){
        $("#can_sms_sent").attr('src','<?php echo base_url();?>uploads/digis/ok_now.png');
        $("#can_sms_sent").attr('data-original-title',checker.default_sim);

    }else{
        $("#can_sms_sent").attr('src','<?php echo base_url();?>uploads/digis/error.png');
        errorMsg('No SMS Device Found');
    }
    if(checker.whatsapp){
        $("#can_whatsapp_sent").attr('src','<?php echo base_url();?>uploads/digis/ok_now.png');
    }else{
        $("#can_whatsapp_sent").attr('src','<?php echo base_url();?>uploads/digis/error.png');
    }
    if(checker.email){
        $("#can_email_sent").attr('src','<?php echo base_url();?>uploads/digis/ok_now.png');
    }else{
        $("#can_email_sent").attr('src','<?php echo base_url();?>uploads/digis/error.png');
    }


  }


});

xhr.open("GET", "<?php echo base_url();?>Checkupdatesofsystem/isComLive");
xhr.send(data);




        $(".studentsidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('.studentsideclose, .overlay').on('click', function () {
            $('.studentsidebar').removeClass('active');
            $('.overlay').fadeOut();
        });

        $('#sidebarCollapse').on('click', function () {
            $('.studentsidebar').addClass('active');
            $('.overlay').fadeIn();
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });
</script>


<script src="<?php echo base_url(); ?>backend/plugins/iCheck/icheck.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/datepicker/bootstrap-datepicker.js?v=<?=refresh_code()?>"></script>
<?php
if ($language_name != 'en') {
    ?>
    <script src="<?php echo base_url(); ?>backend/plugins/datepicker/locales/bootstrap-datepicker.<?php echo $language_name ?>.js?v=<?=refresh_code()?>"></script>

<?php } ?>
<script src="<?php echo base_url(); ?>backend/datepicker/js/bootstrap-datetimepicker.js?v=<?=refresh_code()?>"></script>

<script src="<?php echo base_url(); ?>backend/plugins/chartjs/Chart.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/plugins/fastclick/fastclick.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url(); ?>backend/dist/js/app.min.js?v=<?=refresh_code()?>"></script>
<!--nprogress-->
<script src="<?php echo base_url(); ?>backend/dist/js/nprogress.js?v=<?=refresh_code()?>"></script>
<!--file dropify-->
<script src="<?php echo base_url(); ?>backend/dist/js/dropify.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/jquery.dataTables.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/dataTables.buttons.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/jszip.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/pdfmake.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/vfs_fonts.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/buttons.html5.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/buttons.print.min.js?v=<?=refresh_code()?>"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/buttons.colVis.min.js?v=<?=refresh_code()?>" ></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/dataTables.responsive.min.js?v=<?=refresh_code()?>" ></script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/datatables/js/ss.custom.js?v=<?=refresh_code()?>" ></script>
<script src="<?php echo base_url() ?>backend/validation_engine/jquery.validationEngine.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url() ?>backend/validation_engine/jquery.validationEngine-en.js?v=<?=refresh_code()?>"></script>

<!-- <script src="<?php echo base_url(); ?>backend/dist/datatables/js/datetime-moment.js?v=<?=refresh_code()?>"></script>
->
<!-- Month Picker -->
<script src="<?php echo base_url(); ?>backend/js/month_picker.js?v=<?=refresh_code()?>"></script>

</body>
</html>
<!-- jQuery 3 -->
<!--script src="<?php echo base_url(); ?>backend/dist/js/pages/dashboard2.js?v=<?=refresh_code()?>"></script-->
<script src="<?php echo base_url() ?>backend/fullcalendar/dist/fullcalendar.min.js?v=<?=refresh_code()?>"></script>
<script src="<?php echo base_url() ?>backend/fullcalendar/dist/locale-all.js?v=<?=refresh_code()?>"></script>
<?php if ($language_name != 'en') { ?>
    <script src="<?php echo base_url() ?>backend/fullcalendar/dist/locale/<?php echo $language_name ?>.js?v=<?=refresh_code()?>"></script>
<?php } ?>
<script type="text/javascript">

    $(document).ready(function () {
        $('.fee_month').monthpicker({pattern: 'yyyy-mm'});
<?php
if ($this->session->flashdata('success_msg')) {
    ?>
            successMsg("<?php echo $this->session->flashdata('success_msg'); ?>");
    <?php
} else if ($this->session->flashdata('error_msg')) {
    ?>
            errorMsg("<?php echo $this->session->flashdata('error_msg'); ?>");
    <?php
} else if ($this->session->flashdata('warning_msg')) {
    ?>
            infoMsg("<?php echo $this->session->flashdata('warning_msg'); ?>");
    <?php
} else if ($this->session->flashdata('info_msg')) {
    ?>
            warningMsg("<?php echo $this->session->flashdata('info_msg'); ?>");
    <?php
}
?>
    });


    function complete_event(id, status) {

        $.ajax({
            url: "<?php echo site_url("admin/calendar/markcomplete/") ?>" + id,
            type: "POST",
            data: {id: id, active: status},
            dataType: 'json',

            success: function (res)
            {

                if (res.status == "fail") {

                    var message = "";
                    $.each(res.error, function (index, value) {

                        message += value;
                    });
                    errorMsg(message);

                } else {

                    successMsg(res.message);

                    window.location.reload(true);
                }

            }

        });
    }

    function markc(id) {

        $('#newcheck' + id).change(function () {

            if (this.checked) {

                complete_event(id, 'yes');
            } else {

                complete_event(id, 'no');
            }

        });
    }

</script>



<!-- Button trigger modal -->
<!-- Modal -->
<div class="row">
    <div class="modal fade" id="sessionModal" tabindex="-1" role="dialog" aria-labelledby="sessionModalLabel">
        <form action="<?php echo site_url('admin/admin/activeSession') ?>" id="form_modal_session" class="">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="sessionModalLabel"><?php echo $this->lang->line('session'); ?></h4>
                    </div>
                    <div class="modal-body sessionmodal_body pb0">

                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-primary submit_session" data-loading-text="<i class='fa fa-spinner fa-spin '></i> <?php echo $this->lang->line('please_wait'); ?>"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>


<?php $this->load->view('layout/routine_update'); ?>
<?php $this->load->view('layout/addon_update'); ?>

<script type="text/javascript">
    var calendar_date_time_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'DD', 'm' => 'MM', 'M' => 'MMM', 'Y' => 'YYYY']) ?>';

    var datetime_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(true, true), ['d' => 'DD', 'm' => 'MM', 'Y' => 'YYYY', 'H' => 'hh', 'i' => 'mm']) ?>';

    var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy','M' => 'M']) ?>';


    function savedata(eventData) {
        var base_url = '<?php echo base_url() ?>';
        $.ajax({
            url: base_url + 'admin/calendar/saveevent',
            type: 'POST',
            data: eventData,
            dataType: "json",
            success: function (msg) {
                alert(msg);

            }
        });
    }

    $calendar = $('#calendar');
    var base_url = '<?php echo base_url() ?>';
    today = new Date();
    y = today.getFullYear();
    m = today.getMonth();
    d = today.getDate();
    var viewtitle = 'month';
    var pagetitle = "<?php
if (isset($title)) {
    echo $title;
}
?>";

    if (pagetitle == "Dashboard") {

        viewtitle = 'agendaWeek';
    }

    $calendar.fullCalendar({
        viewRender: function (view, element) {

        },

        header: {
            center: 'title',
            right: 'month,agendaWeek,agendaDay',
            left: 'prev,next,today'
        },
        firstDay: start_week,
        defaultDate: today,
        defaultView: viewtitle,
        selectable: true,
        selectHelper: true,
        views: {
            month: {// name of view
                titleFormat: 'MMMM YYYY'
                        // other view-specific options here
            },
            week: {
                titleFormat: " MMMM D YYYY"
            },
            day: {
                titleFormat: 'D MMM, YYYY'
            }
        },
        timezone: 'UTC',
        draggable: false,
        lang: '<?php echo $language_name ?>',
        editable: false,
        eventLimit: false, // allow "more" link when too many events


        // color classes: [ event-blue | event-azure | event-green | event-orange | event-red ]
        events: {
            url: base_url + 'admin/calendar/getevents'

        },

        eventRender: function (event, element) {
            element.attr('title', event.title);
            element.attr('onclick', event.onclick);
            element.attr('data-toggle', 'tooltip');
            if ((!event.url) && (event.event_type != 'task')) {
                element.attr('title', event.title + '-' + event.description);
                element.click(function () {
                    view_event(event.id);
                });
            }
        },
        dayClick: function (date, jsEvent, view) {
           console.log('Clicked on the entire day: ' + date.format());



<?php if ($this->rbac->hasPrivilege('calendar_to_do_list', 'can_add')) { ?>
                var newEventModal= $('#newEventModal');
                $("#input-field").val('');
                $("#desc-field").text('');
                var event_start_from = new Date(date);
                console.log(event_start_from);
                $('.event_from',newEventModal).data("DateTimePicker").date(event_start_from);
                $('.event_to',newEventModal).data("DateTimePicker").date(event_start_from);
                $('#newEventModal').modal('show');

<?php
 } ?>
            return false;
        }

    });



    // function datepic() {
    //     $("#date-field").daterangepicker();
    // }

    function view_event(id) {

        $('.selectevent').find('.cpicker-big').removeClass('cpicker-big').addClass('cpicker-small');
        var base_url = '<?php echo base_url() ?>';
        if (typeof (id) == 'undefined') {
            return;
        }
        $.ajax({
            url: base_url + 'admin/calendar/view_event/' + id,
            type: 'POST',
            //data: '',
            dataType: "json",
            success: function (msg) {


                $("#event_title").val(msg.event_title);
                $("#event_desc").text(msg.event_description);

                $('#eventid').val(id);
                if (msg.event_type == 'public') {

                    $('input:radio[name=eventtype]')[0].checked = true;

                } else if (msg.event_type == 'private') {
                    $('input:radio[name=eventtype]')[1].checked = true;

                } else if (msg.event_type == 'sameforall') {
                    $('input:radio[name=eventtype]')[2].checked = true;

                } else if (msg.event_type == 'protected') {
                    $('input:radio[name=eventtype]')[3].checked = true;

                }
                //===========

                var __viewModal=$('#viewEventModal');
 var event_start_from = new Date(msg.start_date);
 $('.event_from',__viewModal).data("DateTimePicker").date(event_start_from);

  var event_end_to = new Date(msg.end_date);
 $('.event_to',__viewModal).data("DateTimePicker").date(event_end_to);
                //============

                $("#event_color").val(msg.event_color);
                $("#delete_event").attr("onclick", "deleteevent(" + id + ",'Event')")

                // $("#28B8DA").removeClass('cpicker-big').addClass('cpicker-small');
                $("#" + msg.colorid).removeClass('cpicker-small').addClass('cpicker-big');
                $('#viewEventModal').modal('show');
            }
        });


    }

    $(document).ready(function (e) {

        $(function() {
            $(".student_search").autocomplete({
                serviceUrl: '<?=base_url();?>student/autocomplete_search_student',
                onSelect: function( suggestion ) {
                    $(this).val(suggestion.data);
                }
            });
        });







        $("#addevent_form").on('submit', (function (e) {

            e.preventDefault();
            $.ajax({
                url: "<?php echo site_url("admin/calendar/saveevent") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (res)
                {

                    if (res.status == "fail") {

                        var message = "";
                        $.each(res.error, function (index, value) {

                            message += value;
                        });
                        errorMsg(message);

                    } else {

                        successMsg(res.message);

                        window.location.reload(true);
                    }
                }
            });
        }));


    });


    $(document).ready(function (e) {
        $("#updateevent_form").on('submit', (function (e) {

            e.preventDefault();
            $.ajax({
                url: "<?php echo site_url("admin/calendar/updateevent") ?>",
                type: "POST",
                data: new FormData(this),
                dataType: 'json',
                contentType: false,
                cache: false,
                processData: false,
                success: function (res)
                {

                    if (res.status == "fail") {

                        var message = "";
                        $.each(res.error, function (index, value) {

                            message += value;
                        });
                        errorMsg(message);

                    } else {

                        successMsg(res.message);

                        window.location.reload(true);
                    }
                }
            });
        }));


    });

    function deleteevent(id, msg) {
        if (typeof (id) == 'undefined') {
            return;
        }
        if (confirm("<?php echo $this->lang->line('are_you_sure_to_delete_this');?> ")) {
            $.ajax({
                url: base_url + 'admin/calendar/delete_event/' + id,
                type: 'POST',
                dataType: "json",
                success: function (res) {
                    if (res.status == "fail") {
                        errorMsg(res.message);
                    } else {
                        successMsg(msg + " <?php echo $this->lang->line('delete_message');?>");
                        window.location.reload(true);
                    }
                }
            })
        }
    }

    $("body").on('click', '.cpicker', function () {
        var color = $(this).data('color');
        // Clicked on the same selected color
        if ($(this).hasClass('cpicker-big')) {
            return false;
        }

        $(this).parents('.cpicker-wrapper').find('.cpicker-big').removeClass('cpicker-big').addClass('cpicker-small');
        $(this).removeClass('cpicker-small', 'fast').addClass('cpicker-big', 'fast');
        if ($(this).hasClass('kanban-cpicker')) {
            $(this).parents('.panel-heading-bg').css('background', color);
            $(this).parents('.panel-heading-bg').css('border', '1px solid ' + color);
        } else if ($(this).hasClass('calendar-cpicker')) {
            $("body").find('input[name="eventcolor"]').val(color);
        }
    });




    $(document).ready(function () {
        moment.lang('en', {
          week: { dow: start_week }
        });

        $("body").delegate(".date", "focusin", function () {
            $(this).datepicker({
                todayHighlight: false,
                format: date_format,
                autoclose: true,
                weekStart : start_week,
                language: '<?php echo $language_name ?>'
            });
        });










        $('body').on('focus',".date_fee", function(){
        $(this).datepicker({
            format: date_format,
            autoclose: true,
            language: '<?php echo $language_name; ?>',
            endDate: '+0d',
              weekStart : start_week,
            todayHighlight: true
        });
      });





        $('.datetime_twelve_hour').datetimepicker({
               format:  calendar_date_time_format + ' hh:mm a'
        });


            $("#event_date").daterangepicker({
            timePickerIncrement: 5,
            locale: {
            format: calendar_date_time_format
            }
           });


///================

        $('.event_from').datetimepicker({
               format:  calendar_date_time_format + ' hh:mm a'
        });

        $('.event_to').datetimepicker({
               format:  calendar_date_time_format + ' hh:mm a'
        });
//==============


    });

    function loadDate() {

        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';

        $('.date').datetimepicker({
            format: datetime_format,
            locale:
                    '<?php echo $language_name ?>',

        });
    }

    showdate('this_year');

    function showdate(type) {

<?php
if (isset($_POST['date_from']) && $_POST['date_from'] != '' && isset($_POST['date_to']) && $_POST['date_to'] != '') {
    ?>
            var date_from = '<?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->datetostrtotime($_POST['date_from'])); ?>';
            var date_to = '<?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->datetostrtotime($_POST['date_to'])); ?>';


    <?php
} else {
    ?>
            var date_from = '<?php echo date($this->customlib->getSchoolDateFormat()); ?>';
            var date_to = '<?php echo date($this->customlib->getSchoolDateFormat()); ?>';
    <?php
}
?>

        if (type == 'period') {

            $.ajax({
                url: base_url + 'Report/get_betweendate/' + type,
                type: 'POST',
                data: {date_from: date_from, date_to: date_to},
                success: function (res) {

                    $('#date_result').html(res);

                    loadDate();
                }


            });

        } else {
            $('#date_result').html('');
        }


    }

    $("#select_all").change(function () {  //"select all" change
        $('input:checkbox').not(this).prop('checked', this.checked);
        // $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
    });

    function Loader(show=true,message='Please wait ...') {
    if(show) {
        $('.wrapper').addClass('blurred');
        $(".loader").show();
        $(".loader-message").html(message);
    }else{
        $('.wrapper').removeClass('blurred');
        $(".loader").hide();
        $(".loader-message").html('');


    }
}
<?php
$exclude=array("/smsconfig",'/admin/chat','/student/new_admission');

if(!in_array($_SERVER['REQUEST_URI'],$exclude)){
?>
$(document).on({
    ajaxStart: function() {   Loader();  },
     ajaxStop: function() {Loader(false); }  ,
     ajaxError: function() {Loader(false); }
});

<?php }?>

    function takePrint(divName)
    {



        var mywindow = window.open('', 'PRINT', 'height=400,width=600');
        mywindow.document.write('<html><head><link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/print_style.css?v=<?=refresh_code()?>"><title>' + document.title  + '</title>');

        mywindow.document.write('</head><body >');
        mywindow.document.write(document.getElementById(divName).innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        mywindow.close();

        return true;


    }


    $(document).ready(function() {
        // Function to perform AJAX request
        function fetchData() {
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Process the retrieved data here
                        var data=xhr.responseText;
                        if(data){
                            successMsg("New Version Avaialbe to Update");
                            window.location='<?=base_url().'admin/ExportVersion/checkVersionUpdates';?>';
                        }
                    } else {
                        console.error("Error:", xhr.status);
                    }
                }
            };

            xhr.open('GET', '<?=base_url().'admin/ExportVersion/checkVersionUpdates';?>', true);
            xhr.send();
        }



        fetchData();

    });
    $(document).ready(function() {
        $('.wrapper').removeClass('blurred');
        Loader(false,"Finalizing..");
        setTimeout(() => {
       $('.wrapper').removeClass('blurred');
        Loader(false,"please wait...");
        }, 1000);
       
        
        
    });




    
   function LoadFunctionality() {

    }




    $(document).on("click", ".exportPDF", function(e) {
    e.preventDefault(); // Prevent the default link behavior
   
    Loader(true,'please wait generating PDF...');
        var data=$(".pdf_content");
        $.ajax({
            url: '<?=base_url();?>export/exportPDF',
            method: 'POST',
            data : { pdf_content : data.html(),pdf_title:$(".exportPDF").data('title'),pdf_name:$(".exportPDF").data('pdfname')},
            xhrFields: {
                responseType: 'blob',
            },
            success: function (data) {
                Loader(false);
                var a = document.createElement('a');
                var url = window.URL.createObjectURL(data);
                a.href = url;
                a.download = $(".exportPDF").data('pdfname');
                document.body.append(a);
                a.click();
                a.remove();
                window.URL.revokeObjectURL(url);
            }
        });

    });

// Use event delegation for dynamically added elements
$(document).on("click", ".fancybox", function(e) {
    e.preventDefault(); // Prevent the default link behavior
   
    var href = $(this).attr('href');
    var title = $(this).data('fancybox');

    // Set the title in the modal
    $("#fancy_title").html(title);

    // Add a class to blur the content while loading
    $(".fancymodel-content").addClass("blurred");

    // Use AJAX to fetch content and update the modal
    $.post(href, {}, function(data) {
        // Replace the content and remove the blur effect
        $(".fancymodel-content").html(data).removeClass("blurred");
        
        // Toggle and show the modal after content is loaded
        $('#fancyboxmodel').modal('toggle').modal('show');
    });
});

    
      
   

   LoadFunctionality();
   function LoadValidationEngine() {
 
   }
   LoadValidationEngine();
   
   
   // Use event delegation for dynamically added elements
$(document).on("focusin", ".validate[required]", function() {
    $(this).attr("required", true);
});

// Use event delegation for dynamically added elements
$(document).on("ready", function() {
    $(".validate").validationEngine('attach', {
        validateNonVisibleFields: true,
        updatePromptsPosition: true,
        scrollOffset: 150
    });
});

// Example for dynamically added elements with a specific class
$(document).on("focusin", ".validate.dynamic", function() {
    $(this).validationEngine('attach', {
        validateNonVisibleFields: true,
        updatePromptsPosition: true,
        scrollOffset: 150
    });
});


   
    $(document).on('change', '.school_class', function (e) {
        $('#section_id').html("");
        var class_id = $(this).val();
        if(class_id!=''){
            LoadSection(class_id);
          
        }

    });
    $(document).on('change', 'select[name=section_id]', function (e) {
        getSubjectGroup();

    });
    $(document).on('change', 'select[name=subject_group_id]', function (e) {
        getsubjectBySubjectGroup();

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


    function getSubjectGroup() {  
    var class_id=$("select[name=class_id]").val();
    var section_id=$("select[name=section_id]").val();
        if (class_id != "" && section_id != "") {

            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: 'POST',
                url: base_url + 'admin/subjectgroup/getGroupByClassandSection',
                data: {'class_id': class_id, 'section_id': section_id},
                dataType: 'JSON',
                beforeSend: function () {
                    // setting a timeout
                    $('select[name=subject_group_id]').html("").addClass('dropdownloading');
                },
                success: function (data) {

                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                       
                        div_data += "<option value=" + obj.subject_group_id + " " + sel + ">" + obj.name + "</option>";
                    });
                    $('select[name=subject_group_id]').append(div_data);
                },
                error: function (xhr) { // if error occured
                    alert("Error occured.please try again");

                },
                complete: function () {
                    $('select[name=subject_group_id]').removeClass('dropdownloading');
                }
            });
        }

    }

    function getsubjectBySubjectGroup() {
        var class_id=$("select[name=class_id]").val();
        var section_id=$("select[name=section_id]").val();
        var subject_group_id=$("select[name=subject_group_id]").val();
        var subject_id=$("select[name=subject_id]");

        if (class_id != "" && section_id != "" && subject_group_id != "") {

            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';

            $.ajax({
                type: 'POST',
                url: base_url + 'admin/subjectgroup/getGroupsubjects',
                data: {'subject_group_id': subject_group_id},
                dataType: 'JSON',
                beforeSend: function () {
                    // setting a timeout
                    $(subject_id).html("").addClass('dropdownloading');
                },
                success: function (data) {
                    console.log(data);
                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                        
                        div_data += "<option value=" + obj.id + " " + sel + ">" + obj.name + "</option>";
                    });
                    $(subject_id).append(div_data);
                },
                error: function (xhr) { // if error occured
                    alert("Error occured.please try again");

                },
                complete: function () {
                    $(subject_id).removeClass('dropdownloading');
                }
            });
        }
    }

   
    <?php
    $locked=getSchoolInfo("payment_issue");
    
   if($locked){?>
 $.post('<?=base_url('SoftwareBill/Html');?>', function (data) {
    errorMsg("Your School Software is locked due to Charges we could not received ");
    $('.expiry_popup').click();
   $(".content-wrapper").html(data);
 });
 
   
<?php }


    ?>







    
</script>







