<?php

defined('BASEPATH') or exit('No direct script access allowed');

class MY_Model extends CI_Model {
    

    public function __construct() {
        parent::__construct();
        $this->load->library('user_agent');
        

    }

    function getActiveVoucher() {
        $this->db->select('fee_session_groups.*,fee_groups.name as `group_name`');
        $this->db->from('fee_session_groups');
        $this->db->join('fee_groups', 'fee_groups.id = fee_session_groups.fee_groups_id');
        $this->db->where('fee_session_groups.session_id', $this->current_session);
        $this->db->where('fee_groups.is_system', 0);
        $this->db->where('fee_groups.is_active',1);
        $this->db->where('fee_session_groups.school_id', getSchoolID());
        $query = $this->db->get();
        $result = $query->result();
        return $result[0]->id;
    
}

    public function log($message = null, $record_id = null, $action = null) {
        $user_id = $this->customlib->getStaffID();

        $ip = $this->input->ip_address();

        if ($this->agent->is_browser()) {
            $agent = $this->agent->browser() . ' ' . $this->agent->version();
        } elseif ($this->agent->is_robot()) {
            $agent = $this->agent->robot();
        } elseif ($this->agent->is_mobile()) {

            $agent = $this->agent->mobile();
        } else {
            $agent = 'Unidentified User Agent';
        }

        $platform = $this->agent->platform(); // Platform info (Windows, Linux, Mac, etc.)

        $insert = array(
            'message' => $message,
            'user_id' => $user_id,
            'record_id' => $record_id,
            'ip_address' => $ip,
            'platform' => $platform,
            'agent' => $agent,
            'action' => $action,
            'time' => date('Y-m-d H:i:s'),
        );

        $this->db->insert('logs', $insert);
    }

}
