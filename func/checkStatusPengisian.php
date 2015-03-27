<?php
	$n1 = 1; $n2 = 0; $n3 = 0; $n4 = 0; $n5 = 0; $n6 = 0; $n7 = 0; $n8 = 0; $n9 = 0; $n10 = 0; $n11 = 0; $n12 = 0; $n13 = 0; $n14 = 0; $n15 = 0; $n16 = 0; $n17 = 0; $n18 = 0;
	$stat2 = '<i class="fa fa-times"></i>'; $stat3 = '<i class="fa fa-times"></i>'; $stat4 = '<i class="fa fa-times"></i>'; $stat5 = '<i class="fa fa-times"></i>'; $stat6 = '<i class="fa fa-times"></i>'; $stat7 = '<i class="fa fa-times"></i>'; $stat8 = '<i class="fa fa-times"></i>'; $stat9 = '<i class="fa fa-times"></i>'; $stat10 = '<i class="fa fa-times"></i>'; $stat11 = '<i class="fa fa-times"></i>'; $stat12 = '<i class="fa fa-times"></i>'; $stat13 = '<i class="fa fa-times"></i>'; $stat14 = '<i class="fa fa-times"></i>'; $stat15 = '<i class="fa fa-times"></i>'; $stat16 = '<i class="fa fa-times"></i>'; $stat17 = '<i class="fa fa-times"></i>'; $stat18 = '<i class="fa fa-times"></i>';
	
	$query_step2 = "select * from 1_2 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step2 = mysqli_query($dbLink,$query_step2);
	if( mysqli_num_rows($result_step2) > 0 ) {
		$stat2 = '<i class="fa fa-check"></i>';
		$n2 = 1;
	}
	$query_step3 = "select * from 1_3 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step3 = mysqli_query($dbLink,$query_step3);
	if( mysqli_num_rows($result_step3) > 0 ) {
		$stat3 = '<i class="fa fa-check"></i>';
		$n3 = 1;
	}
	$query_step4 = "select * from 1_4 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step4 = mysqli_query($dbLink,$query_step4);
	if( mysqli_num_rows($result_step4) > 0 ) {
		$stat4 = '<i class="fa fa-check"></i>';
		$n4 = 1;
	}
	$query_step5 = "select * from 1_5 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step5 = mysqli_query($dbLink,$query_step5);
	if( mysqli_num_rows($result_step5) > 0 ) {
		$stat5 = '<i class="fa fa-check"></i>';
		$n5 = 1;
	}
	$query_step6 = "select * from 1_6 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step6 = mysqli_query($dbLink,$query_step6);
	if( mysqli_num_rows($result_step6) > 0 ) {
		$stat6 = '<i class="fa fa-check"></i>';
		$n6 = 1;
	}
	$query_step7 = "select * from 2_1 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step7 = mysqli_query($dbLink,$query_step7);
	if( mysqli_num_rows($result_step7) > 0 ) {
		$stat7 = '<i class="fa fa-check"></i>';
		$n7 = 1;
	}
	$query_step8 = "select * from 2_2 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step8 = mysqli_query($dbLink,$query_step8);
	if( mysqli_num_rows($result_step8) > 0 ) {
		$stat8 = '<i class="fa fa-check"></i>';
		$n8 = 1;
	}
	$query_step9 = "select * from 3_1 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step9 = mysqli_query($dbLink,$query_step9);
	if( mysqli_num_rows($result_step9) > 0 ) {
		$stat9 = '<i class="fa fa-check"></i>';
		$n9 = 1;
	}
	$query_step10 = "select * from 3_2 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step10 = mysqli_query($dbLink,$query_step10);
	if( mysqli_num_rows($result_step10) > 0 ) {
		$stat10 = '<i class="fa fa-check"></i>';
		$n10 = 1;
	}
	$query_step11 = "select * from 3_3 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step11 = mysqli_query($dbLink,$query_step11);
	if( mysqli_num_rows($result_step11) > 0 ) {
		$stat11 = '<i class="fa fa-check"></i>';
		$n11 = 1;
	}
	$query_step12 = "select * from 3_4 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step12 = mysqli_query($dbLink,$query_step12);
	if( mysqli_num_rows($result_step12) > 0 ) {
		$stat12 = '<i class="fa fa-check"></i>';
		$n12 = 1;
	}
	$query_step13 = "select * from 3_5 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step13 = mysqli_query($dbLink,$query_step13);
	if( mysqli_num_rows($result_step13) > 0 ) {
		$stat13 = '<i class="fa fa-check"></i>';
		$n13 = 1;
	}
	$query_step14 = "select * from 4_1 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step14 = mysqli_query($dbLink,$query_step14);
	if( mysqli_num_rows($result_step14) > 0 ) {
		$stat14 = '<i class="fa fa-check"></i>';
		$n14 = 1;
	}
	$query_step15 = "select * from 4_2 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step15 = mysqli_query($dbLink,$query_step15);
	if( mysqli_num_rows($result_step15) > 0 ) {
		$stat15 = '<i class="fa fa-check"></i>';
		$n15 = 1;
	}
	$query_step16 = "select * from 4_3 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step16 = mysqli_query($dbLink,$query_step16);
	if( mysqli_num_rows($result_step16) > 0 ) {
		$stat16 = '<i class="fa fa-check"></i>';
		$n16 = 1;
	}
	$query_step17 = "select * from 4_4 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step17 = mysqli_query($dbLink,$query_step17);
	if( mysqli_num_rows($result_step17) > 0 ) {
		$stat17 = '<i class="fa fa-check"></i>';
		$n17 = 1;
	}
	$query_step18 = "select * from 5_1 where id_user = '".$_SESSION['id_u5er']."' limit 1";
	$result_step18 = mysqli_query($dbLink,$query_step18);
	if( mysqli_num_rows($result_step18) > 0 ) {
		$stat18 = '<i class="fa fa-check"></i>';
		$n18 = 1;
	}
	
	$nHasil = $n1 * $n2 * $n3 * $n4 * $n5 * $n6 * $n7 * $n8 * $n9 * $n10 * $n11 * $n12 * $n13 * $n14 * $n15 * $n16 * $n17 * $n18;	

?>