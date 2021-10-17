<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {
	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
		$this->load->model('m_akun');
		$this->load->model('m_simpanan');
		$this->load->model('m_anggota');

		if($this->is_not_login()){
			redirect(base_url('login'));
		}

        if($this->is_not_keanggotaan()){
			show_404();
		}
    }

	public function index()
	{
		$data["title"]		= "Beranda";
		/*$data['total']		= $this->m_simpanan->tampil_all()->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/beranda',$data);
		$this->load->view('keanggotaan/footer',$data);*/
		
		
		$jumlah             = $this->m_anggota->tampil_data()->num_rows()+1;
		if($jumlah < 10){
		    $data['no_anggota'] = '02.'.date('Y').'.000'.$jumlah;
		}else if($this->m_anggota->tampil_data()->num_rows() < 100){
		    $data['no_anggota'] = '02.'.date('Y').'.00'.$jumlah;
		}else if($this->m_anggota->tampil_data()->num_rows() < 1000){
		    $data['no_anggota'] = '02.'.date('Y').'.0'.$jumlah;
		}else{
		    $data['no_anggota'] = '02.'.date('Y').'.'.$jumlah;
		}
		
		$data['anggota']	= $this->m_anggota->tampil_data()->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/anggota',$data);
		$this->load->view('keanggotaan/footer',$data);
    }
}