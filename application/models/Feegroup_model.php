<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Feegroup_model extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function get($id = null) {
        $this->db->select()->from('fee_groups');
        $this->db->where('is_system', 0);
        if ($id != null) {
            $this->db->where('id', $id);
        } else {
            $this->db->order_by('id',"desc");
        }
        $this->db->where('school_id', $this->session->school_id);

        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }
    public function drowpdown() {
        $this->db->select()->from('fee_groups')->join('fee_session_groups', 'fee_groups.id = fee_session_groups.fee_groups_id');
            $this->db->where('fee_groups.is_system', 0);
            $this->db->order_by('fee_groups.id',"desc");
            $this->db->where('fee_session_groups.school_id', $this->session->school_id);
             $query = $this->db->get();
            return $query->result_array();
        
    }

    /**
     * This function will delete the record based on the id
     * @param $id
     */
    public function remove($id) {
        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================
        $this->db->where('id', $id);
        $this->db->where('is_system', 0);
        $this->db->delete('fee_groups');
        $message = DELETE_RECORD_CONSTANT . " On  fee groups id " . $id;
        $action = "Delete";
        $record_id = $id;
        $this->log($message, $record_id, $action);
        //======================Code End==============================
        $this->db->trans_complete(); # Completing transaction
        /* Optional */
        if ($this->db->trans_status() === false) {
            # Something went wrong.
            $this->db->trans_rollback();
            return false;
        } else {
            //return $return_value;
        }
    }

    /**
     * This function will take the post data passed from the controller
     * If id is present, then it will do an update
     * else an insert. One function doing both add and edit.
     * @param $data
     */
    public function add($data) {
        $school_id=$this->session->school_id;
        $name=$data['name'];
        $description=$data['description'];
          echo  $sql="INSERT INTO `fee_groups` (`name`, `description`, `school_id`,is_active) VALUES ('$name', '$description', '$school_id',1)";
            $this->db->query($sql);
           
        
      
    }

    public function check_exists($str) {
        $name = $this->security->xss_clean($str);
        $id = $this->input->post('id');
        if (!isset($id)) {
            $id = 0;
        }

        if ($this->check_data_exists($name, $id)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function check_data_exists($name, $id) {
        $this->db->where('name', $name);
        $this->db->where('id !=', $id);
        $this->db->where('school_id', $this->session->school_id);

        $query = $this->db->get('fee_groups');
        if ($query->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    function checkGroupExistsByName($name) {
        $this->db->where('name', $name);
        $this->db->where('school_id', getSchoolID());
        $query = $this->db->get('fee_groups');
        if ($query->num_rows() > 0) {
            return $query->row();
        } else {
            return FALSE;
        }
    }

}
