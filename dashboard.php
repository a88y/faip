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
	
	$pages = 1;
	$step1 = 'step_current';
	$step2 = '';
	$step3 = '';
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
                    $query_1	= "SELECT * FROM user WHERE id_user = '".$_SESSION['id_u5er']."';";
                    $result_1	= mysqli_query($dbLink, $query_1);
                    $row_1		= mysqli_fetch_array($result_1);
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
						<div class="box box-bordered box-color">
							<div class="box-title">
								<h3><i class="icon-th-list"></i>I.1 Informasi Umum</h3>
							</div>
							<div class="box-content nopadding">
                                <form action="./func/1.1.update.php" method="post" class="form-horizontal form-bordered form-validate" id="form1">
                                    
                                	<div class="control-group" style="background-color:transparent; <?php echo $styleInfo ?>">
										<div class="controls" style="border-left:none;">
                                            <div class=" <?php echo $classInfo ?> spanMessage">
                                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                <?php echo $msgInfo ?>
                                            </div>
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Nama Lengkap</label>
										<div class="controls">
											<input type="text" name="txtNama" id="txtNama" class="input-xxlarge" value="<?php echo $row_1['nama']?>" >
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">No. KTA PII</label>
										<div class="controls">
											<input type="text" name="txtNoKta" id="txtNoKta" class="input-xxlarge" value="<?php echo $row_1['no_kta']?>" <?php if($row_1['no_kta'] != '' ){ echo 'disabled'; }?> >
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Alamat Tempat Tinggal Saat Ini</label>
										<div class="controls">
											<textarea name="txtAlamat" id="txtAlamat" rows="3" class="input-block-level" data-rule-required="true" data-rule-minlength="2"><?php echo $row_1['alamat']?></textarea>
										</div>
									</div>
                                    
                                    <div id="divNegara" class="control-group">
										<label class="control-label">Negara</label>
										<div class="controls">
                                        	<select name="txtNegara" id="txtNegara" class="input-xlarge" onChange="showProvinsi(this.value,'divProvinsi')" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_ngr = "select negara as n from negara where 1 order by negara asc";
	$result_ngr = mysqli_query( $dbLink, $query_ngr );
	while($row_ngr = mysqli_fetch_array( $result_ngr ) ) {
?>
                                            	<option <?php if($row_ngr['n'] == $row_1['negara'] ) echo "selected" ?> value="<?php echo $row_ngr['n']?>"><?php echo $row_ngr['n']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
									<div id="divProvinsi" class="control-group" <?php if($row_1['negara'] != 'Indonesia' ) echo 'style="display:none;"' ?> >
										<label class="control-label">Propinsi</label>
										<div class="controls">
                                        	<select name="txtProvinsi" id="txtProvinsi" class="input-xlarge" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_prov = "select provinsi as p from provinsi where 1 order by provinsi asc;";
	$result_prov = mysqli_query( $dbLink, $query_prov );
	while($row_prov = mysqli_fetch_array( $result_prov ) ) {
?>
                                            	<option <?php if($row_prov['p'] == $row_1['provinsi'] ) echo "selected" ?> value="<?php echo $row_prov['p']?>"><?php echo $row_prov['p']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
                                    <div class="control-group">
										<label class="control-label">Jenis Identitas</label>
										<div class="controls">
                                        	<select name="txtIdJenisIdentitas" id="txtIdJenisIdentitas" class="input-xlarge" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_jenis = "select * from jenis_identitas where 1 order by identitas asc;";
	$result_jenis = mysqli_query( $dbLink, $query_jenis );
	while($row_jenis = mysqli_fetch_array( $result_jenis ) ) {
?>
                                            	<option <?php if($row_jenis['id_jenis_identitas'] == $row_1['id_jenis_identitas'] ) echo "selected" ?> value="<?php echo $row_jenis['id_jenis_identitas']?>"><?php echo $row_jenis['identitas']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">No. KTP/Identitas Diri</label>
										<div class="controls">
											<input type="text" name="txtIdIdentitas" id="txtIdIdentitas" class="input-xxlarge" value="<?php echo $row_1['no_id']?>" data-rule-required="true" >
										</div>
									</div>
                                    
                                    <div id="divNegaraIdentitas" class="control-group">
										<label class="control-label">Negara Identitas</label>
										<div class="controls">
                                        	<select name="txtNegaraIdentitas" id="txtNegaraIdentitas" class="input-xlarge" onChange="showProvinsi(this.value,'divProvinsiIdentitas')" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_ngr = "select negara as ni from negara where 1 order by negara asc";
	$result_ngr = mysqli_query( $dbLink, $query_ngr );
	while($row_ngr = mysqli_fetch_array( $result_ngr ) ) {
?>
                                            	<option <?php if($row_ngr['ni'] == $row_1['negara_identitas'] ) echo "selected" ?> value="<?php echo $row_ngr['ni']?>"><?php echo $row_ngr['ni']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
									<div id="divProvinsiIdentitas" class="control-group" <?php if($row_1['negara_identitas'] != 'Indonesia' ) echo 'style="display:none;"' ?> >
										<label class="control-label">Propinsi Identitas</label>
										<div class="controls">
                                        	<select name="txtProvinsiIdentitas" id="txtProvinsiIdentitas" class="input-xlarge" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_prov = "select provinsi as pi from provinsi where 1 order by provinsi asc;";
	$result_prov = mysqli_query( $dbLink, $query_prov );
	while($row_prov = mysqli_fetch_array( $result_prov ) ) {
?>
                                            	<option <?php if($row_prov['pi'] == $row_1['provinsi_identitas'] ) echo "selected" ?> value="<?php echo $row_prov['pi']?>"><?php echo $row_prov['pi']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Tgl. Lahir</label>
										<div class="controls">
											<input type="text" name="txtTglLahir" id="txtTglLahir" placeholder="MM/DD/YYYY" class="input-large datepick" value="<?php if($row_1['tgl_lahir'] != ""){ echo viewdatepicker($row_1['tgl_lahir']); }?>" data-rule-required="true" > 
										</div>
									</div>
                                
									<div class="control-group">
										<label for="textfield" class="control-label">Tempat Lahir</label>
										<div class="controls">
											<input type="text" name="txtTmpLahir" id="txtTmpLahir" class="input-xxlarge" value="<?php echo $row_1['tmp_lahir']?>" data-rule-required="true" >
										</div>
									</div>
                                    
                                    <div id="divNegaraLahir" class="control-group">
										<label class="control-label">Negara Lahir</label>
										<div class="controls">
                                        	<select name="txtNegaraLahir" id="txtNegaraLahir" class="input-xlarge" onChange="showProvinsi(this.value,'divProvinsiLahir')" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_ngr = "select negara as nl from negara where 1 order by negara asc";
	$result_ngr = mysqli_query( $dbLink, $query_ngr );
	while($row_ngr = mysqli_fetch_array( $result_ngr ) ) {
?>
                                            	<option <?php if($row_ngr['nl'] == $row_1['negara_lahir'] ) echo "selected" ?> value="<?php echo $row_ngr['nl']?>"><?php echo $row_ngr['nl']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
									<div id="divProvinsiLahir" class="control-group" <?php if($row_1['negara_lahir'] != 'Indonesia' ) echo 'style="display:none;"' ?> >
										<label class="control-label">Propinsi Lahir</label>
										<div class="controls">
                                        	<select name="txtProvinsiLahir" id="txtProvinsiLahir" class="input-xlarge" data-rule-required="true">
                                            	<option value="" selected disabled>Select One</option>
<?php
	$query_prov = "select provinsi as pl from provinsi where 1 order by provinsi asc;";
	$result_prov = mysqli_query( $dbLink, $query_prov );
	while($row_prov = mysqli_fetch_array( $result_prov ) ) {
?>
                                            	<option <?php if($row_prov['pl'] == $row_1['provinsi_lahir'] ) echo "selected" ?> value="<?php echo $row_prov['pl']?>"><?php echo $row_prov['pl']?></option>
<?php
	}
?>
                                            </select>
										</div>
									</div>
                                    
									<div class="control-group">
										<label for="textfield" class="control-label">Email</label>
										<div class="controls">
                                        	<div id="divEmail">
                                                <div class="span12" style="margin-bottom:5px;">
                                                <input type="text" name="txtEmail[]" id="txtEmail" class="input-xlarge" value="" data-rule-required="true" data-rule-email="true" >
                                                </div>
                                            </div>
                                        	<div id="btnAddMoreEmail" class="btn btn-add-more"><i class="icon-plus"></i></div>
                                        </div>
									</div>
                                
									<div class="control-group">
										<label for="textfield" class="control-label">No. HP/Mobile Phone</label>
										<div class="controls">
                                        	<div id="divPhone">
                                                <div class="span12" style="margin-bottom:5px;">
                                                <input type="text" name="txtPhone[]" id="txtPhone" class="input-xlarge" value="" data-rule-required="true">
                                                </div>
                                            </div>
                                        	<div id="btnAddMorePhone" class="btn btn-add-more"><i class="icon-plus"></i></div>
										</div>
									</div>
                                    
                                    <div class="control-group" style="background-color:transparent;">
                                        <div class="controls">
                                            <input type="hidden" name="actionSave" value="add"/>
                                            <input type="hidden" name="txtIdUser" value="<?php echo base64_encode($_SESSION['id_u5er'])?>" />
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                        </div>
                                    </div>
                                    
                                </form>
							</div>
                            <div class="control-nav">
                                <a href="./1.2.php"><div class="btn btn-primary">Next</div></a>
                            </div>
						</div>
					</div>
				</div>
                
			</div>
		</div>
    </div>

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
    
	<script src="js/plugins/datepicker/bootstrap-datepicker.js"></script>
    
	<script type="text/javascript" src="js/function.js"></script>
    
	<script type="text/javascript">
    
		$(document).ready(function() {
		
			// datepicker
			$('.datepick').datepicker({
				format: 'yyyy-mm-dd'
			});

			<?php				
			$query_phone = "select phone from phone where id_user = '".$_SESSION['id_u5er']."' order by phone asc";
			$result_phone = mysqli_query($dbLink, $query_phone);
			if( mysqli_num_rows($result_phone) > 0 ) {
			?>
				$('#divPhone').html("");
			<?php
			while ( $row_phone = mysqli_fetch_array($result_phone) ) {
			?>
				addMorePhone('<?php echo $row_phone['phone']?>');
			<?php
			}
			}
			?>
			
			<?php				
			$query_email = "select email from email where id_user = '".$_SESSION['id_u5er']."' order by email asc";
			$result_email = mysqli_query($dbLink, $query_email);
			if( mysqli_num_rows($result_email) > 0 ) {
			?>
				$('#divEmail').html("");
			<?php
			while ( $row_email = mysqli_fetch_array($result_email) ) {
			?>
				addMoreEmail('<?php echo $row_email['email']?>');
			<?php
			}
			}
			?>
			
		});
		
    
    </script>   
         
</body>
</html>

<?php } ?>