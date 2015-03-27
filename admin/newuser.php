<?php
	session_start();
	include('../src/dbconnect.php');
	include('../src/function.php');


if( !isset($_SESSION['log1n_4dmin_f4ip']) && $_SESSION['log1n_4dmin_f4ip']!=true ) {
	header('location: ../?err='.base64_encode('Silahkan login terlebih dahulu.'));
	exit();
} else {
			
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
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

</head>

<body>

	<div id="navigation" class="navbar-fixed-top">
		<div class="container-fluid">
			<span id="brand">FAIP - BKK PII</span>
			<ul class='main-nav'>
				<li>
					<a href="./">
						<i class="fa fa-home"></i>
						<span>Home</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
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
					<div class="span8" style="margin:0 auto; float:none;">
						<div class="box box-bordered box-color">
							<div class="box-title">
								<h3><i class="icon-th-list"></i> Registrasi Baru</h3>
							</div>
							<div class="box-content nopadding">
								<form action="./func/new_user.php" method="post" class="form-horizontal form-bordered form-validate" id="formRegister">
                                
									<!--<div class="control-group" style="background-color:transparent; <?php echo $styleInfo ?> ">
										<div class="controls" style="border-left:none;">
                                            <div class=" <?php echo $classInfo ?> spanMessage">
                                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                <?php echo $msgInfo ?>
                                            </div>
										</div>
									</div>-->
                                    
									<div class="control-group">
										<label for="" class="control-label">Nama Lengkap</label>
										<div class="controls">
											<input type="text" name="txtNama" id="txtNama" class="input-xxlarge" data-rule-required="true" >
										</div>
									</div>
                                
									<div class="control-group">
										<label for="" class="control-label">No. KTA PII</label>
										<div class="controls">
											<input type="text" name="txtNoKta" id="txtNoKta" class="input-xxlarge" onChange="checkAvailable2('NoKta')" data-rule-required="true" >
                                            <span id="checkNoKta" class="checkAvailable help-block error"></span>
										</div>
									</div>
                                    
									<div class="control-group">
										<label for="textfield" class="control-label">Email</label>
										<div class="controls">
											<input type="text" name="txtEmail" id="txtEmail" class="input-xlarge" onChange="checkAvailable2('Email')" data-rule-required="true" data-rule-email="true">
                                            <span id="checkEmail" class="checkAvailable help-block error"></span>
										</div>
									</div>
                                
									<div class="control-group">
										<label for="textfield" class="control-label">Kata Sandi</label>
										<div class="controls">
											<input type="password" name="txtPassword" id="txtPassword" class="input-xlarge" data-rule-required="true">
										</div>
									</div>
                                    
                                    <div class="form-actions">
                    					<input type="hidden" name="actionSave" value="add"/>
										<button type="submit" class="btn btn-primary">Registrasi</button>
                                        <a href="./dashboard.php"><div class="btn">Kembali</div></a>
									</div>
								
                                </form>
							</div>
						</div>
					</div>
				</div>
                
			</div>
		</div>
    </div>

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
     
	<script src="../js/plugins/datepicker/bootstrap-datepicker.js"></script>
    
	<script type="text/javascript" src="../js/function.js"></script>

	<script type="text/javascript">
    
		$(document).ready(function() {
		
			// datepicker
			$('.datepick').datepicker({
				format: 'yyyy-mm-dd'
			});
			
		});
		
    
    </script>
        
        
</body>
</html>



<?php } ?>

