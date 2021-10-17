<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Saldo extends MY_Controller {
	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
		$this->load->model('m_crud');
		$this->load->model('m_akun');
		$this->load->model('m_ppob');
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
    	$data["title"]		= "Data Transaksi Potong Saldo PPOB";
		$data['saldo']		= $this->m_ppob->tampil_deposit()->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/riwayat-potongan-saldo',$data);
		$this->load->view('keanggotaan/footer',$data);
	}

	public function tambah()
	{
    	$data["title"]		= "Data Transaksi Potong Saldo PPOB";
    	$data['anggota']    = $this->m_anggota->tampil_data()->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/tambah-potongan-saldo',$data);
		$this->load->view('keanggotaan/footer',$data);
	}
	
	public function aksi_tambah()
	{
	    $id_user            = $_POST['id_user'];
	    $tanggal            = $_POST['tanggal'].' '.date('H:i:s');
	    $nominal            = str_replace(".", "", $input['nominal']);
	    $status             = 'Y';
	    $id_koperasi        = 2;
	    
	    $data               = array(
	                        'id_user' => $id_user,
	                        'tanggal' => $tanggal,
	                        'nominal' => $nominal,
	                        'status' => $status,
	                        'id_koperasi' => $id_koperasi
	    );
	    
	    $this->m_crud->tambah_data($data,'tbl_potong_saldo');
	    
	    
	    $sukarela           = array(
	                        'id_user' => $id_user,
	                        'id_admin' => $this->session->userdata('sehat_dkk@id_user'),
	                        'nominal' => $nominal,
	                        'tanggal' => $tanggal,
	                        'periode' => $_POST['tanggal']
	    );
	    
	    $this->m_crud->tambah_data($sukarela,'tbl_sim_sukarela');
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data saldo anggota berhasil ditambahkan.</div>');
		redirect(base_url('keanggotaan/saldo'));
	}

	public function edit($a)
	{
    	$data["title"]		= "Data Transaksi Potong Saldo PPOB";
		$data['edit']		= $this->m_ppob->edit_deposit($a)->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/edit-potongan-saldo',$data);
		$this->load->view('keanggotaan/footer',$data);
	}
	
	public function aksi_edit()
	{
	    $id                 = $_POST['id'];
	    $id_user            = $_POST['id_user'];
	    $tanggal            = $_POST['tanggal'].' '.date('H:i:s');
	    $nominal            = str_replace(".", "", $input['nominal']);
	    $tanggalnya         = $_POST['tanggalnya'];
	    
	    $data               = array(
	                        'tanggal' => $tanggal,
	                        'nominal' => $nominal
	    );
		$where				= array('id' => $id);
		$this->m_crud->update_data('tbl_potong_saldo',$data,$where);
	    
	    
	    $sukarela           = array(
	                        'nominal' => $nominal,
	                        'tanggal' => $tanggal,
	                        'periode' => $_POST['tanggal']
	    );
		$wherenya				= array('tanggal' => $tanggalnya, 'id_user' => $id_user);
		$this->m_crud->update_data('tbl_sim_sukarela',$sukarela,$wherenya);
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data saldo anggota berhasil ditambahkan.</div>');
		redirect(base_url('keanggotaan/saldo'));
	}
}