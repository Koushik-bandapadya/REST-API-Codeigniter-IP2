<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Password_genaration extends REST_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('password_model');
        $this->load->model('login_model');
    }
    
    public function index_post() {
        $username = $this->input->get_request_header('username');
        $password = $this->input->get_request_header('password');
        $userData = $this->login_model->getUser($username, $password);
        $response = array();
    
        if (empty($userData)) {
            $response['message'] = "Invalid username or password";
            echo json_encode($response);
        } else {
            

            $data['password'] = $this->password_model->generate_password();
            $this->load->view('password_view', $data);

















        }
    }
}
