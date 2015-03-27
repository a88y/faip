<?php
	
	/* --- DATE --- */
	$timestamp = gmdate("Y-m-d H:i:s", time()+60*60*7); //GMT +7
	
	date_default_timezone_set('Asia/Jakarta'); //Sama aja GMT +7
	$timestamp2 = date("Y-m-d H:i:s");
	
		$tahun = substr($timestamp, 0, 4);
		$tahun2 = substr($timestamp, 2, 2);
		$bulan = substr($timestamp, 5, 2);
		$tgl   = substr($timestamp, 8, 2);
		$BulanIndo = array("Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des");
	$datestamp = $tahun . "-" . $bulan . "-" . $tgl;
	$datestamp1 = $tgl . "-" . $bulan . "-" . $tahun;
	$datestamp2 = $tgl . "-" . $bulan . "-" . $tahun2;
	$datestamp3 = $tgl . " " . $BulanIndo[(int)$bulan-1] . " ". $tahun2; 
	
	
	if($tahun == '2014'){ $cptahun = '2014'; } else { $cptahun = '2014 - '.$tahun; }
	
	function convDate($vardate) {
		$tahun = substr($vardate, 0, 4);
		$tahun2 = substr($vardate, 2, 2);
		$bulan = substr($vardate, 5, 2);
		$tgl   = substr($vardate, 8, 2);
		$BulanIndo = array("Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des");
		return $tgl . " " . $BulanIndo[(int)$bulan-1] . " ". $tahun;  
	}
	
	function convDateTime($vardate) {
		$tahun = substr($vardate, 0, 4);
		$tahun2 = substr($vardate, 2, 2);
		$bulan = substr($vardate, 5, 2);
		$tgl   = substr($vardate, 8, 2);
		
		$jam   = substr($vardate, 11, 2);
		$menit   = substr($vardate, 14, 2);
		$detik   = substr($vardate, 17, 2);
		$BulanIndo = array("Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des");
		return $tgl . " " . $BulanIndo[(int)$bulan-1] . " ". $tahun .", ". $jam .":". $menit .":". $detik ;   
	}
		
	function savedatepicker($vardate) {
		$data = explode("/", $vardate);
		$joindata = $data[2]."-".$data[0]."-".$data[1];
		return $joindata;    
	}
		
	function viewdatepicker($vardate) {
		$data = explode("-", $vardate);
		$joindata = $data[1]."/".$data[2]."/".$data[0];
		return $joindata;    
	}
	
	/* --- /DATE --- */
	
	/* --- CURRENT PAGES --- */
	function pageUrl() {
		$pageURL = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
		if ($_SERVER["SERVER_PORT"] != "80") {
			$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
		} else {
			$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
		}
		return $pageURL;	
	}
	
	
	/* --- RESET PASSWORD RANDOM --- */
	function randomPassword( 
		$length=8, //string length
		$uselower=1, //use lowercase letters
		$useupper=1, // use uppercase letters
		$usespecial=0, //use special characters
		$usenumbers=1, //use numbers
		$prefix=''
		){
			$key = $prefix;
			// Seed random number generator
			srand((double)microtime() * rand(1000000, 9999999));
			$charset = "";
			if ($uselower == 1) $charset .= "abcdefghijkmnopqrstuvwxyz";
			if ($useupper == 1) $charset .= "ABCDEFGHIJKLMNPQRSTUVWXYZ";
			if ($usenumbers == 1) $charset .= "0123456789";
			if ($usespecial == 1) $charset .= "~#$%^*()_+-={}|][";
			while ($length > 0) {
				$key .= $charset[rand(0, strlen($charset)-1)];
				$length--;
			}
			return $key;
		}
	
	function randomString($length){
		$rand = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, +$length);
		return $rand;
	}
	function caseArrayStr($length){
		$key = array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","A1","B1","C1","D1","E1","F1","G1","H1","I1","J1","K1","L1","M1","N1","O1","P1","Q1","R1","S1","T1","U1","V1","W1","X1","Y1","Z1","A2","B2","C2","D2","E2","F2","G2","H2","I2","J2","K2","L2","M2","N2","O2","P2","Q2","R2","S2","T2","U2","V2","W2","X2","Y2","Z2","A3","B3","C3","D3","E3","F3","G3","H3","I3","J3","K3","L3","M3","N3","O3","P3","Q3","R3","S3","T3","U3","V3","W3","X3","Y3","Z3");
		return $key[$length];
	}
	function caseArrayAbjad($length){
		$key = array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
		return $key[$length];
	}
	
	function changeNameUrl($txtName){
		$name = str_replace(" ","_",trim($txtName));	
		if ($name!='' && preg_match('/[^\w\d_-]/si',$name)) {
			$name = str_replace(' ','_',$name);
			if (preg_match('/[^\w\d_-]/si',$name))	{
				$name = preg_replace('/[^\w\d_-]/si','',$name);
			}
		}
		return $name;
	}
	
	function ubah_huruf_awal($paragrap) {   
		$pisahkalimat = explode(" ", $paragrap);  
		$kalimatbaru = array();  
		  
		foreach ($pisahkalimat as $kalimat){
			$kalimatawalhurufbesar=ucfirst(strtolower($kalimat));  
			$kalimatbaru[] = $kalimatawalhurufbesar;  
		}  
		  
		$textgood = implode(" ", $kalimatbaru);  
		return $textgood;  
	}
	
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
