<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	if(!empty($_GET["tampungId"]) && !empty($_GET["goAction"]) ){
		$tampungId = mysql_real_escape_string($_GET['tampungId']);
		$id = $_GET["goAction"];
		
		$sql = "select * from ".$id."_p where id_".$id."_p_parent = '".$tampungId."' order by nilai_p asc";
		$result = mysqli_query($dbLink,$sql);
		if( mysqli_num_rows($result) > 0 ) {
				echo '<option value="" data-nilai="0" selected >Select One</option>';
			while($row = mysqli_fetch_array($result)) {
				echo '<option value="'.$row['jenis'].'" data-nilai="'.$row['nilai_p'].'">'.$row['jenis'].'</option>';
			}
		} else {
			echo 0;
		}
		
	}
?>