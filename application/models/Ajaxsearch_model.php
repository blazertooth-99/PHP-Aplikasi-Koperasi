<?php
class Ajaxsearch_model extends CI_Model
{
	function fetch_data($a)
	{
		$query=$this->db->query("SELECT id, penyedia, code_produk, nama, deskripsi, harga+fee_vikosha+biaya_admin+nominal AS harga_jual, provider, poin, kategori, status, id_koperasi FROM v_produk_agratek WHERE penyedia LIKE '%$a%' AND kategori = 'pulsa' AND id_koperasi = '2'");
		return $query;		
	}
	
	function fetch_data_paket($a)
	{
		$query=$this->db->query("SELECT id, penyedia, code_produk, nama, deskripsi, harga+fee_vikosha+biaya_admin+nominal AS harga_jual, provider, poin, kategori, status, id_koperasi FROM v_produk_agratek WHERE penyedia LIKE '%$a%' AND kategori = 'data' AND id_koperasi = '2'");
		return $query;		
	}
	
	function fetch_plntoken($a)
	{
		$query=$this->db->query("SELECT id, penyedia, code_produk, nama, deskripsi, harga+fee_vikosha+biaya_admin+nominal AS harga_jual, provider, poin, kategori, status, id_koperasi FROM v_produk_agratek WHERE penyedia LIKE '%$a%' AND kategori = 'plntoken' AND id_koperasi = '2'");
		return $query;		
	}
}
?>