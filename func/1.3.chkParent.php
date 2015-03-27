<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	if(!empty($_GET["tampungId"])){
		$tampungId = $_GET['tampungId'];
		
		$sql = "select * from 1_3_p where id_1_3_p_parent = '".$tampungId."' order by nilai_p desc";
		$result = mysqli_query($dbLink,$sql);
		if( mysqli_num_rows($result) > 0 ) {
				echo '<li class="selected"><div data-value="" data-nilai="0">Select One</div></li>';
			while($row = mysqli_fetch_array($result)) {
				echo '<li><div data-value="'.$row['jenis'].'" data-nilai="'.$row['nilai_p'].'">'.$row['jenis'].'</div></li>';
			}
		} else {
			echo 0;
		}
		
	}
?>