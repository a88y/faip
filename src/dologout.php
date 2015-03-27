<?php

session_start();

$_SESSION['cred_u5er'] 			= "";
$_SESSION['id_u5er'] 			= "";
$_SESSION['n4ma_u5er']			= "";
$_SESSION['log1n_us3r_f4ip']	= false;

session_destroy();

header('location: ../');

?>;