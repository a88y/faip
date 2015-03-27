
	<div id="navigation" class="navbar-fixed-top">
		<div class="container-fluid">
			<span id="brand">FAIP - BKK PII</span>
			
            
			<ul class='main-nav'>
            
				<!--<li class='active'>
					<a href="index.php">
						<i class="icon-home"></i>
						<span>Dashboard</span>
					</a>
				</li>-->
            
				<li>
					<a href="./dashboard.php">
						<i class="fa fa-home"></i>
						<span>Home</span>
					</a>
				</li>
            
				<li>
					<a href="javascript:#" data-toggle="dropdown" class='dropdown-toggle'>
						<i class="fa fa-folder-open"></i>
						<span>Formulir Aplikasi</span>
						<span class="caret"></span>
					</a>
                    
					<ul class="dropdown-menu">
						<li <?php if($pages == 1){ echo 'class="active"'; } ?> >
							<a href="./dashboard.php">I.1 Informasi Umum</a>
						</li>
						<li <?php if($pages == 2){ echo 'class="active"'; } ?> >
							<a href="./1.2.php">I.2 Pendidikan Formal</a>
						</li>
						<li <?php if($pages == 3){ echo 'class="active"'; } ?> >
							<a href="./1.3.php">I.3 Organisasi Profesi & Organisasi Lain</a>
						</li>
						<li <?php if($pages == 4){ echo 'class="active"'; } ?> >
							<a href="./1.4.php">I.4 Tanda Penghargaan yang Diterima</a>
						</li>
						<li <?php if($pages == 5){ echo 'class="active"'; } ?> >
							<a href="./1.5.php">I.5 Pendidikan yang Diikuti</a>
						</li>
						<li <?php if($pages == 6){ echo 'class="active"'; } ?> >
							<a href="./1.6.php">I.6 Pendidikan Manajemen dan Lainnya yang Diikuti</a>
						</li>
						<li <?php if($pages == 7){ echo 'class="active"'; } ?> >
							<a href="./2.1.php">II.1 Referensi Kode Etik dan Etika Profesi</a>
						</li>
						<li <?php if($pages == 8){ echo 'class="active"'; } ?> >
							<a href="./2.2.php">II.2 Pengertian, Pendapat dan Pengalaman</a>
						</li>
						<li <?php if($pages == 9){ echo 'class="active"'; } ?> >
							<a href="./3.1.php">III.1 Pengalaman dalam Perancangan dan Perencanaan</a>
						</li>
						<li <?php if($pages == 10){ echo 'class="active"'; } ?> >
							<a href="./3.2.php">III.2 Pengalaman Mengajar</a>
						</li>
						<li <?php if($pages == 11){ echo 'class="active"'; } ?> >
							<a href="./3.3.php">III.3 Pengalaman Penelitian</a>
						</li>
						<li <?php if($pages == 12){ echo 'class="active"'; } ?> >
							<a href="./3.4.php">III.4 Pengalaman dalam Manufaktur</a>
						</li>
						<li <?php if($pages == 13){ echo 'class="active"'; } ?> >
							<a href="./3.5.php">III.5 Pengalaman dalam Manajemen</a>
						</li>
						<li <?php if($pages == 14){ echo 'class="active"'; } ?> >
							<a href="./4.1.php">IV.1 Karya Tulis di Bidang Keinsinyuran</a>
						</li>
						<li <?php if($pages == 15){ echo 'class="active"'; } ?> >
							<a href="./4.2.php">IV.2 Makalah yang Disajikan dalam Seminar</a>
						</li>
						<li <?php if($pages == 16){ echo 'class="active"'; } ?> >
							<a href="./4.3.php">IV.3 Seminar / Lokakarya yang Diikuti</a>
						</li>
						<li <?php if($pages == 17){ echo 'class="active"'; } ?> >
							<a href="./4.4.php">IV.4 Karya Temuan / Inovasi / Paten</a>
						</li>
						<li <?php if($pages == 18){ echo 'class="active"'; } ?> >
							<a href="./5.1.php">V Bahasa yang Dikuasai</a>
						</li>
					</ul>
                    
				</li>
            
				<!--<li>
					<a href="tables-large.php">
						<i class="fa fa-table"></i>
						<span>Data Table</span>
					</a>
				</li>-->
				
				
				
			</ul>
			<div class="user">
            
            	<ul class="icon-nav">
					
					<!--<li>
						<a href="more-error.php" class='lock-screen' rel='tooltip' title="Error Page" data-placement="bottom"><i class="fa fa-warning"></i></a>
					</li>-->
					
					<li>
						<a href="./src/dologout.php" class='lock-screen' rel='tooltip' title="Logout" data-placement="bottom"><i class="fa fa-sign-out"></i></a>
					</li>
                    
				</ul>
                
				<div class="dropdown">
					<a href="javascript:#" class='dropdown-toggle' data-toggle=""><?php echo $_SESSION['n4ma_u5er']?> <img src="img/demo/user-avatar.jpg" alt=""></a>
				</div>
                
			</div>
			<!--<a href="javascript:#" class='toggle-mobile'><i class="icon-reorder"></i></a>-->
		</div>
	</div>