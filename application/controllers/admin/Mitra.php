<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mitra extends MY_Controller {
	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
		$this->load->model('m_akun');
		$this->load->model('m_crud');
		$this->load->model('m_mitra');

		if($this->is_not_login()){
			redirect(base_url('login'));
		}

        if($this->is_not_admin()){
			show_404();
		}
    }

	public function koperasi()
	{
		$data["title"]		= "Data Koperasi";
		$data['koperasi']	= $this->m_mitra->tampil_koperasi()->result();
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/koperasi',$data);
		$this->load->view('admin/footer',$data);
    }

	public function pt()
	{
		$data["title"]		= "Data PT";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/404',$data);
		$this->load->view('admin/footer',$data);
    }

	public function umkm()
	{
		$data["title"]		= "Data UMKM";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/404',$data);
		$this->load->view('admin/footer',$data);
    }

	public function bumn()
	{
		$data["title"]		= "Data BUMN";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/404',$data);
		$this->load->view('admin/footer',$data);
    }

	public function tambah()
	{
		$data["title"]		= "Tambah Data Mitra";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/404',$data);
		$this->load->view('admin/footer',$data);
    }

	public function edit($a,$b)
	{
		$data["title"]		= "Tambah Data Mitra";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/404',$data);
		$this->load->view('admin/footer',$data);
    }
    
    public function hapus($a,$b)
    {
		$data["title"]		= "Tambah Data Mitra";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/404',$data);
		$this->load->view('admin/footer',$data);
    }
}