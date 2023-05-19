<?php
// Define a class named Student_model
class ClientModel extends CI_Model {

    // Constructor method that loads the CodeIgniter database library
    public function __construct() {
        parent::__construct(); // Calls the parent constructor method
        $this->load->database(); // Loads the CodeIgniter database library
    }

    // Define a method named insert_student that inserts a new student record into the database
    public function insert_client($data = array()){ 
        return $this->db->insert("client_info", $data); // Inserts a new record into the tbl_students table
    }
}
