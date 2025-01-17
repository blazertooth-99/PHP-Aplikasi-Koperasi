<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends MY_Controller {
	function __construct(){
        parent::__construct();
		$this->load->model('m_login');
		$this->load->model('m_akun');
		$this->load->model('m_crud');
		$this->load->model('m_produk');
		$this->load->model('m_ppob');

		if($this->is_not_login()){
			redirect(base_url('login'));
		}

        if($this->is_not_admin()){
			show_404();
		}
    }

	public function index()
	{
		$data["title"]		= "Data Produk";
		$data['produk']		= $this->m_produk->tampil_data()->result();
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/produk',$data);
		$this->load->view('admin/footer',$data);
    }

	public function tambah()
	{
		$data["title"]		= "Data Produk";
		$data['kategori']	= $this->m_produk->tampil_kategori()->result();
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/tambah-produk',$data);
		$this->load->view('admin/footer',$data);
	}
	
	public function aksi_tambah()
	{
		$input					= $this->input->post();
		$harga					= str_replace(".", "", $input['harga']);
		$harga_grosir			= str_replace(".", "", $input['harga_grosir']);
		$harga_beli			    = str_replace(".", "", $input['harga_beli']);
		$nmfile 				= "sehat_dkk".'-'.time();
		$path   				= './img/';
		$config['upload_path'] 	= $path;
		$config['allowed_types']= 'gif|jpg|png|jpeg|bmp';
		$config['file_name'] 	= $nmfile;
		$this->upload->initialize($config);
        if($this->m_produk->lihat_produk($input['barcode'])->num_rows() == 0){
    		if ($this->upload->do_upload('foto')){
    			$gbr 				= $this->upload->data();
    			
    		    /*$tmpName            = $_FILES['foto']['tmp_name'];
        		list($width, $height, $type, $attr) = getimagesize($tmpName);
        		$width              = $width;
        		$height             = $height;
        		$lebar              = number_format($width/10);
        		$tinggi             = number_format($height/10);
        		
                $config['image_library']='gd2';
                $config['source_image']='./img/'.$gbr['file_name'];
                $config['create_thumb']= FALSE;
                $config['maintain_ratio']= FALSE;
                $config['quality']= '100%';
                $config['width']= $lebar;
                $config['height']= $tinggi;
                $config['new_image']= './img/'.$gbr['file_name'];
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();*/
    			$data					= array(
    									'foto' => $gbr['file_name'],
    									'barcode' => $input['barcode'],
    									'id_kategori' => $input['id_kategori'],
    									'nama' => $input['nama'],
    									'harga' => $harga,
    									'harga_grosir' => $harga_grosir,
    									'harga_beli' => $harga_beli,
    									'keterangan' => $input['keterangan'],
    									'deskripsi' => $input['deskripsi'],
    									'status' => $input['status'],
    									'poin' => $input['poin'],
    									'stok' => $input['stok'],
    									'diskon' => $input['diskon'],
    									'id_admin' => $this->session->userdata('sehat_dkk@id_user'),
    									'tgl_input' => date("Y-m-d H:i:s"),
    									'id_outlet' => $this->session->userdata('sehat_dkk@id_outlet')
    			);
    			$this->m_crud->tambah_data($data,'tbl_produk');
    			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data produk berhasil disimpan.</div>');
    			redirect(base_url('admin/produk'));
    		}else{
    		    $data					= array(
    									'barcode' => $input['barcode'],
    									'id_kategori' => $input['id_kategori'],
    									'nama' => $input['nama'],
    									'harga' => $harga,
    									'harga_beli' => $harga_beli,
    									'harga_grosir' => $harga_grosir,
    									'keterangan' => $input['keterangan'],
    									'deskripsi' => $input['deskripsi'],
    									'status' => $input['status'],
    									'poin' => $input['poin'],
    									'stok' => $input['stok'],
    									'diskon' => $input['diskon'],
    									'id_admin' => $this->session->userdata('sehat_dkk@id_user'),
    									'tgl_input' => date("Y-m-d H:i:s"),
    									'id_outlet' => $this->session->userdata('sehat_dkk@id_outlet')
    			);
    			$this->m_crud->tambah_data($data,'tbl_produk');
    			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data produk berhasil disimpan.</div>');
    			redirect(base_url('admin/produk'));
    		}
        }else{
			$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Warning !</strong> Data produk sudah disimpan.</div>');
			redirect(base_url('admin/produk/tambah'));
        }
	}

	public function edit($a=NULL)
	{
		if(!empty($a))
		{
			$data["title"]		= "Data Produk";
			$data['kategori']	= $this->m_produk->tampil_kategori()->result();
			$data['edit']		= $this->m_produk->edit_data($a)->result();
			$this->load->view('admin/head',$data);
			$this->load->view('admin/menu',$data);
			$this->load->view('admin/edit-produk',$data);
			$this->load->view('admin/footer',$data);
		}
		else{
			show_404();
		}
	}

	public function aksi_edit()
	{
		$input					= $this->input->post();
		$harga					= str_replace(".", "", $input['harga']);
		$harga_grosir			= str_replace(".", "", $input['harga_grosir']);
		$harga_beli			    = str_replace(".", "", $input['harga_beli']);
		$nmfile 				= "produk".'-'.time();
		$path   				= './img/';
		$config['upload_path'] 	= $path;
		$config['allowed_types']= 'gif|jpg|png|jpeg|bmp';
		$config['file_name'] 	= $nmfile;
		$this->upload->initialize($config);
		
		$tmpName                = $_FILES['foto']['tmp_name'];
       
		list($width, $height, $type, $attr) = getimagesize($tmpName);

		if ($this->upload->do_upload('foto')){
			$gbr 				= $this->upload->data();
			
		    /*$tmpName            = $_FILES['foto']['tmp_name'];
    		list($width, $height, $type, $attr) = getimagesize($tmpName);
    		$width              = $width;
    		$height             = $height;
    		$lebar              = number_format($width/10);
    		$tinggi             = number_format($height/10);
    		
            $config['image_library']='gd2';
            $config['source_image']='./img/'.$gbr['file_name'];
            $config['create_thumb']= FALSE;
            $config['maintain_ratio']= FALSE;
            $config['quality']= '100%';
            $config['width']= $lebar;
            $config['height']= $tinggi;
            $config['new_image']= './img/'.$gbr['file_name'];
            $this->load->library('image_lib', $config);
            $this->image_lib->resize();*/
			$data					= array(
									'foto' => $gbr['file_name'],
									'barcode' => $input['barcode'],
									'id_kategori' => $input['id_kategori'],
									'nama' => $input['nama'],
									'harga' => $harga,
    								'harga_beli' => $harga_beli,
									'harga_grosir' => $harga_grosir,
									'keterangan' => $input['keterangan'],
									'status' => $input['status'],
									'poin' => $input['poin'],
									'stok' => $input['stok'],
									'diskon' => $input['diskon'],
									'id_admin' => $this->session->userdata('sehat_dkk@id_user'),
									'tgl_input' => date("Y-m-d H:i:s")
			);
			$where				= array('id' => $input['id']);
			$this->m_crud->update_data('tbl_produk',$data,$where);
			unlink($path.$input['foto_lama']);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data produk berhasil disimpan.</div>');
			redirect(base_url('admin/produk'));
		}
		else{
			$data					= array(
									'id_kategori' => $input['id_kategori'],
									'barcode' => $input['barcode'],
									'nama' => $input['nama'],
									'harga' => $harga,
    								'harga_beli' => $harga_beli,
									'harga_grosir' => $harga_grosir,
									'keterangan' => $input['keterangan'],
									'status' => $input['status'],
									'poin' => $input['poin'],
									'stok' => $input['stok'],
									'diskon' => $input['diskon'],
									'id_admin' => $this->session->userdata('sehat_dkk@id_user'),
									'tgl_input' => date("Y-m-d H:i:s")
			);
			$where				= array('id' => $input['id']);
			$this->m_crud->update_data('tbl_produk',$data,$where);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data produk berhasil disimpan.</div>');
			redirect(base_url('admin/produk'));
		}
	}

	public function hapus($a)
	{
	    $path   			= './img/';
        $tabel				= "tbl_produk";
		$where 				= array('id' => $a);
		
		foreach($this->m_produk->edit_data($a)->result() as $b)
		{
		    $foto           = $b->foto;
		}
		if(!empty($foto)){
		    unlink($path.$foto);
		}
		$this->m_crud->hapus($tabel,$where);
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data produk berhasil dihapus.</div>');
		echo"<Script>window.location=history.go(-1)</script>";
	}
	
	public function export()
	{
		/*header("Content-type: application/vnd-ms-excel");
		header("Content-Disposition: attachment; filename=Data Produk.xlsx");*/
		$data["title"]		= "Data Produk sehat_dkk";
		
		$data['cetak']	    = $this->m_produk->tampil_data()->result();
		$this->load->view('admin/cetak-produk-excel',$data);
				
	}

	public function ppob()
	{
		$data['title']		= 'Data Produk PPOB';
		$data['produk']		= $this->m_ppob->tampil_data_produk()->result();
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/produk-ppob',$data);
		$this->load->view('admin/footer',$data);
	}

	public function editppob($a)
	{
		$data['title']		= 'Data Produk PPOB';
		$data['edit']		= $this->m_ppob->edit_data_produk($a)->result();
		$this->load->view('admin/head',$data);
		$this->load->view('admin/menu',$data);
		$this->load->view('admin/edit-produk-ppob',$data);
		$this->load->view('admin/footer',$data);
	}

	public function aksi_editppob()
	{
	    if(!empty($_POST['id_koperasi'])){
    		$nominal		    = str_replace(".", "", $_POST['nominal']);
    		$data				= array(
    							'nominal' => $nominal
    		);
    		$where				= array('id' => $_POST['id']);
    		$this->m_crud->update_data('tbl_produk_ppob_koperasi',$data,$where);
	    }else{
	        $nominal		    = str_replace(".", "", $_POST['nominal']);
	        $id_koperasi        = 2;
    		$data				= array(
    							'nominal' => $nominal,
    							'id_produk' => $_POST['id_produk'],
    							'id_koperasi' => $id_koperasi
    		);
			$this->m_crud->tambah_data($data,'tbl_produk_ppob_koperasi');
	    }
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>Berhasil !</strong> Data produk PPOB INDORA berhasil disimpan.</div>');
		redirect(base_url('admin/produk/ppob'));
	}
}