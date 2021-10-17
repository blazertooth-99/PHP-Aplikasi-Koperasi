<?php
class M_ppob extends CI_Model{

  function tampil_data(){
    $query=$this->db->query("SELECT * FROM tbl_ppob");
    return $query;
  }
  
  function tampil_saldo(){
    //$id_admin   = $this->session->userdata('sehat_dkk@id_user');
    $query      = $this->db->query("SELECT saldo FROM tbl_agen_resmi WHERE id = '2'");
    return $query;
  }

  function tampil_data_produk(){
    $query=$this->db->query("SELECT * FROM v_produk_agratek WHERE id_koperasi = 2 OR id_koperasi IS NULL");
    return $query;
  }

  function edit_data_produk($a){
    $query=$this->db->query("SELECT * FROM v_produk_agratek WHERE id = '$a' LIMIT 1");
    return $query;
  }
  
  function tampil_deposit(){
    $query      = $this->db->query("SELECT * FROM v_potong_saldo WHERE id_koperasi = '2' ORDER BY tanggal DESC");
    return $query;
  }
  
  function edit_deposit($a){
    $query      = $this->db->query("SELECT * FROM v_potong_saldo WHERE id_koperasi = '2' AND id = '$a'");
    return $query;
  }

  function tampil_data_limit(){
    $query=$this->db->query("SELECT * FROM tbl_ppob limit 9");
    return $query;
  }
    
  function cari_provider($a){
    $query=$this->db->query("SELECT * FROM tbl_ppob_nohp WHERE nomor = '$a'")->result();
    return $query;
  }
    
  function tampil_data_transaksi($a){
    //$query=$this->db->query("SELECT * FROM tbl_trx_ppob_mobile_pulsa WHERE id = '$a'");
    $query=$this->db->query("SELECT * FROM tbl_trx_ppob_agratek WHERE id_trx = '$a'");
    return $query;
  }
    
  function tampil_data_transaksi_ref_id($a){
    $query=$this->db->query("SELECT * FROM tbl_trx_ppob_mobile_pulsa WHERE ref_id = '$a'");
    return $query;
  }
    
  function tampil_data_riwayat_transaksi(){
    $query=$this->db->query("SELECT * FROM tbl_trx_ppob_mobile_pulsa WHERE id_user = ''");
    return $query;
  }
    
  /* function cari_provider($a){
    $query=$this->db->query("SELECT * FROM tbl_ppob_nohp WHERE nomor = '$a'")->result();
    return $query;
  } */

  public function tampil_nominal_pulsa($a,$b)
  {
    $query=$this->db->query("SELECT * FROM v_produk_agratek WHERE penyedia = '$a' AND kategori = '$b'");
    return $query;
  }

  public function tampil_riwayat()
  {
    $id_admin   = $this->session->userdata('sehat_dkk@id_user');
    $query      = $this->db->query("SELECT * FROM tbl_riwayat WHERE id_admin = '$id_admin' AND keterangan = 'PPOB' AND penyedia = 'AGRATEK' ORDER BY tanggal DESC");
    return $query;
  }
}