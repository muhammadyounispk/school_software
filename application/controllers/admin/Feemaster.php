<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Feemaster extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->sch_setting_detail = $this->setting_model->getSetting();
      


      
    }

    function index() {

        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'admin/feemaster');
        $data['title'] = 'Feemaster List';
        $feegroup = $this->feegroup_model->get();
     
    
        $data['feegroupList'] = $feegroup;
        $feetype = $this->feetype_model->get();
        $data['feetypeList'] = $feetype;
     
        $feegroup_result = $this->feesessiongroup_model->getFeesByGroup();
        $data['feemasterList'] = $feegroup_result;
      
        $data['disactivefeemasterList'] =$this->feesessiongroup_model->getFeesByGroup(null,0);
     

        $this->form_validation->set_rules('feetype_id', $this->lang->line('feetype'), 'required');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required|numeric');
        $this->form_validation->set_rules('fee_month', $this->lang->line('fee_month'), 'required');
        $this->form_validation->set_rules('auto_voucher', $this->lang->line('auto_voucher'), 'required');
       

   

      

        if ($this->form_validation->run() == FALSE) {
            
        } else {
                
                 //check fee group
                 $fee_group_id="Fee Vouchers(".$this->input->post('fee_month').")";
                 if($this->feegroup_model->checkGroupExistsByName($fee_group_id)){
                 $fee_group_id=$this->feegroup_model->checkGroupExistsByName($fee_group_id)->id;

                 }else{
                $fee_group_add=array("name"=>$fee_group_id,"description"=>"System generated Fee Goup","school_id"=>getSchoolID());
                $this->feegroup_model->add($fee_group_add);
                $fee_group_id=$this->feegroup_model->checkGroupExistsByName($fee_group_id)->id;
                    
                 }

            $insert_array = array(
                'fee_groups_id' =>$fee_group_id ,
                'feetype_id' => $this->input->post('feetype_id'),
                'amount' => $this->input->post('amount'),
                'session_id' => $this->setting_model->getCurrentSession(),
                'auto_voucher' => $this->input->post('auto_voucher'),
                'is_active' => 1,
            ); 
         

            $feegroup_result = $this->feesessiongroup_model->add($insert_array);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('success_message') . '</div>');
            redirect('admin/feemaster/index');
        }
      

     
        $this->load->view('layout/header', $data);
       
        $this->load->view('admin/feemaster/feemasterList', $data);
    
    
        $this->load->view('layout/footer', $data);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('fees_master', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Fees Master List';
        $this->feegrouptype_model->remove($id);
        redirect('admin/feemaster/index');
    }

    function deletegrp($id) {
        $data['title'] = 'Fees Master List';
        $this->feesessiongroup_model->remove($id);
        redirect('admin/feemaster');
    }

    function edit($id) {
        if (!$this->rbac->hasPrivilege('fees_master', 'can_edit')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'admin/feemaster');
        $data['id'] = $id;
        $feegroup_type = $this->feegrouptype_model->get($id);
        $data['feegroup_type'] = $feegroup_type;
        $feegroup = $this->feegroup_model->get();
        $data['feegroupList'] = $feegroup;
        $feetype = $this->feetype_model->get();
        $data['feetypeList'] = $feetype;
        $feegroup_result = $this->feesessiongroup_model->getFeesByGroup();
        $data['feemasterList'] = $feegroup_result;
        $this->form_validation->set_rules('feetype_id', $this->lang->line('feetype'), 'required');
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'required');
        $this->form_validation->set_rules(
                'fee_groups_id', $this->lang->line('feegroup'), array(
            'required',
            array('check_exists', array($this->feesessiongroup_model, 'valid_check_exists'))
                )
        );

        if(isset($_POST['account_type'] ) && $_POST['account_type'] =='fix'){
            $this->form_validation->set_rules('fine_amount', $this->lang->line('fine') . " " . $this->lang->line('amount'), 'required|numeric');
            $this->form_validation->set_rules('due_date', $this->lang->line('due_date'), 'trim|required|xss_clean');

        }elseif(isset($_POST['account_type']) && ($_POST['account_type']=='percentage')){
            $this->form_validation->set_rules('fine_percentage', $this->lang->line('percentage'), 'required|numeric');
            $this->form_validation->set_rules('fine_amount', $this->lang->line('fine') . " " . $this->lang->line('amount'), 'required|numeric');
             $this->form_validation->set_rules('due_date', $this->lang->line('due_date'), 'trim|required|xss_clean');
        }
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/feemaster/feemasterEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $insert_array = array(
                'id' => $this->input->post('id'),
                'feetype_id' => $this->input->post('feetype_id'),
                'due_date' => $this->customlib->dateFormatToYYYYMMDD($this->input->post('due_date')),
                'amount' => $this->input->post('amount'),
                'fine_type' => $this->input->post('account_type'),
                'fine_percentage' => $this->input->post('fine_percentage'),
                'fine_amount' => $this->input->post('fine_amount'),
                'auto_voucher' => $this->input->post('auto_voucher'),
            );
            
            $feegroup_result = $this->feegrouptype_model->add($insert_array);

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');
            redirect('admin/feemaster/index');
        }
    }

    function assign($id) {
     
        if (!$this->rbac->hasPrivilege('fees_group_assign', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Fees Collection');
        $this->session->set_userdata('sub_menu', 'admin/feemaster');
        $data['id'] = $id;
        $data['title'] = 'student fees';
        $search_text = $this->input->post('search_text');
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $feegroup_result = $this->feesessiongroup_model->getFeesByGroup($id);
        $data['feegroupList'] = $feegroup_result;
        $data['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;
        $data['sch_setting'] = $this->sch_setting_detail;

        $genderList = $this->customlib->getGender();
        $data['genderList'] = $genderList;
        $RTEstatusList = $this->customlib->getRteStatus();
        $data['RTEstatusList'] = $RTEstatusList;

        $category = $this->category_model->get();
        $data['categorylist'] = $category;


        if ($this->input->server('REQUEST_METHOD') == 'POST') {

            $data['category_id'] = $this->input->post('category_id');
            $data['gender'] = $this->input->post('gender');
            $data['rte_status'] = $this->input->post('rte');
            $data['class_id'] = $this->input->post('class_id');
            $data['section_id'] = $this->input->post('section_id');
            $data['fee_month'] = $id;
        
          
            $resultlist = $this->studentfeemaster_model->searchAssignFeeByClassSection($data['class_id'], $data['section_id'], $id, $data['category_id'], $data['gender'], $data['rte_status'],$search_text);
            
            foreach ($resultlist as $key => $value) {
             $student_due_fee = $this->studentfeemaster_model->getStudentFees($value['student_session_id'],$id);
            if($student_due_fee){
            $paid_data=array_column($student_due_fee[0]->fees,"amount_detail","feetype_id");
            $count=0;
            foreach ($paid_data as $fee_type => $paid_details) {
               
               if($paid_details){
                $count++;
               }
            }
             $resultlist[$key]['fee_details']=$paid_data;
             $resultlist[$key]['total_feetype_paid']=$count;
            }
            }
            $data['resultlist'] = $resultlist;
        }
       
       
        $this->load->view('layout/header', $data);
      
        $this->load->view('admin/feemaster/assign', $data);

        $this->load->view('layout/footer', $data);
    }


    function sendRemainderSMS()  {
       $student=$_REQUEST['student_session_id'];
       $fee=$_REQUEST['fee'];
       if($student){
        $messages=array();
        foreach ($student as $key => $student_id) {
            $to=$fee[$student_id]['to'];
            $text=$fee[$student_id]['text'];
            $status=$fee[$student_id]['status'];
            if($status==2){
                $messages[]=array('to'=>$to,'text'=>$text);

            }
        }

        $this->sendBothText($messages);

       }
    }


    function setVoucherValidity()  {
        $obj['due_date']=$this->input->post('due_date');
        $obj['fine']=$this->input->post('fine_amount_pkr');
        $sql=db::prepUpdateQuery($obj,'fee_session_groups','id',$this->current_voucher_id);
        db::updateRecord($sql);
        $fee_group_id=db::getCell("SELECT fee_groups_id from fee_session_groups where id=".$this->current_voucher_id);
        $sql=db::prepUpdateQuery($obj,'fee_groups','id', $fee_group_id);
        db::updateRecord($sql);
        echo $this->lang->line('update_message');
    }

}

?>