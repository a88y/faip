<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');

if( !isset($_SESSION['log1n_penilai_f4ip']) && $_SESSION['log1n_penilai_f4ip']!=true ) {
	header('location: ../?err='.base64_encode('Silahkan login terlebih dahulu.'));
	exit();
} else {
			
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
    
	<!-- dataTables -->
	<link rel="stylesheet" href="../css/plugins/datatable/TableTools.css">
    
	<link rel="stylesheet" href="../css/custom-style.css">
    
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
                
				<div class="row-fluid">
					<div class="span12">
						<div class="box box-bordered box-color">
							<div class="box-title">
								<h3><i class="icon-th-list"></i>Daftar Pemohon</h3>
							</div>
							<div class="box-content nopadding">
								<table class="table table-nomargin dataTable table-bordered">
									<thead>
										<tr>
											<th>No.</th>
											<th>Nama</th>
											<th>No. KTA</th>
											<th>Username</th>
											<th>Lokasi</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
<?php

	$query = "select t1.id_user, t1.nama, t1.no_kta, t1.provinsi, t1.negara, t2.username, t2.id_credential, t1.user_submit, t1.penilai_submit
					from user as t1
				join login as t2 on t2.id_user = t1.id_user
					where t2.id_credential = 2 and t1.user_submit = '1'
					order by t1.id_user desc;";

	$result = mysqli_query($dbLink, $query);

	$i = 0;
	while( $row = mysqli_fetch_array($result) ) {
		$i ++;
		$lokasi = $row['provinsi']!=''? : $row['negara'];
?>
										<tr>
											<td><?=$i?></td>
											<td><?=$row['nama']?></td>
											<td><?=$row['no_kta']?></td>
											<td><?=$row['username']?></td>
											<td><?=$lokasi?></td>
											<td>
<?php
		if( $row['penilai_submit'] == 1 ) {
?>
                                                <a href="javascript:#" title="Download in Excel format."><img src="../img/excel.gif" width="30" /></a>
                                                <a href="./1.1.php?reff=<?=base64_encode($row['id_user'])?>" title="Open in detailed view."><img src="../img/open.png" width="30" /></a>
<?php
		} else {
?>
												<a href="./src/change_status.php?reff=<?=base64_encode($row['id_user'])?>" title="Mulai Penilaian." class="btn btn-primary startPenilaian"><i class="fa fa-lock"></i> Mulai Penilaian</a>
<?php
		}
?>
                                            </td>
										</tr>
<?php
	}
?>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
                
			</div>
		</div>
    </div>
    
    

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
    
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>

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
    
	<!-- Chosen -->
	<script src="../js/plugins/chosen/chosen.jquery.min.js"></script>
    
	<!-- dataTables -->
	<script src="../js/plugins/datatable/jquery.dataTables.min.js"></script>
    
	<script type="text/javascript">
    
		$(document).ready(function() {
		
			setInterval( function(){
				$.ajax({
					url:"../inc/autoDate.php",
					success: function(response) {
						$('.autoDate').html(response);
					}
				});
			}, 10000 );
			
			
			$('.startPenilaian').on('click', function() {
				
				if( confirm('Anda yakin akan memulai penilaian?\nSemua data yang telah diinput akan dikunci dan tidak bisa dirubah kembali.') ) {
					return true;
				} else {
					return false;
				}
				
			});
			
		
			// dataTables
			if($('.dataTable').length > 0){
				$('.dataTable').each(function(){
					var opt = {
						"sPaginationType": "full_numbers",
						"oLanguage":{
							"sSearch": "<span>Search:</span> ",
							"sInfo": "Showing <span>_START_</span> to <span>_END_</span> of <span>_TOTAL_</span> entries",
							"sLengthMenu": "_MENU_ <span>entries per page</span>"
						}
					};
					if($(this).hasClass("dataTable-noheader")){
						opt.bFilter = false;
						opt.bLengthChange = false;
					}
					if($(this).hasClass("dataTable-nofooter")){
						opt.bInfo = false;
						opt.bPaginate = false;
					}
					if($(this).hasClass("dataTable-nosort")){
						var column = $(this).data('nosort');
						column = column.split(',');
						for (var i = 0; i < column.length; i++) {
							column[i] = parseInt(column[i]);
						};
						opt.aoColumnDefs =  [
						{ 'bSortable': false, 'aTargets': column }
						];
					}
					if($(this).hasClass("dataTable-scroll-x")){
						opt.sScrollX = "100%";
						opt.bScrollCollapse = true;
					}
					if($(this).hasClass("dataTable-scroll-y")){
						opt.sScrollY = "300px";
						opt.bPaginate = false;
						opt.bScrollCollapse = true;
					}
					if($(this).hasClass("dataTable-reorder")){
						opt.sDom = "Rlfrtip";
					}
					if($(this).hasClass("dataTable-colvis")){
						opt.sDom = 'C<"clear">lfrtip';
						opt.oColVis = {
							"buttonText": "Change columns <i class='icon-angle-down'></i>"
						};
					}
					if($(this).hasClass('dataTable-tools')){
						opt.sDom= 'T<"clear">lfrtip';
						opt.oTableTools = {
							"sSwfPath": "js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
						};
					}
					if($(this).hasClass("dataTable-scroller")){
						opt.sScrollY = "300px";
						opt.bDeferRender = true;
						opt.sDom = "frtiS";
						opt.sAjaxSource = "js/plugins/datatable/demo.txt";
					}
					var oTable = $(this).dataTable(opt);
					$('.dataTables_filter input').attr("placeholder", "Search here...");
					$(".dataTables_length select").wrap("<div class='input-mini'></div>").chosen({
						disable_search_threshold: 9999999
					});
					if($(this).hasClass("dataTable-fixedcolumn")){
						new FixedColumns( oTable );
					}
				});
			}

			// force correct width for chosen
			resize_chosen();
			
			
			
		});
		
		

$(window).resize(function() {
	// chosen resize bug
	resize_chosen();
});

function resize_chosen(){
	$('.chzn-container').each(function() {
		var el = $(this);
		el.css('width', el.parent().width()+'px');
		el.find(".chzn-drop").css('width', (el.parent().width()-2)+'px');
		el.find(".chzn-search input").css('width', (el.parent().width()-37)+'px');
	});
}

<?php
	if( isset($_GET['msg']) && base64_decode($_GET['msg']) != '' ) {
?>
		alert('<?=base64_decode($_GET['msg'])?>');
<?php
	}
?>
		
    
    </script>   
         
</body>
</html>

<?php } ?>