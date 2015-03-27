<?php
	session_start();
	include('./src/dbconnect.php');
	include('./src/function.php');

	if( !isset($_SESSION['log1n_us3r_f4ip']) && $_SESSION['log1n_us3r_f4ip']!=true ) {
		header('location: ./?err='.base64_encode('Silahkan login terlebih dahulu.'));
		exit();
	} else {
	
	include('./func/sumtotal.php');
	include('./func/checkStatusPengisian.php');
	include('./func/checkStatusPenilai.php');
	
	$pages = 'selesai';
	$step1 = 'step_ok';
	$step2 = 'step_ok';
	$step3 = 'step_ok';
	$step4 = 'step_ok';
	$step5 = 'step_ok';
	$step6 = 'step_ok';
	$step7 = 'step_ok';
	$step8 = 'step_ok';
	$step9 = 'step_ok';
	$step10 = 'step_ok';
	$step11 = 'step_ok';
	$step12 = 'step_ok';
	$step13 = 'step_ok';
	$step14 = 'step_ok';
	$step15 = 'step_ok';
	$step16 = 'step_ok';
	$step17 = 'step_ok';
	$step18 = 'step_ok';
	
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
								<h3><i class="icon-th-list"></i> Selesai</h3>
							</div>
                            
							<div class="box-content nopadding">
                            
								<form action="<?php if( $status_penilai == 1 ){ echo '#'; } else { echo './func/change_status.php'; } ?>" method="post" class="form-horizontal form-bordered" id="formSubmit">
                                    
                                	<div class="control-group" style="background-color:transparent; <?php echo $styleInfo ?>">
										<div class="controls" style="border-left:none; margin-left:0px;">
                                            <div class=" <?php echo $classInfo ?> spanMessage">
                                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                <?php echo $msgInfo ?>
                                            </div>
										</div>
									</div>
                                    
                                     <table class="t_faip" cellpadding="0" cellspacing="0">
                                     	<thead>
                                            <tr>
                                                <th width="5%" align="center">No</th>
                                                <th width="5%" align="center">Langkah</th>
                                                <th width="80%">Judul</th>
                                                <th width="10%" align="center">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                        	<tr>
                                            	<td width="5%" align="center">1.</td>
                                            	<td width="5%" align="center">I.1</td>
                                            	<td width="80%"><a href="./dashboard.php">Informasi Umum</a></td>
                                            	<td width="10%" align="center"><i class="fa fa-check"></i></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">2.</td>
                                            	<td align="center">I.2</td>
                                            	<td><a href="./1.2.php">Pendidikan Formal</a></td>
                                            	<td align="center"><?php echo $stat2 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">3.</td>
                                            	<td align="center">I.3</td>
                                            	<td><a href="./1.3.php">Organisasi Profesi & Organisasi Lain yang Dimasuki</a></td>
                                            	<td align="center"><?php echo $stat3 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">4.</td>
                                            	<td align="center">I.4</td>
                                            	<td><a href="./1.4.php">Tanda Penghargaan yang Diterima</a></td>
                                            	<td align="center"><?php echo $stat4 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">5.</td>
                                            	<td align="center">I.5</td>
                                            	<td><a href="./1.5.php">Pendidikan / Pelatihan Teknik / Pertanian dan Pendidikan Profesi yang Diikuti</a></td>
                                            	<td align="center"><?php echo $stat5 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">6.</td>
                                            	<td align="center">I.6</td>
                                            	<td><a href="./1.6.php">Pendidikan / Pelatihan Manajemen dan Pendidikan Lainnya (yang Relevan) yang Diikuti</a></td>
                                            	<td align="center"><?php echo $stat6 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">7.</td>
                                            	<td align="center">II.1</td>
                                            	<td><a href="./2.1.php">Referensi Kode Etik dan Etika Profesi</a></td>
                                            	<td align="center"><?php echo $stat7 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">8.</td>
                                            	<td align="center">II.2</td>
                                            	<td><a href="./2.2.php">Pengertian, Pendapat dan Pengalaman Kode Etik dan Etika Profesi Sendiri</a></td>
                                            	<td align="center"><?php echo $stat8 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">9.</td>
                                            	<td align="center">III.1</td>
                                            	<td><a href="./3.1.php">Pengalaman dalam Perencanaan dan Perancangan dan/atau Pengalaman dalam Pengelolaan Tugas-tugas Keinsinyuran</a></td>
                                            	<td align="center"><?php echo $stat9 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">10.</td>
                                            	<td align="center">III.2</td>
                                            	<td><a href="./3.2.php">Pengalaman Mengajar Pelajaran Keinsinyuran dan/atau Manajemen</a></td>
                                            	<td align="center"><?php echo $stat10 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">11.</td>
                                            	<td align="center">III.3</td>
                                            	<td><a href="./3.3.php">Pengalaman dalam Penelitian, Pengembangan dan Komersilisasi dan/atau Pengalaman Menangani Bahan dan Komponen</a></td>
                                            	<td align="center"><?php echo $stat11 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">12.</td>
                                            	<td align="center">III.4</td>
                                            	<td><a href="./3.4.php">Pengalaman dalam Pekerjaan Manufaktur atau Produksi dan/atau Konsultasi Perekayasaan dan/atau Konstruksi / Instalasi</a></td>
                                            	<td align="center"><?php echo $stat12 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">13.</td>
                                            	<td align="center">III.5</td>
                                            	<td><a href="./3.5.php">Pengalaman dalam Manajemen Usaha / Pemasaran Teknik dan/atau dalam Manajemen Pembangunan dan Pemeliharaan Aset</a></td>
                                            	<td align="center"><?php echo $stat13 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">14.</td>
                                            	<td align="center">IV.1</td>
                                            	<td><a href="./4.1.php">Karya Tulis di Bidang Keinsinyuran yang Dipublikasikan</a></td>
                                            	<td align="center"><?php echo $stat14 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">15.</td>
                                            	<td align="center">IV.2</td>
                                            	<td><a href="./4.2.php">Makalah Tulisan yang Disajikan dalam Seminar / Lokakarya Keinsinyuran</a></td>
                                            	<td align="center"><?php echo $stat15 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">16.</td>
                                            	<td align="center">IV.3</td>
                                            	<td><a href="./4.3.php">Seminar / Lokakarya yang Diikuti</a></td>
                                            	<td align="center"><?php echo $stat16 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">17.</td>
                                            	<td align="center">IV.4</td>
                                            	<td><a href="./4.4.php">Karya Temuan / Inovasi / Paten dan Implementasi Teknologi Baru</a></td>
                                            	<td align="center"><?php echo $stat17 ?></td>
                                            </tr>
                                        	<tr>
                                            	<td align="center">18.</td>
                                            	<td align="center">V</td>
                                            	<td><a href="./5.1.php">Bahasa yang Dikuasai</a></td>
                                            	<td align="center"><?php echo $stat18 ?></td>
                                            </tr>
                                         </tbody>
                                     </table>
                                     <div class="control-group" style="background-color:transparent;">
                                        <div class="controls" style="border-left:none;">
                                            <div style="position:relative; padding-bottom:20px;">Silahkan periksa kembali pengisian anda sebelum klik SUBMIT.</div>
                                            <?php if( $status_penilai == 1 ){ ?>
                                            <div class="btn btn-primary btn-disabled">Submit</div>
											<?php } else { ?>
                                            <input type="hidden" name="actionSave" id="actionSave" value="add"/>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </form>
							</div>
                        	
                            <div class="control-nav">
                                <a href="./5.1.php"><div class="btn btn-primary">Prev</div></a>
                                <a href="./dashboard.php"><div class="btn btn-primary">Back To Home</div></a>
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
	<!-- jQuery Multiselect Plugins -->
	<script src="js/jquery.sumoselect.js"></script>
    
	<script src="js/plugins/datepicker/bootstrap-datepicker.js"></script>
    
	<script type="text/javascript" src="js/function.js"></script>
    
	<script type="text/javascript">
    
		$(document).ready(function() {
		
<?php
	if( isset($_GET['msg']) && base64_decode($_GET['msg'])!='' ) {
?>
			alert('<?=base64_decode($_GET['msg'])?>');
<?php
	}
?>
		
<?php
	if( isset($_GET['err']) && base64_decode($_GET['err'])!='' ) {
?>
			alert('<?=base64_decode($_GET['err'])?>');
<?php
	}
?>
			
<?php
	if( $nHasil == 0 ) {			
?>
			
			$('form#formSubmit').on('submit', function(){
				
				if( confirm('Data belum terisi dengan sempurna.\nApa anda yakin ingin melanjutkan?') ) {
					return true;
				} else {
					return false;
				}
				
				return false;
				
			})
			
<?php
	}
?>
			
		});
		
    </script>   
         
</body>
</html>

<?php } ?>