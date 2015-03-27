<?php
	session_start();
	include('./dbconnect.php');
	include('./function.php');
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['send_dologin'] == 'yes') {

		$txtEmail 		= $_POST['txtEmail'];
		$txtPassword	= $_POST['txtPassword'];
	
		$query = "select id_user, id_credential from login where username = '".$txtEmail."' and password = md5('".$txtPassword."') limit 1;";
		$result = mysqli_query($dbLink,$query);
		
		if( mysqli_num_rows($result) > 0 ) {
			
			$row = mysqli_fetch_array($result);
			
			if( $row['id_credential'] == '1' ) {
				
				$row2 = mysqli_fetch_array( mysqli_query($dbLink,"select nama from user where id_user = '".$row['id_user']."'") );
				
				$_SESSION['cred_u5er'] 			= $row['id_credential'];
				$_SESSION['id_u5er'] 			= $row['id_user'];
				$_SESSION['n4ma_u5er']			= $row2['nama'];
				$_SESSION['log1n_penilai_f4ip']	= true;
				
				header('location: ../penilai/dashboard.php');
				exit();
				
			} else if( $row['id_credential'] == '2' ) {
				
				$row2 = mysqli_fetch_array( mysqli_query($dbLink,"select nama from user where id_user = '".$row['id_user']."'") );
				
				$_SESSION['cred_u5er'] 			= $row['id_credential'];
				$_SESSION['id_u5er'] 			= $row['id_user'];
				$_SESSION['n4ma_u5er']			= $row2['nama'];
				$_SESSION['log1n_us3r_f4ip']	= true;
				
				header('location: ../dashboard.php');
				exit();
				
			} else if( $row['id_credential'] == '0' ) {
				
				$row2 = mysqli_fetch_array( mysqli_query($dbLink,"select nama from user where id_user = '".$row['id_user']."'") );
				
				$_SESSION['cred_u5er'] 			= $row['id_credential'];
				$_SESSION['id_u5er'] 			= $row['id_user'];
				$_SESSION['n4ma_u5er']			= $row2['nama'];
				$_SESSION['log1n_4dmin_f4ip']	= true;
				
				header('location: ../admin/dashboard.php');
				exit();
				
			}
			
		} else {
			$_SESSION['cred_u5er'] 			= "";
			$_SESSION['id_u5er'] 			= "";
			$_SESSION['n4ma_u5er']			= "";
			$_SESSION['log1n_us3r_f4ip']	= false;
				
			header('location: ../?err='.base64_encode('Email dan Kata sandi tidak sesuai, silahkan periksa kembali.'));
			exit();
		}
		
	}
?>