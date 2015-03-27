<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');
	include('../src/sumtotal.php');

if( !isset($_SESSION['log1n_penilai_f4ip']) && $_SESSION['log1n_penilai_f4ip']!=true ) {
	header('location: ../?err='.base64_encode('Silahkan login terlebih dahulu.'));
	exit();
} else {
		
	if( !isset($_GET['reff']) || $_GET['reff']=='' ) {
		header('location: ./dashboard.php');
	}
		
	$id_user = base64_decode($_GET['reff']);
	
	$pages = 11;
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
	$step11 = 'step_current';
	$step12 = '';
	$step13 = '';
	$step14 = '';
	$step15 = '';
	$step16 = '';
	$step17 = '';
	$step18 = '';
	
	$pagesEdit = '';
	$titleHeader = 'III.3 Pengalaman dalam Penelitian, Pengembangan dan Komersilisasi dan/atau Pengalaman Menangani Bahan dan Komponen';
	$titleHeaderAction = '';	
	
	$msgInfo = "";
	$classInfo = "";
	$styleInfo = "display:none;";
	if ( isset($_GET['err']) ) {     
		$msgInfo = '<strong>Warning!</strong> '.base64_decode($_GET['err']);
		$classInfo = "alert alert-error";
		$styleInfo = "display:block;";
	} else if ( isset($_GET['msg']) ) { 
		$msgInfo = '<strong>Success!</strong> '.base64_decode($_GET['msg']);
		$classInfo = "alert alert-success";
		$styleInfo = "display:block;";
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
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="../css/bootstrap-responsive.min.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="../css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="../css/themes.css">
    <!-- jQuery Multiselect Plugins -->
	<link rel="stylesheet" href="../css/sumoselect.css">
    
	<link rel="stylesheet" href="../css/custom-style.css">

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/eakroko.js"></script>
	<!-- Validation -->
	<script src="../js/plugins/validation/jquery.validate.min.js"></script>
	<script src="../js/plugins/validation/additional-methods.min.js"></script>
    
	<!-- Favicon -->
	<link rel="shortcut icon" href="../img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="../img/apple-touch-icon-precomposed.png" />

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
	$query_1 = "select t1.id_user, t1.id_3_3, IFNULL(t1.total_penilaian_penilai, t1.total_penilaian) total_penilaian, t2.id_3_3_detail, t2.kegiatan, t2.nama, t2.penyandang_dana, t2.perguruan, t2.sampai, t2.sejak, t3.jenis, t3.nilai_p, t3.peran, t3.nilai_q, t3.cakupan, t3.nilai_r, t3.jenis_penilai, t3.nilai_p_penilai, t3.peran_penilai, t3.nilai_q_penilai, t3.cakupan_penilai, t3.nilai_r_penilai
				from 3_3 as t1
				join 3_3_detail as t2 on t2.id_3_3 = t1.id_3_3
				join 3_3_pqr as t3 on t3.id_3_3_detail = t2.id_3_3_detail
				where t1.id_user = '".$id_user."' order by t2.id_3_3_detail asc";
						
	$result_1 = mysqli_query($dbLink, $query_1);
	if( mysqli_num_rows($result_1) > 0 ) {
?>
                <div id="divContent" class="row-fluid">
					<div class="span12">
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
										<label class="control-label">Uraian Kegiatan yang Dilakukan</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["kegiatan"]?></p></div>
										</div>
									</div>
                                        
									<div class="control-group">
										<label class="control-label">Nama Proyek / Program</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["nama"]?></p></div>
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Penyandang Dana</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["penyandang_dana"]?></p></div>
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Perguruan Tinggi, Lembaga atau Perusahaan</label>
										<div class="controls">
                                            <div class="input-block-level"><p><?php echo $row_1["perguruan"]?></p></div>
										</div>
									</div>
                                
									<div class="control-group">
										<label class="control-label">Masa Proyek / Program</label>
										<div class="controls">
                                            <div class="input-xlarge"><p><?php echo $row_1["sejak"]?></p></div>
                                            <div class="help-block" style="margin:10px 0px;">Sampai dengan</div>
                                            <div class="input-xlarge"><p><?php echo $row_1["sampai"]?></p></div>
										</div>
									</div>
                                                                                            
                                    <div class="control-group">
										<label class="control-label">Lingkup & Besaran Proyek / Program</label>
										<div class="controls">
                                            <div class="input-block-level input-nilai"><p><?php echo $row_1["jenis"]?></p></div>
                                            <div class="div-nilai"><span>Nilai P : </span><?=$row_1["nilai_p"]?></div>
										</div>
                                        <div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" name="txtSelectNilaiP" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $row_1["jenis_penilai"] ?>" placeholder="Select One" readonly />
                                                <ul class="ulSelectCustom input-nilai">
                                                    <li><div data-value="" data-nilai="">Select One</div></li>
<?php
								$query_p = "select * from 3_3_p where 1;";
								$result_p = mysqli_query($dbLink,$query_p);
								while($row_p = mysqli_fetch_array($result_p)) {
?>
                                                <li class="<?php if($row_p['jenis'] == $row_1["jenis_penilai"]) { echo "selected"; } ?>"><div data-value="<?php echo $row_p['jenis']?>" data-nilai="<?php echo $row_p['nilai_p']?>"><?php echo $row_p['jenis']?></div></li>
<?php
								}
?>
                                            	</ul>
                                            </div>
                                            <div class="div-nilai"><span>Nilai P :</span> <input type="text" name="txtNilaiP" class="input-small disabled-clear txtpenilai" value="<?php echo $row_1["nilai_p_penilai"] ?>" maxlength="1" ></div>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Peran / Keterlibatan Pemohon</label>
										<div class="controls">
                                            <div class="input-block-level input-nilai"><p><?php echo $row_1["peran"]?></p></div>
                                            <div class="div-nilai"><span>Nilai Q : </span><?=$row_1["nilai_q"]?></div>
										</div>
                                        <div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" name="txtSelectNilaiQ" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $row_1["peran_penilai"] ?>" placeholder="Select One" readonly />
                                                <ul class="ulSelectCustom input-nilai">
                                                    <li><div data-value="" data-nilai="">Select One</div></li>
<?php
								$query_q = "select * from 3_3_q where 1;";
								$result_q = mysqli_query($dbLink,$query_q);
								while($row_q = mysqli_fetch_array($result_q)) {
?>
												<li class="<?php if($row_q['peran'] == $row_1["peran_penilai"]) { echo "selected"; } ?>"><div data-value="<?php echo $row_q['peran']?>" data-nilai="<?php echo $row_q['nilai_q']?>"><?php echo $row_q['peran']?></div></li>
<?php
								}
?>
                                            	</ul>
                                            </div>
                                            <div class="div-nilai"><span>Nilai Q :</span> <input type="text" name="txtNilaiQ" class="input-small disabled-clear txtpenilai" value="<?php echo $row_1["nilai_q_penilai"] ?>"  maxlength="1" ></div>
										</div>
									</div>
                                    
									<div class="control-group">
										<label class="control-label">Cakupan Proyek/Program</label>
										<div class="controls">
                                            <div class="input-block-level input-nilai"><p><?php echo $row_1["cakupan"]?></p></div>
                                            <div class="div-nilai"><span>Nilai R : </span><?=$row_1["nilai_r"]?></div>
										</div>
                                        <div class="controls">
                                        	<div class="fullwidth">
                                        		<input type="text" name="txtSelectNilaiR" class="input-block-level input-nilai txtSelectCustom" value="<?php echo $row_1["cakupan_penilai"] ?>" placeholder="Select One" readonly />
                                                <ul class="ulSelectCustom input-nilai">
                                                    <li><div data-value="" data-nilai="">Select One</div></li>
<?php
								$query_r = "select * from 3_3_r where 1;";
								$result_r = mysqli_query($dbLink,$query_r);
								while($row_r = mysqli_fetch_array($result_r)) {
?>
                                                <li class="<?php if($row_r['cakupan'] == $row_1["cakupan_penilai"]) { echo "selected"; } ?>"><div data-value="<?php echo $row_r['cakupan']?>" data-nilai="<?php echo $row_r['nilai_r']?>"><?php echo $row_r['cakupan']?></div></li>
<?php
								}
?>
                                            	</ul>
                                            </div>
                                            <div class="div-nilai"><span>Nilai R :</span> <input type="text" name="txtNilaiR" class="input-small disabled-clear txtpenilai" value="<?php echo $row_1["nilai_r_penilai"] ?>"  maxlength="1" ></div>
										</div>
									</div>
                                    
                                    <div class="control-group">
										<label class="control-label">Kompetensi yang relevan dengan Pengalaman Penelitian, Pengembangan, Komersialisasi dan Penanganan Bahan/Komponen</label>
										<div class="controls">
<?php
	$i = 0;
	$query_2 = "select id_kompetensi, kompetensi, nilai_kompetensi from 3_3_kompetensi where id_3_3_detail = '".$row_1["id_3_3_detail"]."' order by id_kompetensi asc";	
	$result_2 = mysqli_query($dbLink, $query_2);
	if( mysqli_num_rows($result_2) > 0 ) {
		while ( $row_2 = mysqli_fetch_array($result_2) ) { ?>
                                        	                                            
                                            <div class="input-block-level input-nilai-kopetensi" style="margin-bottom:5px;">
                                                <p><?php echo $row_2["kompetensi"]?></p>
                                            </div>
<?php $i += 1; }
	} else { ?>
                                            <div class="input-block-level input-nilai-kopetensi" style="margin-bottom:5px;"></div>
<?php } ?>
                                        	<div class="div-nilai"><span>Kompetensi Terhitung :</span> <input type="text" name="txtNilaiKopetensi" class="input-small disabled-clear nilai" value="<?php echo $i ?>" readonly ></div>
										</div>
                                        <div class="controls">
                                        	<select name="txtKopetensi" class="input-block-level multiSumoSelect input-nilai-kopetensi" multiple="multiple" data-rule-required="true" onChange="hitungTotalNilaiSeluruhPenilai($(this))">
<?php
$uu = 0;
$idKopetensi = '';
$query_k = "select * from bakuan_kompetensi where step = 'III.3' order by id_bakuan_kompetensi asc";
$result_k = mysqli_query($dbLink,$query_k);
while($row_k = mysqli_fetch_array($result_k)) {
	$selectedKopetensi = '';
	
	$valueKopetensi = $row_k['kode'].' '.$row_k['kompetensi'];
	$query_uu = "select * from 3_3_kompetensi where id_3_3_detail = '".$row_1["id_3_3_detail"]."' && kompetensi = '".$valueKopetensi."' limit 1";
	$result_uu = mysqli_query($dbLink,$query_uu);
	if( mysqli_num_rows($result_uu) > 0 ) {
		$selectedKopetensi = 'selected';
		
		$id_bakuan_kompetensi = $row_k["id_bakuan_kompetensi"];
		if($uu == 0){ $idKopetensi = $id_bakuan_kompetensi; } else { $idKopetensi = $idKopetensi.','.$id_bakuan_kompetensi; }
		
		$uu += 1;
	}
	
?>
                <option value="<?php echo $row_k['kode'].' '.$row_k['kompetensi']?>" data-nilai="<?php echo $row_k['satuan']?>" data-id="<?php echo $row_k['id_bakuan_kompetensi']?>" <?php echo $selectedKopetensi ?>><?php echo $row_k['kode'].' '.$row_k['kompetensi'] ?></option>
<?php
}
if($uu != 0){ $hasilPenilaianTotal = $hasilPenilaianTotal * $uu; }
?>
                                            </select>
                                            <input type="hidden" name="txtSelectKopetensi" class="txtSelectKopetensi" value="<?php echo $idKopetensi ?>"/>
										</div>
									</div>
                                    
                                    <div class="control-group" style="background-color:transparent;">
                                        <div class="controls" style="border-left:none;">
                                        	<input type="hidden" name="id_detail" value="<?=$row_1["id_3_3_detail"]?>" />
                                        	<button class="btn btn-primary btn-edit">Save</button>
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
             
				
                
			</div>
		</div>
    </div>

    <div class="bgSelectCustom"></div>

	<!-- jQuery UI -->
	<script src="../js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
	<script src="../js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
	<script src="../js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
	<script src="../js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
	<script src="../js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
	<!-- Touch enable for jquery UI -->
	<script src="../js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
	<!-- slimScroll -->
	<script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- Bootbox -->
	<script src="../js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- jQuery Multiselect Plugins -->
	<script src="../js/jquery.sumoselect.js"></script>
    
	<script src="../js/plugins/datepicker/bootstrap-datepicker.js"></script>
    
	<script type="text/javascript" src="../js/function.js"></script>
    
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
			
			$('.input-penilai').on('keyup',function(){
				if( isNaN($(this).val()) || $(this).val() > 4 || $(this).val() == ' ' ) {
					$(this).val($(this).attr('rel-value')).focus();
				}
			});			
			
			
			$('.input-kompetensi').on('change',function(){
				var relatives = $(this).attr('rel-detail'),
					terhitung = 0;
				$('.input-kompetensi[rel-detail='+relatives+']').each(function() {
                    terhitung = parseInt(terhitung) + parseInt($(this).val());
                });
				$('.terhitung[rel-detail='+relatives+']').html(terhitung);
			});
			
			
			$('form').on('submit', function(){
				
				var forms = $(this),
					ajaxvalue = forms.serialize();
				
				$.ajax({
					url:"./src/3.3.update.php",
					type:"POST",
					data: ajaxvalue,
					beforeSend: function(){
						$('.btn-edit').attr('disabled','disabled');
						forms.find('.btn-edit').html('Updating Data');
					},
					success: function(serverResponse){
						alert(serverResponse);
						$('.btn-edit').removeAttr('disabled');
						forms.find('.btn-edit').html('Save');
						location.reload();
					},
					error: function(errMsg){
						alert(errMsg);
						$('.btn-edit').removeAttr('disabled');
						forms.find('.btn-edit').html('Save');
					}
				});
				
				return false;
				
			});
			
		});
		
    

    </script>   
         
</body>
</html>

<?php } ?>