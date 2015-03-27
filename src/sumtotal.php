<?php

	$totalAkhirSeluruhNilai = '';
	$tt_1_2 = 0;
	$query_1_2 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 1_2 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_1_2 = mysqli_query($dbLink, $query_1_2);
	if( mysqli_num_rows($result_1_2) > 0 ) { while ( $row_1_2 = mysqli_fetch_array($result_1_2) ) { $tt_1_2 = $tt_1_2 + $row_1_2["total_penilaian"]; } }
	$tt_1_3 = 0;
	$query_1_3 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 1_3 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_1_3 = mysqli_query($dbLink, $query_1_3);
	if( mysqli_num_rows($result_1_3) > 0 ) { while ( $row_1_3 = mysqli_fetch_array($result_1_3) ) { $tt_1_3 = $tt_1_3 + $row_1_3["total_penilaian"]; } }
	$tt_1_4 = 0;
	$query_1_4 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 1_4 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_1_4 = mysqli_query($dbLink, $query_1_4);
	if( mysqli_num_rows($result_1_4) > 0 ) { while ( $row_1_4 = mysqli_fetch_array($result_1_4) ) { $tt_1_4 = $tt_1_4 + $row_1_4["total_penilaian"]; } }
	$tt_1_5 = 0;
	$query_1_5 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 1_5 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_1_5 = mysqli_query($dbLink, $query_1_5);
	if( mysqli_num_rows($result_1_5) > 0 ) { while ( $row_1_5 = mysqli_fetch_array($result_1_5) ) { $tt_1_5 = $tt_1_5 + $row_1_5["total_penilaian"]; } }
	$tt_1_6 = 0;
	$query_1_6 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 1_6 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_1_6 = mysqli_query($dbLink, $query_1_6);
	if( mysqli_num_rows($result_1_6) > 0 ) { while ( $row_1_6 = mysqli_fetch_array($result_1_6) ) { $tt_1_6 = $tt_1_6 + $row_1_6["total_penilaian"]; } }
	$tt_2_1 = 0;
	$query_2_1 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 2_1 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_2_1 = mysqli_query($dbLink, $query_2_1);
	if( mysqli_num_rows($result_2_1) > 0 ) { while ( $row_2_1 = mysqli_fetch_array($result_2_1) ) { $tt_2_1 = $tt_2_1 + $row_2_1["total_penilaian"]; } }
	$tt_2_2 = 0;
	$query_2_2 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 2_2 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_2_2 = mysqli_query($dbLink, $query_2_2);
	if( mysqli_num_rows($result_2_2) > 0 ) { while ( $row_2_2 = mysqli_fetch_array($result_2_2) ) { $tt_2_2 = $tt_2_2 + $row_2_2["total_penilaian"]; } }
	$tt_3_1 = 0;
	$query_3_1 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 3_1 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_3_1 = mysqli_query($dbLink, $query_3_1);
	if( mysqli_num_rows($result_3_1) > 0 ) { while ( $row_3_1 = mysqli_fetch_array($result_3_1) ) { $tt_3_1 = $tt_3_1 + $row_3_1["total_penilaian"]; } }
	$tt_3_2 = 0;
	$query_3_2 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 3_2 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_3_2 = mysqli_query($dbLink, $query_3_2);
	if( mysqli_num_rows($result_3_2) > 0 ) { while ( $row_3_2 = mysqli_fetch_array($result_3_2) ) { $tt_3_2 = $tt_3_2 + $row_3_2["total_penilaian"]; } }
	$tt_3_3 = 0;
	$query_3_3 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 3_3 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_3_3 = mysqli_query($dbLink, $query_3_3);
	if( mysqli_num_rows($result_3_3) > 0 ) { while ( $row_3_3 = mysqli_fetch_array($result_3_3) ) { $tt_3_3 = $tt_3_3 + $row_3_3["total_penilaian"]; } }
	$tt_3_4 = 0;
	$query_3_4 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 3_4 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_3_4 = mysqli_query($dbLink, $query_3_4);
	if( mysqli_num_rows($result_3_4) > 0 ) { while ( $row_3_4 = mysqli_fetch_array($result_3_4) ) { $tt_3_4 = $tt_3_4 + $row_3_4["total_penilaian"]; } }
	$tt_3_5 = 0;
	$query_3_5 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 3_5 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_3_5 = mysqli_query($dbLink, $query_3_5);
	if( mysqli_num_rows($result_3_5) > 0 ) { while ( $row_3_5 = mysqli_fetch_array($result_3_5) ) { $tt_3_5 = $tt_3_5 + $row_3_5["total_penilaian"]; } }
	$tt_4_1 = 0;
	$query_4_1 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 4_1 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_4_1 = mysqli_query($dbLink, $query_4_1);
	if( mysqli_num_rows($result_4_1) > 0 ) { while ( $row_4_1 = mysqli_fetch_array($result_4_1) ) { $tt_4_1 = $tt_4_1 + $row_4_1["total_penilaian"]; } }
	$tt_4_2 = 0;
	$query_4_2 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 4_2 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_4_2 = mysqli_query($dbLink, $query_4_2);
	if( mysqli_num_rows($result_4_2) > 0 ) { while ( $row_4_2 = mysqli_fetch_array($result_4_2) ) { $tt_4_2 = $tt_4_2 + $row_4_2["total_penilaian"]; } }
	$tt_4_3 = 0;
	$query_4_3 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 4_3 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_4_3 = mysqli_query($dbLink, $query_4_3);
	if( mysqli_num_rows($result_4_3) > 0 ) { while ( $row_4_3 = mysqli_fetch_array($result_4_3) ) { $tt_4_3 = $tt_4_3 + $row_4_3["total_penilaian"]; } }
	$tt_4_4 = 0;
	$query_4_4 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 4_4 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_4_4 = mysqli_query($dbLink, $query_4_4);
	if( mysqli_num_rows($result_4_4) > 0 ) { while ( $row_4_4 = mysqli_fetch_array($result_4_4) ) { $tt_4_4 = $tt_4_4 + $row_4_4["total_penilaian"]; } }
	$tt_5_1 = 0;
	$query_5_1 = "select IFNULL(total_penilaian_penilai, total_penilaian)  total_penilaian from 5_1 where id_user = '".base64_decode($_GET['reff'])."'";	
	$result_5_1 = mysqli_query($dbLink, $query_5_1);
	if( mysqli_num_rows($result_5_1) > 0 ) { while ( $row_5_1 = mysqli_fetch_array($result_5_1) ) { $tt_5_1 = $tt_5_1 + $row_5_1["total_penilaian"]; } }
	
	$totalAkhirSeluruhNilai = $tt_1_2 + $tt_1_3 + $tt_1_4 + $tt_1_5 + $tt_1_6 + $tt_2_1 + $tt_2_2 + $tt_3_1 + $tt_3_2 + $tt_3_3 + $tt_3_4 + $tt_3_5 + $tt_4_1 + $tt_4_2 + $tt_4_3 + $tt_4_4 + $tt_5_1 ;
	
?>
