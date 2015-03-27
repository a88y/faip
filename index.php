<?php
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
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">
    
	<!-- Custom CSS -->
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


	<script type="text/javascript">
    
		$(document).ready(function() {
					
		});
	
	</script>
    
</head>

<body class='login'>

	<div class="wrapper">
		<h1><span><img src="img/logo-big.png" alt="" class='retina-ready' width="59" height="49">FAIP BKK-PII</span></h1>
		<div class="login-body">
			<h2>MASUK</h2>
			<form action="./src/dologin.php" method="post" id="loginForm" class="form-validate">
                <div class=" <?php echo $classInfo ?> " style=" <?php echo $styleInfo ?> ">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <?php echo $msgInfo ?>
                </div>
            	<div class="control-group">
                    <div class="email controls">
                        <input type="text" name="txtEmail" id="txtEmail" placeholder="Email" class="input-block-level" data-rule-required="true" data-rule-email="true">
                    </div>
                </div>
                <div class="control-group">
                    <div class="pw controls">
                        <input type="password" name="txtPassword" id="txtPassword" placeholder="Kata Sandi" class="input-block-level" data-rule-required="true">
                    </div>
                </div>
				<div class="submit">
                    <input type="hidden" name="send_dologin" value="yes"/>
					<input type="submit" value="Masuk" class='btn btn-primary'>
				</div>                
			</form>
			<div class="forget">
				<a href="./register.php"><span>Registrasi baru</span></a>
			</div>
		</div>
	</div>
    
	<script type="text/javascript" src="js/function.js"></script>
    
</body>

</html>
