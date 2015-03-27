<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	
	if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['actionSave'] == 'add') {

		$txtNama				= ubah_huruf_awal($_POST['txtNama']);
		$txtAlamat				= $_POST['txtAlamat'];
		$txtNegara				= $_POST['txtNegara'];
		$txtIdJenisIdentitas	= $_POST['txtIdJenisIdentitas'];
		$txtIdIdentitas			= $_POST['txtIdIdentitas'];
		$txtNegaraIdentitas		= $_POST['txtNegaraIdentitas'];
		$txtNegaraLahir			= $_POST['txtNegaraLahir'];
		$txtTglLahir 			= savedatepicker($_POST['txtTglLahir']);
		$txtTmpLahir 			= ubah_huruf_awal($_POST['txtTmpLahir']);
		$txtIdUser				= base64_decode($_POST['txtIdUser']);
		
		if($txtNegara != 'Indonesia'){ $txtProvinsi = ''; } else { $txtProvinsi = $_POST['txtProvinsi']; }
		if($txtNegaraIdentitas != 'Indonesia'){ $txtProvinsiIdentitas = ''; } else { $txtProvinsiIdentitas = $_POST['txtProvinsiIdentitas']; }
		if($txtNegaraLahir != 'Indonesia'){ $txtProvinsiLahir = ''; } else { $txtProvinsiLahir = $_POST['txtProvinsiLahir']; }
		
		$query_user = "update user set nama = '".$txtNama."',
									alamat = '".$txtAlamat."',
									negara = '".$txtNegara."',
									provinsi = '".$txtProvinsi."',
									id_jenis_identitas = '".$txtIdJenisIdentitas."',
									no_id = '".$txtIdIdentitas."',
									negara_identitas = '".$txtNegaraIdentitas."',
									provinsi_identitas = '".$txtProvinsiIdentitas."',
									tgl_lahir = '".$txtTglLahir."',
									tmp_lahir = '".$txtTmpLahir ."',
									negara_lahir = '".$txtNegaraLahir ."',
									provinsi_lahir = '".$txtProvinsiLahir ."'
							where id_user = '".$txtIdUser ."' limit 1;";
			
		mysqli_query($dbLink, $query_user);
		
		$sql2 = "delete from phone where id_user = '".$txtIdUser."'";
		if($result2 = mysqli_query($dbLink, $sql2)){
			foreach ($_POST['txtPhone'] as $value) {
				if ($value) {
					$sql8="INSERT INTO phone (id_user, phone) VALUES ('".$txtIdUser."', '".$value."')";
					mysqli_query($dbLink, $sql8);
				}
			}
		}
		
		$sql4 = "delete from email where id_user = '".$txtIdUser."'";
		if($result4 = mysqli_query($dbLink, $sql4)){
			foreach ($_POST['txtEmail'] as $valueEmail) {
				if ($valueEmail) {
					$sql9="INSERT INTO email (id_user, email) VALUES ('".$txtIdUser."', '".$valueEmail."')";
					mysqli_query($dbLink, $sql9);
				}
			}
		}
		
		header('location: ../dashboard.php?msg=='.base64_encode('Data berhasil disimpan.'));
			
	}

?>