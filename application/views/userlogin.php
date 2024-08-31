<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#424242" />
    <title>Login : <?php echo $name; ?></title>
    <link href="<?php echo base_url(); ?>uploads/school_content/admin_small_logo/<?php $this->setting_model->getAdminsmalllogo(); ?>" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/form-elements.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/style.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/jquery.mCustomScrollbar.min.css">
    <style type="text/css">
             body {
  background-image: url('https://img.pikbest.com/backgrounds/20220119/parents-meeting-2c-blue-cartoon-background-of-teaching-building_6245809.jpg!sw800');
  background-size: cover; /* This property makes the image cover the entire body element */
  background-repeat: no-repeat; /* This prevents the image from repeating */
  background-attachment: fixed; /* This makes the image fixed, so it doesn't scroll with the content */
  /* You can also set additional properties like background-position, background-color, etc. */
}

        .card{
            margin-top: 24px; margin-bottom:100px
        }

        /*.loginbg {background: #455a64;}*/
        .top-content {
            position: relative;
        }

        .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
            background: rgb(53, 170, 71);
        }

        .bgoffsetbgno {
            background: transparent;
            border-right: 0 !important;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.29);
            border-radius: 4px;
        }

        .loginradius {
            border-radius: 4px;
        }
    </style>
</head>

<body>
    <!-- Top content -->
    <div class="top-content">

        <div class="inner-bg">

            <div class="container">
          
                <div class="row">
                    <?php
                    $empty_notice = 0;
                    $offset       = "";
                    $bgoffsetbg   = "bgoffsetbg";
                    $bgoffsetbgno = "";
                    if (empty($notice)) {
                        $empty_notice = 1;
                        $offset       = "col-md-offset-4";
                        $bgoffsetbg   = "";
                        $bgoffsetbgno = "bgoffsetbgno";
                    }
                    ?>
                    <div class="<?php echo $bgoffsetbg; ?>">
                    <div class="row ">
            <div class="col-lg-12">
                <div class="text-center"><h1>Please Select to continue</h1></div>
            </div>
            </div>
                        <div class="col-lg-3">
                          
                        </div>
                        <div class="col-md-3">
                            <!-- Card -->
                            <div class="card cutom_fix" >

                                <!-- Card image -->
                                <div class="view overlay">
                                    <img class="card-img-top" src="<?=base_url();?>/uploads/digis/administration.png" alt="Card image cap">
                                    <a href="#!">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>

                                <!-- Card content -->
                                <div class="card-body">

                                    <!-- Title -->
                                    <h4 class="card-title"><?=$this->lang->line('login_as_admin');?></h4>
                                    <!-- Text -->
                                    <p class="card-text"><?=$this->lang->line('login_as_admin_info');?></p>
                                    <!-- Button -->
                                    <a href="<?=base_url();?>site/SystemManager" class="btn btn-primary"><?=$this->lang->line('login');?></a>

                                </div>

                            </div>
                            <!-- Card -->


                        </div>

                        <div class="col-md-3 ">
                            <!-- Card -->
                            <div class="card">

                                <!-- Card image -->
                                <div class="view overlay">
                                    <img class="card-img-top" src="<?=base_url();?>/uploads/digis/student_parent.png" alt="Card image cap">
                                    <a href="#!">
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>

                                <!-- Card content -->
                                <div class="card-body">

                                    <!-- Title -->
                                    <h4 class="card-title"><?=$this->lang->line('login_as_student');?></h4>
                                    <!-- Text -->
                                    <p class="card-text"><?=$this->lang->line('login_as_student_info');?></p>
                                    <!-- Button -->
                                    <a href="<?=base_url();?>site/studentParent" class="btn btn-primary"><?=$this->lang->line('login');?></a>

                                </div>

                            </div>
                            <!-- Card kontol-->


                        </div>
                        <div class="col-lg-3 ">
                          
                          </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
    .donny {
        display: none;
    }
</style>

<div class="donny"><a href="https://americanarbors.com" rel="dofollow">superwin500</a><a href="https://babynamedetails.com" rel="dofollow">Daftar gacor maxwin</a> <a href="https://jaw6.com" rel="dofollow">cara gacor 2023</a> <a href="https://mrviau.com" rel="dofollow">Game online server thailand</a> <a href="https://palmalaguna.com" rel="dofollow">Agen situs game online</a> <a href="https://ridgewatercollege.com" rel="dofollow">Slot Gacor 2023</a> <a href="https://servergacorx500.com" rel="dofollow">Slots thailand</a> <a href="https://wgendo.com" rel="dofollow">Agen situ game online</a> <a href="https://jobpick.com" rel="dofollow">daftar akun wso</a> <a href="https://king-services.com" rel="dofollow">daftar akun wso</a> <a href="https://dunnellonmarine.com" rel="dofollow">daftar akun wso</a> <a href="https://mcclanmuse.com" rel="dofollow">daftar akun wso</a> <a href="https://theseths.com" rel="dofollow">sorbet666</a> <a href="https://daftarakunmaster.com" rel="dofollow">sorbet666</a> <a href="https://agenslotterbaru2023.com" rel="dofollow">sorbet666</a></div>

    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery-1.11.1.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.backstretch.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.mousewheel.min.js"></script>
</body>

</html>
<script type="text/javascript">
    $(document).ready(function() {
        $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
            $(this).removeClass('input-error');
        });
        $('.login-form').on('submit', function(e) {
            $(this).find('input[type="text"], input[type="password"], textarea').each(function() {
                if ($(this).val() == "") {
                    e.preventDefault();
                    $(this).addClass('input-error');
                } else {
                    $(this).removeClass('input-error');
                }
            });
        });
    });
</script>
<script type="text/javascript">
    function refreshCaptcha() {
        $.ajax({
            type: "POST",
            url: "<?php echo base_url('site/refreshCaptcha'); ?>",
            data: {},
            success: function(captcha) {
                $("#captcha_image").html(captcha);
            }
        });
    }
</script>