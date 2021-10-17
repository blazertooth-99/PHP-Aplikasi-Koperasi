<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notifikasi extends MY_Controller {
	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
		$this->load->model('m_akun');
		$this->load->model('m_crud');
		$this->load->model('m_anggota');

		if($this->is_not_login()){
			redirect(base_url('login'));
		}

        if($this->is_not_admin()){
			show_404();
		}
    }

	public function index()
	{
		$data["title"]		= "Notifikasi Aplikasi";
		$data['notif']		= $this->m_anggota->tampil_notifikasi()->result();
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/notifikasi',$data);
		$this->load->view('admin/footer',$data);
  }

	public function tambah()
	{
		$data["title"]		= "Notifikasi Aplikasi";
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/tambah-notifikasi',$data);
		$this->load->view('admin/footer',$data);
	}
	
	public function aksi_tambah()
	{
		include_once 'firebase.php';    
		include_once 'push.php';    
		$firebase		        = new Firebase();
		$push	    	        = new Push(); 
		$payload                = array();
        $payload['team']        = 'Indonesia';
        $payload['score']       = '5.6'; 
        $title                  = isset($_POST['title']) ? $_POST['title'] : ''; 
        $message                = isset($_POST['message']) ? $_POST['message'] : ''; 
		$push_type              = isset($_POST['push_type']) ? $_POST['push_type'] : '';    
		$input					= $this->input->post(); 
		$nmfile 				= "notif".'-'.time();
		$path   				= './img/';
		$config['upload_path'] 	= $path;
		$config['allowed_types']= 'gif|jpg|png|jpeg|bmp';
		$config['file_name'] 	= $nmfile;
		$this->upload->initialize($config);
		if ($this->upload->do_upload('foto')){
			$gbr 				= $this->upload->data();   
			$push->setImage("https://pengurus.kopranesia.id/img/".$gbr['file_name']);
			foreach($this->m_anggota->tampil_data()->result() as $a)
			{
				$data					= array(
					'judul' 	=> $_POST['title'],
					'id_user' 	=> $a->id_user,
					'keterangan'=> $_POST['message'], 
					'foto'	    => $gbr['file_name'], 
					'tanggal'   => date("Y-m-d H:i:s")
					);
					$this->m_crud->tambah_data($data,'tbl_notif_broadcast');
			}	
		 
		}else{ 
			$push->setImage('');
			foreach($this->m_anggota->tampil_data()->result() as $a)
			{
				$data					= array(
					'judul' 	=> $_POST['title'],
					'id_user' 	=> $a->id_user,
					'keterangan'=> $_POST['message'],  
					'tanggal'   => date("Y-m-d H:i:s")
					);
					$this->m_crud->tambah_data($data,'tbl_notif_broadcast');
			}
		}
 
	    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Notif Broadcast berhasil disimpan.</div>');
	 
        $push->setTitle($title);
		$push->setMessage($message);  
        $push->setIsBackground(FALSE);
        $push->setPayload($payload);
 
 
        $json = '';
        $response = '';
 
        if ($push_type == 'topic') {
            $json = $push->getPush();
            $response = $firebase->sendToTopic('global', $json);
        } else if ($push_type == 'individual') {
            $json = $push->getPush();
            $regId = isset($_POST['regId']) ? $_POST['regId'] : '';
            $response = $firebase->send($regId, $json);
        }
	
			redirect(base_url('admin/notifikasi'));
	 		
	} 
	
	public function hapus($a,$b)
	{
		$tabel				= "tbl_notif_broadcast";
        $judul              = $this->db->query("SELECT judul FROM tbl_notif_broadcast WHERE id_notif = '$a' AND tanggal = '$b'")->row()->judul;
		$where 				= array('judul' => $judul);
		$this->m_crud->hapus($tabel,$where);
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data Notifikasi broadcast berhasil dihapus.</div>');
		echo"<Script>window.location=history.go(-1)</script>";
	}
}