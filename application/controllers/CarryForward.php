<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class CarryForward extends CI_Controller
{

   

    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->setting_result = $this->setting_model->getSetting();
   
        $this->load->model('feereminder_model');
        $this->load->helpers('custom_helper');
    }

    public function index()
    {
    $students=array();
    $fee_session_group_arr=array();
    $current_month=date('Y-m');
    $last_month= getLastMonthYear(date('m'),date('Y'));
    $fee_group= getLastFeeGroupID();
    $current= getCurrentFeeGroupID();

    /*   LAST MONTH  FEE GROUP   */
    foreach ($fee_group as $school_id => $old_fee_groups_id) {
        if($old_fee_groups_id){
        $new_group_id=$current[$school_id];
        $sql_a = "SELECT*  FROM fee_groups  where  id=$new_group_id and school_id=$school_id";
        $fee_group_data = db::getRecord($sql_a);

        $session_id=db::getCell("SELECT id FROM `sessions`  where school_id=$school_id and is_active='yes' ");
        $session_group['school_id']=$school_id;
         $session_group['fee_groups_id']= $new_group_id;
        $session_group['session_id']= $session_id;
        $session_group['is_active']= 1;
        $session_group['due_date'] = $fee_group_data['due_date'];
        $session_group['fine'] = $fee_group_data['fine'];
      
       
             /*  DELETE FEE GROUP IF EXIST  FOR INSTITUTE   */
        $sql_exist="SELECT id From fee_session_groups where school_id=$school_id and fee_groups_id=$new_group_id and session_id=$session_id";
        $check_exist=db::getCell($sql_exist);
        if(!$check_exist){
        /*  MAKING FEE GROUP ACTIVE FOR INSTITUTE   */
         $q=db::prepInsertQuery($session_group,'fee_session_groups');
         pr( $q);
        $fee_session_group_id_new=db::insertRecord($q);
        
        /*  CARRY FORWARDING FEE TYPES  */
         $sql="SELECT id FROM `fee_session_groups`
         where school_id=$school_id and fee_groups_id=$old_fee_groups_id  and session_id=$session_id";
        $fee_session_group_id_old=db::getCell($sql);
        if($fee_session_group_id_old){
          $sql="SELECT * FROM `fee_groups_feetype`  WHERE 
          fee_session_group_id=$fee_session_group_id_old";
        $fee_types=db::getRecords($sql);
         foreach ($fee_types as $key => $fee_type) {
         
            $is_auto_generated=$fee_type['auto_voucher'];

            unset($fee_type['id']);
            unset($fee_type['created_at']);
            $fee_type['school_id']=$school_id;
            $fee_type['fee_session_group_id']=$fee_session_group_id_new;
            $fee_type['fee_groups_id']= $new_group_id;
            $fee_type['due_date']= empty($fee_type['due_date']) ? NULL: date('Y-m-t', strtotime($fee_type['due_date'] . ' +30 days'));
            if($is_auto_generated==1){
            $query_feetype=db::prepInsertQuery($fee_type,"fee_groups_feetype");
            $new_fee_type_id=db::insertRecord($query_feetype);
            }
           
         }
         $balance_type_id=db::getCell("SELECT id from feetype where type='Balance' and school_id=$school_id ");
         if(!$balance_type_id){
             $feetype_obj=array(
                "type"=>"Balance",
                "code"=>"BL",
                "is_system"=>1,
                "school_id"=>$school_id
             );
             $create_balance_feetype_query=db::prepInsertQuery($feetype_obj,"feetype");
             
             $balance_type_id=db::insertRecord($create_balance_feetype_query);

         }

         //Creating Fee Type
         $balance_fee_type = [
            'school_id' => $school_id,
            'fee_session_group_id' => $fee_session_group_id_new,
            'fee_groups_id' => $new_group_id,
            'feetype_id' => $balance_type_id,
            'session_id' => $fee_type['session_id'],
            'amount' => '',
            'fine_type' => 'none',
            'due_date' => date('Y-m-t', strtotime(date('Y-m-d') . ' +30 days')),
            'fine_percentage' => 0.00,
            'fine_amount' => 0.00,
            'auto_voucher' => 0,
            'is_active' => 'no'
        ];
        $query_feetype_for_balance=db::prepInsertQuery($balance_fee_type,"fee_groups_feetype");
        db::insertRecord($query_feetype_for_balance);
          /*  CARRY FORWARDING VOUCHERS   */
         $sql="SELECT * FROM `student_fees_master` WHERE 
          fee_session_group_id=$fee_session_group_id_old";
        $vouchers=db::getRecords($sql);
        if($vouchers){
        foreach ($vouchers as $vkey => $voucher) {
            $student_id=$voucher['student_session_id'];
            $fee_session_group_arr[$voucher['student_session_id']]=$fee_session_group_id_new;
                $paid_sql="SELECT sum(paid)  FROM `student_fees_deposite` where 
                fee_session_group_id={$voucher['fee_session_group_id']} and 
                student_session_id= $student_id
                 ";
                $paid_fee=db::getCell($paid_sql);
            unset($voucher['id']);
            unset($voucher['created_at']);
            //Fee types in vouchers
            $fee_types=unserialize($voucher['feetypes']);
            $total=array_sum($fee_types);
            $balance=$total-  $paid_fee;
            $fee_types[$balance_type_id]=$balance;
            $voucher['feetypes']=serialize($fee_types);
            $amount=$total+$balance;
            $voucher['amount']= $amount;
            $voucher['fee_session_group_id']=$fee_session_group_id_new;
            $query_voucher=db::prepInsertQuery($voucher,"student_fees_master");
            $new_voucher_id=db::insertRecord($query_voucher);

        }

    }

    }
      
   

  


        
       
       
      



        




        

       
    $lock_voucher['is_active']=0;
    $query=db::prepUpdateQuery($lock_voucher,"fee_groups","id",$old_fee_groups_id);
    db::updateRecord($query);

    }//if old found

}
}
//Now Adding Balances of All Vouchers Calculated 



}


   



 
    

}
