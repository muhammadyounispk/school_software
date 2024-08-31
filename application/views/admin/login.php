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
  background-image: url('https://wallpaperaccess.com/full/859072.jpg');
  background-size: cover; /* This property makes the image cover the entire body element */
  background-repeat: no-repeat; /* This prevents the image from repeating */
  background-attachment: fixed; /* This makes the image fixed, so it doesn't scroll with the content */
  /* You can also set additional properties like background-position, background-color, etc. */
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
                <div class="row ">
                
                   
                    <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <div class="loginbg loginradius login390">
                              
                                <div class="form-bottom">
                                <center>

                                <img style="height: 160px;" class="card-img-top" src="<?=base_url();?>/uploads/digis/administration.png" alt="Card image cap">
                                </center><br>
                                    
                                    <?php
                                    if (isset($error_message)) {
                                        echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                                    }
                                    ?>
                                    <?php
                                    if ($this->session->flashdata('message')) {
                                        echo "<div class='alert alert-success'>" . $this->session->flashdata('message') . "</div>";
                                    };
                                    ?>
                                    <form action="<?php echo site_url('site/SystemManager') ?>" method="post">
                                        <?php echo $this->customlib->getCSRF(); ?>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only" for="form-username">
                                                <?php echo $this->lang->line('username'); ?></label>
                                            <input type="text" name="username" value="<?php echo set_value("username"); ?>" placeholder="<?php echo $this->lang->line('username'); ?>" class="form-username form-control" id="email">
                                            <span class="fa fa-envelope form-control-feedback"></span>
                                            <span class="text-danger"><?php echo form_error('username'); ?></span>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <input type="password" name="password" value="<?php echo set_value("password"); ?>" placeholder="<?php echo $this->lang->line('password'); ?>" class="form-password form-control" id="password">
                                            <span class="fa fa-lock form-control-feedback"></span>
                                            <span class="text-danger"><?php echo form_error('password'); ?></span>
                                        </div>
                                        <?php if ($is_captcha) { ?>
                                            <div class="form-group has-feedback row">
                                                <div class='col-lg-7 col-md-12 col-sm-6'>
                                                    <span id="captcha_image"><?php echo $captcha_image; ?></span>
                                                    <span class="fa fa-refresh catpcha" title='Refresh Catpcha' onclick="refreshCaptcha()"></span>
                                                </div>
                                                <div class='col-lg-5 col-md-12 col-sm-6'>
                                                    <input type="text" name="captcha" placeholder="<?php echo $this->lang->line('captcha'); ?>" autocomplete="off" class=" form-control" id="captcha">
                                                    <span class="text-danger"><?php echo form_error('captcha'); ?></span>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <center>
                    <p><a style="position: relative;margin-top: -16px;float: right;margin-bottom: 22px;" href="<?php echo site_url('site/forgotpassword') ?>" class="forgot"> <i class="fa fa-key"></i> Password forgot ?</a> </p>
                                    </center>

                                        <button type="submit" class="btn">
                                            <?php echo $this->lang->line('sign_in'); ?></button>
                                    </form>
                                    <br>
                                    
                                    <center>
                                        <p><a href="<?php echo site_url('site/userlogin') ?>" class="forgot"> <i class="fa fa-arrow-left"></i> <?php echo $this->lang->line('go'); ?> <?php echo $this->lang->line('back'); ?></a> </p>
                                    </center>


                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4"></div>


                   

                   



                    </div>
                </div>
            </div>
        </div>
    </div>
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