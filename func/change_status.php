<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	include('./checkStatusPengisian.php');
		
	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'add') {
		
//		if($nHasil == 0){
//			$query_1 = "update user set user_submit = '0' where id_user = '".$_SESSION['id_u5er']."' limit 1";
//			$result_1 = mysqli_query($dbLink, $query_1);
//			header('location: ../finish.php?err=='.base64_encode('Data ada yang belum lengkap diisi, mohon di periksa kembali.'));
//			exit();
//		} else {
			$query_1 = "update user set user_submit = '1' where id_user = '".$_SESSION['id_u5er']."' limit 1";
			$result_1 = mysqli_query($dbLink, $query_1);
			if($result_1){
				header('location: ../finish.php?msg=='.base64_encode('Data berhasil disimpan. Mohon tunggu data anda akan segera diproses oleh penilai.'));
				exit();			
			} else {
				header('location: ../finish.php?err=='.base64_encode('Data ada yang belum lengkap diisi, mohon di periksa kembali.'));
				exit();
			}
//		}
		
	} 
		
?>