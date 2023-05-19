<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Password_model extends CI_Model {

  public function generate_password($length = 10) {
    $data = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz';
    return substr(str_shuffle($data), 0, $length);
  }

}
