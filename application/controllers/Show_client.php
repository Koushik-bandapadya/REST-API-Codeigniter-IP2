<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Show_client extends REST_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('Show_client_List_model');
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
 


            $client_contacted = $this->input->post('client_contacted');
            $clients = $this->Show_client_List_model->get_clients_by_contact_count($client_contacted);
    


            
            if ($clients) {
                $this->response([
                    'status' => TRUE,
                    'message' => 'Clients found!',
                    'data' => $clients
                ], REST_Controller::HTTP_OK);
            } else {
                $this->response([
                    'status' => FALSE,
                    'message' => 'No clients found!'
                ], REST_Controller::HTTP_NOT_FOUND);
            }
        }






    }
}
