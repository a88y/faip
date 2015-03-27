<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	if(!empty($_GET["tampungId"])){
		if($_GET["action"]=="NoKta"){
			$tabel = 'user';
			$idxFiled = 'no_kta';
		} else if($_GET["action"]=="NoKtp"){
			$tabel = 'user';
			$idxFiled = 'no_id';
		} else if($_GET["action"]=="Email"){
			$tabel = 'user';
			$idxFiled = 'email';
		}
		
		$tampungId = mysql_real_escape_string($_GET['tampungId']);
		$sql = "select ".$idxFiled." from ".$tabel." where ".$idxFiled." = '".$tampungId."'";
		$result = mysqli_query($dbLink,$sql);
		if( mysqli_num_rows($result) > 0 ) {
			echo 0;
		} else {
			echo 1;
		}
		
	}
?>