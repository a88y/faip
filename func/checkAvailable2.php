<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	if(!empty($_GET["tampungId"])){
		
		$tampungId = mysql_real_escape_string($_GET['tampungId']);
		$oldVal = mysql_real_escape_string($_GET['oldVal']);
		$sql = "select no_kta from user where no_kta = '".$tampungId."' and no_kta != '".$oldVal."'";
		$result = mysqli_query($dbLink,$sql);
		if( mysqli_num_rows($result) > 0 ) {
			echo 0;
		} else {
			echo 1;
		}
		
	}
?>