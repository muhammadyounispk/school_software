<!DOCTYPE html>
<html <?php echo $this->customlib->getRTL(); ?>>
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();

?>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $this->customlib->getAppName(); ?></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta name="theme-color" content="#424242" />
    <link href="<?php echo base_url(); ?>uploads/school_content/admin_small_logo/<?php $this->setting_model->getAdminsmalllogo(); ?>" rel="shortcut icon" type="image/x-icon">

    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/bootstrap/css/bootstrap.min.css?rand=<?=refresh_code()?>">

    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/jquery.mCustomScrollbar.min.css?rand=<?=refresh_code()?>">
    <?php
    $this->load->view('layout/theme');
    ?>

    <script  src="<?php echo base_url(); ?>backend/js/jquery.min.js?rand=<?=refresh_code()?>"></script>
    <!--Auto COMPLETE -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/autocomplete/ac.css?rand=<?=refresh_code()?>">
    <script  src="<?php echo base_url(); ?>backend/autocomplete/ac.js?rand=<?=refresh_code()?>"></script>

    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/month_picker.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>/backend/dist/css/font-awesome.min.css?rand=<?=refresh_code()?>">
    <!-- Option 1: Include in HTML -->


    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/ionicons.min.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/iCheck/flat/blue.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/morris/morris.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/datepicker/datepicker3.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/colorpicker/bootstrap-colorpicker.css?rand=<?=refresh_code()?>">

    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/daterangepicker/daterangepicker-bs3.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css?rand=<?=refresh_code()?>">

    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/custom_style.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/datepicker/css/bootstrap-datetimepicker.css?rand=<?=refresh_code()?>">
    <!--file dropify-->
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/dropify.min.css?rand=<?=refresh_code()?>">
    <!--file nprogress-->
    <link href="<?php echo base_url(); ?>backend/dist/css/nprogress.css?rand=<?=refresh_code()?>" rel="stylesheet">


    <!--print table-->
    <link href="<?php echo base_url(); ?>backend/dist/datatables/css/jquery.dataTables.min.css?rand=<?=refresh_code()?>" rel="stylesheet">
    <link href="<?php echo base_url(); ?>backend/dist/datatables/css/buttons.dataTables.min.css?rand=<?=refresh_code()?>" rel="stylesheet">
    <link href="<?php echo base_url(); ?>backend/dist/datatables/css/dataTables.bootstrap.min.css?rand=<?=refresh_code()?>" rel="stylesheet">
    <!--print table mobile support-->
    <link href="<?php echo base_url(); ?>backend/dist/datatables/css/responsive.dataTables.min.css?rand=<?=refresh_code()?>" rel="stylesheet">
    <link href="<?php echo base_url(); ?>backend/dist/datatables/css/rowReorder.dataTables.min.css?rand=<?=refresh_code()?>" rel="stylesheet">
    <!--language css-->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/0.8.2/css/flag-icon.min.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>backend/dist/css/bootstrap-select.min.css?rand=<?=refresh_code()?>">
    <script src="<?php echo base_url(); ?>backend/custom/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/dist/js/moment.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/datepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="<?php echo base_url(); ?>backend/plugins/colorpicker/bootstrap-colorpicker.js"></script>
    <script src="<?php echo base_url(); ?>backend/datepicker/date.js"></script>
    <script src="<?php echo base_url(); ?>backend/dist/js/jquery-ui.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/js/school-custom.js"></script>
    <script src="<?php echo base_url(); ?>backend/js/school-admin-custom.js"></script>
    <script src="<?php echo base_url(); ?>backend/js/sstoast.js"></script>

    <!-- fullCalendar -->
    <link rel="stylesheet" href="<?php echo base_url() ?>backend/fullcalendar/dist/fullcalendar.min.css?rand=<?=refresh_code()?>">
    <link rel="stylesheet" href="<?php echo base_url() ?>backend/fullcalendar/dist/fullcalendar.print.min.css?rand=<?=refresh_code()?>" media="print">
    <script type="text/javascript">
        var baseurl = "<?php echo base_url(); ?>";
        var start_week = <?php echo $this->customlib->getStartWeek(); ?>;
        var chk_validate = "<?php echo $this->config->item('SSLK') ?>";
    </script>
    <!-- Fancy Box -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>backend/fancybox/jquery.fancybox-1.3.4.css?rand=<?=refresh_code()?>" media="screen" />

    <style type="text/css">
        span.flag-icon.flag-icon-us {
            text-orientation: mixed;
        }

        .mini_load{
            height: 17px;
        }
    </style>


