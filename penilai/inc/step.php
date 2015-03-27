<ul class="step">
    <li class="<?php echo $step1 ?>"><a href="./1.1.php?reff=<?=base64_encode($id_user)?>"><span>I.1<div>Informasi Umum</div></span></a><hr></li>
    <li class="<?php echo $step2 ?>"><a href="./1.2.php?reff=<?=base64_encode($id_user)?>"><span>I.2<div>Pendidikan Formal</div></span></a><hr></li>
    <li class="<?php echo $step3 ?>"><a href="./1.3.php?reff=<?=base64_encode($id_user)?>"><span>I.3<div>Organisasi Profesi & Organisasi Lain</div></span></a><hr></li>
    <li class="<?php echo $step4 ?>"><a href="./1.4.php?reff=<?=base64_encode($id_user)?>"><span>I.4<div>Tanda Penghargaan yang Diterima</div></span></a><hr></li>
    <li class="<?php echo $step5 ?>"><a href="./1.5.php?reff=<?=base64_encode($id_user)?>"><span>I.5<div>Pendidikan yang Diikuti</div></span></a><hr></li>
    <li class="<?php echo $step6 ?>"><a href="./1.6.php?reff=<?=base64_encode($id_user)?>"><span>I.6<div>Pendidikan Manajemen dan Lainnya yang Diikuti</div></span></a><hr></li>
    <li class="<?php echo $step7 ?>"><a href="./2.1.php?reff=<?=base64_encode($id_user)?>"><span>II.1<div>Referensi Kode Etik dan Etika Profesi</div></span></a><hr></li>
    <li class="<?php echo $step8 ?>"><a href="./2.2.php?reff=<?=base64_encode($id_user)?>"><span>II.2<div>Pengertian, Pendapat dan Pengalaman</div></span></a><hr></li>
    <li class="<?php echo $step9 ?>"><a href="./3.1.php?reff=<?=base64_encode($id_user)?>"><span>III.1<div>Pengalaman dalam Perancangan dan Perencanaan</div></span></a><hr></li>
    <li class="<?php echo $step10 ?>"><a href="./3.2.php?reff=<?=base64_encode($id_user)?>"><span>III.2<div>Pengalaman Mengajar</div></span></a><hr></li>
    <li class="<?php echo $step11 ?>"><a href="./3.3.php?reff=<?=base64_encode($id_user)?>"><span>III.3<div>Pengalaman Penelitian</div></span></a><hr></li>
    <li class="<?php echo $step12 ?>"><a href="./3.4.php?reff=<?=base64_encode($id_user)?>"><span>III.4<div>Pengalaman dalam Manufaktur</div></span></a><hr></li>
    <li class="<?php echo $step13 ?>"><a href="./3.5.php?reff=<?=base64_encode($id_user)?>"><span>III.5<div>Pengalaman dalam Manajemen</div></span></a><hr></li>
    <li class="<?php echo $step14 ?>"><a href="./4.1.php?reff=<?=base64_encode($id_user)?>"><span>IV.1<div>Karya Tulis di Bidang Keinsinyuran</div></span></a><hr></li>
    <li class="<?php echo $step15 ?>"><a href="./4.2.php?reff=<?=base64_encode($id_user)?>"><span>IV.2<div class="right">Makalah yang Disajikan dalam Seminar</div></span></a><hr></li>
    <li class="<?php echo $step16 ?>"><a href="./4.3.php?reff=<?=base64_encode($id_user)?>"><span>IV.3<div class="right">Seminar / Lokakarya yang Diikuti</div></span></a><hr></li>
    <li class="<?php echo $step17 ?>"><a href="./4.4.php?reff=<?=base64_encode($id_user)?>"><span>IV.4<div class="right">Karya Temuan / Inovasi / Paten</div></span></a><hr></li>
    <li class="<?php echo $step18 ?>"><a href="./5.1.php?reff=<?=base64_encode($id_user)?>"><span>V<div class="right">Bahasa yang Dikuasai</div></span></a><hr></li>
</ul>
<div class="ket_step">
<?php if($pages=='selesai'){ ?>
	Finish
<?php } else { ?>
	langkah <?php echo $pages ?> dari 18
<?php } ?>
</div>