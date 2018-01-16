<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
* 
*/
class MY_Controller extends CI_Controller {
	public $user;
	public $token;
	
	function __construct(){
		parent::__construct();

		$this->load->library('Theme', '', 'theme');
		//$this->load->library('Param', '', 'param');
		//$this->load->library('ObjectMeta', '', 'meta');
		$this->load->library('session');
		$this->load->model('User_model', 'User');

        $id = $this->session->userdata('id');
        $this->user = $this->User->get($id);

        // header
        $this->load->model('Usersession_model', 'USession');
        $token = $this->input->get_request_header('Authorization');
        $check = $this->USession->checkToken($token);
        if($check){
        	$this->token = true;
        }else{
        	$this->token = false;
        }

	}

	public function show_404(){
        $this->load->view('404');
    }

    public function json_404(){
        $params = array(
        	'status' => 'failed',
        	'message' => 'Access denied!'
        );
        echo json_encode($params);
    }
}