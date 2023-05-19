<?php
class Show_client_List_model extends CI_Model {
    
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    
    public function get_clients() {
        $query = $this->db->get('client_info');
        

    }


    public function get_clients_by_contact_count($client_contacted) {
        if ($client_contacted === '1') {
            $this->db->where('client_contacted', 1);
        } elseif ($client_contacted === '0') {
            $this->db->where('client_contacted', 0);
        } elseif ($client_contacted === 'both') {
            $this->db->where_in('client_contacted', array(0, 1));
        } elseif ($client_contacted === '') {
            // Do nothing, no additional conditions needed
        } else {
            // Handle the case when $client_contacted is not '0', '1', 'both', or empty (optional)
            // You can choose to return an empty array or show an error message
            return array(); // Empty array
        }
    
        // Exclude empty (blank) values
        $this->db->where('client_contacted !=', '');
    
        $query = $this->db->get('client_info');
    
        return $query->result_array();
    }
    
    






    // public function get_clients_by_contact_count($client_contacted) {
    //     $this->db->where('client_contacted', $client_contacted);
    //     $query = $this->db->get('client_info');
        
    //     if ($query->num_rows() > 0) {
    //         return $query->result_array();
    //     } else {
    //         return FALSE;
    //     }
    // }






}
