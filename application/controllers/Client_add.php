<?php
// Require REST_Controller class from the library directory
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/REST_Controller.php';
 
// Define Student class which extends REST_Controller class
class Client_add extends REST_Controller {

    // Constructor function, which is called when a Student object is created
    public function __construct() {
        // Call the parent class constructor
        parent::__construct();
        // Load the ClientModel
        $this->load->model('ClientModel');
        $this->load->library( 'form_validation');
        $this->load->model('login_model');
    } 

    // POST request handler for the URL <project url>/index.php/student
    public function index_post() {

		$username = $this->input->get_request_header('username');
		$password = $this->input->get_request_header('password');


		$userData=$this->login_model->getUser($username,$password);
		$response=array();
		if (empty($userData)){
			$response['message']="Invalid username or password";
			echo json_encode($response);
		}else{
		
            


 





        // Get JSON data from the request body and decode it into a PHP object
        // $request_data = json_decode($this->input->raw_input_stream);
    
            // collecting form data inputs
            $client_code = $this->input->post("client_code");
            $name = $this->input->post("name"); 
            $contact_number = $this->input->post("contact_number"); 
            $email = $this->input->post("email");  
            $address = $this->input->post("address");  
            // $office_id = $this->input->post("office_id");  
            // $client_parent_id= $this->input->post("client_parent_id");  
            $handler_id= $this->input->post("handler_id");  
            $client_pairID= $this->input->post("client_pairID");  
            $client_contacted= $this->input->post("client_contacted");  
    
        // Form validation rules
        $this->form_validation->set_rules('client_code', 'client_code', 'required');
        $this->form_validation->set_rules('name', 'name', 'required');
        $this->form_validation->set_rules('contact_number', 'contact_number', 'required');
        $this->form_validation->set_rules('email', 'email', 'required'); 
        // $this->form_validation->set_rules('address', 'address', 'required'); 
        // $this->form_validation->set_rules('office_id', 'office_id', 'required'); 
        // $this->form_validation->set_rules('client_parent_id', 'client_parent_id', 'required'); 
        $this->form_validation->set_rules('handler_id', 'handler_id', 'required'); 
        $this->form_validation->set_rules('client_pairID', 'client_pairID', 'required'); 
        $this->form_validation->set_rules('client_contacted', 'client_contacted', 'required'); 
    
        // Validate form data
        if ($this->form_validation->run() === FALSE) {
            // If form validation fails, send an error response with a status code of 400
            $this->response(array(
                'status' => 0,
                'message' => validation_errors()
            ), REST_Controller::HTTP_BAD_REQUEST);
        } else {
            // If all fields are not empty
            if (!empty($client_code) && !empty($name) && !empty($contact_number) && !empty($email)) {
                // Create an array of student data
                $client = array(
                    'client_code' => $client_code,
                    'name' => $name,
                    'contact_number' => $contact_number,
                    'email' => $email,
                    'catagory_id' => 1,
                    'address' => $address,
                    // 'office_id' => $office_id,
                    'office_id' => 0,
                    // 'client_parent_id' => $client_parent_id,
                    'client_parent_id' => 0,
                    'handler_id' => $handler_id,
                    'client_pairID' => $client_pairID,
                    'client_contacted' => $client_contacted,
                );
    
                // Insert the student data into the database using the ClientModel's insert_student method
                if ($this->ClientModel->insert_client($client)) {
                    // If successful, send a success response with a status code of 201
                    $this->response(array(
                        'status' => 1,
                        'message' => 'Client has been created',
                        'data' => $client
                    ), REST_Controller::HTTP_CREATED);
                } else {
                    // If unsuccessful, send an error response with a status code of 500
                    $this->response(array(
                        'status' => 0,
                        'message' => 'Client creation failed'
                    ), REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
                }
            } else {
                // If any field is empty, send a not found error response with a status code of 400
                $this->response(array(
                    'status' => 0,
                    'message' => 'All fields are required'
                ), REST_Controller::HTTP_BAD_REQUEST);
            }
        }










		}
	




    }
    
        
    
}