<?php
	session_start();
	include('../../src/dbconnect.php');

if( isset($_GET['reff']) && base64_decode($_GET['reff'])!='' ) {
	
	$id_user = base64_decode($_GET['reff']);
	$nama = base64_decode($_GET['user']);
	
	$newPwd = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 5);
	
	$query = "update login set password = md5('".$newPwd."') where id_user = '".$id_user."' limit 1;";
	
	if( mysqli_query($dbLink, $query) ) {
		header('location: ../dashboard.php?msg='.base64_encode('Berhasil mereset password untuk user : '.$nama.'. Password yang baru adalah : '.$newPwd));
	} else {
		header('location: ../dashboard.php?msg='.base64_encode('Gagal mereset password untuk user : '.$nama.'. Silahkan coba beberapa saat lagi.'));
	}	
	
} else {
	header('location: ../dashboard.php?msg='.base64_encode('Gagal mereset password. Silahkan pilih User terlebih dahulu.'));
}

?>