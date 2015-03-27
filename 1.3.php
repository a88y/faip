<?php
	session_start();
	include('./src/dbconnect.php');
	include('./src/function.php');

	if( !isset($_SESSION['log1n_us3r_f4ip']) && $_SESSION['log1n_us3r_f4ip']!=true ) {
		header('location: ./?err='.base64_encode('Silahkan login terlebih dahulu.'));
		exit();
	} else {
	
	include('./func/sumtotal.php');
	include('./func/checkStatusPenilai.php');
	
	$pages = 3;
	$step1 = 'step_ok';
	$step2 = 'step_ok';
	$step3 = 'step_current';
	$step4 = '';
	$step5 = '';
	$step6 = '';
	$step7 = '';
	$step8 = '';
	$step9 = '';
	$step10 = '';
	$step11 = '';
	$step12 = '';
	$step13 = '';
	$step14 = '';
	$step15 = '';
	$step16 = '';
	$step17 = '';
	$step18 = '';
	
	$pagesEdit = '';
	$actionSave = 'add';
	$titleHeader = 'I.3 Organisasi Profesi & Organisasi Lain yang Dimasuki';
	$titleHeaderAction = '';
	$nama_organisasi = '';
	$sejak = '';
	$sampai = '';
	$kedudukan = '';
	$selectNilaiParent = '';
	$selectNameParent = '';
	$selectNilaiP = '';
	$nilaiP = 0;
	$selectNilaiQ = '';
	$nilaiQ = 0;
	$selectNilaiR = '';
	$nilaiR = 0;
	$kompetensi = '';
	$totalSeluruhNilaiEdit = '';
	$hasilPenilaianTotal = 0;
	if ( isset($_GET['action']) && $_GET['action']=='edit' ) {  
		if(isset($_GET['id'])){
			$id = base64_decode($_GET['id']);
			$query_id = "select * from 1_3_detail where id_organisasi_detail = '".$id."' limit 1";
			$result_id = mysqli_query($dbLink,$query_id);
			if( mysqli_num_rows($result_id) > 0 ) {
				while($row_id = mysqli_fetch_array($result_id)) {
					$pagesEdit = true;
					$actionSave = 'edit';
					$titleHeaderAction = 'Ubah';
					$id_organisasi 		 		 = $row_id["id_organisasi"];
					$id_organisasi_detail 		 = $row_id["id_organisasi_detail"];
					$nama_organisasi			 = $row_id["nama_organisasi"];
					$sejak					 	 = $row_id["sejak"];
					$sampai					 	 = $row_id["sampai"];
					$kedudukan 					 = $row_id["kedudukan"];
					
					$query_tt = "select * from 1_3_pqr where id_organisasi_detail = '".$id_organisasi_detail."' limit 1";
					$result_tt = mysqli_query($dbLink,$query_tt);
					if( mysqli_num_rows($result_tt) > 0 ) {
						while($row_tt = mysqli_fetch_array($result_tt)) {
							$selectNilaiParent= $row_tt["id_jenis_parent"];
							$selectNilaiP 	  = $row_tt["jenis"];
							$nilaiP 		  = $row_tt["nilai_p"];
							$selectNilaiQ 	  = $row_tt["cakupan"];
							$nilaiQ 		  = $row_tt["nilai_q"];
							$selectNilaiR 	  = $row_tt["peran"];
							$nilaiR 		  = $row_tt["nilai_r"];
						}
					}
					
					$query_uu = "select * from 1_3_p_parent where id_1_3_p_parent = '".$selectNilaiParent."' limit 1";
					$result_uu = mysqli_query($dbLink,$query_uu);
					if( mysqli_num_rows($result_uu) > 0 ) {
						while($row_uu = mysqli_fetch_array($result_uu)) {
							$selectNameParent= $row_uu["parent"];
						}
					}
	
					$query_xx = "select * from 1_3 where id_organisasi = '".$id_organisasi."' && id_user = '".$_SESSION['id_u5er']."' limit 1";
					$result_xx = mysqli_query($dbLink,$query_xx);
					if( mysqli_num_rows($result_xx) > 0 ) {
						while($row_xx = mysqli_fetch_array($result_xx)) {
							$totalSeluruhNilaiEdit = $row_xx["total_penilaian"];
						}
					} else {
						header('location: ./1.3.php?err=='.base64_encode('Id tidak ditemukan.'));		
						exit();
					}
					$hasilPenilaianTotal = $nilaiP * $nilaiQ * $nilaiR;	
				}
			} else {
				header('location: ./1.3.php?err=='.base64_encode('Id tidak ditemukan.'));		
				exit();
			}
		} else {
			header('location: ./1.3.php?err=='.base64_encode('Id tidak ditemukan.'));	
			exit();
		}
	}
	
?>
<!doctype html>
<html>
<head>
	<meta charset="utf8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
	
    <title>FAIP - BKK PII</title>
	

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">
    <!-- jQuery Multiselect Plugins -->
	<link rel="stylesheet" href="css/sumoselect.css">
    
	<link rel="stylesheet" href="css/custom-style.css">

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/eakroko.js"></script>
	<!-- Validation -->
	<script src="js/plugins/validation/jquery.validate.min.js"></script>
	<script src="js/plugins/validation/additional-methods.min.js"></script>
    
	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

</head>

<body>

<?php
	include('./inc/menuheader.php');
?>

	<div class="container-fluid nav-fixed" id="content">
		
		<div id="main">
			<div class="container-fluid">
            
				<div class="page-header">
					<div class="pull-left">
						<h1>Formulir Aplikasi Insinyur Profesional</h1>
						<h5>Badan Kejuruan Kimia Persatuan Insinyur Indonesia</h5>
					</div>
					<div class="pull-right">
                        
						<ul class="stats">
							
							<li class='blue'>
								<i class="icon-star"></i>
								<div class="details">
									<span class="big"><?php echo $totalAkhirSeluruhNilai?></span>
									<span>Hasil Penilaian Total Akhir (T) Keseluruhan Bagian</span>
								</div>
							</li>
                            
							<li class='orange'>
								<i class="fa fa-calendar"></i>
								<div class="details autoDate">
                                    <span class="big"><?php echo date('d F Y')?></span>
                                    <span><?php echo date('l, H:i')?></span>
								</div>
							</li>
                            
						</ul>
                        
					</div>
				</div>
                
                <div id="divStep" class="row-fluid">
					<div class="span12">
                    	<?php include('./inc/step.php'); ?>
                    </div>
                </div>

<?php
	$query_1 = "select t1.id_user, t1.id_organisasi, IFNULL(t1.total_penilaian_penilai ,t1.total_penilaian) as total_penilaian, t2.id_organisasi_detail, t2.nama_organisasi, t2.sejak, t2.sampai, t2.kedudukan, t3.id_jenis_parent, t3.jenis, IFNULL(t3.nilai_p_penilai ,t3.nilai_p) as nilai_p, t3.cakupan, IFNULL(t3.nilai_q_penilai ,t3.nilai_q) as nilai_q, t3.peran, IFNULL(t3.nilai_r_penilai ,t3.nilai_r) as nilai_r, t4.parent
				from 1_3 as t1
				join 1_3_detail as t2 on t2.id_organisasi = t1.id_organisasi
				join 1_3_pqr as t3 on t3.id_organisasi_detail = t2.id_organisasi_detail	
				join 1_3_p_parent as t4 on t4.id_1_3_p_parent = t3.id_jenis_parent	
				where t1.id_user = '".$_SESSION['id_u5er']."' order by t2.id_organisasi_detail asc";
						
	$result_1 = mysqli_query($dbLink, $query_1);
	if( mysqli_num_rows($result_1) > 0 ) {
?>
                <div id="divContent" class="row-fluid">
					<div class="span12">
						<?php if($status_penilai == 1){ ?>
                        <div style="position:relative; top:0px; width:100%;">
                            <div class="alert alert-info spanMessage" style="position:relative; float:none;">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <?php echo $msgStatPenilai ?>
                            </div>
                        </div>
                        <?php } ?>
						<div class="box box-bordered">
							<div class="box-title">
								<h3><i class="icon-th-list"></i> <?php echo $titleHeader ?> </h3>
							</div>
                            
						<?php  while ( $row_1 = mysqli_fetch_array($result_1) ) { 
									$totalSeluruhNilai = $row_1["total_penilaian"]; 
									$totalNilai = $row_1["nilai_p"] * $row_1["nilai_q"] * $row_1["nilai_r"];
									$titleHeader = ''; 
									if($pagesEdit != true){ $titleHeaderAction = 'Tambah Baru'; }
						?>
							<div class="box-content nopadding">
								<form action="#" method="post" class="form-horizontal form-bordered">
                                    
									<div class="control-group">
										<label class="control-label">Nama Organisasi Profesi</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["nama_organisasi"]?></p></div>
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Masa Keanggotaan</label>
										<div class="controls">
                                            <div class="input-xlarge"><p><?php echo $row_1["sejak"]?></p></div>
                                            <div class="help-block" style="margin:10px 0px;">Sampai dengan</div>
                                            <div class="input-xlarge"><p><?php echo $row_1["sampai"]?></p></div>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Kedudukan dalam Organisasi</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["kedudukan"]?></p></div>
										</div>
									</div>
                                    
                                    
									<div class="control-group" style="border-bottom:none;">
										<label class="control-label">Jenis Organisasi</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["parent"]?></p></div>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Periode Berorganisasi</label>
										<div class="controls">
                                            <div class="input-block-level input-nilai"><p><?php echo $row_1["jenis"]?></p></div>
                                            <div class="div-nilai"><span>Nilai P :</span> <?php echo $row_1["nilai_p"]?></div>
										</div>
									</div>
                                    
                                    <div class="control-group">
										<label class="control-label">Cakupan Organisasi</label>
										<div class="controls">
                                            <div class="input-block-level input-nilai"><p><?php echo $row_1["cakupan"]?></p></div>
                                            <div class="div-nilai"><span>Nilai Q :</span> <?php echo $row_1["nilai_q"]?></div>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Peranan dalam Organisasi</label>
										<div class="controls">
                                            <div class="input-block-level input-nilai"><p><?php echo $row_1["peran"]?></p></div>
                                            <div class="div-nilai"><span>Nilai R :</span> <?php echo $row_1["nilai_r"]?></div>
										</div>
									</div>
                                    
                                    <div class="control-group">
										<label class="control-label">Kompetensi yang Relevan dengan Kegiatan Organisasi</label>
										<div class="controls">
<?php
	$i = 0;
	$query_2 = "select id_kompetensi, id_organisasi_detail, kompetensi, nilai_kompetensi from 1_3_kompetensi where id_organisasi_detail = '".$row_1["id_organisasi_detail"]."' order by id_kompetensi asc";	
	$result_2 = mysqli_query($dbLink, $query_2);
	if( mysqli_num_rows($result_2) > 0 ) {
		while ( $row_2 = mysqli_fetch_array($result_2) ) { ?>
                                        	<div class="input-block-level input-nilai-kopetensi" style="margin-bottom:5px;"><p><?php echo $row_2["kompetensi"]?></p></div>
<?php  $nilai_kompetensi = $row_2["nilai_kompetensi"];
		$i += $nilai_kompetensi;  }
	} else { ?>
                                            <div class="input-block-level input-nilai-kopetensi" style="margin-bottom:5px;"></div>
<?php } ?>
											
											<div class="div-nilai"><span>Kompetensi Terhitung :</span> <?php echo $i ?></div>
										</div>
									</div>
                                    
                                    <div class="control-group" style="background-color:transparent;">
                                        <div class="controls" style="border-left:none;">
                                        	<?php if($pagesEdit != true && $status_penilai == 0){ ?>
                                            		<a href="./1.3.php?action=edit&id=<?php echo base64_encode($row_1["id_organisasi_detail"]) ?>"><div class="btn btn-primary btn-edit">Edit</div></a>									
											<?php } else { ?>
                                            		<div class="btn btn-disabled btn-edit">Edit</div>
                                            <?php }	?>
                                        </div>
                                    </div>
                                    
                                </form>
							</div>
						<?php } ?>
                        	
                            <div class="box-content" style="background:#f6f6f6;">
                                <div class="control-group">
                                    <div class="controls">
                                        <div class="div-nilai">Hasil Penilaian Total (T) : <?php echo $totalSeluruhNilai?> </div>
                                        <div class="div-nilai">Hasil Penilaian Total Akhir (T) Keseluruhan Bagian : <?php echo $totalAkhirSeluruhNilai?> </div>
                                    </div>
                                </div>
                            </div>
                            
						</div>
					</div>
				</div>
<?php } ?>
             
				<div id="coloumn-content" class="row-fluid">
					<div class="span12">
						<div class="box box-bordered box-color">
                        
                            <?php if($status_penilai == 0){ ?>
							<div class="box-title">
                                <h3><i class="icon-edit"></i> <?php echo $titleHeaderAction.' '.$titleHeader ?></h3>
							</div>
							<div class="box-content nopadding">
                                <form action="./func/1.3.add.php" method="post" class="form-horizontal form-bordered form-validate" id="form1">
                                    
                                	<div class="control-group" style="background-color:transparent; <?php echo $styleInfo ?>">
										<div class="controls" style="border-left:none;">
                                            <div class=" <?php echo $classInfo ?> spanMessage">
                                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                <?php echo $msgInfo ?>
                                            </div>
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Nama Organisasi Profesi</label>
										<div class="controls">
                                        <input type="text" name="txtNamaOrganisasi" id="txtNamaOrganisasi" class="input-block-level" value="<?php echo $nama_organisasi ?>" data-rule-required="true">
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Masa Keanggotaan</label>
										<div class="controls">
                                        	<select name="txtMasaKeanggotaanAwal" id="txtMasaKeanggotaanAwal" class="input-xlarge" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
										<?php for( $year = strtotime('-60 years'); $year < strtotime('+5 years'); $year = strtotime('+1 years', $year) ){ ?>
                                            	<option value="<?php echo date('Y', $year)?>" <?php if(date('Y', $year) == $sejak ) echo "selected" ?>><?php echo date('Y', $year)?></option>
										<?php } ?>
                                            </select>
                                            <div class="help-block" style="margin:10px 0px;">Sampai dengan</div>
                                            <select name="txtMasaKeanggotaanAkhir" id="txtMasaKeanggotaanAkhir" class="input-xlarge" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
										<?php for( $year = strtotime('-60 years'); $year < strtotime('+5 years'); $year = strtotime('+1 years', $year) ){ ?>
                                            	<option value="<?php echo date('Y', $year)?>" <?php if(date('Y', $year) == $sampai ) echo "selected" ?>><?php echo date('Y', $year)?></option>
										<?php } ?>
                                            </select>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Kedudukan dalam Organisasi</label>
										<div class="controls">
                                        	<input type="text" name="txtKedudukan" id="txtKedudukan" class="input-block-level" value="<?php echo $kedudukan ?>">
										</div>
									</div>
                                    
                                    <div class="control-group contentFloatL" style="border-bottom:none;">
										<label class="control-label">Jenis Organisasi</label>
										<div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $selectNameParent ?>" placeholder="Select One" readonly />
                                                <input type="hidden" name="txtJenisParent" id="txtJenisParent" value="<?php echo $selectNilaiParent ?>" />
                                                <ul id="ulSelectJenisParent" class="ulSelectCustom input-jenis-parent">
                                                    <li><div data-value="" data-nilai="0">Select One</div></li>
<?php
								$query_p_parent = "select * from 1_3_p_parent where 1;";
								$result_p_parent = mysqli_query($dbLink,$query_p_parent);
								while($row_p_parent = mysqli_fetch_array($result_p_parent)) {
?>
                                                <li class="<?php if($row_p_parent['id_1_3_p_parent'] == $selectNilaiParent) { echo "selected"; } ?>"><div data-value="<?php echo $row_p_parent['parent']?>" data-nilai="<?php echo $row_p_parent['id_1_3_p_parent']?>"><?php echo $row_p_parent['parent']?></div></li>
<?php
								}
?>
                                            	</ul>
                                            </div>
										</div>
									</div>
                                    
									<div class="control-group contentFloatL">
										<label class="control-label">Periode Organisasi</label>
										<div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" name="txtSelectNilaiP" id="txtSelectNilaiP" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $selectNilaiP ?>" placeholder="Select One" readonly />
                                                <ul id="ulSelectNilaiP" class="ulSelectCustom input-nilai">
                                                    <li><div data-value="" data-nilai="0">Select One</div></li>
<?php
								$query_p_parent_s = "select * from 1_3_p_parent where 1;";
								$result_p_parent_s = mysqli_query($dbLink,$query_p_parent_s);
								while($row_p_parent_s = mysqli_fetch_array($result_p_parent_s)) {
									
									$query_p = "select * from 1_3_p where id_1_3_p_parent = '".$row_p_parent_s["id_1_3_p_parent"]."' order by nilai_p desc";
									$result_p = mysqli_query($dbLink,$query_p);
									while($row_p = mysqli_fetch_array($result_p)) {
										
?>
													<li class="<?php if($row_p['jenis'] == $selectNilaiP) { echo "selected"; } ?>" data-filter="<?php echo $row_p_parent_s["id_1_3_p_parent"]?>" style=" <?php if($row_p["id_1_3_p_parent"] == $selectNilaiParent ){ echo 'display:block;'; } else { echo 'display:none;'; } ?> "><div data-value="<?php echo $row_p['jenis']?>" data-nilai="<?php echo $row_p['nilai_p']?>"><?php echo $row_p['jenis']?></div></li>                                           	
<?php
									}
									
								}
								
?>
                                            	</ul>
                                            </div>
                                            <div class="div-nilai"><span>Nilai P :</span> <input type="text" name="txtNilaiP" id="txtNilaiP" class="input-small disabled-clear" value="<?php echo $nilaiP ?>" readonly ></div>
										</div>
									</div>
                                    
                                    <div class="control-group contentFloatL">
										<label class="control-label">Cakupan Organisasi</label>
										<div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" name="txtSelectNilaiQ" id="txtSelectNilaiQ" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $selectNilaiQ ?>" placeholder="Select One" readonly />
                                                <ul id="ulSelectNilaiQ" class="ulSelectCustom input-nilai">
                                                    <li><div data-value="" data-nilai="0">Select One</div></li>
<?php
								$query_q = "select * from 1_3_q where 1;";
								$result_q = mysqli_query($dbLink,$query_q);
								while($row_q = mysqli_fetch_array($result_q)) {
?>
												<li class="<?php if($row_q['cakupan'] == $selectNilaiQ) { echo "selected"; } ?>"><div data-value="<?php echo $row_q['cakupan']?>" data-nilai="<?php echo $row_q['nilai_q']?>"><?php echo $row_q['cakupan']?></div></li>
<?php
								}
?>
                                            	</ul>
                                            </div>
                                            <div class="div-nilai"><span>Nilai Q :</span> <input type="text" name="txtNilaiQ" id="txtNilaiQ" class="input-small disabled-clear" value="<?php echo $nilaiQ ?>" readonly ></div>
										</div>
									</div>
                                    
									<div class="control-group contentFloatL">
										<label class="control-label">Peranan dalam Organisasi</label>
										<div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" name="txtSelectNilaiR" id="txtSelectNilaiR" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $selectNilaiR ?>" placeholder="Select One" readonly />
                                                <ul id="ulSelectNilaiR" class="ulSelectCustom input-nilai">
                                                    <li><div data-value="" data-nilai="0">Select One</div></li>
<?php
								$query_r = "select * from 1_3_r where 1;";
								$result_r = mysqli_query($dbLink,$query_r);
								while($row_r = mysqli_fetch_array($result_r)) {
?>
                                                <li class="<?php if($row_r['peran'] == $selectNilaiR) { echo "selected"; } ?>"><div data-value="<?php echo $row_r['peran']?>" data-nilai="<?php echo $row_r['nilai_r']?>"><?php echo $row_r['peran']?></div></li>
<?php
								}
?>
                                            	</ul>
                                            </div>
                                            <div class="div-nilai"><span>Nilai R :</span> <input type="text" name="txtNilaiR" id="txtNilaiR" class="input-small disabled-clear" value="<?php echo $nilaiR ?>" readonly ></div>
										</div>
									</div>
                                    
                                    <div class="control-group contentFloatL">
										<label class="control-label">Kompetensi yang Relevan dengan Kegiatan Organisasi</label>
										<div class="controls">
                                        	<select name="txtKopetensi" id="txtKopetensi" class="input-block-level multiSumoSelect input-nilai-kopetensi" multiple="multiple" onChange="hitungTotalNilaiSeluruh()">
<?php
$uu = 0;
$idKopetensi = '';
$query_k = "select * from bakuan_kompetensi where step = 'I.3' order by id_bakuan_kompetensi asc";
$result_k = mysqli_query($dbLink,$query_k);
while($row_k = mysqli_fetch_array($result_k)) {
	$selectedKopetensi = '';
	
	if($pagesEdit == true){
		$valueKopetensi = $row_k['kode'].' '.$row_k['kompetensi'];
		$query_uu = "select * from 1_3_kompetensi where id_organisasi_detail = '".$id_organisasi_detail."' && kompetensi = '".$valueKopetensi."' limit 1";
		$result_uu = mysqli_query($dbLink,$query_uu);
		if( mysqli_num_rows($result_uu) > 0 ) {
			$selectedKopetensi = 'selected';
			
			$id_bakuan_kompetensi = $row_k["id_bakuan_kompetensi"];
			if($uu == 0){ $idKopetensi = $id_bakuan_kompetensi; } else { $idKopetensi = $idKopetensi.','.$id_bakuan_kompetensi; }
			
			$uu += 1;
		}
	}

?>
                <option value="<?php echo $row_k['kode'].' '.$row_k['kompetensi']?>" data-nilai="<?php echo $row_k['satuan']?>" data-id="<?php echo $row_k['id_bakuan_kompetensi']?>" <?php echo $selectedKopetensi ?>><?php echo $row_k['kode'].' '.$row_k['kompetensi'] ?></option>
<?php
}
if($uu != 0){ $hasilPenilaianTotal = $hasilPenilaianTotal * $uu; }
?>
                                            </select>
                                            <div id="divNilaiKopetensi" class="div-nilai"><span>Kompetensi Terhitung :</span> <input type="text" name="txtNilaiKopetensi" id="txtNilaiKopetensi" class="input-small disabled-clear nilai" value="<?php echo $uu ?>" readonly ></div>
                                            <input type="hidden" name="txtSelectKopetensi" id="txtSelectKopetensi" value="<?php echo $idKopetensi ?>"/>
										</div>
									</div>
                                    
                                    <div class="control-group" style="background-color:transparent;">
                                        <div class="controls" style="border-left:none;">
                    						<div class="div-nilai" style="padding-left:0px;">Hasil Penilaian Total (T) : <input type="text" name="txtTotalNilai" id="txtTotalNilai" class="input-small disabled-clear" value="<?php echo $hasilPenilaianTotal ?>" readonly ></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group" style="background-color:transparent;">
                                        <div class="controls" style="border-left:none;">
                                            <input type="hidden" name="actionSave" id="actionSave" value="<?php echo $actionSave ?>"/>
                                            <input type="hidden" name="txtIdUser" value="<?php echo base64_encode($_SESSION['id_u5er'])?>" />
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                            
                                            <?php if($pagesEdit == true){ ?>
                                            <input type="hidden" name="txtTotalNilaiEdit" value="<?php echo base64_encode($hasilPenilaianTotal) ?>"/>
                                            <input type="hidden" name="txtTotalSeluruhNilaiEdit" value="<?php echo base64_encode($totalSeluruhNilaiEdit) ?>"/>
                                            <input type="hidden" name="txtIdEdit" value="<?php echo base64_encode($id_organisasi_detail) ?>"/>
                                            <a href="./1.3.php"><div class="btn btn-inverse">Batal</div></a>
                                            <button type="submit" class="btn btn-danger" id="btnHapus">Hapus</button>
                                            <?php } ?>
                                            
                                        </div>
                                    </div>
                                    
                                </form>
							</div>
                            <?php } ?>
                            
                            <div class="control-nav">
                                <a href="./1.2.php"><div class="btn btn-primary">Prev</div></a>
                                <a href="./1.4.php"><div class="btn btn-primary">Next</div></a>
                            </div>
						</div>
					</div>
				</div>
                
			</div>
		</div>
    </div>

    <div class="bgSelectCustom"></div>
    
	<!-- jQuery UI -->
	<script src="js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
	<script src="js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
	<!-- Touch enable for jquery UI -->
	<script src="js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
	<!-- slimScroll -->
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- Bootbox -->
	<script src="js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- jQuery Multiselect Plugins -->
	<script src="js/jquery.sumoselect.js"></script>
    
	<script src="js/plugins/datepicker/bootstrap-datepicker.js"></script>
    
	<script type="text/javascript" src="js/function.js"></script>
    
	<script type="text/javascript">
    
		$(document).ready(function() {
		
			// datepicker
			$('.datepick').datepicker({
				format: 'yyyy-mm-dd'
			});
			
			$('.multiSumoSelect').SumoSelect({
				placeholder: 'Select One'
			});	
			
			<?php if($pagesEdit == true || isset($_GET['err']) || isset($_GET['msg']) ){ ?>
					$("body, html").animate({ scrollTop : $('#coloumn-content').position().top - 30 }, 700);
			<?php } ?>
			
		});
		
    
    </script>   
         
</body>
</html>

<?php } ?>