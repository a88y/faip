<?php
	session_start();
	include('../../src/dbconnect.php');
	include('../../src/function.php');
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		
		$id_user = base64_decode($_GET['reff']);
		
		$txtNama 					= ubah_huruf_awal($_POST['txtNama']);
		$txtNoKta 					= $_POST['txtNoKta'];
		
		$query = "update user set nama = '".$txtNama."', no_kta = '".$txtNoKta."' where id_user = '".$id_user."' limit 1;";
	
		if( mysqli_query($dbLink,$query) ) {
			header('location: ../dashboard.php?msg='.base64_encode('Data user telah dirubah.'));
		} else {
			header('location: ../dashboard.php?msg='.base64_encode('Data user gagal dirubah. Silahkan coba lagi.'));
		}
		
	}

?>