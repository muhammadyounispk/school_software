<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Mailer {

    public $mail_config;
    private $sch_setting;
 
    public function __construct() {
        $this->CI = &get_instance();
        $this->CI->load->model('emailconfig_model');
        $this->CI->mail_config = $this->CI->emailconfig_model->getActiveEmail();
        $this->CI->load->model('setting_model');
        $this->sch_setting = $this->CI->setting_model->get();
    }
 
    public function send_mail($toemail, $subject, $body, $FILES = array(), $cc = "") {

        $mail = new PHPMailer();
        $mail->CharSet = 'UTF-8';
     
        $school_name = $this->sch_setting[0]['name'];
        $school_email    = $this->sch_setting[0]['email'];
        $school_phone    = $this->sch_setting[0]['phone'];
        $school_address    = $this->sch_setting[0]['address'];

        $institute_data="$school_name<br>Postal Address: $school_address<br> Phone: $school_phone<br>Email: $school_email <br> ".$_SERVER['HTTP_HOST'];
        if ($this->CI->mail_config->email_type == "smtp") {

            $mail->IsSMTP();
            $mail->SMTPAuth   = ($this->CI->mail_config->smtp_auth != "") ? $this->CI->mail_config->smtp_auth : "";
            $mail->SMTPSecure = $this->CI->mail_config->ssl_tls;
            $mail->Host       = $this->CI->mail_config->smtp_server;
            $mail->Port       = $this->CI->mail_config->smtp_port;
            $mail->Username   = $this->CI->mail_config->smtp_username;
            $mail->Password   = $this->CI->mail_config->smtp_password;
            $mail->SetFrom($this->CI->mail_config->smtp_username, $school_name);
            $mail->AddReplyTo($school_email, $school_name);
        } else {
            $mail->isSMTP();
            $mail->Host        = 'localhost';
            $mail->SMTPAuth    = false;
            $mail->SMTPAutoTLS = false;
            $mail->Port        = 25;
            $mail->SetFrom($school_email, $school_name);
            $mail->AddReplyTo($school_email, $school_name);
        }
        if (!empty($FILES)) {
            if (isset($_FILES['files']) && !empty($_FILES['files'])) {
                $no_files = count($_FILES["files"]['name']);
                for ($i = 0; $i < $no_files; $i++) {
                    if ($_FILES["files"]["error"][$i] > 0) {
                        echo "Error: " . $_FILES["files"]["error"][$i] . "<br>";
                    } else {
                        $file_tmp = $_FILES["files"]["tmp_name"][$i];
                        $file_name = $_FILES["files"]["name"][$i];
                        $mail->AddAttachment($file_tmp, $file_name);
                    }
                }
            }
        }
        if ($cc != "") {

            $mail->AddCC($cc);
        }
        $html=file_get_contents(dirname(__FILE__)."/email_template/t1.html");
        $footer_image=$_SERVER['HTTP_HOST']."/uploads/front_office/footer.png";
        $logo_url=$_SERVER['HTTP_HOST']."/uploads/school_content/admin_logo/".$this->sch_setting[0]['admin_logo'];
        $portal=$_SERVER['HTTP_HOST'];
        $html=str_replace("{img_link}",$logo_url,$html);
        $html=str_replace("{title}",$subject,$html);
        $html=str_replace("{body}",$body,$html);
        $html=str_replace("{button_title}","open Portal",$html);
        $html=str_replace("{button_link}",$portal,$html);
        $html=str_replace("{institute_data}",$institute_data,$html);
        $html=str_replace("{img_link_footer}",$footer_image,$html);
        $mail->Subject = $subject;
        $mail->Body = $html;
        $mail->AltBody = $body;
        $mail->AddAddress($toemail);
        if ($mail->Send()) {
            return true;
        } else {
            return false;
        }
    }

}
