<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	$txtKegiatan			 = $_POST['txtKegiatan'];
	$txtProyek				 = $_POST['txtProyek'];
	$txtPerguruan			 = $_POST['txtPerguruan'];
	$txtMasaProyekAwal		 = $_POST['txtMasaProyekAwal'];
	$txtMasaProyekAkhir	 	 = $_POST['txtMasaProyekAkhir'];
	$txtPemberi		 		 = $_POST['txtPemberi'];
	$txtPemilik		 		 = $_POST['txtPemilik'];
	
	$txtJenisParent			 = $_POST['txtJenisParent'];
	$txtSelectNilaiP		 = $_POST['txtSelectNilaiP'];
	$txtNilaiP				 = $_POST['txtNilaiP'];
	$txtSelectNilaiQ		 = $_POST['txtSelectNilaiQ'];
	$txtNilaiQ		 		 = $_POST['txtNilaiQ'];
	$txtSelectNilaiR		 = $_POST['txtSelectNilaiR'];
	$txtNilaiR 				 = $_POST['txtNilaiR'];
	$txtSelectKopetensi		 = $_POST['txtSelectKopetensi'];
	$txtTotalNilai			 = $_POST['txtTotalNilai'];
	$txtIdUser				 = base64_decode($_POST['txtIdUser']);
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'add') {
		
		$query_chk	= "select id_3_4 from 3_4 where id_user = '".$txtIdUser."' limit 1";
		$result_chk = mysqli_query($dbLink,$query_chk);
		if(mysqli_num_rows($result_chk) > 0 ) {
			$row_chk = mysqli_fetch_array($result_chk);
			$id_detail = $row_chk['id_3_4'];
		} else {
			$id_new = $txtIdUser.'01';
			$query_new = "insert into 3_4 (id_3_4, id_user, total_penilaian) values ('".$id_new."','".$txtIdUser."','0')";
			mysqli_query($dbLink,$query_new);
			$id_detail = $id_new;
		}
		
		$maxSQL = "SELECT max(id_3_4_detail) as maxID FROM 3_4_detail WHERE id_3_4_detail LIKE '".$id_detail."%'";
		$maxResult = mysqli_query($dbLink,$maxSQL);
		$data = mysqli_fetch_array($maxResult);
		
		$idMax = $data['maxID'];
		$noUrut = (int) substr($idMax, 12, 2);
		$noUrut += 1;
		$newID = $id_detail . sprintf("%02s", $noUrut);
		
		$query_1 = "insert into 3_4_detail (id_3_4_detail, id_3_4, kegiatan, nama, perguruan, sejak, sampai, client, pemilik) values ( '".$newID."', '".$id_detail."', '".$txtKegiatan."', '".$txtProyek."', '".$txtPerguruan."', '".$txtMasaProyekAwal."', '".$txtMasaProyekAkhir."', '".$txtPemberi."', '".$txtPemilik."' )";
		$query_2 = "insert into 3_4_pqr (id_3_4_detail, id_jenis_parent, jenis, nilai_p, peran, nilai_q, cakupan, nilai_r) values ( '".$newID."', '".$txtJenisParent."', '".$txtSelectNilaiP."', '".$txtNilaiP."' , '".$txtSelectNilaiQ."', '".$txtNilaiQ."' , '".$txtSelectNilaiR."', '".$txtNilaiR."' )";
		
		$kopetensiStr = explode(",",$txtSelectKopetensi);	
		for($i=0;$i<count($kopetensiStr);$i++){ 
			if(!empty($kopetensiStr[$i])){
				$idKopetensi = $kopetensiStr[$i];
			}
			
			$query_Kop	= "select * from bakuan_kompetensi where id_bakuan_kompetensi = '".$idKopetensi."' limit 1";
			$result_Kop = mysqli_query($dbLink,$query_Kop);
			if(mysqli_num_rows($result_Kop) > 0 ) {
				while($row_Kop = mysqli_fetch_array($result_Kop)) {
					$maxSQL = "SELECT max(id_kompetensi) as maxID FROM 3_4_kompetensi WHERE id_kompetensi LIKE '".$newID."%'";
					$maxResult = mysqli_query($dbLink,$maxSQL);
					$data = mysqli_fetch_array($maxResult);
					
					$idMax = $data['maxID'];
					$noUrut = (int) substr($idMax, 14, 2);
					$noUrut += 1;
					$newIDKop = $newID . sprintf("%02s", $noUrut);
				
					$query_3 = "insert into 3_4_kompetensi (id_kompetensi, id_3_4_detail, kompetensi, nilai_kompetensi) values ( '".$newIDKop."', '".$newID."', '".$row_Kop["kode"]." ".$row_Kop["kompetensi"]."' , '".$row_Kop["satuan"]."' );";
										
					mysqli_query($dbLink, $query_3);
				}
			}
		}
		
		$query_4 = "select total_penilaian from 3_4 where id_3_4 = '".$id_detail ."' limit 1;";
		$result_total = mysqli_query($dbLink, $query_4);
		$row_total = mysqli_fetch_array($result_total);
		
		$newTotalNilai = $txtTotalNilai + $row_total['total_penilaian'];
		
		$query_4 = "update 3_4 set total_penilaian = '".$newTotalNilai."' where id_3_4 = '".$id_detail ."' limit 1";
		
		mysqli_query($dbLink, $query_1);
		mysqli_query($dbLink, $query_2);
		mysqli_query($dbLink, $query_4);
		
		header('location: ../3.4.php?msg=='.base64_encode('Data berhasil disimpan.'));
		exit();
		
	} else 	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'edit') {
		
		$txtTotalNilaiEdit		 	 = base64_decode($_POST['txtTotalNilaiEdit']);
		$txtTotalSeluruhNilaiEdit	 = base64_decode($_POST['txtTotalSeluruhNilaiEdit']);
		$id_3_4_detail 				 = base64_decode($_POST['txtIdEdit']);
		
		$query_chk	= "select id_3_4 from 3_4_detail where id_3_4_detail = '".$id_3_4_detail."' limit 1";
		$result_chk = mysqli_query($dbLink,$query_chk);
		if(mysqli_num_rows($result_chk) > 0 ) {
			while($row_chk = mysqli_fetch_array($result_chk)) {
				$id_3_4 = $row_chk["id_3_4"];
			}
		}
				
		$query_1 = "update 3_4_detail set kegiatan = '".$txtKegiatan."',
							nama = '".$txtProyek."',
							perguruan = '".$txtPerguruan."',
							sejak = '".$txtMasaProyekAwal."',
							sampai = '".$txtMasaProyekAkhir."',
							client = '".$txtPemberi."',
							pemilik = '".$txtPemilik."'
					where id_3_4_detail = '".$id_3_4_detail ."' limit 1;";
		
		
		$query_2 = "update 3_4_pqr set id_jenis_parent = '".$txtJenisParent."',
							jenis = '".$txtSelectNilaiP."',
							nilai_p = '".$txtNilaiP."',
							peran = '".$txtSelectNilaiQ."',
							nilai_q = '".$txtNilaiQ."',
							cakupan = '".$txtSelectNilaiR."',
							nilai_r = '".$txtNilaiR."'
					where id_3_4_detail = '".$id_3_4_detail ."' limit 1;";
		
		
		$query_3 = "delete from 3_4_kompetensi where id_3_4_detail = '".$id_3_4_detail."'";
		if($result3 = mysqli_query($dbLink, $query_3)){
			$kopetensiStr = explode(",",$txtSelectKopetensi);	
			for($i=0;$i<count($kopetensiStr);$i++){ 
				if(!empty($kopetensiStr[$i])){
					$idKopetensi = $kopetensiStr[$i];
				}
				
				$query_Kop	= "select * from bakuan_kompetensi where id_bakuan_kompetensi = '".$idKopetensi."' limit 1";
				$result_Kop = mysqli_query($dbLink,$query_Kop);
				if(mysqli_num_rows($result_Kop) > 0 ) {
					while($row_Kop = mysqli_fetch_array($result_Kop)) {
						$maxSQL = "SELECT max(id_kompetensi) as maxID FROM 3_4_kompetensi WHERE id_kompetensi LIKE '".$id_3_4_detail."%'";
						$maxResult = mysqli_query($dbLink,$maxSQL);
						$data = mysqli_fetch_array($maxResult);
						
						$idMax = $data['maxID'];
						$noUrut = (int) substr($idMax, 14, 2);
						$noUrut += 1;
						$newIDKop = $id_3_4_detail . sprintf("%02s", $noUrut);
					
						$query_3 = "insert into 3_4_kompetensi (id_kompetensi, id_3_4_detail, kompetensi, nilai_kompetensi) values ( '".$newIDKop."', '".$id_3_4_detail."', '".$row_Kop["kode"]." ".$row_Kop["kompetensi"]."' , '".$row_Kop["satuan"]."' );";
											
						mysqli_query($dbLink, $query_3);
					}
				}
			}
			
		}
		
		$newTotalNilai = ($txtTotalSeluruhNilaiEdit - $txtTotalNilaiEdit) + $txtTotalNilai;
		$query_4 = "update 3_4 set total_penilaian = '".$newTotalNilai."' where id_3_4 = '".$id_3_4 ."' limit 1";
		
		
		mysqli_query($dbLink, $query_1);
		mysqli_query($dbLink, $query_2);
		mysqli_query($dbLink, $query_4);
		
		header('location: ../3.4.php?msg=='.base64_encode('Data berhasil disimpan.'));	
		exit();
	
	} else 	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'delete') {
		
		$txtTotalNilaiEdit		 	 = base64_decode($_POST['txtTotalNilaiEdit']);
		$txtTotalSeluruhNilaiEdit	 = base64_decode($_POST['txtTotalSeluruhNilaiEdit']);
		$newTotalNilai 				 = $txtTotalSeluruhNilaiEdit - $txtTotalNilaiEdit;
		$id_3_4_detail 				 = base64_decode($_POST['txtIdEdit']);
		
		$query_chk	= "select id_3_4 from 3_4_detail where id_3_4_detail = '".$id_3_4_detail."' limit 1";
		$result_chk = mysqli_query($dbLink,$query_chk);
		if(mysqli_num_rows($result_chk) > 0 ) {
			while($row_chk = mysqli_fetch_array($result_chk)) {
				$id_3_4 = $row_chk["id_3_4"];
			}
		}
		
		$query = "delete from 3_4_detail where id_3_4_detail = '".$id_3_4_detail."'";
		$query2 = "delete from 3_4_kompetensi where id_3_4_detail = '".$id_3_4_detail."'";
		$query3 = "delete from 3_4_pqr where id_3_4_detail = '".$id_3_4_detail."'";
		
		if($newTotalNilai <= 0){
			$query4 = "delete from 3_4 where id_3_4 = '".$id_3_4."' limit 1";
		} else {
			$query4 = "update 3_4 set total_penilaian = '".$newTotalNilai."' where id_3_4 = '".$id_3_4."' limit 1";
		}
		
		mysqli_query($dbLink, $query);
		mysqli_query($dbLink, $query2);
		mysqli_query($dbLink, $query3);
		mysqli_query($dbLink, $query4);
		
		header('location: ../3.4.php?msg=='.base64_encode('Data berhasil dihapus.'));	
		exit();
		
	}
		
?>