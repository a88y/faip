<?php

$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db_name = 'faip';

$dbLink = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ('please check your db settings');

$timestamp = gmdate("Y-m-d H:i:s", time()+60*60*7); //GMT +7

?>