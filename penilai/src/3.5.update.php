<?php

include('../../src/dbconnect.php');

$txtJenisParent		= $_POST['txtJenisParent'];
$txtSelectNilaiP 	= $_POST['txtSelectNilaiP'];
$nilai_p 			= $_POST['txtNilaiP'];
$txtSelectNilaiQ	= $_POST['txtSelectNilaiQ'];
$nilai_q 			= $_POST['txtNilaiQ'];
$txtSelectNilaiR	= $_POST['txtSelectNilaiR'];
$nilai_r			= $_POST['txtNilaiR'];
$txtSelectKopetensi	= $_POST['txtSelectKopetensi'];
$id_detail			= $_POST['id_detail'];

	$query = "update 3_5_pqr set id_jenis_parent_penilai = ".(($txtJenisParent=='')?"NULL":("'".$txtJenisParent."'")).",
									jenis_penilai = ".(($txtSelectNilaiP=='')?"NULL":("'".$txtSelectNilaiP."'")).",
									nilai_p_penilai = ".(($nilai_p=='' || $nilai_p=='0')?"NULL":("'".$nilai_p."'")).",
									peran_penilai = ".(($txtSelectNilaiQ=='')?"NULL":("'".$txtSelectNilaiQ."'")).",
									nilai_q_penilai = ".(($nilai_q=='' || $nilai_q=='0')?"NULL":("'".$nilai_q."'")).",
									cakupan_penilai = ".(($txtSelectNilaiR=='')?"NULL":("'".$txtSelectNilaiR."'")).",
									nilai_r_penilai = ".(($nilai_r=='' || $nilai_r=='0')?"NULL":("'".$nilai_r."'"))."
					where id_3_5_detail = '".$id_detail."' limit 1;";
					
	//echo $query;

	mysqli_query($dbLink,$query);
	
	
	$query_1 = "select id_3_5 as id from 3_5_detail where id_3_5_detail = '".$id_detail."' limit 1;";
	$result_1 = mysqli_query($dbLink, $query_1);
	$row_1 = mysqli_fetch_array($result_1);
	
	$id = $row_1['id'];
	
	$query_6 = "delete from 3_5_kompetensi where id_3_5_detail = '".$id_detail."'";
	if($result6 = mysqli_query($dbLink, $query_6)){
		$kopetensiStr = explode(",",$txtSelectKopetensi);	
		for($i=0;$i<count($kopetensiStr);$i++){ 
			if(!empty($kopetensiStr[$i])){
				$idKopetensi = $kopetensiStr[$i];
			}
			
			$query_Kop	= "select * from bakuan_kompetensi where id_bakuan_kompetensi = '".$idKopetensi."' limit 1";
			$result_Kop = mysqli_query($dbLink,$query_Kop);
			if(mysqli_num_rows($result_Kop) > 0 ) {
				while($row_Kop = mysqli_fetch_array($result_Kop)) {
					$maxSQL = "SELECT max(id_kompetensi) as maxID FROM 3_5_kompetensi WHERE id_kompetensi LIKE '".$id_detail."%'";
					$maxResult = mysqli_query($dbLink,$maxSQL);
					$data = mysqli_fetch_array($maxResult);
					
					$idMax = $data['maxID'];
					$noUrut = (int) substr($idMax, 14, 2);
					$noUrut += 1;
					$newIDKop = $id_detail . sprintf("%02s", $noUrut);
				
					$query_6 = "insert into 3_5_kompetensi (id_kompetensi, id_3_5_detail, kompetensi, nilai_kompetensi) values ( '".$newIDKop."', '".$id_detail."', '".$row_Kop["kode"]." ".$row_Kop["kompetensi"]."' , '".$row_Kop["satuan"]."' );";
										
					mysqli_query($dbLink, $query_6);
				}
			}
		}
	}
	
	$query_2 = "select id_3_5_detail as id_detail from 3_5_detail where id_3_5 = '".$id."';";
	$result_2 = mysqli_query($dbLink, $query_2);
	
	$calculate = 0;
	
	while ( $row_2 = mysqli_fetch_array($result_2) ) {
		
		$query_3 = "select IFNULL(nilai_p_penilai,nilai_p) nilai_p, IFNULL(nilai_q_penilai, nilai_q) nilai_q, IFNULL(nilai_r_penilai, nilai_r) nilai_r from 3_5_pqr where id_3_5_detail = '".$row_2['id_detail']."';";
		$result_3 = mysqli_query($dbLink, $query_3);
		$row_3 = mysqli_fetch_array($result_3);
		
		$nilai_p = $row_3['nilai_p'];
		$nilai_q = $row_3['nilai_q'];
		$nilai_r = $row_3['nilai_r'];
		
		$query_4 = "select SUM( nilai_kompetensi ) as kompetensi_terhitung from 3_5_kompetensi where id_3_5_detail = '".$row_2['id_detail']."';";
		$result_4 = mysqli_query($dbLink, $query_4);
		$row_4 = mysqli_fetch_array($result_4);
		
		$kompetensi_terhitung = $row_4['kompetensi_terhitung'];
		
		$count = $nilai_p * $nilai_q * $nilai_r * $kompetensi_terhitung;
		$calculate += $count;
		
	}
	
	$query_5 = "update 3_5 set total_penilaian_penilai = '".$calculate."' where id_3_5 = '".$id."' limit 1;";
	mysqli_query($dbLink, $query_5);
	
	echo 'Update Succeed';

//	if( true ) {
//		echo 'Update Succed';
//	} else {
//		echo 'Update Failed,\nPlease try again later.';
//	}

?>