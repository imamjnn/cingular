<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->library('session');
		$this->load->library('Theme', '', 'theme');
		$this->load->model('User_model', 'User');
		$this->load->model('Usersession_model', 'USession');
	}
	
	public function index() {
		$this->load->view('auth');
	}

	public function login() {
		$this->load->view('login');
		
	}

	public function register() {
		$this->load->view('register');
		
	}

	public function logout() {
		$data = $this->session->userdata('token');
		if($data){
			$this->USession->removeByCond(['token'=>$data['token']]);
			$this->session->sess_destroy();
			$result['status'] = 'success';
			$result['message'] = 'Logout success.';
		}else{
			$result['status'] = 'failed';
			$result['message'] = 'Error Logout, maybe you are not logged in.';
		}
		echo json_encode($result);
	}

	public function native_logout($token) {
		$check_token = $this->USession->checkToken($token);
		//deb($check_token);
		if($check_token){
			$test = $this->USession->removeByCond(['token'=>$token]);
			$this->session->sess_destroy();
			$result['status'] = 'success';
			$result['message'] = 'Logout success.';
		}else{
			$result['status'] = 'failed';
			$result['message'] = 'Error Native Logout, maybe you are not logged in.';
		}
		echo json_encode($result);
	}

	public function check_login() {
		$decod = json_decode(file_get_contents("php://input"));
		$username = $decod->username;
		$password =	$decod->password;

		// $username = $this->input->post('username');
		// $password =	$this->input->post('password');

		// get ip client
		$ip = $_SERVER['REMOTE_ADDR']?:($_SERVER['HTTP_X_FORWARDED_FOR']?:$_SERVER['HTTP_CLIENT_IP']);

		// encryp password
		$hash_pass = password_hash($password, PASSWORD_BCRYPT, ['cost'=>12]);

		$user = $this->User->getBy(['username'=>$username]);
		if($user)
			$check_pass = password_verify($password, $user->password);
		$check_user = $this->User->checkUsername($username);

		if($check_user == true && $check_pass == true){
			// create token
			//$token = bin2hex(password_hash($user->username, PASSWORD_DEFAULT, ['cost'=>5]));
			$token = bin2hex(openssl_random_pseudo_bytes(16));
			
			$sess_data = array('id'=>$user->id, 'username'=>$user->username, 'token'=>$token);
			$sess_key = $this->session->set_userdata($sess_data);			
			$sess_save = $this->USession->create(['user'=>$user->id, 'token' => $token, 'ip'=>$ip]);
			
			$result['user'] = $user->id;
			$result['token'] = $token;
			$result['status'] = 'success';
			$result['message'] = 'Login success.';
						
		}else{
			$result['status'] = 'failed';
			$result['message'] = 'Invalid username or password.';
		}

		echo json_encode($result);

	}

	public function user($id) {
		$params['user'] = $this->User->get($id);
		echo json_encode($params);

	}
}
