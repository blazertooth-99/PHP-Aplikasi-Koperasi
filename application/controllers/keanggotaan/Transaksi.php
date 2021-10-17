<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Transaksi extends MY_Controller {
	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
		$this->load->model('m_crud');
		$this->load->model('m_akun');
		$this->load->model('m_anggota');
		$this->load->model('m_simpanan');
		$this->load->model('m_riwayat');
		$this->load->model('m_transaksi');
		$this->load->model('m_ppob');

		if($this->is_not_login()){
			redirect(base_url('login'));
		}

        if($this->is_not_keanggotaan()){
			show_404();
		}
    }

	public function index()
	{
		$data["title"]			= "Data Transaksi";
		if(isset($_POST['filter'])){
			$simpanan			= $_POST['simpanan'];
			$id_propinsi		= $_POST['id_propinsi'];
			$id_kabupaten		= $_POST['id_kabupaten'];
			$id_kecamatan		= $_POST['id_kecamatan'];
			$id_kelurahan		= $_POST['id_kelurahan'];
			$data['pokok']		= $this->m_simpanan->tampil_data('pokok')->result();
			$data['wajib']		= $this->m_simpanan->tampil_data('wajib')->result();
			$data['sukarela']	= $this->m_simpanan->tampil_data('sukarela')->result();
		}
		else{
			
			$simpanan			= '';
			$id_propinsi		= '';
			$id_kabupaten		= '';
			$id_kecamatan		= '';
			$id_kelurahan		= '';
			$data['pokok']		= $this->m_simpanan->tampil_data('pokok')->result();
			$data['wajib']		= $this->m_simpanan->tampil_data('wajib')->result();
			$data['sukarela']	= $this->m_simpanan->tampil_data('sukarela')->result();
		}

		$data['simpanan']		= $simpanan;
		$data['id_propinsi']	= $id_propinsi;
		$data['id_kabupaten']	= $id_kabupaten;
		$data['id_kecamatan']	= $id_kecamatan;
		$data['id_kelurahan']	= $id_kelurahan;

		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/simpanan',$data);
		$this->load->view('keanggotaan/footer',$data);
	}

	public function baru()
	{
		$data["title"]		= "Data Transaksi";
		$data['pokok']		= $this->m_simpanan->tampil_data('pokok')->result();
		$data['wajib']		= $this->m_simpanan->tampil_data('wajib')->result();
		$data['sukarela']	= $this->m_simpanan->tampil_data('sukarela')->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/transaksi-baru',$data);
		$this->load->view('keanggotaan/footer',$data);
	}

	public function aksi_baru(){
		$id_user			= $_POST['id_user'];
		$tanggal			= $_POST['tanggal'].' '.date('H:i:s');
		$nominal			= str_replace(".", "", $_POST['nominal']);
		$id_admin			= $this->session->userdata('sehat_dkk@id_user');
		$simpanan			= $_POST['simpanan'];
        if($this->db->query("SELECT * FROM tbl_user WHERE id_user = '$id_user' LIMIT 1")->num_rows() < 1){
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Peringatan !</strong> No. Anggota tidak dikenal.</div>');
			redirect(base_url('keanggotaan/transaksi/baru'));
        }
		switch ($simpanan) {
			case '1':
			    $saldo      = $this->m_ppob->tampil_saldo()->row()->saldo;
			    
			    $up_saldo   = array(
			                'saldo' => $saldo-$nominal
			    );
			    
			    $where_sal  = array(
			                'id' => 2    
			    );
			    
			    $this->m_crud->update_data('tbl_agen_resmi',$up_saldo,$where_sal);
			    
				$sukarela	= array(
							'id_user' => $id_user,
							'tanggal' => $tanggal,
							'nominal' => $nominal,
							'id_admin' => $id_admin,
							'periode' => date('Y-12-31')
				);

				$this->m_crud->tambah_data($sukarela,'tbl_sim_sukarela');

				$riwayat	= array(
							'judul' => 'Pembayaran',
							'deskripsi' => 'Simpanan Sukarela Rp. '.$nominal,
							'nominal' => $nominal,
							'tanggal' => $tanggal,
							'id_user'  => $id_user,
							'id_admin' =>  $id_admin,
							'keterangan' => 'tunai'
				);
				$this->m_crud->tambah_data($riwayat,'tbl_riwayat');

				$notifikasi	= array(
							'id_user' => $id_user,
							'keterangan' => 'Simpanan Sukarela Rp. '.$nominal,
							'judul' => 'Pembayaran',
							'status' => 'Y',
							'tanggal' => $_POST['tanggal']
				);
				$this->m_crud->tambah_data($notifikasi,'tbl_notif');
				$id_simpanan	= $this->db->query("SELECT id_simpanan FROM tbl_sim_sukarela WHERE id_user = '$id_user' AND tanggal = '$tanggal' ORDER BY id_simpanan DESC LIMIT 1")->row()->id_simpanan;
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Transaksi tidak dikenal.</div>');
				redirect(base_url('keanggotaan/transaksi/cetak/sukarela/'.$id_simpanan));

				break;
			
			case '2':
				/*$wajib		= array(
							'id_user' => $id_user,
							'tanggal' => $tanggal,
							'nominal' => $nominal,
							'id_admin' => $id_admin,
							'periode' => date('Y')
				);

				$this->m_crud->tambah_data($wajib,'tbl_sim_wajib');

				$riwayat	= array(
							'judul' => 'Pembayaran',
							'deskripsi' => 'Simpanan Wajib Rp. '.$nominal,
							'nominal' => $nominal,
							'tanggal' => $tanggal,
							'id_user'  => $id_user,
							'id_admin' =>  $id_admin,
							'keterangan' => 'tunai'
				);
				$this->m_crud->tambah_data($riwayat,'tbl_riwayat');

				$notifikasi	= array(
							'id_user' => $id_user,
							'keterangan' => 'Simpanan Wajib Rp. '.$nominal,
							'judul' => 'Pembayaran',
							'status' => 'Y',
							'tanggal' => $_POST['tanggal']
				);
				$this->m_crud->tambah_data($notifikasi,'tbl_notif');
				$id_simpanan	= $this->db->query("SELECT id_simpanan FROM tbl_sim_wajib WHERE id_user = '$id_user' AND tanggal = '$tanggal' ORDER BY id_simpanan DESC LIMIT 1")->row()->id_simpanan;
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Transaksi tidak dikenal.</div>');
				redirect(base_url('keanggotaan/transaksi/cetak/wajib/'.$id_simpanan));*/
				break;
			
			default:
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Gagal !</strong> Transaksi tidak dikenal.</div>');
				redirect(base_url('keanggotaan/transaksi/baru'));
				break;
		}		
	}

	public function cari_anggota()
	{
		if (isset($_GET['term'])) {
			$a				= $_GET['term'];
		  	$b 				= $this->m_anggota->cari_anggota($a);
		   	if (count($b) > 0) {
		    foreach ($b as $c)
		     	$data[]	 	= array(
							'id_user' => $c->id_user,
							'label' => $c->no_anggota,
							'nama' => $c->nama,
							'kelurahan' => $c->kelurahan,
							'kecamatan' => $c->kecamatan,
							'rt' => $c->rt,
							'rw' => $c->rw
				);
		     	echo json_encode($data);
		   	}
		}
	}

	public function riwayat(){
		$data["title"]		= "Data Transaksi";
		$data['sukarela']	= $this->m_riwayat->tampil_data('sukarela')->result();
		$data['pokok']		= $this->m_riwayat->tampil_data('pokok')->result();
		$data['wajib']		= $this->m_riwayat->tampil_data('wajib')->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/riwayat-simpanan',$data);
		$this->load->view('keanggotaan/footer',$data);		
	}

	/*public function verifikasi(){
		$data["title"]		= "Verifiikasi Transaksi";
		$data['verifikasi']	= $this->m_transaksi->tampil_pembayaran()->result();
		$this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/verifikasi-transaksi',$data);
		$this->load->view('keanggotaan/footer',$data);	
	}*/

	public function aksi_verifikasi($a){
		$id_admin			= $this->session->userdata('sehat_dkk@id_user');
		$periode			= date('Y-m-d');
		foreach($this->m_transaksi->edit_pembayaran($a)->result() as $b){
			$simpanan		= $b->simpanan;
			$nominal		= $b->nominal;
			$id_user		= $b->id_user;
			$tanggal		= $b->tgl;
		}

		$edit				= array(
							'verif' => 'Y',
							'id_admin' => $id_admin,
							'tgl_verif' => date('Y-m-d H:i:s')
		);

		$where 				= array(
							'id' => $a
		);
		$this->m_crud->update_data('tbl_bayar_apk',$edit,$where);

		if($simpanan == 'Simpanan Wajib'){
			$data			= array(
							'id_user' => $id_user,
							'id_admin' => $id_admin,
							'nominal' => $nominal,
							'tanggal' => $tanggal,
							'periode' => $periode,
							'verif' => 'Y'
			);

			$this->m_crud->tambah_data($data,'tbl_sim_wajib');
			$riwayat	= array(
							'judul' => 'Pembayaran',
							'deskripsi' => 'Simpanan Wajib Rp. '.$nominal,
							'nominal' => $nominal,
							'tanggal' => $tanggal,
							'id_user'  => $id_user,
							'id_admin' =>  $id_admin,
							'keterangan' => 'tunai'
				);
				$this->m_crud->tambah_data($riwayat,'tbl_riwayat');

				$notifikasi	= array(
							'id_user' => $id_user,
							'keterangan' => 'Simpanan Wajib Rp. '.$nominal,
							'judul' => 'Pembayaran',
							'status' => 'Y',
							'tanggal' => date('Y-m-d')
				);
				$this->m_crud->tambah_data($notifikasi,'tbl_notif');
				
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Transaksi terverifikasi.</div>');
			redirect(base_url('keanggotaan/transaksi/verifikasi'));
		}
		elseif($simpanan == 'Simpanan Sukarela'){
			$data			= array(
							'id_user' => $id_user,
							'id_admin' => $id_admin,
							'nominal' => $nominal,
							'tanggal' => $tanggal,
							'periode' => $periode
			);

			$this->m_crud->tambah_data($data,'tbl_sim_sukarela');
			
			
				$riwayat	= array(
							'judul' => 'Pembayaran',
							'deskripsi' => 'Simpanan Sukarela Rp. '.$nominal,
							'nominal' => $nominal,
							'tanggal' => $tanggal,
							'id_user'  => $id_user,
							'id_admin' =>  $id_admin,
							'keterangan' => 'tunai'
				);
				$this->m_crud->tambah_data($riwayat,'tbl_riwayat');

				$notifikasi	= array(
							'id_user' => $id_user,
							'keterangan' => 'Simpanan Sukarela Rp. '.$nominal,
							'judul' => 'Pembayaran',
							'status' => 'Y',
							'tanggal' => date('Y-m-d')
				);
				$this->m_crud->tambah_data($notifikasi,'tbl_notif');
				
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Transaksi terverifikasi.</div>');
			redirect(base_url('keanggotaan/transaksi/verifikasi'));
		}
		else{
			show_404();
		}
	}

	public function cetak($a,$b=NULL){
		$data["title"]		= "Data Transaksi";
		/* $this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/404',$data);
		$this->load->view('keanggotaan/footer',$data); */
		switch ($a) {
			case 'sukarela':
				if(!empty($b)){
					$data['cetak']	= $this->m_simpanan->edit_data($a,$b)->result();
					$this->load->view('keanggotaan/cetak-sukarela',$data);
				}else{
					$data['cetak']	= $this->m_simpanan->tampil_data($a)->result();
					$this->load->view('keanggotaan/cetak-simpanan-sukarela',$data);
				}
				break;
			
			case 'wajib':
				$data['cetak']	= $this->m_simpanan->edit_data($a,$b)->result();
				$this->load->view('keanggotaan/cetak-wajib',$data);
				break;
			
			case 'pokok':
				$data['cetak']	= $this->m_simpanan->edit_data($a,$b)->result();
				$this->load->view('keanggotaan/cetak-pokok',$data);
				break;
			
			default:
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Transaksi tidak dikenal.</div>');
				redirect(base_url('keanggotaan/transaksi/baru'));
				break;
		}
	}

	public function export($a=NULL,$b=NULL){
		$data["title"]		= "Data Transaksi";
		/* $this->load->view('keanggotaan/head',$data);
		$this->load->view('keanggotaan/menu',$data);
		$this->load->view('keanggotaan/404',$data);
		$this->load->view('keanggotaan/footer',$data); */
		switch ($a) {
			case 'sukarela':
				if(!empty($b)){
					$data['cetak']	= $this->m_simpanan->edit_data($a,$b)->result();
					$this->load->view('keanggotaan/cetak-sukarela',$data);
				}else{
					$data['cetak']	= $this->m_simpanan->tampil_data($a)->result();
					$this->load->view('keanggotaan/cetak-simpanan-sukarela-excel',$data);
				}
				break;
			
			case 'wajib':
			    if(!empty($b)){
					$data['cetak']	= $this->m_simpanan->edit_data($a,$b)->result();
				}else{
					$data['cetak']	= $this->m_simpanan->tampil_data($a)->result();
				}
				$this->load->view('keanggotaan/cetak-wajib-excel',$data);
				break;
			
			case 'pokok':
			    if(!empty($b)){
					$data['cetak']	= $this->m_simpanan->edit_data($a,$b)->result();
				}else{
					$data['cetak']	= $this->m_simpanan->tampil_data($a)->result();
				}
				$this->load->view('keanggotaan/cetak-pokok-excel',$data);
				break;
			
			default:
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Transaksi tidak dikenal.</div>');
				redirect(base_url('keanggotaan/transaksi'));
				break;
		}
	}
	
	public function hapus($a,$b){
	    switch ($a) {
			case 'sukarela':
				$tabel				= "tbl_sim_sukarela";
				$where 				= array('id_simpanan' => $b);
				$this->m_crud->hapus($tabel,$where);
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data transaksi simpanan sukarela berhasil dihapus.</div>');
				echo"<Script>window.location=history.go(-1)</script>";
				break;
			
			case 'wajib':
				$tabel				= "tbl_sim_wajib";
				$where 				= array('id_simpanan' => $b);
				$this->m_crud->hapus($tabel,$where);
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data transaksi simpanan wajib berhasil dihapus.</div>');
				echo"<Script>window.location=history.go(-1)</script>";
				break;
			default:
				show_404();
				break;
		}
	}
}