<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
    }

	public function index()
	{
		$this->load->view('login-pengurus');
  	}

	

	function auth(){
		$username		= htmlspecialchars(addslashes(trim($this->input->post('username'))));
		$password		= htmlspecialchars(addslashes(trim(base64_encode(base64_encode(base64_encode($this->input->post('password')))))));
		$id_agen		= 2;

		
		$cek_kasir 		= $this->m_login->cek_kasir($username,$password,$id_agen);
		if($cek_kasir->num_rows() > 0){
			$data		= $cek_kasir->row_array();
			$this->session->set_userdata('sehat_dkk@',TRUE);
			$this->session->set_userdata('sehat_dkk@id_user',$data['id']);
			$this->session->set_userdata('sehat_dkk@id_level',$data['level']);
			$this->session->set_userdata('sehat_dkk@id_outlet',$id_agen);
			redirect(base_url('kasir/home'));
		}
		else{
			$cek_keanggotaan 	= $this->m_login->cek_keanggotaan($username,$password,$id_agen);
			if($cek_keanggotaan->num_rows() > 0){
				$data			= $cek_keanggotaan->row_array();
				$this->session->set_userdata('sehat_dkk@',TRUE);
				$this->session->set_userdata('sehat_dkk@id_user',$data['id']);
				$this->session->set_userdata('sehat_dkk@id_level',$data['level']);
			    $this->session->set_userdata('sehat_dkk@id_outlet',$id_agen);
				redirect(base_url('keanggotaan/home'));
			}else{
				$cek_admin=$this->m_login->cek_login($username,$password,$id_agen);
				if($cek_admin->num_rows() > 0){
					$data		= $cek_admin->row_array();
					$this->session->set_userdata('sehat_dkk@',TRUE);
					$this->session->set_userdata('sehat_dkk@id_user',$data['id']);
					$this->session->set_userdata('sehat_dkk@id_level',$data['level']);
			        $this->session->set_userdata('sehat_dkk@id_outlet',$id_agen);
					redirect(base_url('admin/produk/ppob'));
				}else{
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><small><strong>Warning !!!<br></strong> Username atau password salah.</small></div>');
					redirect(base_url('login'));
				}
			}
		}
	}

	function logout(){
		$this->session->sess_destroy();
		redirect(base_url('login'));
	}
}
