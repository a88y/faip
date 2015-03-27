<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	$txtNamaPekerjaan		 = $_POST['txtNamaPekerjaan'];
	$txtMasaPekerjaanAwal	 = $_POST['txtMasaPekerjaanAwal'];
	$txtMasaPekerjaanAkhir	 = $_POST['txtMasaPekerjaanAkhir'];
	$txtNamaProyek	 		 = $_POST['txtNamaProyek'];
	$txtFungsi	 			 = $_POST['txtFungsi'];
	
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
		
		$query_chk	= "select id_3_1 from 3_1 where id_user = '".$txtIdUser."' limit 1";
		$result_chk = mysqli_query($dbLink,$query_chk);
		if(mysqli_num_rows($result_chk) > 0 ) {
			$row_chk = mysqli_fetch_array($result_chk);
			$id_detail = $row_chk['id_3_1'];
		} else {
			$id_new = $txtIdUser.'01';
			$query_new = "insert into 3_1 (id_3_1, id_user, total_penilaian) values ('".$id_new."','".$txtIdUser."','0')";
			mysqli_query($dbLink,$query_new);
			$id_detail = $id_new;
		}
		
		$maxSQL = "SELECT max(id_3_1_detail) as maxID FROM 3_1_detail WHERE id_3_1_detail LIKE '".$id_detail."%'";
		$maxResult = mysqli_query($dbLink,$maxSQL);
		$data = mysqli_fetch_array($maxResult);
		
		$idMax = $data['maxID'];
		$noUrut = (int) substr($idMax, 12, 2);
		$noUrut += 1;
		$newID = $id_detail . sprintf("%02s", $noUrut);
		
		$query_1 = "insert into 3_1_detail (id_3_1_detail, id_3_1, pengalaman, sejak, sampai, jabatan, nama_proyek) values ( '".$newID."', '".$id_detail."', '".$txtNamaPekerjaan."', '".$txtMasaPekerjaanAwal."', '".$txtMasaPekerjaanAkhir."', '".$txtFungsi."', '".$txtNamaProyek."' )";
		$query_2 = "insert into 3_1_pqr (id_3_1_detail, jenis, nilai_p, peran, nilai_q, cakupan, nilai_r) values ( '".$newID."', '".$txtSelectNilaiP."', '".$txtNilaiP."' , '".$txtSelectNilaiQ."', '".$txtNilaiQ."' , '".$txtSelectNilaiR."', '".$txtNilaiR."' )";
		
		$kopetensiStr = explode(",",$txtSelectKopetensi);	
		for($i=0;$i<count($kopetensiStr);$i++){ 
			if(!empty($kopetensiStr[$i])){
				$idKopetensi = $kopetensiStr[$i];
			}
			
			$query_Kop	= "select * from bakuan_kompetensi where id_bakuan_kompetensi = '".$idKopetensi."' limit 1";
			$result_Kop = mysqli_query($dbLink,$query_Kop);
			if(mysqli_num_rows($result_Kop) > 0 ) {
				while($row_Kop = mysqli_fetch_array($result_Kop)) {
					$maxSQL = "SELECT max(id_kompetensi) as maxID FROM 3_1_kompetensi WHERE id_kompetensi LIKE '".$newID."%'";
					$maxResult = mysqli_query($dbLink,$maxSQL);
					$data = mysqli_fetch_array($maxResult);
					
					$idMax = $data['maxID'];
					$noUrut = (int) substr($idMax, 14, 2);
					$noUrut += 1;
					$newIDKop = $newID . sprintf("%02s", $noUrut);
				
					$query_3 = "insert into 3_1_kompetensi (id_kompetensi, id_3_1_detail, kompetensi, nilai_kompetensi) values ( '".$newIDKop."', '".$newID."', '".$row_Kop["kode"]." ".$row_Kop["kompetensi"]."' , '".$row_Kop["satuan"]."' );";
										
					mysqli_query($dbLink, $query_3);
				}
			}
		}
		
		$query_4 = "select total_penilaian from 3_1 where id_3_1 = '".$id_detail ."' limit 1;";
		$result_total = mysqli_query($dbLink, $query_4);
		$row_total = mysqli_fetch_array($result_total);
		
		$newTotalNilai = $txtTotalNilai + $row_total['total_penilaian'];
		
		$query_4 = "update 3_1 set total_penilaian = '".$newTotalNilai."' where id_3_1 = '".$id_detail ."' limit 1";
		
		mysqli_query($dbLink, $query_1);
		mysqli_query($dbLink, $query_2);
		mysqli_query($dbLink, $query_4);
		
		header('location: ../3.1.php?msg=='.base64_encode('Data berhasil disimpan.'));
		exit();
		
	} else 	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'edit') {
		
		$txtTotalNilaiEdit		 	 = base64_decode($_POST['txtTotalNilaiEdit']);
		$txtTotalSeluruhNilaiEdit	 = base64_decode($_POST['txtTotalSeluruhNilaiEdit']);
		$id_3_1_detail 				 = base64_decode($_POST['txtIdEdit']);
		
		$query_chk	= "select id_3_1 from 3_1_detail where id_3_1_detail = '".$id_3_1_detail."' limit 1";
		$result_chk = mysqli_query($dbLink,$query_chk);
		if(mysqli_num_rows($result_chk) > 0 ) {
			while($row_chk = mysqli_fetch_array($result_chk)) {
				$id_3_1 = $row_chk["id_3_1"];
			}
		}
				
		$query_1 = "update 3_1_detail set pengalaman = '".$txtNamaPekerjaan."',
							sejak = '".$txtMasaPekerjaanAwal."',
							sampai = '".$txtMasaPekerjaanAkhir."',
							nama_proyek = '".$txtNamaProyek."',
							jabatan = '".$txtFungsi."'
					where id_3_1_detail = '".$id_3_1_detail ."' limit 1;";
		
		
		$query_2 = "update 3_1_pqr set jenis = '".$txtSelectNilaiP."',
							nilai_p = '".$txtNilaiP."',
							peran = '".$txtSelectNilaiQ."',
							nilai_q = '".$txtNilaiQ."',
							cakupan = '".$txtSelectNilaiR."',
							nilai_r = '".$txtNilaiR."'
					where id_3_1_detail = '".$id_3_1_detail ."' limit 1;";
		
		
		$query_3 = "delete from 3_1_kompetensi where id_3_1_detail = '".$id_3_1_detail."'";
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
						$maxSQL = "SELECT max(id_kompetensi) as maxID FROM 3_1_kompetensi WHERE id_kompetensi LIKE '".$id_3_1_detail."%'";
						$maxResult = mysqli_query($dbLink,$maxSQL);
						$data = mysqli_fetch_array($maxResult);
						
						$idMax = $data['maxID'];
						$noUrut = (int) substr($idMax, 14, 2);
						$noUrut += 1;
						$newIDKop = $id_3_1_detail . sprintf("%02s", $noUrut);
					
						$query_3 = "insert into 3_1_kompetensi (id_kompetensi, id_3_1_detail, kompetensi, nilai_kompetensi) values ( '".$newIDKop."', '".$id_3_1_detail."', '".$row_Kop["kode"]." ".$row_Kop["kompetensi"]."' , '".$row_Kop["satuan"]."' );";
											
						mysqli_query($dbLink, $query_3);
					}
				}
			}
			
		}
		
		$newTotalNilai = ($txtTotalSeluruhNilaiEdit - $txtTotalNilaiEdit) + $txtTotalNilai;
		$query_4 = "update 3_1 set total_penilaian = '".$newTotalNilai."' where id_3_1 = '".$id_3_1 ."' limit 1";
		
		
		mysqli_query($dbLink, $query_1);
		mysqli_query($dbLink, $query_2);
		mysqli_query($dbLink, $query_4);
		
		header('location: ../3.1.php?msg=='.base64_encode('Data berhasil disimpan.'));	
		exit();
	
	} else 	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'delete') {
		
		$txtTotalNilaiEdit		 	 = base64_decode($_POST['txtTotalNilaiEdit']);
		$txtTotalSeluruhNilaiEdit	 = base64_decode($_POST['txtTotalSeluruhNilaiEdit']);
		$newTotalNilai 				 = $txtTotalSeluruhNilaiEdit - $txtTotalNilaiEdit;
		$id_3_1_detail 				 = base64_decode($_POST['txtIdEdit']);
		
		$query_chk	= "select id_3_1 from 3_1_detail where id_3_1_detail = '".$id_3_1_detail."' limit 1";
		$result_chk = mysqli_query($dbLink,$query_chk);
		if(mysqli_num_rows($result_chk) > 0 ) {
			while($row_chk = mysqli_fetch_array($result_chk)) {
				$id_3_1 = $row_chk["id_3_1"];
			}
		}
		
		$query = "delete from 3_1_detail where id_3_1_detail = '".$id_3_1_detail."'";
		$query2 = "delete from 3_1_kompetensi where id_3_1_detail = '".$id_3_1_detail."'";
		$query3 = "delete from 3_1_pqr where id_3_1_detail = '".$id_3_1_detail."'";
		
		if($newTotalNilai <= 0){
			$query4 = "delete from 3_1 where id_3_1 = '".$id_3_1."' limit 1";
		} else {
			$query4 = "update 3_1 set total_penilaian = '".$newTotalNilai."' where id_3_1 = '".$id_3_1."' limit 1";
		}
		
		mysqli_query($dbLink, $query);
		mysqli_query($dbLink, $query2);
		mysqli_query($dbLink, $query3);
		mysqli_query($dbLink, $query4);
		
		header('location: ../3.1.php?msg=='.base64_encode('Data berhasil dihapus.'));	
		exit();
		
	}
		
?>