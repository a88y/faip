<?php
	session_start();
	include('../../src/dbconnect.php');
	include('../../src/function.php');
	include('../../func/checkStatusPengisian.php');
		
	if (isset($_GET['reff']) && base64_decode($_GET['reff']) != '') {
		
			$query_1 = "update user set penilai_submit = '1' where id_user = '".base64_decode($_GET['reff'])."' limit 1";
			//echo $query_1;
			$result_1 = mysqli_query($dbLink, $query_1);
			header('location: ../dashboard.php?msg='.base64_encode('Silahkan memulai penilaian anda.'));
			exit();
		
	} 
		
?>