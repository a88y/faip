<?php
	session_start();
	include('../../src/dbconnect.php');
	include('../../src/function.php');
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'add') {
		$txtNama 					= ubah_huruf_awal($_POST['txtNama']);
		$txtNoKta 					= $_POST['txtNoKta'];
		$txtEmail					= $_POST['txtEmail'];
		$txtPassword				= $_POST['txtPassword'];
		
		$sql = "select no_kta from user where no_kta = '".$txtNoKta."'";
		$result = mysqli_query($dbLink,$sql);
		if( mysqli_num_rows($result) > 0 ) {
			header('location: ../newuser.php?err='.base64_encode('No Kta sudah digunakan.'));
			exit();
		}
		
		$sql = "select email from user where email = '".$txtEmail."'";
		$result = mysqli_query($dbLink,$sql);
		if( mysqli_num_rows($result) > 0 ) {
			header('location: ../newuser.php?err='.base64_encode('Alamat Email sudah digunakan.'));
			exit();
		}
		
		$years = date('Y');
		$maxSQL = "SELECT max(id_user) as maxID FROM login WHERE id_user LIKE '".$years."-%'";
		$maxResult = mysqli_query($dbLink,$maxSQL);
		$data = mysqli_fetch_array($maxResult);
		
		$idMax = $data['maxID'];
		
		$noUrut = (int) substr($idMax, 5, 5);
		$noUrut++;
		$newID = $years . '-' . sprintf("%05s", $noUrut);
				
		
		$query 			= "insert into login ( id_user, id_credential, username, password ) values ( '".$newID."', '1', '".$txtEmail."', md5('".$txtPassword."') )";
		
		$query_user 	= "insert into user ( id_user, nama, email, no_kta ) values ( '".$newID."', '".$txtNama."', '".$txtEmail."', '".$txtNoKta."' )";
		
		$query_email	= "insert into email (id_user,email) values ('".$newID."', '".$txtEmail."');";
	
		if( mysqli_query($dbLink,$query) && mysqli_query($dbLink,$query_user) && mysqli_query($dbLink,$query_email) ) {
				
			header('location: ../dashboard.php?msg='.base64_encode('User Penilai telah didaftarkan.'));
			
		}
		
	}

?>