<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Export extends Admin_Controller
{


    /**
     * This is default constructor of the class
     */
    public function __construct($key = "")
    {
        parent::__construct();
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $this->load->helper('custom_helper');
    }



    public  function pdf()
    {
        include_once APPPATH . '/third_party/unispdf/autoload.php';
        $hrml="<style>".file_get_contents($_SERVER['DOCUMENT_ROOT']."/backend/dist/css/reports.css")."</style>";
        $hrml.=$this->input->post('pdf_content')??'No Data';


        $path = $_SERVER['DOCUMENT_ROOT'].  '/uploads/digis/'.getSchoolID().'/';
        if(!file_exists( $path)){
            mkdir($path,0755);
        }
        $file_name=$this->input->post('pdf_name');
        $dompdf = new \Dompdf\Dompdf();
        $dompdf-> set_option('isRemoteEnabled', true);
        if(strpos($file_name,'_Detailed')){
            $dompdf->set_paper('A4', 'landscape');
            $hrml.="<style>table{font-size: 0.6rem!important}</style>";

        }

        $file_name="download";
        $dompdf->loadHtml($hrml);
        $dompdf->render();
        //$dompdf->getCanvas()->page_text(560, 25, "{PAGE_NUM} of {PAGE_COUNT}", NULL, 10, array(0, 0, 0));
        $pdf = $path . $file_name . '.pdf';
        file_put_contents($pdf, $dompdf->output());
        header('Cache-Control: no-cache, no-store, must-revalidate'); // HTTP 1.1
        header('Pragma: no-cache'); // HTTP 1.0
        header('Expires: 0');
        $dompdf->stream($file_name, array('Attachment' => 1));





    }
    public  function exportPDF()
    {
        
        include_once APPPATH . '/third_party/unispdf/autoload.php';
        $hrml="<style>".file_get_contents($_SERVER['DOCUMENT_ROOT']."/backend/dist/css/reports.css")."</style>";
        
        ob_start();
        $school = $this->sch_setting_detail;
       
        $logo = base_url() . "uploads/school_content/logo/" . $school->admin_logo;
        $pdf_title=$_POST['pdf_title'];
        $this->load->view('layout/report_header', get_defined_vars());
           $html_content = ob_get_clean();
       
          $hrml.=$html_content;

        $hrml.=$this->input->post('pdf_content')??'No Data';


        $path = $_SERVER['DOCUMENT_ROOT'].  '/uploads/digis/'.getSchoolID().'/';
        echo $path;
        die;
        if(!file_exists( $path)){
            mkdir($path,0755);
        }
        $file_name=$this->input->post('pdf_name');
        $dompdf = new \Dompdf\Dompdf();
        $dompdf-> set_option('isRemoteEnabled', true);
        if(strpos($file_name,'_Detailed')){
            $dompdf->set_paper('A4', 'landscape');
           

        }
        
        $hrml.="<style>table{font-size: 0.6rem!important; margin-bottom: 5px!important;} body, table {
            font-family: Arial, sans-serif;
        } </style>";
      
        $file_name="download";
        $dompdf->loadHtml($hrml);
        $dompdf->render();
        //$dompdf->getCanvas()->page_text(560, 25, "{PAGE_NUM} of {PAGE_COUNT}", NULL, 10, array(0, 0, 0));
        $pdf = $path . $file_name . '.pdf';
        file_put_contents($pdf, $dompdf->output());
        header('Cache-Control: no-cache, no-store, must-revalidate'); // HTTP 1.1
        header('Pragma: no-cache'); // HTTP 1.0
        header('Expires: 0');
        $dompdf->stream($file_name, array('Attachment' => 1));





    }


}