</head>

<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="loader" style="display:none">
    <img src="<?= DIGIS_ASSETS ?>/loader.gif" alt="Loading...">


</div>

<script>
    jQuery.browser = {
        msie: false,
        version: 0
    };

    function collapseSidebar() {
        if (Boolean(sessionStorage.getItem('sidebar-toggle-collapsed'))) {
            sessionStorage.setItem('sidebar-toggle-collapsed', '');
        } else {
            sessionStorage.setItem('sidebar-toggle-collapsed', '1');
        }
    }

    function checksidebar() {
        if (Boolean(sessionStorage.getItem('sidebar-toggle-collapsed'))) {
            var body = document.getElementsByTagName('body')[0];
            body.className = body.className + ' sidebar-collapse';
        }
    }

    checksidebar();
</script>
<div class="wrapper">

    <div id="navbar" class="navbar navbar-default          ace-save-state">
        <div class="navbar-container ace-save-state" id="navbar-container">
            <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
                <span class="sr-only">Toggle sidebar</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <div class="navbar-header pull-left">
                <a href="<?php echo base_url(); ?>/admin/admin/dashboard" class="navbar-brand">
                    <small>

                        <?php echo $this->setting_model->getCurrentSchoolName(); ?>
                    </small>
                </a>


            </div>
            <div class="navbar-header">
                <center>
                    <ul  style="
    margin-top: 10px;
    background: azure;
    border-radius: 16px;">
                        <li style="display: inline;margin-right: 5px;margin-left: -29px;">  <i class="fa fa-envelope" data-toggle="tooltip" data-placement="left"  data-original-title="SMS Status"></i> <img  src="<?= base_url();?>/uploads/digis/loading.gif"   class="mini_load" id="can_sms_sent"> </li>
                        <li style="display: inline; margin-right: 5px;"> <i class="fa fa-whatsapp" data-toggle="tooltip" data-placement="left"   data-original-title="Whatsapp Status"></i> <img src="<?= base_url();?>/uploads/digis/loading.gif" class="mini_load" id="can_whatsapp_sent">  </li>
                        <li style="display: inline; margin-right: 5px;"> <i class="fa fa-envelope" data-toggle="tooltip"  data-placement="left"   data-original-title="Email Status"></i> <img src="<?= base_url();?>/uploads/digis/loading.gif" class="mini_load" id="can_email_sent"></li>

                    </ul>
                </center>


            </div>
            <div class="navbar-buttons navbar-header pull-right" role="navigation">
                <ul class="nav ace-nav">


                    <li class="green dropdown-modal">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="ace-icon fa fa-desktop icon-animated-vertical"></i>
                            <span class="badge badge-success"> V <?=getActiveVersion();?></span>
                        </a>

                        <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                            <li class="dropdown-header">
                                <i class="ace-icon fa fa-desktop-o"></i>
                                School Software Updates
                            </li>
                            <li class="dropdown-footer">
                                <a href="<?= base_url()."admin/ExportVersion/all";?>" class="fancybox">
                                    View All Versions
                                    <i class="ace-icon fa fa-arrow-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <?php
                    $file   = "";
                    $result = $this->customlib->getUserData();

                    $image = $result["image"];
                    $role  = $result["user_type"];
                    $id    = $result["id"];
                    if (!empty($image)) {

                        $file = "uploads/staff_images/" . $image;
                    } else {
                        if ($result['gender'] == 'Female') {
                            $file = "uploads/staff_images/default_female.jpg";
                        } else {
                            $file = "uploads/staff_images/default_male.jpg";
                        }
                    }
                    ?>



                    <li class="light-blue dropdown-modal">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <img style="height: 40px ; width: 40px ; object-fit: fill" class="nav-user-photo" src="<?php echo base_url() . $file; ?>" >
                            <span class="user-info">
									<small>Welcome,</small>
									<?php echo $this->customlib->getAdminSessionUserName(); ?>
								</span>

                            <i class="ace-icon fa fa-caret-down"></i>
                        </a>

                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                            <li>
                                <a href="<?php echo base_url() . "admin/staff/profile/" . $id ?>">
                                    <i class="ace-icon fa fa-cog"></i>
                                    <?php echo $this->lang->line('profile'); ?>
                                </a>
                            </li>



                            <li class="divider"></li>

                            <li>
                                <a href="<?php echo base_url(); ?>site/logout">
                                    <i class="ace-icon fa fa-power-off"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div><!-- /.navbar-container -->
    </div>


