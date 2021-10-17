<?php
class M_login extends CI_Model{

    function cek_login($username,$password,$id_agen){
		$query=$this->db->query("SELECT * FROM tbl_admin WHERE username = '$username' AND password = '$password' AND level = 1 AND id_agen = '$id_agen' LIMIT 1");
		return $query;
	}

    function cek_kasir($username,$password,$id_agen){
		$query=$this->db->query("SELECT * FROM tbl_admin WHERE username = '$username' AND password = '$password' AND level = 2 AND id_agen = '$id_agen' LIMIT 1");
		return $query;
	}

    function cek_keanggotaan($username,$password,$id_agen){
		$query=$this->db->query("SELECT * FROM tbl_admin WHERE username = '$username' AND password = '$password' AND level = 3 AND id_agen = '$id_agen' LIMIT 1");
		return $query;
	}
    
}