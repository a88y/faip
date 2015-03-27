<?php
	$msgStatPenilai = "Data anda sedang diproses oleh penilai.";
	
	$query_chkP = "select penilai_submit from user where id_user = '".$_SESSION['id_u5er']."' limit 1";				
	$result_chkP = mysqli_query($dbLink, $query_chkP);
	if( mysqli_num_rows($result_chkP) > 0 ) {
		$row_chkP = mysqli_fetch_array($result_chkP);
		$status_penilai = $row_chkP['penilai_submit'];
	}
?>