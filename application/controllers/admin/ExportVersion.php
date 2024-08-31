<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
} 

class ExportVersion extends Admin_Controller
{

    public function __construct()
    {

        parent::__construct();
        ini_set('memory_limit', '-1');
        $this->load->model("classteacher_model");
        $this->load->model("Staff_model");
        $this->load->model("smsconfig_model");
        $this->load->library('Enc_lib');
        $this->load->library('mailer');
        $this->load->model('smsconfig_model');
        $this->sch_setting_detail = $this->setting_model->getSetting();




    }

    function index()
    {
        $data=array();
        $this->load->view('layout/header');
        $this->load->view('ExportVersion/ExportVersion', $data);
        $this->load->view('layout/footer');
    }

    function make(){
        $this->form_validation->set_rules('version_name', "Version Name", 'trim|required|xss_clean');
        $this->form_validation->set_rules('version', "Version", 'trim|required|xss_clean');
        $this->form_validation->set_rules('from_date', "Date", 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', "Description", 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header');
            $this->load->view('ExportVersion/ExportVersion', "");
            $this->load->view('layout/footer');

        }else {

            $from_date = $this->input->post('from_date');
            $version = $this->input->post('version');
            $version_name = $this->input->post('version_name');
            $description= $this->input->post('description');
            $this->CopyingFiles($from_date);

                $data['version']=$version;
                $data['name']=$version_name;
                $data['detail']=$description;
                $sql=db::prepInsertQuery($data,"version");
               db::insertRecord($sql);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">New Version has been gerated Successfully</div>');
            redirect('admin/ExportVersion/make');




        }
        }





    function CopyingFiles($date){  
        $timestamp = strtotime($date);
          function getAllFilesInRootFolder() {
    $rootFolderPath = $_SERVER['DOCUMENT_ROOT'];
    $files = [];
    $iterator = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($rootFolderPath));
    foreach ($iterator as $file) {
        if ($file->isFile()) {
            $files[] = $file->getPathname();
        }
    }
    return $files;
}
       $allFiles = getAllFilesInRootFolder();
       foreach ($allFiles as $file) {
        $modificationTimestamp = filemtime($file);
      if($timestamp < $modificationTimestamp){
       $from_file = $file;
       $to_file= str_replace("dev.isdigitalschools.com", 'app.isdigitalschools.com', $from_file);
         $command = "cp $from_file $to_file";
          
              $output = shell_exec($command);
                    
   }
}

    }
  
    function all(){

        $versions=db::getRecords("SELECT * FROM `version` order by id DESC");

        $this->load->view('ExportVersion/All', get_defined_vars());
    }
    function checkVersionUpdates(){
        $version=db::getCell("SELECT max(version) FROM `version` ");
        $new_version=db::getRecord("SELECT* FROM `version` order by id DESC  limit 1");
        if( $version > getActiveVersion()){

            $this->load->view('layout/header_simple');
            $this->load->view('ExportVersion/update_version', get_defined_vars());


        }else{

        }


}
    function Install(){
        db::query("update sch_settings set version ='".PUITCVersion()."' where id='".getSchoolID()."'");
        $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">New Version Successfully Installed </div>');
        redirect('admin/admin/dashboard');


}



}
