-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2015 at 07:20 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `faip`
--

-- --------------------------------------------------------

--
-- Table structure for table `1_2`
--

CREATE TABLE IF NOT EXISTS `1_2` (
  `id_pendidikan_formal` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pendidikan_formal`),
  KEY `fk_reference_8` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_2`
--

INSERT INTO `1_2` (`id_pendidikan_formal`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 48, 48);

-- --------------------------------------------------------

--
-- Table structure for table `1_2_detail`
--

CREATE TABLE IF NOT EXISTS `1_2_detail` (
  `id_pendidikan_formal_detail` varchar(14) NOT NULL,
  `id_pendidikan_formal` varchar(12) DEFAULT NULL,
  `pendidikan_formal` varchar(250) DEFAULT NULL,
  `tahun_lulus` varchar(4) DEFAULT NULL,
  `jenjang` varchar(150) DEFAULT NULL,
  `program` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_pendidikan_formal_detail`),
  KEY `fk_reference_9` (`id_pendidikan_formal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_2_detail`
--

INSERT INTO `1_2_detail` (`id_pendidikan_formal_detail`, `id_pendidikan_formal`, `pendidikan_formal`, `tahun_lulus`, `jenjang`, `program`) VALUES
('2015-000010101', '2015-0000101', '23324324', '1972', 'S-1', 'Teknik / Keinsinyuran');

-- --------------------------------------------------------

--
-- Table structure for table `1_2_kompetensi`
--

CREATE TABLE IF NOT EXISTS `1_2_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_pendidikan_formal_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_12` (`id_pendidikan_formal_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_2_kompetensi`
--

INSERT INTO `1_2_kompetensi` (`id_kompetensi`, `id_pendidikan_formal_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.2.1.3 Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1),
('2015-00001010102', '2015-000010101', 'W.2.1.4 Mengenali dan menanggulangi masalah keinsinyuran.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_2_p`
--

CREATE TABLE IF NOT EXISTS `1_2_p` (
  `id_1_2_p` int(11) NOT NULL AUTO_INCREMENT,
  `penghargaan` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_2_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_2_p`
--

INSERT INTO `1_2_p` (`id_1_2_p`, `penghargaan`, `nilai_p`) VALUES
(1, 'Lulus dengan pujian tertinggi (Summa Cum Kaude) dan diatasnya', 4),
(2, 'Lulus dengan pujian besar (Magna Cum Laude)', 3),
(3, 'Lulus dengan pujian (Cum Laude)', 2),
(4, 'Lulus', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_2_pqr`
--

CREATE TABLE IF NOT EXISTS `1_2_pqr` (
  `id_pendidikan_formal_detail` varchar(14) NOT NULL,
  `penghargaan` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `jenjang` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `akreditasi_prodi` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `penghargaan_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `jenjang_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `akreditasi_prodi_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_pendidikan_formal_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_2_pqr`
--

INSERT INTO `1_2_pqr` (`id_pendidikan_formal_detail`, `penghargaan`, `nilai_p`, `jenjang`, `nilai_q`, `akreditasi_prodi`, `nilai_r`, `penghargaan_penilai`, `nilai_p_penilai`, `jenjang_penilai`, `nilai_q_penilai`, `akreditasi_prodi_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Lulus dengan pujian tertinggi (Summa Cum Kaude) dan diatasnya', 4, 'S-1 Teknik atau S-2 Non Teknik', 2, 'Lulusan Program Studi Terakreditasi A', 3, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_2_q`
--

CREATE TABLE IF NOT EXISTS `1_2_q` (
  `id_1_2_q` int(11) NOT NULL AUTO_INCREMENT,
  `jenjang` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_2_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_2_q`
--

INSERT INTO `1_2_q` (`id_1_2_q`, `jenjang`, `nilai_q`) VALUES
(1, 'Sarjana S-3 Teknik/Keinsinyuran', 4),
(2, 'S-2 Teknik, Magister Bisnis atau S-3 Non Teknik', 3),
(3, 'S-1 Teknik atau S-2 Non Teknik', 2),
(4, 'S-1 Non Teknik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_2_r`
--

CREATE TABLE IF NOT EXISTS `1_2_r` (
  `id_1_2_r` int(11) NOT NULL AUTO_INCREMENT,
  `akreditasi_prodi` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_2_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_2_r`
--

INSERT INTO `1_2_r` (`id_1_2_r`, `akreditasi_prodi`, `nilai_r`) VALUES
(1, 'Lulusan Program Studi World University 500', 4),
(2, 'Lulusan Program Studi Terakreditasi A', 3),
(3, 'Lulusan Program Studi Terakreditasi B', 2),
(4, 'Lulusan Program Studi Terakreditasi C', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_3`
--

CREATE TABLE IF NOT EXISTS `1_3` (
  `id_organisasi` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_organisasi`),
  KEY `fk_reference_11` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_3`
--

INSERT INTO `1_3` (`id_organisasi`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 96, 96);

-- --------------------------------------------------------

--
-- Table structure for table `1_3_detail`
--

CREATE TABLE IF NOT EXISTS `1_3_detail` (
  `id_organisasi_detail` varchar(14) NOT NULL,
  `id_organisasi` varchar(12) DEFAULT NULL,
  `nama_organisasi` varchar(250) DEFAULT NULL,
  `sejak` varchar(25) DEFAULT NULL,
  `sampai` varchar(25) DEFAULT NULL,
  `kedudukan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_organisasi_detail`),
  KEY `fk_reference_13` (`id_organisasi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_3_detail`
--

INSERT INTO `1_3_detail` (`id_organisasi_detail`, `id_organisasi`, `nama_organisasi`, `sejak`, `sampai`, `kedudukan`) VALUES
('2015-000010101', '2015-0000101', '4324324', '1973', '1957', '324324');

-- --------------------------------------------------------

--
-- Table structure for table `1_3_kompetensi`
--

CREATE TABLE IF NOT EXISTS `1_3_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_organisasi_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_15` (`id_organisasi_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_3_kompetensi`
--

INSERT INTO `1_3_kompetensi` (`id_kompetensi`, `id_organisasi_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.1.1.3 Berpedoman konstitusi dan perundang-undangan ', 1),
('2015-00001010102', '2015-000010101', 'W.1.1.4 Kesetiakawanan nasional dan kepedulian sosial ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_3_p`
--

CREATE TABLE IF NOT EXISTS `1_3_p` (
  `id_1_3_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `id_1_3_p_parent` int(11) NOT NULL,
  PRIMARY KEY (`id_1_3_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `1_3_p`
--

INSERT INTO `1_3_p` (`id_1_3_p`, `jenis`, `nilai_p`, `id_1_3_p_parent`) VALUES
(1, 'Diatas 15 Tahun', 4, 1),
(2, '11 sampai 15 Tahun', 3, 1),
(3, '6 sampai 10 Tahun', 2, 1),
(4, '1 sampai 5 Tahun', 1, 1),
(5, 'Diatas 20 Tahun', 4, 2),
(6, '16 sampai 20 Tahun', 3, 2),
(7, '6 sampai 15 Tahun', 2, 2),
(8, '1 sampai 5 Tahun', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `1_3_pqr`
--

CREATE TABLE IF NOT EXISTS `1_3_pqr` (
  `id_organisasi_detail` varchar(14) NOT NULL,
  `id_jenis_parent` int(11) DEFAULT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `id_jenis_parent_penilai` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_organisasi_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_3_pqr`
--

INSERT INTO `1_3_pqr` (`id_organisasi_detail`, `id_jenis_parent`, `jenis`, `nilai_p`, `cakupan`, `nilai_q`, `peran`, `nilai_r`, `id_jenis_parent_penilai`, `jenis_penilai`, `nilai_p_penilai`, `cakupan_penilai`, `nilai_q_penilai`, `peran_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 2, 'Diatas 20 Tahun', 4, 'Pimpinan', 4, 'Organisasi Regional', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_3_p_parent`
--

CREATE TABLE IF NOT EXISTS `1_3_p_parent` (
  `id_1_3_p_parent` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(250) NOT NULL,
  PRIMARY KEY (`id_1_3_p_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `1_3_p_parent`
--

INSERT INTO `1_3_p_parent` (`id_1_3_p_parent`, `parent`) VALUES
(1, 'Organisasi Keprofesian'),
(2, 'Organisasi Non Keprofesian');

-- --------------------------------------------------------

--
-- Table structure for table `1_3_q`
--

CREATE TABLE IF NOT EXISTS `1_3_q` (
  `id_1_3_q` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_3_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `1_3_q`
--

INSERT INTO `1_3_q` (`id_1_3_q`, `cakupan`, `nilai_q`) VALUES
(1, 'Pimpinan', 4),
(2, 'Anggota Pengurus', 3),
(3, 'Anggota Biasa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `1_3_r`
--

CREATE TABLE IF NOT EXISTS `1_3_r` (
  `id_1_3_r` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_3_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_3_r`
--

INSERT INTO `1_3_r` (`id_1_3_r`, `peran`, `nilai_r`) VALUES
(1, 'Organisasi Internasional', 4),
(2, 'Organisasi Regional', 3),
(3, 'Organisasi Nasional', 2),
(4, 'Organisasi Lokal (bukan Nasional)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_4`
--

CREATE TABLE IF NOT EXISTS `1_4` (
  `id_1_4` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_4`),
  KEY `fk_reference_16` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_4`
--

INSERT INTO `1_4` (`id_1_4`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 72, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_4_detail`
--

CREATE TABLE IF NOT EXISTS `1_4_detail` (
  `id_1_4_detail` varchar(14) NOT NULL,
  `id_1_4` varchar(12) DEFAULT NULL,
  `nama_penghargaan` varchar(250) DEFAULT NULL,
  `tgl` varchar(25) DEFAULT NULL,
  `tempat` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_1_4_detail`),
  KEY `fk_reference_18` (`id_1_4`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_4_detail`
--

INSERT INTO `1_4_detail` (`id_1_4_detail`, `id_1_4`, `nama_penghargaan`, `tgl`, `tempat`) VALUES
('2015-000010101', '2015-0000101', '435435435', '1972', '454354');

-- --------------------------------------------------------

--
-- Table structure for table `1_4_kompetensi`
--

CREATE TABLE IF NOT EXISTS `1_4_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_1_4_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_19` (`id_1_4_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_4_kompetensi`
--

INSERT INTO `1_4_kompetensi` (`id_kompetensi`, `id_1_4_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.1.1.4 Kesetiakawanan nasional dan kepedulian sosial ', 1),
('2015-00001010102', '2015-000010101', 'W.1.1.5 Wawasan kebangsaan dan kemandirian  nasional', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_4_p`
--

CREATE TABLE IF NOT EXISTS `1_4_p` (
  `id_1_4_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_4_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_4_p`
--

INSERT INTO `1_4_p` (`id_1_4_p`, `jenis`, `nilai_p`) VALUES
(1, 'Penghargaan Profesi Keinsinyuran', 4),
(2, 'Penghargaan Profesi Non Keinsinyuran', 3),
(3, 'Penghargaan Kemasyarakatan', 2),
(4, 'Penghargaan Kepegawaian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_4_pqr`
--

CREATE TABLE IF NOT EXISTS `1_4_pqr` (
  `id_1_4_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_1_4_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_4_pqr`
--

INSERT INTO `1_4_pqr` (`id_1_4_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Penghargaan Profesi Keinsinyuran', 4, 'Karena pemikiran, kreatifitas Pemohon', 3, 'Penghargaan Nasional', 3, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_4_q`
--

CREATE TABLE IF NOT EXISTS `1_4_q` (
  `id_1_4_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_4_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_4_q`
--

INSERT INTO `1_4_q` (`id_1_4_q`, `peran`, `nilai_q`) VALUES
(1, 'Karena penemuan dan inovasi Pemohon', 4),
(2, 'Karena pemikiran, kreatifitas Pemohon', 3),
(3, 'Karena Kinerja Pemohon', 2),
(4, 'Karena pengabdian Pemohon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_4_r`
--

CREATE TABLE IF NOT EXISTS `1_4_r` (
  `id_1_4_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_4_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_4_r`
--

INSERT INTO `1_4_r` (`id_1_4_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Penghargaan Internasional', 4),
(2, 'Penghargaan Nasional', 3),
(3, 'Penghargaa Lembaga Kemasyarakatan, Profesi', 2),
(4, 'Penghargaan Perusahaan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_5`
--

CREATE TABLE IF NOT EXISTS `1_5` (
  `id_1_5` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_5`),
  KEY `fk_reference_20` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_5`
--

INSERT INTO `1_5` (`id_1_5`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_5_detail`
--

CREATE TABLE IF NOT EXISTS `1_5_detail` (
  `id_1_5_detail` varchar(14) NOT NULL,
  `id_1_5` varchar(12) DEFAULT NULL,
  `nama_program` varchar(250) DEFAULT NULL,
  `tgl` varchar(25) DEFAULT NULL,
  `tempat` varchar(250) DEFAULT NULL,
  `penyelenggara` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_1_5_detail`),
  KEY `fk_reference_21` (`id_1_5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_5_detail`
--

INSERT INTO `1_5_detail` (`id_1_5_detail`, `id_1_5`, `nama_program`, `tgl`, `tempat`, `penyelenggara`) VALUES
('2015-000010101', '2015-0000101', '34543534', '1973', '4545', '43543');

-- --------------------------------------------------------

--
-- Table structure for table `1_5_kompetensi`
--

CREATE TABLE IF NOT EXISTS `1_5_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_1_5_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_23` (`id_1_5_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_5_kompetensi`
--

INSERT INTO `1_5_kompetensi` (`id_kompetensi`, `id_1_5_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.2.1.4 Mengenali dan menanggulangi masalah keinsinyuran.', 1),
('2015-00001010102', '2015-000010101', 'W.2.1.5 Memperluas pengetahuan dan memupuk kerjasama antar kejuruan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_5_p`
--

CREATE TABLE IF NOT EXISTS `1_5_p` (
  `id_1_5_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_5_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_5_p`
--

INSERT INTO `1_5_p` (`id_1_5_p`, `jenis`, `nilai_p`) VALUES
(1, 'Pendidikan/Pelatihan Teknik/Keinsinyuran > 1 bulan', 4),
(2, 'Pendidikan/Pelatihan Teknik/Keinsinyuran 1 - 4 minggu', 3),
(3, 'Pendidikan/Pelatihan Teknik/Keinsinyuran 1 - 5 hari kerja', 2),
(4, 'Pendidikan/Pelatihan Teknik/Keinsinyuran < 1 hari kerja', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_5_pqr`
--

CREATE TABLE IF NOT EXISTS `1_5_pqr` (
  `id_1_5_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_1_5_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_5_pqr`
--

INSERT INTO `1_5_pqr` (`id_1_5_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Pendidikan/Pelatihan Teknik/Keinsinyuran > 1 bulan', 4, 'Pendidikan/Peelatihan jarak jauh (distance learning)', 1, 'Pendidikan/Pelatihan dalam Perusahaan', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_5_q`
--

CREATE TABLE IF NOT EXISTS `1_5_q` (
  `id_1_5_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_5_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_5_q`
--

INSERT INTO `1_5_q` (`id_1_5_q`, `peran`, `nilai_q`) VALUES
(1, 'Pendidikan/Pelatihan dengan Sertifikat Kelulusan', 4),
(2, 'Pendidikan/Pelatihan dengan pembuatan makalah, penyelesaian studi kasus dan tugas-tugas', 3),
(3, 'Pendidikan/Pelatihan dengan sertifikat Kehadiran', 2),
(4, 'Pendidikan/Peelatihan jarak jauh (distance learning)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_5_r`
--

CREATE TABLE IF NOT EXISTS `1_5_r` (
  `id_1_5_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_5_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_5_r`
--

INSERT INTO `1_5_r` (`id_1_5_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pelatihan/Pendidikan dengan peserta umum Internasional', 4),
(2, 'Pendidikan/Pelatihan peserta umum Nasional', 3),
(3, 'Pendidikan/Pelatihan dalam Perusahaan', 2),
(4, 'Pendidikan/Pelatihan wajib/kepegawaian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_6`
--

CREATE TABLE IF NOT EXISTS `1_6` (
  `id_1_6` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_6`),
  KEY `fk_reference_27` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_6`
--

INSERT INTO `1_6` (`id_1_6`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_6_detail`
--

CREATE TABLE IF NOT EXISTS `1_6_detail` (
  `id_1_6_detail` varchar(14) NOT NULL,
  `id_1_6` varchar(12) DEFAULT NULL,
  `nama_program` varchar(250) DEFAULT NULL,
  `tgl` varchar(25) DEFAULT NULL,
  `tempat` varchar(250) DEFAULT NULL,
  `penyelenggara` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_1_6_detail`),
  KEY `fk_reference_26` (`id_1_6`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_6_detail`
--

INSERT INTO `1_6_detail` (`id_1_6_detail`, `id_1_6`, `nama_program`, `tgl`, `tempat`, `penyelenggara`) VALUES
('2015-000010101', '2015-0000101', '435454', '1973', 'etert', 'retret');

-- --------------------------------------------------------

--
-- Table structure for table `1_6_kompetensi`
--

CREATE TABLE IF NOT EXISTS `1_6_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_1_6_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_25` (`id_1_6_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_6_kompetensi`
--

INSERT INTO `1_6_kompetensi` (`id_kompetensi`, `id_1_6_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.4.2.1 Melakukan tugas perencanaan dan pemantauan proyek.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_6_p`
--

CREATE TABLE IF NOT EXISTS `1_6_p` (
  `id_1_6_p` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_6_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_6_p`
--

INSERT INTO `1_6_p` (`id_1_6_p`, `peran`, `nilai_p`) VALUES
(1, 'Pendidikan/Pelatihan Manajemen & Non Teknik > 1 bulan', 4),
(2, 'Pendidikan/Pelatihan Manajemen & Non Teknik 1 - 4 minggu', 3),
(3, 'Pendidikan/Pelatihan Manajemen & Non Teknik 1 - 5 hari kerja', 2),
(4, 'Pendidikan/Pelatihan Manajemen & Non Teknik < 1 hari kerja,', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_6_pqr`
--

CREATE TABLE IF NOT EXISTS `1_6_pqr` (
  `id_1_6_detail` varchar(14) NOT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_1_6_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_6_pqr`
--

INSERT INTO `1_6_pqr` (`id_1_6_detail`, `peran`, `nilai_p`, `jenis`, `nilai_q`, `cakupan`, `nilai_r`, `peran_penilai`, `nilai_p_penilai`, `jenis_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Pendidikan/Pelatihan Manajemen & Non Teknik > 1 bulan', 4, 'Pendidikan/Pelatihan dengan sertifikat Kehadiran', 2, 'Pendidikan/Pelatihan wajib/kepegawaian', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_6_q`
--

CREATE TABLE IF NOT EXISTS `1_6_q` (
  `id_1_6_q` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_6_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_6_q`
--

INSERT INTO `1_6_q` (`id_1_6_q`, `jenis`, `nilai_q`) VALUES
(1, 'Pendidikan/Pelatihan dengan Sertifikat Kelulusan', 4),
(2, 'Pendidikan/Pelatihan dengan pembuatan makalah, penyelesaian studi kasus dan tugas-tugas', 3),
(3, 'Pendidikan/Pelatihan dengan sertifikat Kehadiran', 2),
(4, 'Pendidikan/Peelatihan jarak jauh (distance learning)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `1_6_r`
--

CREATE TABLE IF NOT EXISTS `1_6_r` (
  `id_1_6_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_1_6_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `1_6_r`
--

INSERT INTO `1_6_r` (`id_1_6_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pelatihan/Pendidikan dengan peserta umum Internasional', 4),
(2, 'Pendidikan/Pelatihan peserta umum Nasional', 3),
(3, 'Pendidikan/Pelatihan dalam Perusahaan', 2),
(4, 'Pendidikan/Pelatihan wajib/kepegawaian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_1`
--

CREATE TABLE IF NOT EXISTS `2_1` (
  `id_2_1` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_1`),
  KEY `fk_reference_31` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_1`
--

INSERT INTO `2_1` (`id_2_1`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 32, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2_1_detail`
--

CREATE TABLE IF NOT EXISTS `2_1_detail` (
  `id_2_1_detail` varchar(14) NOT NULL,
  `id_2_1` varchar(12) DEFAULT NULL,
  `nama_referensi` varchar(250) DEFAULT NULL,
  `jabatan` varchar(250) DEFAULT NULL,
  `konfirmasi` text,
  PRIMARY KEY (`id_2_1_detail`),
  KEY `fk_reference_30` (`id_2_1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_1_detail`
--

INSERT INTO `2_1_detail` (`id_2_1_detail`, `id_2_1`, `nama_referensi`, `jabatan`, `konfirmasi`) VALUES
('2015-000010101', '2015-0000101', 'et43te', 'tertret', 'reterter');

-- --------------------------------------------------------

--
-- Table structure for table `2_1_kompetensi`
--

CREATE TABLE IF NOT EXISTS `2_1_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_2_1_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_2_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_1_kompetensi`
--

INSERT INTO `2_1_kompetensi` (`id_kompetensi`, `id_2_1_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.1.1.1 Kesadaran tanggungjawab kecendekiaan dan profesi', 1),
('2015-00001010102', '2015-000010101', 'W.1.1.3 Berpedoman konstitusi dan perundang-undangan ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_1_p`
--

CREATE TABLE IF NOT EXISTS `2_1_p` (
  `id_2_1_p` int(11) NOT NULL AUTO_INCREMENT,
  `konsistensi` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_1_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `2_1_p`
--

INSERT INTO `2_1_p` (`id_2_1_p`, `konsistensi`, `nilai_p`) VALUES
(1, 'Tindakan dan Pandangan tentang Kode Etik dan Etika Profesi dilakukan konsisten dan terus menerus', 4),
(2, 'Tindakan dan Pandangan tentang Kode Etik dan Etika Profesi dilakukan sering', 3),
(3, 'Tindakan dan Pandangan tentang Kode Etik dan Etika Profesi dilakukan beberapa kali', 2),
(4, 'Tindakan dan Pandangan tentang Kode Etik dan Etika Profesi dilakukan jarang atau sesekali', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_1_pqr`
--

CREATE TABLE IF NOT EXISTS `2_1_pqr` (
  `id_2_1_detail` varchar(14) NOT NULL,
  `konsistensi` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `referensi` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `konsistensi_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `referensi_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_2_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_1_pqr`
--

INSERT INTO `2_1_pqr` (`id_2_1_detail`, `konsistensi`, `nilai_p`, `peran`, `nilai_q`, `referensi`, `nilai_r`, `konsistensi_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `referensi_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Tindakan dan Pandangan tentang Kode Etik dan Etika Profesi dilakukan konsisten dan terus menerus', 4, 'Bahwa Pemohon yelah beberapa kali membuktikan perilaku dan tindakan dalam menerapkan, sosialisasi pelaksanaan Kode Etik Insinyur dan Etika Profesi', 2, 'Referensi adalah Pimpinan Perusahaan atau Bagian Pengawasan Perusahaan yang terkait penegakan Kode Etik dan Etika Profesi', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2_1_q`
--

CREATE TABLE IF NOT EXISTS `2_1_q` (
  `id_2_1_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_1_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `2_1_q`
--

INSERT INTO `2_1_q` (`id_2_1_q`, `peran`, `nilai_q`) VALUES
(1, 'Bahwa Pemohon membuktikan perilaku dan tindakandalam mencegah, menentang dan mengungkap pelanggaran Kode Etik Insinyur dan Etika Profesi', 4),
(2, 'Bahwa Pemohon membuktikan perilaku dan tindakan dalam menerapkan, sosialisasi pelaksanaan Kode Etik Insinyur dan Etika Profesi', 3),
(3, 'Bahwa Pemohon yelah beberapa kali membuktikan perilaku dan tindakan dalam menerapkan, sosialisasi pelaksanaan Kode Etik Insinyur dan Etika Profesi', 2),
(4, 'Bahwa Pemohon mempunyai pemahaman yang memadai dalam pengertian Kode Etik Insinyur dan Etika Profesi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_1_r`
--

CREATE TABLE IF NOT EXISTS `2_1_r` (
  `id_2_1_r` int(11) NOT NULL AUTO_INCREMENT,
  `referensi` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_1_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `2_1_r`
--

INSERT INTO `2_1_r` (`id_2_1_r`, `referensi`, `nilai_r`) VALUES
(1, 'Referensi adalah Tokoh Nasional atau Lembaga Independen yang terkait penegakan Kode Etik dan Etika Profesi', 4),
(2, 'Referensi adalah Pengurus Inti PII atau Majelis Penilai yang terkait penegakan Kode Etik dan Etika Profesi', 3),
(3, 'Referensi adalah Pimpinan Perusahaan atau Bagian Pengawasan Perusahaan yang terkait penegakan Kode Etik dan Etika Profesi', 2),
(4, 'Referensi adalah Atasan, Rekan Sekerja atau Bawahan Pemohon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_2`
--

CREATE TABLE IF NOT EXISTS `2_2` (
  `id_2_2` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_2`),
  KEY `fk_reference_33` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_2`
--

INSERT INTO `2_2` (`id_2_2`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 32, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2_2_detail`
--

CREATE TABLE IF NOT EXISTS `2_2_detail` (
  `id_2_2_detail` varchar(14) NOT NULL,
  `id_2_2` varchar(12) DEFAULT NULL,
  `pendapat` text,
  `tgl` varchar(25) DEFAULT NULL,
  `program` text,
  PRIMARY KEY (`id_2_2_detail`),
  KEY `fk_reference_30` (`id_2_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_2_detail`
--

INSERT INTO `2_2_detail` (`id_2_2_detail`, `id_2_2`, `pendapat`, `tgl`, `program`) VALUES
('2015-000010101', '2015-0000101', 'erterterter', '1972', 'ertret');

-- --------------------------------------------------------

--
-- Table structure for table `2_2_kompetensi`
--

CREATE TABLE IF NOT EXISTS `2_2_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_2_2_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_2_2_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_2_kompetensi`
--

INSERT INTO `2_2_kompetensi` (`id_kompetensi`, `id_2_2_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.1.1.4 Kesetiakawanan nasional dan kepedulian sosial ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_2_p`
--

CREATE TABLE IF NOT EXISTS `2_2_p` (
  `id_2_2_p` int(11) NOT NULL AUTO_INCREMENT,
  `akibat` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_2_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `2_2_p`
--

INSERT INTO `2_2_p` (`id_2_2_p`, `akibat`, `nilai_p`) VALUES
(1, 'Kasus pelanggaran Kode Etik/Etika Profesi yang mengakibatkan kehilangan nyawa, kerugian besar kepentingan umum dan harta benda, kerusakan berat lingkungan dan ditangani Penegak Hukum', 4),
(2, 'Kasus pelanggaran Kode Etik/Etika Profesi yang mengakibatkan kerugian kepentingan umum dan harta benda, kerusakan  lingkungan dan ditangani Dewan Kehormatan Profesi', 3),
(3, 'Kasus pelanggaran Kode Etik/Etika Profesi yang mengakibatkan kerugian Perusahaan/Lembaga dan ditangani oleh Audit Eksternal/Publik', 2),
(4, 'Kasus pelanggaran Kode Etik/Etika Profesi yang mengakibatkan kerugian Perusahaan/Lembaga dan ditangani oleh Audit Internal/Pimpinan Perusahaan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_2_pqr`
--

CREATE TABLE IF NOT EXISTS `2_2_pqr` (
  `id_2_2_detail` varchar(14) NOT NULL,
  `akibat` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `akibat_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_2_2_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_2_pqr`
--

INSERT INTO `2_2_pqr` (`id_2_2_detail`, `akibat`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `akibat_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Kasus pelanggaran Kode Etik/Etika Profesi yang mengakibatkan kehilangan nyawa, kerugian besar kepentingan umum dan harta benda, kerusakan berat lingkungan dan ditangani Penegak Hukum', 4, 'Tindakan dalam mengungkap, membongkar dan melaporkan secara hukum pelanggaran Kode Etik/Etika Profesi', 4, 'Kasus Kode Etik/Etika Profesi dalam Perusahaan', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2_2_q`
--

CREATE TABLE IF NOT EXISTS `2_2_q` (
  `id_2_2_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_2_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `2_2_q`
--

INSERT INTO `2_2_q` (`id_2_2_q`, `peran`, `nilai_q`) VALUES
(1, 'Tindakan dalam mengungkap, membongkar dan melaporkan secara hukum pelanggaran Kode Etik/Etika Profesi', 4),
(2, 'Tindakan menolak untuk melakukan pelanggaran Kode Etik/Etika Profesi', 3),
(3, 'Tindakan dalam mengingatkan potensi pelanggaran Kode Etik/Etika Profesi', 2),
(4, 'Pandangan, pendapat mengenai suatu kasus pelanggaran Kode Etik/Etika Profesi atau pertentangan kepentingan secara umum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `2_2_r`
--

CREATE TABLE IF NOT EXISTS `2_2_r` (
  `id_2_2_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_2_2_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `2_2_r`
--

INSERT INTO `2_2_r` (`id_2_2_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Kasus Kode Etik/Etika Profesi tingkat Internasional', 4),
(2, 'Kasus Kode Etik/Etika Profesi tingkat Nasional', 3),
(3, 'Kasus Kode Etik/Etika Profesi dalam Perusahaan', 2),
(4, 'Kasus etika bisnis, pertentangan kepentingan umum dan KKN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_1`
--

CREATE TABLE IF NOT EXISTS `3_1` (
  `id_3_1` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_1`),
  KEY `fk_reference_37` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_1`
--

INSERT INTO `3_1` (`id_3_1`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 108, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_1_detail`
--

CREATE TABLE IF NOT EXISTS `3_1_detail` (
  `id_3_1_detail` varchar(14) NOT NULL,
  `id_3_1` varchar(12) DEFAULT NULL,
  `pengalaman` text,
  `sejak` varchar(25) DEFAULT NULL,
  `sampai` varchar(25) DEFAULT NULL,
  `jabatan` text,
  `nama_proyek` text,
  PRIMARY KEY (`id_3_1_detail`),
  KEY `fk_reference_30` (`id_3_1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_1_detail`
--

INSERT INTO `3_1_detail` (`id_3_1_detail`, `id_3_1`, `pengalaman`, `sejak`, `sampai`, `jabatan`, `nama_proyek`) VALUES
('2015-000010101', '2015-0000101', 'etertret', '1972', '1956', 'reter', 'ertretr');

-- --------------------------------------------------------

--
-- Table structure for table `3_1_kompetensi`
--

CREATE TABLE IF NOT EXISTS `3_1_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_3_1_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_3_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_1_kompetensi`
--

INSERT INTO `3_1_kompetensi` (`id_kompetensi`, `id_3_1_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.2.1.3 Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1),
('2015-00001010102', '2015-000010101', 'W.2.1.5 Memperluas pengetahuan dan memupuk kerjasama antar kejuruan', 1),
('2015-00001010103', '2015-000010101', 'W.2.2.1 Menyadari keterbatasan kepakaran dan pengetahuan dirinya ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_1_p`
--

CREATE TABLE IF NOT EXISTS `3_1_p` (
  `id_3_1_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_1_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_1_p`
--

INSERT INTO `3_1_p` (`id_3_1_p`, `jenis`, `nilai_p`) VALUES
(1, 'Diatas Rp. 5000 Milyar, Pembangunan Fasilitas di Lokasi Baru (Greenfield/Grassroot), Berdampak Besar pada Ekonomi Nasional & Global', 4),
(2, 'Rp. 500 - 5000 Milyar, Perluasan Fasilitas di Lokasi Sekarang (Expansion/Brownfield), Berdampak Besar pada Ekonomi Nasional  ', 3),
(3, 'Rp. 50 - 500 Milyar, Modifikasi Besar. Debottlenecking, Revamping, Berdampak Besar pada Ekonomi Perusahaan', 2),
(4, 'Dibawah Rp. 50 Milyar, Modifikasi Kecil, Proyek-proyek Operasional, Proyek Pemeliharaan, Pemecahan Masalah Kinerja Fasilitas Sekarang, Berdampak pada Efisiensi Perusahaan dan Operabilitas Fasilitas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_1_pqr`
--

CREATE TABLE IF NOT EXISTS `3_1_pqr` (
  `id_3_1_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_3_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_1_pqr`
--

INSERT INTO `3_1_pqr` (`id_3_1_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Diatas Rp. 5000 Milyar, Pembangunan Fasilitas di Lokasi Baru (Greenfield/Grassroot), Berdampak Besar pada Ekonomi Nasional & Global', 4, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_1_q`
--

CREATE TABLE IF NOT EXISTS `3_1_q` (
  `id_3_1_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_1_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_1_q`
--

INSERT INTO `3_1_q` (`id_3_1_q`, `peran`, `nilai_q`) VALUES
(1, 'Pembuat Kebijakan, Pengambil Keputusan Strategis, Pengambil Keputusan Bisnis, Penanggungjawab Hukum & Komersial (Eksternal), Wewenang Membuat Pengecualian', 4),
(2, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3),
(3, 'Pelaksana Pekerjaan, Bekerja Mandiri, Mahir di Bidang yg Dikerjakannya, Tempat Bertanya Para Pemula, Penanggungjawab Perhitungan Teknis dan Penerapan Data', 2),
(4, 'Pencari Data, Membantu Penyiapan Materi, Melakukan Perhitungan Sederhana, Penanggungjawab Kebenaran Data', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_1_r`
--

CREATE TABLE IF NOT EXISTS `3_1_r` (
  `id_3_1_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_1_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_1_r`
--

INSERT INTO `3_1_r` (`id_3_1_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4),
(2, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3),
(3, 'Pekerjaan Melibatkan atau Diperuntukkan bagi Pihak Lain dalam Perusahaan atau Suatu Lembaga, Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, Pekerjaan yang Melibatkan 1 - 3 Profesi Non Keinsinyuran, Wewenang Keuangan Pemohon Rp 5', 2),
(4, 'Pekerjaan untuk Kebutuhan Sendiri atau untuk Bagian Sendiri, Pekerjaan yang Melibatkan 1 -3 Profesi Keinsinyuran dalam Satu Perusahaan/Lembaga, Wewenang Keuangan Pemohon Dibawah Rp. 5 juta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_2`
--

CREATE TABLE IF NOT EXISTS `3_2` (
  `id_3_2` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_2`),
  KEY `fk_reference_41` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_2`
--

INSERT INTO `3_2` (`id_3_2`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 24, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_2_detail`
--

CREATE TABLE IF NOT EXISTS `3_2_detail` (
  `id_3_2_detail` varchar(14) NOT NULL,
  `id_3_2` varchar(12) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `perguruan` varchar(250) DEFAULT NULL,
  `sejak` varchar(25) DEFAULT NULL,
  `sampai` varchar(25) DEFAULT NULL,
  `jumlah_jam` varchar(250) DEFAULT NULL,
  `jumlah_selesai` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_3_2_detail`),
  KEY `fk_reference_30` (`id_3_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_2_detail`
--

INSERT INTO `3_2_detail` (`id_3_2_detail`, `id_3_2`, `nama`, `perguruan`, `sejak`, `sampai`, `jumlah_jam`, `jumlah_selesai`) VALUES
('2015-000010101', '2015-0000101', 'eterter', 'tretret', '1972', '2018', 'ertert', 'ertrettret');

-- --------------------------------------------------------

--
-- Table structure for table `3_2_kompetensi`
--

CREATE TABLE IF NOT EXISTS `3_2_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_3_2_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_3_2_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_2_kompetensi`
--

INSERT INTO `3_2_kompetensi` (`id_kompetensi`, `id_3_2_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'P.5.2.2 Mengembangkan rencana pengembangan pengalaman kerja.', 1),
('2015-00001010102', '2015-000010101', 'P.5.2.4 Melaksanakan secara efektif kegiatan pengajaran, pengembangan, dan belajar dalam bentuk yang paling tepat untuk sesuatu keadaan.', 1),
('2015-00001010103', '2015-000010101', 'P.5.2.5 Menggunakan secara efektif teknologi pendidikan dan pelatihan untuk mendukung pengajaran, pengembangan dan proses belajar dalam program pendidikan atau pelatihan keinsinyuran. ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_2_p`
--

CREATE TABLE IF NOT EXISTS `3_2_p` (
  `id_3_2_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_2_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_2_p`
--

INSERT INTO `3_2_p` (`id_3_2_p`, `jenis`, `nilai_p`) VALUES
(1, 'Bahan yang Diajarkan merupakan Konsep yang Baru, Referensi Bahan Mengajar Amat Terbatas. Konsep Baru yang Diajarkan Mempunyai Dampak Besar bagi Kemanusiaan/Ekonomi. Pengajar yang Mampu Sedikit Sekali.', 4),
(2, 'Bahan yang Diajarkan merupakan Konsep yang Belum Terlalu Umum, Referensi Bahan Mengajar Terbatas. Konsep Baru yang Diajarkan Mempunyai Dampak Cukup Besar bagi Kemanusiaan/Ekonomi. Pengajar yang Mampu Terbatas.', 3),
(3, 'Bahan yang Diajarkan merupakan Konsep Sudah Umum, Referensi Bahan Mengajar Banyak. Konsep yang Diajarkan Tidak Lagi Berdampak Besar bagi Kemanusiaan/Ekonomi. Pengajar yang Mampu Cukup Banyak.', 2),
(4, 'Bahan yang Diajarkan merupakan Bahan Dasar yang Baku, Referensi Bahan Mengajar Banyak. Merupakan Bahan Umum yang Diajarkan oleh Banyak Pihak Dimanapun Juga. Pengajar yang Mampu  Banyak.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_2_pqr`
--

CREATE TABLE IF NOT EXISTS `3_2_pqr` (
  `id_3_2_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_3_2_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_2_pqr`
--

INSERT INTO `3_2_pqr` (`id_3_2_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Bahan yang Diajarkan merupakan Konsep Sudah Umum, Referensi Bahan Mengajar Banyak. Konsep yang Diajarkan Tidak Lagi Berdampak Besar bagi Kemanusiaan/Ekonomi. Pengajar yang Mampu Cukup Banyak.', 2, 'Pengajar Utama namun Bukan Penulis Utama Bahan Pengajaran, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 2, 'Mengajar/membimbing Program S-1, Dosen Tamu Lingkup Terbatas (1 - 2) Nasional, Mengajar Pelatihan Keinsinyuran Lingkup Terbatas (1 - 2) Nasional', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_2_q`
--

CREATE TABLE IF NOT EXISTS `3_2_q` (
  `id_3_2_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_2_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_2_q`
--

INSERT INTO `3_2_q` (`id_3_2_q`, `peran`, `nilai_q`) VALUES
(1, 'Pengajar Utama sekaligus Pencetus/Penggagas/Penemu Konsep, Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan, Penulis Utama Bahan Pengajaran', 4),
(2, 'Pengajar Utama dan Penulis Utama Bahan Pengajaran, namun Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 3),
(3, 'Pengajar Utama namun Bukan Penulis Utama Bahan Pengajaran, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 2),
(4, 'Pengajar Pengganti atau Sebagian Materi, Bukan Penulis Utama Bahan Pengajaran, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_2_r`
--

CREATE TABLE IF NOT EXISTS `3_2_r` (
  `id_3_2_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_2_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_2_r`
--

INSERT INTO `3_2_r` (`id_3_2_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Mengajar/membimbing Program S-3, Dosen Tamu Internasional, Pengajar Pelatihan Keinsinyuran untuk Umum Internasional', 4),
(2, 'Mengajar/membimbing Program S-2, Dosen Tamu Lingkup Nasional, Mengajar Pelatihan Keinsinyuran Lingkup Nasional', 3),
(3, 'Mengajar/membimbing Program S-1, Dosen Tamu Lingkup Terbatas (1 - 2) Nasional, Mengajar Pelatihan Keinsinyuran Lingkup Terbatas (1 - 2) Nasional', 2),
(4, 'Asisten Pengajar Program S-1, Asisten Dosen Tamu Lingkup Nasional, Asisten Pengajar Pelatihan Keinsinyuran Lingkup Nasional', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_3`
--

CREATE TABLE IF NOT EXISTS `3_3` (
  `id_3_3` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_3`),
  KEY `fk_reference_45` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_3`
--

INSERT INTO `3_3` (`id_3_3`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 72, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_3_detail`
--

CREATE TABLE IF NOT EXISTS `3_3_detail` (
  `id_3_3_detail` varchar(14) NOT NULL,
  `id_3_3` varchar(12) DEFAULT NULL,
  `kegiatan` text,
  `nama` varchar(250) DEFAULT NULL,
  `penyandang_dana` varchar(25) DEFAULT NULL,
  `perguruan` varchar(250) DEFAULT NULL,
  `sampai` varchar(25) DEFAULT NULL,
  `sejak` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_3_3_detail`),
  KEY `fk_reference_30` (`id_3_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_3_detail`
--

INSERT INTO `3_3_detail` (`id_3_3_detail`, `id_3_3`, `kegiatan`, `nama`, `penyandang_dana`, `perguruan`, `sampai`, `sejak`) VALUES
('2015-000010101', '2015-0000101', 'eeeeeeeertret', 'retretre', 'tretrtrt', 'ertretret', '1972', '1960');

-- --------------------------------------------------------

--
-- Table structure for table `3_3_kompetensi`
--

CREATE TABLE IF NOT EXISTS `3_3_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_3_3_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_3_3_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_3_kompetensi`
--

INSERT INTO `3_3_kompetensi` (`id_kompetensi`, `id_3_3_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'P.6.1.2 Melakukan kajian pustaka.', 1),
('2015-00001010102', '2015-000010101', 'P.6.1.3 Melakukan penelitian dasar dan atau terapan.', 1),
('2015-00001010103', '2015-000010101', 'P.6.1.5 Menemu-kenali dan menyampaikan hasil penelitian.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_3_p`
--

CREATE TABLE IF NOT EXISTS `3_3_p` (
  `id_3_3_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_3_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_3_p`
--

INSERT INTO `3_3_p` (`id_3_3_p`, `jenis`, `nilai_p`) VALUES
(1, 'Dari suatu Konsep/Sistem atau Produk yang Baru, Penerapan untuk Kegunaan yang Baru, dan berdampak Besar bagi Kemanusiaan/Ekonomian', 4),
(2, 'Dari suatu Konsep/Sistem atau Produk Modifikasi, Perluasan Penerapan untuk Kegunaan yang Mirip atau Sama, dan berdampak Cukup Besar bagi Kemanusiaan/Ekonomian', 3),
(3, 'Dari suatu Konsep/Sistem atau Produk yang Sama, untuk Kegunaan yang Sama, namun dengan kondisi teknis dan Lingkungan yang Berbeda, Pasar atau Segmen Pengguna yang Berbeda. Merupakan Perluasan Komersialisasi.', 2),
(4, 'Dari suatu Konsep/Sistem atau Produk Baru atau Modifikasi namun belum masuk pada Tahap Komersialisasi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_3_pqr`
--

CREATE TABLE IF NOT EXISTS `3_3_pqr` (
  `id_3_3_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_3_3_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_3_pqr`
--

INSERT INTO `3_3_pqr` (`id_3_3_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Dari suatu Konsep/Sistem atau Produk yang Sama, untuk Kegunaan yang Sama, namun dengan kondisi teknis dan Lingkungan yang Berbeda, Pasar atau Segmen Pengguna yang Berbeda. Merupakan Perluasan Komersialisasi.', 2, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_3_q`
--

CREATE TABLE IF NOT EXISTS `3_3_q` (
  `id_3_3_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_3_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_3_q`
--

INSERT INTO `3_3_q` (`id_3_3_q`, `peran`, `nilai_q`) VALUES
(1, 'Pembuat Kebijakan, Pengambil Keputusan Strategis, Pengambil Keputusan Bisnis, Penanggungjawab Hukum & Komersial (Eksternal), Wewenang Membuat Pengecualian', 4),
(2, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3),
(3, 'Pelaksana Pekerjaan, Bekerja Mandiri, Mahir di Bidang yg Dikerjakannya, Tempat Bertanya Para Pemula, Penanggungjawab Perhitungan Teknis dan Penerapan Data', 2),
(4, 'Pencari Data, Membantu Penyiapan Materi, Melakukan Perhitungan Sederhana, Penanggungjawab Kebenaran Data', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_3_r`
--

CREATE TABLE IF NOT EXISTS `3_3_r` (
  `id_3_3_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_3_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_3_r`
--

INSERT INTO `3_3_r` (`id_3_3_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4),
(2, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3),
(3, 'Pekerjaan Melibatkan atau Diperuntukkan bagi Pihak Lain dalam Perusahaan atau Suatu Lembaga, Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, Pekerjaan yang Melibatkan 1 - 3 Profesi Non Keinsinyuran, Wewenang Keuangan Pemohon Rp 5', 2),
(4, 'Pekerjaan untuk Kebutuhan Sendiri atau untuk Bagian Sendiri, Pekerjaan yang Melibatkan 1 -3 Profesi Keinsinyuran dalam Satu Perusahaan/Lembaga, Wewenang Keuangan Pemohon Dibawah Rp. 5 juta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_4`
--

CREATE TABLE IF NOT EXISTS `3_4` (
  `id_3_4` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_4`),
  KEY `fk_reference_49` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_4`
--

INSERT INTO `3_4` (`id_3_4`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 128, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_4_detail`
--

CREATE TABLE IF NOT EXISTS `3_4_detail` (
  `id_3_4_detail` varchar(14) NOT NULL,
  `id_3_4` varchar(12) DEFAULT NULL,
  `kegiatan` text,
  `nama` varchar(250) DEFAULT NULL,
  `perguruan` varchar(250) DEFAULT NULL,
  `sejak` varchar(25) DEFAULT NULL,
  `sampai` varchar(25) DEFAULT NULL,
  `client` varchar(25) DEFAULT NULL,
  `pemilik` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_3_4_detail`),
  KEY `fk_reference_30` (`id_3_4`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_4_detail`
--

INSERT INTO `3_4_detail` (`id_3_4_detail`, `id_3_4`, `kegiatan`, `nama`, `perguruan`, `sejak`, `sampai`, `client`, `pemilik`) VALUES
('2015-000010101', '2015-0000101', 'ertretret', 'retret', 'retret', '1970', '1973', 'etert', 'ertret');

-- --------------------------------------------------------

--
-- Table structure for table `3_4_kompetensi`
--

CREATE TABLE IF NOT EXISTS `3_4_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_3_4_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_3_4_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_4_kompetensi`
--

INSERT INTO `3_4_kompetensi` (`id_kompetensi`, `id_3_4_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'P.7.1.3 Menyiapkan pedoman perancangan (design guidelines) perekayasaan  berdasarkan uraian kebutuhan pemberi tugas.', 1),
('2015-00001010102', '2015-000010101', 'P.7.1.4 Menyiapkan rancangan pendahuluan, pengembangannya dan rancangan terinci (detailed design) perekayasaan, agar pemilik proyek dapat melakukan pelelangan. ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_4_p`
--

CREATE TABLE IF NOT EXISTS `3_4_p` (
  `id_3_4_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `id_3_4_p_parent` int(11) NOT NULL,
  PRIMARY KEY (`id_3_4_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `3_4_p`
--

INSERT INTO `3_4_p` (`id_3_4_p`, `jenis`, `nilai_p`, `id_3_4_p_parent`) VALUES
(1, 'Nilai aset Fasilitas Manufaktur dan Produksi Diatas Rp. 5000 Milyar, Pekerja Langsung dan Alih Daya Diatas 5000 orang,  Luasan Fasilitas Diatas 2000 Hektar', 4, 1),
(2, 'Nilai aset Fasilitas Manufaktur dan Produksi  Rp. 500 -  5000 Milyar, Pekerja Langsung dan Alih Daya  500 - 5000 orang,  Luasan Fasilitas 200 - 2000 Hektar', 3, 1),
(3, 'Nilai aset Fasilitas Manufaktur dan Produksi  Rp. 50 -  500 Milyar, Pekerja Langsung dan Alih Daya  50 - 500 orang,  Luasan Fasilitas 20 - 200 Hektar', 2, 1),
(4, 'Nilai aset Fasilitas Manufaktur dan Produksi Dibawah Rp. 50 Milyar, Pekerja Langsung dan Alih Daya  50 orang,  Luasan Fasilitas 20 Hektar', 1, 1),
(5, 'Nilai Aset Fasilitas yang akan Dibangun Diatas Rp. 5000 Milyar, Pembangunan Fasilitas di Lokasi Baru (Greenfield/Grassroot), Berdampak Besar pada Ekonomi Nasional & Global', 4, 2),
(6, 'Nilai Aset Fasilitas yang akan Dibangun Rp. 500 - 5000 Milyar, Perluasan Fasilitas di Lokasi Sekarang (Expansion/Brownfield), Berdampak Besar pada Ekonomi Nasional  ', 3, 2),
(7, 'Nilai Aset Fasilitas yang akan Dibangun Rp. 50 - 500 Milyar, Modifikasi Besar. Debottlenecking, Revamping, Berdampak Besar pada Ekonomi Perusahaan', 2, 2),
(8, 'Nilai Aset Fasilitas yang akan Dibangun Dibawah Rp. 50 Milyar, Modifikasi Kecil, Proyek-proyek Operasional, Proyek Pemeliharaan, Pemecahan Masalah Kinerja Fasilitas Sekarang, Berdampak pada Efisiensi Perusahaan dan Operabilitas Fasilitas', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `3_4_pqr`
--

CREATE TABLE IF NOT EXISTS `3_4_pqr` (
  `id_3_4_detail` varchar(14) NOT NULL,
  `id_jenis_parent` int(11) DEFAULT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `id_jenis_parent_penilai` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_3_4_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_4_pqr`
--

INSERT INTO `3_4_pqr` (`id_3_4_detail`, `id_jenis_parent`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `id_jenis_parent_penilai`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 1, 'Nilai aset Fasilitas Manufaktur dan Produksi Diatas Rp. 5000 Milyar, Pekerja Langsung dan Alih Daya Diatas 5000 orang,  Luasan Fasilitas Diatas 2000 Hektar', 4, 'Pembuat Kebijakan, Pengambil Keputusan Strategis, Pengambil Keputusan Bisnis, Penanggungjawab Hukum & Komersial (Eksternal), Wewenang Membuat Pengecualian', 4, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_4_p_parent`
--

CREATE TABLE IF NOT EXISTS `3_4_p_parent` (
  `id_3_4_p_parent` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(250) NOT NULL,
  PRIMARY KEY (`id_3_4_p_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `3_4_p_parent`
--

INSERT INTO `3_4_p_parent` (`id_3_4_p_parent`, `parent`) VALUES
(1, 'Pengalaman Dalam Pekerjaan Manufaktur dan Produksi'),
(2, 'Pengalaman Dalam Konsultasi Perekayasaan dan/atau Konstruksi/Instalasi');

-- --------------------------------------------------------

--
-- Table structure for table `3_4_q`
--

CREATE TABLE IF NOT EXISTS `3_4_q` (
  `id_3_4_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_4_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_4_q`
--

INSERT INTO `3_4_q` (`id_3_4_q`, `peran`, `nilai_q`) VALUES
(1, 'Pembuat Kebijakan, Pengambil Keputusan Strategis, Pengambil Keputusan Bisnis, Penanggungjawab Hukum & Komersial (Eksternal), Wewenang Membuat Pengecualian', 4),
(2, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3),
(3, 'Pelaksana Pekerjaan, Bekerja Mandiri, Mahir di Bidang yg Dikerjakannya, Tempat Bertanya Para Pemula, Penanggungjawab Perhitungan Teknis dan Penerapan Data', 2),
(4, 'Pencari Data, Membantu Penyiapan Materi, Melakukan Perhitungan Sederhana, Penanggungjawab Kebenaran Data', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_4_r`
--

CREATE TABLE IF NOT EXISTS `3_4_r` (
  `id_3_4_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_4_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_4_r`
--

INSERT INTO `3_4_r` (`id_3_4_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4),
(2, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3),
(3, 'Pekerjaan Melibatkan atau Diperuntukkan bagi Pihak Lain dalam Perusahaan atau Suatu Lembaga, Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, Pekerjaan yang Melibatkan 1 - 3 Profesi Non Keinsinyuran, Wewenang Keuangan Pemohon Rp 5', 2),
(4, 'Pekerjaan untuk Kebutuhan Sendiri atau untuk Bagian Sendiri, Pekerjaan yang Melibatkan 1 -3 Profesi Keinsinyuran dalam Satu Perusahaan/Lembaga, Wewenang Keuangan Pemohon Dibawah Rp. 5 juta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_5`
--

CREATE TABLE IF NOT EXISTS `3_5` (
  `id_3_5` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_5`),
  KEY `fk_reference_56` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_5`
--

INSERT INTO `3_5` (`id_3_5`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_5_detail`
--

CREATE TABLE IF NOT EXISTS `3_5_detail` (
  `id_3_5_detail` varchar(14) NOT NULL,
  `id_3_5` varchar(12) DEFAULT NULL,
  `kegiatan` text,
  `nama` varchar(250) DEFAULT NULL,
  `perguruan` varchar(250) DEFAULT NULL,
  `sejak` varchar(25) DEFAULT NULL,
  `sampai` varchar(25) DEFAULT NULL,
  `client` varchar(25) DEFAULT NULL,
  `pemilik` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_3_5_detail`),
  KEY `fk_reference_30` (`id_3_5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_5_detail`
--

INSERT INTO `3_5_detail` (`id_3_5_detail`, `id_3_5`, `kegiatan`, `nama`, `perguruan`, `sejak`, `sampai`, `client`, `pemilik`) VALUES
('2015-000010101', '2015-0000101', 'ertert', 'ertret', 'ertert', '1972', '1970', 'retre', 'tretret');

-- --------------------------------------------------------

--
-- Table structure for table `3_5_kompetensi`
--

CREATE TABLE IF NOT EXISTS `3_5_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_3_5_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_3_5_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_5_kompetensi`
--

INSERT INTO `3_5_kompetensi` (`id_kompetensi`, `id_3_5_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'P.10.2.1 Mematuhi ketentuan kesehatan dan keselamatan kerja.', 1),
('2015-00001010102', '2015-000010101', 'P.10.2.2 Menemu-kenali dan menentukan kebutuhan pelatihan bagi tenaga kerja teknis di tempat pekerjaan.', 1),
('2015-00001010103', '2015-000010101', 'P.10.2.4 Mengkaji efektifitas program pelatihan di tempat kerja.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_5_p`
--

CREATE TABLE IF NOT EXISTS `3_5_p` (
  `id_3_5_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `id_3_5_p_parent` int(11) NOT NULL,
  PRIMARY KEY (`id_3_5_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `3_5_p`
--

INSERT INTO `3_5_p` (`id_3_5_p`, `jenis`, `nilai_p`, `id_3_5_p_parent`) VALUES
(1, 'SIUP Besar, Badan Usaha perdagangan yang memiliki kekayaan bersih lebih dari Rp. 10 Milyar tidak termasuk tanah dan bangunan tempat usaha.', 4, 1),
(2, 'SIUP Menengah, Badan Usaha perdagangan yang memiliki kekayaan bersih Rp. 500 juta - 10 Milyar tidak termasuk tanah dan bangunan tempat usaha.', 3, 1),
(3, 'SIUP Kecil, Badan Usaha perdagangan yang memiliki kekayaan bersih Rp. 50 - 500 juta tidak termasuk tanah dan bangunan tempat usaha.', 2, 1),
(4, 'SIUP Mikro, Badan Usaha perdagangan yang memiliki kekayaan bersih kurang dari Rp. 50 juta tidak termasuk tanah dan bangunan tempat usaha.', 1, 1),
(5, 'Nilai Aset Fasilitas yang akan Dibangun Diatas Rp. 5000 Milyar, Pembangunan Fasilitas di Lokasi Baru (Greenfield/Grassroot), Berdampak Besar pada Ekonomi Nasional & Global', 4, 2),
(6, 'Nilai Aset Fasilitas yang akan Dibangun Rp. 500 - 5000 Milyar, Perluasan Fasilitas di Lokasi Sekarang (Expansion/Brownfield), Berdampak Besar pada Ekonomi Nasional  ', 3, 2),
(7, 'Nilai Aset Fasilitas yang akan Dibangun Rp. 50 - 500 Milyar, Modifikasi Besar. Debottlenecking, Revamping, Berdampak Besar pada Ekonomi Perusahaan', 2, 2),
(8, 'Nilai Aset Fasilitas yang akan Dibangun Dibawah Rp. 50 Milyar, Modifikasi Kecil, Proyek-proyek Operasional, Proyek Pemeliharaan, Pemecahan Masalah Kinerja Fasilitas Sekarang, Berdampak pada Efisiensi Perusahaan dan Operabilitas Fasilitas', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `3_5_pqr`
--

CREATE TABLE IF NOT EXISTS `3_5_pqr` (
  `id_3_5_detail` varchar(14) NOT NULL,
  `id_jenis_parent` int(11) DEFAULT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `id_jenis_parent_penilai` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` int(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_3_5_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `3_5_pqr`
--

INSERT INTO `3_5_pqr` (`id_3_5_detail`, `id_jenis_parent`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `id_jenis_parent_penilai`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 1, 'SIUP Kecil, Badan Usaha perdagangan yang memiliki kekayaan bersih Rp. 50 - 500 juta tidak termasuk tanah dan bangunan tempat usaha.', 2, 'Nilai Aset Fasilitas yang akan Dibangun Dibawah Rp. 50 Milyar, Modifikasi Kecil, Proyek-proyek Operasional, Proyek Pemeliharaan, Pemecahan Masalah Kinerja Fasilitas Sekarang, Berdampak pada Efisiensi Perusahaan dan Operabilitas Fasilitas', 1, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_5_p_parent`
--

CREATE TABLE IF NOT EXISTS `3_5_p_parent` (
  `id_3_5_p_parent` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(250) NOT NULL,
  PRIMARY KEY (`id_3_5_p_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `3_5_p_parent`
--

INSERT INTO `3_5_p_parent` (`id_3_5_p_parent`, `parent`) VALUES
(1, 'Pengalaman Dalam Manajemen Usaha dan Pemasaran Teknik'),
(2, 'Pengalaman Dalam Manajemen Pembangunan dan Pemeliharaan Aset');

-- --------------------------------------------------------

--
-- Table structure for table `3_5_q`
--

CREATE TABLE IF NOT EXISTS `3_5_q` (
  `id_3_5_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_5_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_5_q`
--

INSERT INTO `3_5_q` (`id_3_5_q`, `peran`, `nilai_q`) VALUES
(1, 'Nilai Aset Fasilitas yang akan Dibangun Diatas Rp. 5000 Milyar, Pembangunan Fasilitas di Lokasi Baru (Greenfield/Grassroot), Berdampak Besar pada Ekonomi Nasional & Global', 4),
(2, 'Nilai Aset Fasilitas yang akan Dibangun Rp. 500 - 5000 Milyar, Perluasan Fasilitas di Lokasi Sekarang (Expansion/Brownfield), Berdampak Besar pada Ekonomi Nasional  ', 3),
(3, 'Nilai Aset Fasilitas yang akan Dibangun Rp. 50 - 500 Milyar, Modifikasi Besar. Debottlenecking, Revamping, Berdampak Besar pada Ekonomi Perusahaan', 2),
(4, 'Nilai Aset Fasilitas yang akan Dibangun Dibawah Rp. 50 Milyar, Modifikasi Kecil, Proyek-proyek Operasional, Proyek Pemeliharaan, Pemecahan Masalah Kinerja Fasilitas Sekarang, Berdampak pada Efisiensi Perusahaan dan Operabilitas Fasilitas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `3_5_r`
--

CREATE TABLE IF NOT EXISTS `3_5_r` (
  `id_3_5_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_3_5_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `3_5_r`
--

INSERT INTO `3_5_r` (`id_3_5_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4),
(2, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3),
(3, 'Pekerjaan Melibatkan atau Diperuntukkan bagi Pihak Lain dalam Perusahaan atau Suatu Lembaga, Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, Pekerjaan yang Melibatkan 1 - 3 Profesi Non Keinsinyuran, Wewenang Keuangan Pemohon Rp 5', 2),
(4, 'Pekerjaan untuk Kebutuhan Sendiri atau untuk Bagian Sendiri, Pekerjaan yang Melibatkan 1 -3 Profesi Keinsinyuran dalam Satu Perusahaan/Lembaga, Wewenang Keuangan Pemohon Dibawah Rp. 5 juta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_1`
--

CREATE TABLE IF NOT EXISTS `4_1` (
  `id_4_1` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_1`),
  KEY `fk_reference_60` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_1`
--

INSERT INTO `4_1` (`id_4_1`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_1_detail`
--

CREATE TABLE IF NOT EXISTS `4_1_detail` (
  `id_4_1_detail` varchar(14) NOT NULL,
  `id_4_1` varchar(12) DEFAULT NULL,
  `judul` text,
  `media` text,
  `halaman` varchar(15) DEFAULT NULL,
  `uraian` text NOT NULL,
  PRIMARY KEY (`id_4_1_detail`),
  KEY `fk_reference_30` (`id_4_1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_1_detail`
--

INSERT INTO `4_1_detail` (`id_4_1_detail`, `id_4_1`, `judul`, `media`, `halaman`, `uraian`) VALUES
('2015-000010101', '2015-0000101', 'rtertre', 'treter', 'rtret', 'tert');

-- --------------------------------------------------------

--
-- Table structure for table `4_1_kompetensi`
--

CREATE TABLE IF NOT EXISTS `4_1_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_4_1_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_4_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_1_kompetensi`
--

INSERT INTO `4_1_kompetensi` (`id_kompetensi`, `id_4_1_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.4.1.4 Melakukan pengembangan diri dalam kepemimpinan dan kerjasama kelompok.', 1),
('2015-00001010102', '2015-000010101', 'W.4.1.5 Melakukan pengembangan diri dalam cara berpikir yang berwawasan luas, analitis dan kreatif.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_1_p`
--

CREATE TABLE IF NOT EXISTS `4_1_p` (
  `id_4_1_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_1_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_1_p`
--

INSERT INTO `4_1_p` (`id_4_1_p`, `jenis`, `nilai_p`) VALUES
(1, 'Karya Tulis merupakan Konsep yang Baru, Belum Pernah Diterapkan Sebelumnya, Referensi Amat Terbatas. Konsep Baru yang Ditulis  Mempunyai Dampak Besar bagi Kemanusiaan/Ekonomi.', 4),
(2, 'Karya Tulis merupakan Konsep yang Belum Terlalu Umum, namun Sudah Diterapkan. Karya Tulis Menjelaskan Penerapan di Tempat Baru, untuk Kegunaan Baru. Referensi Terbatas. Konsep Baru yang Ditulis Mempunyai Dampak Cukup Besar bagi Kemanusiaan/Ekonomi.', 3),
(3, 'Karya Tulis merupakan Konsep Sudah Umum Diterapkan di Banyak Tempat. Karya Tulis Menjelaskan Pengalaman Penerapan dan Problematika Lapangan dan Pemecahannya, Referensi Banyak. Konsep yang Ditulis Tidak Lagi Berdampak Besar bagi Kemanusiaan/Ekonomi.', 2),
(4, 'Karya Tulis merupakan Konsep Dasar yang Baku. Karya Tulis merupakan Penjelasan Penyegaran untuk Pembaca Pemula. Referensi Banyak. Karya Tulis Merupakan Bahan Umum yang Ditulis oleh Banyak Pihak di Banyak Media.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_1_pqr`
--

CREATE TABLE IF NOT EXISTS `4_1_pqr` (
  `id_4_1_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_4_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_1_pqr`
--

INSERT INTO `4_1_pqr` (`id_4_1_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Karya Tulis merupakan Konsep yang Belum Terlalu Umum, namun Sudah Diterapkan. Karya Tulis Menjelaskan Penerapan di Tempat Baru, untuk Kegunaan Baru. Referensi Terbatas. Konsep Baru yang Ditulis Mempunyai Dampak Cukup Besar bagi Kemanusiaan/Ekonomi.', 3, 'Pengajar Tambahan, Menulis Bagian Tertentu Materi Penulisan namun Bukan Penulis Utama Bahan Tulisan, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 2, 'Media Keinsinyuran Nasional Terbatas, Media Komunitas Keinsinyuran, Media Perusahaan, Telah Terbit lebih dari 3 Tahun', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_1_q`
--

CREATE TABLE IF NOT EXISTS `4_1_q` (
  `id_4_1_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_1_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_1_q`
--

INSERT INTO `4_1_q` (`id_4_1_q`, `peran`, `nilai_q`) VALUES
(1, 'Penulis Utama, Menulis Bagian Terbesar Materi Penulisan sekaligus Pencetus/Penggagas/Penemu Konsep, Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Ditulis. Pengarah Alur Penulisan. Pengambil Keputusan Akhir Hasil Penulisan', 4),
(2, 'Penulis Utama, Menulis Bagian Terbesar Materi Penulisan namun Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Ditulis.', 3),
(3, 'Pengajar Tambahan, Menulis Bagian Tertentu Materi Penulisan namun Bukan Penulis Utama Bahan Tulisan, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 2),
(4, 'Membantu Menyediakan Data Penulisan, Perhitungan, Tabel dan Ilustrasi. Bukan Penulis Utama Bahan Pengajaran, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_1_r`
--

CREATE TABLE IF NOT EXISTS `4_1_r` (
  `id_4_1_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_1_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_1_r`
--

INSERT INTO `4_1_r` (`id_4_1_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Media Keinsinyuran Internasional Besar Ternama, Beredar di lebih dari 50 Negara, Telah Terbit lebih dari 20 Tahun', 4),
(2, 'Media Keinsinyuran Internasional Besar, Beredar di lebih dari 20 Negara, Telah Terbit lebih dari 10 Tahun', 3),
(3, 'Media Keinsinyuran Nasional Besar Ternama, Telah Terbit lebih dari 20 Tahun', 2),
(4, 'Media Keinsinyuran Nasional Terbatas, Media Komunitas Keinsinyuran, Media Perusahaan, Telah Terbit lebih dari 3 Tahun', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_2`
--

CREATE TABLE IF NOT EXISTS `4_2` (
  `id_4_2` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_2`),
  KEY `fk_reference_64` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_2`
--

INSERT INTO `4_2` (`id_4_2`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 72, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_2_detail`
--

CREATE TABLE IF NOT EXISTS `4_2_detail` (
  `id_4_2_detail` varchar(14) NOT NULL,
  `id_4_2` varchar(12) DEFAULT NULL,
  `judul` text,
  `tempat` text,
  `halaman` varchar(15) DEFAULT NULL,
  `pemapar` varchar(250) DEFAULT NULL,
  `uraian` text NOT NULL,
  PRIMARY KEY (`id_4_2_detail`),
  KEY `fk_reference_30` (`id_4_2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_2_detail`
--

INSERT INTO `4_2_detail` (`id_4_2_detail`, `id_4_2`, `judul`, `tempat`, `halaman`, `pemapar`, `uraian`) VALUES
('2015-000010101', '2015-0000101', 'erter', 'tretre', 'eter', 'ertret', 'tertert'),
('2015-000010102', '2015-0000101', 'erter', 'tretre', 'eter', 'ertret', 'tertert');

-- --------------------------------------------------------

--
-- Table structure for table `4_2_kompetensi`
--

CREATE TABLE IF NOT EXISTS `4_2_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_4_2_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_4_2_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_2_kompetensi`
--

INSERT INTO `4_2_kompetensi` (`id_kompetensi`, `id_4_2_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.4.1.1 Melakukan pengembangan diri dalam kemampuan di bidang manajemen, termasuk hukum, ekonomi dan sosial.', 1),
('2015-00001010102', '2015-000010101', 'W.4.1.2 Menentukan sasaran bagi diri sendiri dalam  mencapai tujuan kerja.', 1),
('2015-00001010201', '2015-000010102', 'W.4.1.1 Melakukan pengembangan diri dalam kemampuan di bidang manajemen, termasuk hukum, ekonomi dan sosial.', 1),
('2015-00001010202', '2015-000010102', 'W.4.1.2 Menentukan sasaran bagi diri sendiri dalam  mencapai tujuan kerja.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_2_p`
--

CREATE TABLE IF NOT EXISTS `4_2_p` (
  `id_4_2_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_2_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_2_p`
--

INSERT INTO `4_2_p` (`id_4_2_p`, `jenis`, `nilai_p`) VALUES
(1, 'Karya Tulis merupakan Konsep yang Baru, Belum Pernah Diterapkan Sebelumnya, Referensi Amat Terbatas. Konsep Baru yang Ditulis  Mempunyai Dampak Besar bagi Kemanusiaan/Ekonomi.', 4),
(2, 'Karya Tulis merupakan Konsep yang Belum Terlalu Umum, namun Sudah Diterapkan. Karya Tulis Menjelaskan Penerapan di Tempat Baru, untuk Kegunaan Baru. Referensi Terbatas. Konsep Baru yang Ditulis Mempunyai Dampak Cukup Besar bagi Kemanusiaan/Ekonomi.', 3),
(3, 'Karya Tulis merupakan Konsep Sudah Umum Diterapkan di Banyak Tempat. Karya Tulis Menjelaskan Pengalaman Penerapan dan Problematika Lapangan dan Pemecahannya, Referensi Banyak. Konsep yang Ditulis Tidak Lagi Berdampak Besar bagi Kemanusiaan/Ekonomi.', 2),
(4, 'Karya Tulis merupakan Konsep Dasar yang Baku. Karya Tulis merupakan Penjelasan Penyegaran untuk Pembaca Pemula. Referensi Banyak. Karya Tulis Merupakan Bahan Umum yang Ditulis oleh Banyak Pihak di Banyak Media.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_2_pqr`
--

CREATE TABLE IF NOT EXISTS `4_2_pqr` (
  `id_4_2_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_4_2_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_2_pqr`
--

INSERT INTO `4_2_pqr` (`id_4_2_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Karya Tulis merupakan Konsep Sudah Umum Diterapkan di Banyak Tempat. Karya Tulis Menjelaskan Pengalaman Penerapan dan Problematika Lapangan dan Pemecahannya, Referensi Banyak. Konsep yang Ditulis Tidak Lagi Berdampak Besar bagi Kemanusiaan/Ekonomi.', 2, 'Penulis Utama, Menulis Bagian Terbesar Materi Penulisan namun Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Ditulis.', 3, 'Seminar/Lokakarya Internasional dengan Peserta 200 - 1000 orang, dengan jumlah Makalah lebih dari 20 - 100', 3, NULL, NULL, NULL, NULL, NULL, NULL),
('2015-000010102', 'Karya Tulis merupakan Konsep Sudah Umum Diterapkan di Banyak Tempat. Karya Tulis Menjelaskan Pengalaman Penerapan dan Problematika Lapangan dan Pemecahannya, Referensi Banyak. Konsep yang Ditulis Tidak Lagi Berdampak Besar bagi Kemanusiaan/Ekonomi.', 2, 'Penulis Utama, Menulis Bagian Terbesar Materi Penulisan namun Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Ditulis.', 3, 'Seminar/Lokakarya Internasional dengan Peserta 200 - 1000 orang, dengan jumlah Makalah lebih dari 20 - 100', 3, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_2_q`
--

CREATE TABLE IF NOT EXISTS `4_2_q` (
  `id_4_2_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_2_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_2_q`
--

INSERT INTO `4_2_q` (`id_4_2_q`, `peran`, `nilai_q`) VALUES
(1, 'Penulis Utama, Menulis Bagian Terbesar Materi Penulisan sekaligus Pencetus/Penggagas/Penemu Konsep, Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Ditulis. Pengarah Alur Penulisan. Pengambil Keputusan Akhir Hasil Penulisan', 4),
(2, 'Penulis Utama, Menulis Bagian Terbesar Materi Penulisan namun Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Ditulis.', 3),
(3, 'Pengajar Tambahan, Menulis Bagian Tertentu Materi Penulisan namun Bukan Penulis Utama Bahan Tulisan, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 2),
(4, 'Membantu Menyediakan Data Penulisan, Perhitungan, Tabel dan Ilustrasi. Bukan Penulis Utama Bahan Pengajaran, Bukan Pencetus/Penggagas/Penemu Konsep, dan Bukan Penulis Utama Bahan Rujukan (Text Book) dari Bahan yang Diajarkan.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_2_r`
--

CREATE TABLE IF NOT EXISTS `4_2_r` (
  `id_4_2_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_2_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_2_r`
--

INSERT INTO `4_2_r` (`id_4_2_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Seminar/Lokakarya Internasional Besar dengan Peserta lebih dari 1000 orang, dengan jumlah Makalah lebih dari 100', 4),
(2, 'Seminar/Lokakarya Internasional dengan Peserta 200 - 1000 orang, dengan jumlah Makalah lebih dari 20 - 100', 3),
(3, 'Seminar/Lokakarya Internasional dengan Peserta 50 - 200 orang, dengan jumlah Makalah lebih dari 10 - 20', 2),
(4, 'Seminar/Lokakarya Terbatasl dengan Peserta kurang dari 50 orang, dengan jumlah Makalah kurang dari 10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_3`
--

CREATE TABLE IF NOT EXISTS `4_3` (
  `id_4_3` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_3`),
  KEY `fk_reference_65` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_3`
--

INSERT INTO `4_3` (`id_4_3`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 24, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_3_detail`
--

CREATE TABLE IF NOT EXISTS `4_3_detail` (
  `id_4_3_detail` varchar(14) NOT NULL,
  `id_4_3` varchar(12) DEFAULT NULL,
  `tempat` text,
  `penyelenggara` text,
  PRIMARY KEY (`id_4_3_detail`),
  KEY `fk_reference_30` (`id_4_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_3_detail`
--

INSERT INTO `4_3_detail` (`id_4_3_detail`, `id_4_3`, `tempat`, `penyelenggara`) VALUES
('2015-000010101', '2015-0000101', 'erterte', 'rtertre');

-- --------------------------------------------------------

--
-- Table structure for table `4_3_kompetensi`
--

CREATE TABLE IF NOT EXISTS `4_3_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_4_3_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_4_3_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_3_kompetensi`
--

INSERT INTO `4_3_kompetensi` (`id_kompetensi`, `id_4_3_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.2.1.3 Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1),
('2015-00001010102', '2015-000010101', 'W.2.1.4 Mengenali dan menanggulangi masalah keinsinyuran.', 1),
('2015-00001010103', '2015-000010101', 'W.2.1.6 Menyelidiki kebutuhan dan memanfaatkan peluang dalam pekerjaan atau bidang kejuruan.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_3_p`
--

CREATE TABLE IF NOT EXISTS `4_3_p` (
  `id_4_3_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_3_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_3_p`
--

INSERT INTO `4_3_p` (`id_4_3_p`, `jenis`, `nilai_p`) VALUES
(1, 'Seminar/Lokakarya Besar dengan Program Inti lebih dari 3 Hari, terdapat lebih dari 2 Program/Session berjalan bersamaan, Mencakup berbagai Bidang Keinsinyuran atau Bidang Industri', 4),
(2, 'Seminar/Lokakarya dengan Program Inti 1 - 3 Hari, Mencakup berberapa Bidang Keinsinyuran atau Bidang Industri', 3),
(3, 'Seminar/Lokakarya dengan Program 1 Hari, Mencakup satu Bidang Keinsinyuran atau Bidang Industri Tertentu', 2),
(4, 'Seminar/Lokakarya dengan Program kurang dari 1/2 Hari (4 jam), Mencakup satu Topik Keinsinyuran atau Topik Industri Tertentu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_3_pqr`
--

CREATE TABLE IF NOT EXISTS `4_3_pqr` (
  `id_4_3_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_4_3_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_3_pqr`
--

INSERT INTO `4_3_pqr` (`id_4_3_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Seminar/Lokakarya Besar dengan Program Inti lebih dari 3 Hari, terdapat lebih dari 2 Program/Session berjalan bersamaan, Mencakup berbagai Bidang Keinsinyuran atau Bidang Industri', 4, 'Peserta Pembelajaran yang Mendapat Sertifikat Kehadiran', 2, 'Seminar/Lokakarya Terbatasl dengan Peserta kurang dari 50 orang, dengan jumlah Makalah kurang dari 10', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_3_q`
--

CREATE TABLE IF NOT EXISTS `4_3_q` (
  `id_4_3_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_3_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_3_q`
--

INSERT INTO `4_3_q` (`id_4_3_q`, `peran`, `nilai_q`) VALUES
(1, 'Penyanggah, Panelis, Nara Sumber, Penyaring Karya Tulis, Komite Teknis', 4),
(2, 'Session Chairman, Moderator, Pengurus Penyelenggara', 3),
(3, 'Peserta Pembelajaran yang Mendapat Sertifikat Kehadiran', 2),
(4, 'Peserta Umum tanpa Sertifikat Kehadiran', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_3_r`
--

CREATE TABLE IF NOT EXISTS `4_3_r` (
  `id_4_3_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_3_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_3_r`
--

INSERT INTO `4_3_r` (`id_4_3_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Seminar/Lokakarya Internasional Besar dengan Peserta lebih dari 1000 orang, dengan jumlah Makalah lebih dari 100', 4),
(2, 'Seminar/Lokakarya Internasional dengan Peserta 200 - 1000 orang, dengan jumlah Makalah lebih dari 20 - 100', 3),
(3, 'Seminar/Lokakarya Internasional dengan Peserta 50 - 200 orang, dengan jumlah Makalah lebih dari 10 - 20', 2),
(4, 'Seminar/Lokakarya Terbatasl dengan Peserta kurang dari 50 orang, dengan jumlah Makalah kurang dari 10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_4`
--

CREATE TABLE IF NOT EXISTS `4_4` (
  `id_4_4` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_4`),
  KEY `fk_reference_72` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_4`
--

INSERT INTO `4_4` (`id_4_4`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 54, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_4_detail`
--

CREATE TABLE IF NOT EXISTS `4_4_detail` (
  `id_4_4_detail` varchar(14) NOT NULL,
  `id_4_4` varchar(12) DEFAULT NULL,
  `tempat` text,
  `uraian` text,
  `referemsi` text,
  `status` text,
  PRIMARY KEY (`id_4_4_detail`),
  KEY `fk_reference_30` (`id_4_4`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_4_detail`
--

INSERT INTO `4_4_detail` (`id_4_4_detail`, `id_4_4`, `tempat`, `uraian`, `referemsi`, `status`) VALUES
('2015-000010101', '2015-0000101', 'erter', 'tret', 'retert', 'ertert');

-- --------------------------------------------------------

--
-- Table structure for table `4_4_kompetensi`
--

CREATE TABLE IF NOT EXISTS `4_4_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_4_4_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_4_4_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_4_kompetensi`
--

INSERT INTO `4_4_kompetensi` (`id_kompetensi`, `id_4_4_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'P.6.4.1 Merumuskan ciri-ciri  produk yang diinginkan pasar.', 1),
('2015-00001010102', '2015-000010101', 'P.6.4.2 Mengumpulkan informasi dan membuat rekomendasi untuk menentukan harga produk.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_4_p`
--

CREATE TABLE IF NOT EXISTS `4_4_p` (
  `id_4_4_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_4_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_4_p`
--

INSERT INTO `4_4_p` (`id_4_4_p`, `jenis`, `nilai_p`) VALUES
(1, 'Merupakan Konsep/Sistem atau Produk yang Baru, Mendapatkan Hak Paten (HAKI) Internasional, Penerapan untuk Kegunaan yang Baru, Telah Komersialisasi dan berdampak Besar bagi Kemanusiaan/Keekonomian', 4),
(2, 'Merupakan Konsep/Sistem atau Produk yang Baru, Mendapatkan Hak Paten (HAKI) Internasional, Penerapan untuk Kegunaan yang Baru, Belum Komersialisasi dan berpeluang  berdampak Besar bagi Kemanusiaan/Keekonomian', 3),
(3, 'Merupakan Konsep/Sistem atau Produk yang Baru, Mendapatkan Hak Rahasia Dagang (HAKI) Internasional, Penerapan untuk Kegunaan yang Baru, Telah Komersialisasi dan berdampak Besar bagi Keekonomian', 2);

-- --------------------------------------------------------

--
-- Table structure for table `4_4_pqr`
--

CREATE TABLE IF NOT EXISTS `4_4_pqr` (
  `id_4_4_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_4_4_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `4_4_pqr`
--

INSERT INTO `4_4_pqr` (`id_4_4_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Merupakan Konsep/Sistem atau Produk yang Baru, Mendapatkan Hak Paten (HAKI) Internasional, Penerapan untuk Kegunaan yang Baru, Belum Komersialisasi dan berpeluang  berdampak Besar bagi Kemanusiaan/Keekonomian', 3, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `4_4_q`
--

CREATE TABLE IF NOT EXISTS `4_4_q` (
  `id_4_4_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_4_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_4_q`
--

INSERT INTO `4_4_q` (`id_4_4_q`, `peran`, `nilai_q`) VALUES
(1, 'Pembuat Kebijakan, Pengambil Keputusan Strategis, Pengambil Keputusan Bisnis, Penanggungjawab Hukum & Komersial (Eksternal), Wewenang Membuat Pengecualian', 4),
(2, 'Pengarah Metodologi, Pembuat Konsep, Pembuat Alur Pikir Kerja, Pengambil Keputusan Teknis, Penanggungjawab Teknis (Internal), Ahli Bidang Tertentu, Pemberi Petunjuk, Bimbingan dan Pelatihan Teknis, Nara Sumber Teknis', 3),
(3, 'Pelaksana Pekerjaan, Bekerja Mandiri, Mahir di Bidang yg Dikerjakannya, Tempat Bertanya Para Pemula, Penanggungjawab Perhitungan Teknis dan Penerapan Data', 2),
(4, 'Pencari Data, Membantu Penyiapan Materi, Melakukan Perhitungan Sederhana, Penanggungjawab Kebenaran Data', 1);

-- --------------------------------------------------------

--
-- Table structure for table `4_4_r`
--

CREATE TABLE IF NOT EXISTS `4_4_r` (
  `id_4_4_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_4_4_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `4_4_r`
--

INSERT INTO `4_4_r` (`id_4_4_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Nasional dan Asing (Internasional), Pekerjaan Melibatkan Profesi Keinsinyuran dan Non-Keinsinyuran Multi Disiplin yang Kompleks, Wewenang Keuangan Pemohon Diatas Rp. 500 juta', 4),
(2, 'Pekerjaan Melibatkan Perusahaan/Lembaga Lain Dalam Negeri (Nasional), Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, dan juga Melibatkan 4 (empat) atau lebih Profesi Non Keinsinyuran. Atau Pekerjaan yang juga Melibatkan Pihak As', 3),
(3, 'Pekerjaan Melibatkan atau Diperuntukkan bagi Pihak Lain dalam Perusahaan atau Suatu Lembaga, Pekerjaan yang Melibatkan 4 (empat) atau lebih Profesi Keinsinyuran, Pekerjaan yang Melibatkan 1 - 3 Profesi Non Keinsinyuran, Wewenang Keuangan Pemohon Rp 5', 2),
(4, 'Pekerjaan untuk Kebutuhan Sendiri atau untuk Bagian Sendiri, Pekerjaan yang Melibatkan 1 -3 Profesi Keinsinyuran dalam Satu Perusahaan/Lembaga, Wewenang Keuangan Pemohon Dibawah Rp. 5 juta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `5_1`
--

CREATE TABLE IF NOT EXISTS `5_1` (
  `id_5_1` varchar(12) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `total_penilaian` int(11) DEFAULT NULL,
  `total_penilaian_penilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_5_1`),
  KEY `fk_reference_73` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `5_1`
--

INSERT INTO `5_1` (`id_5_1`, `id_user`, `total_penilaian`, `total_penilaian_penilai`) VALUES
('2015-0000101', '2015-00001', 24, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `5_1_detail`
--

CREATE TABLE IF NOT EXISTS `5_1_detail` (
  `id_5_1_detail` varchar(14) NOT NULL,
  `id_5_1` varchar(12) DEFAULT NULL,
  `bahasa` varchar(250) DEFAULT NULL,
  `lisan` varchar(250) DEFAULT NULL,
  `tulisan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_5_1_detail`),
  KEY `fk_reference_30` (`id_5_1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `5_1_detail`
--

INSERT INTO `5_1_detail` (`id_5_1_detail`, `id_5_1`, `bahasa`, `lisan`, `tulisan`) VALUES
('2015-000010101', '2015-0000101', 'Albanian', 'Lisan, Dasar', 'Menulis, Lancar (E-mail, Meeting Notes)');

-- --------------------------------------------------------

--
-- Table structure for table `5_1_kompetensi`
--

CREATE TABLE IF NOT EXISTS `5_1_kompetensi` (
  `id_kompetensi` varchar(16) NOT NULL,
  `id_5_1_detail` varchar(14) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `nilai_kompetensi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`),
  KEY `fk_reference_29` (`id_5_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `5_1_kompetensi`
--

INSERT INTO `5_1_kompetensi` (`id_kompetensi`, `id_5_1_detail`, `kompetensi`, `nilai_kompetensi`) VALUES
('2015-00001010101', '2015-000010101', 'W.4.1.3 Menerapkan pengelolaan waktu dan tatakerja yang efektif.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `5_1_p`
--

CREATE TABLE IF NOT EXISTS `5_1_p` (
  `id_5_1_p` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_5_1_p`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `5_1_p`
--

INSERT INTO `5_1_p` (`id_5_1_p`, `jenis`, `nilai_p`) VALUES
(1, 'Menguasai Lebih dari 4 Bahasa Asing dari Negara Industri Maju (Inggris, Perancis, Jerman, Jepang, China, Korea, Rusia)', 4),
(2, 'Menguasai 2 - 4 Bahasa Asing dari Negara Industri Maju (Inggris, Perancis, Jerman, Jepang, China, Korea, Rusia)', 3),
(3, 'Menguasai Lebih dari 1 Bahasa Asing dari Negara Industri Maju (Inggris, Perancis, Jerman, Jepang, China, Korea, Rusia)', 2),
(4, 'Tidak Menguasai Bahasa Asing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `5_1_pqr`
--

CREATE TABLE IF NOT EXISTS `5_1_pqr` (
  `id_5_1_detail` varchar(14) NOT NULL,
  `jenis` varchar(250) DEFAULT NULL,
  `nilai_p` int(11) DEFAULT NULL,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  `jenis_penilai` varchar(250) DEFAULT NULL,
  `nilai_p_penilai` int(1) DEFAULT NULL,
  `peran_penilai` varchar(250) DEFAULT NULL,
  `nilai_q_penilai` int(1) DEFAULT NULL,
  `cakupan_penilai` varchar(250) DEFAULT NULL,
  `nilai_r_penilai` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_5_1_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `5_1_pqr`
--

INSERT INTO `5_1_pqr` (`id_5_1_detail`, `jenis`, `nilai_p`, `peran`, `nilai_q`, `cakupan`, `nilai_r`, `jenis_penilai`, `nilai_p_penilai`, `peran_penilai`, `nilai_q_penilai`, `cakupan_penilai`, `nilai_r_penilai`) VALUES
('2015-000010101', 'Menguasai Lebih dari 4 Bahasa Asing dari Negara Industri Maju (Inggris, Perancis, Jerman, Jepang, China, Korea, Rusia)', 4, 'Memakai Bahasa Asing yang Dikuasai dalam Pemaparan Makalah Teknik Keinsinyuran, Pengajaran dan Pelatihan Keinsinyuran', 3, 'Bekerja di Perusahaan yang Memakai Bahasa Asing sebagai Bahasa Korespondensi dan Komunikasi', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `5_1_q`
--

CREATE TABLE IF NOT EXISTS `5_1_q` (
  `id_5_1_q` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(250) DEFAULT NULL,
  `nilai_q` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_5_1_q`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `5_1_q`
--

INSERT INTO `5_1_q` (`id_5_1_q`, `peran`, `nilai_q`) VALUES
(1, 'Memakai Bahasa Asing yang Dikuasai dalam Negosiasi Teknik Keinsinyuran, Pembuatan Kontrak Teknik dan Kontrak Bisnis', 4),
(2, 'Memakai Bahasa Asing yang Dikuasai dalam Pemaparan Makalah Teknik Keinsinyuran, Pengajaran dan Pelatihan Keinsinyuran', 3),
(3, 'Memakai Bahasa Asing yang Dikuasainya untuk mengikuti Seminar Lokakarya Keinsinyuran, Pendidikan dan Pelatihan Keinsinyuran', 2),
(4, 'Memakai Bahasa Asing yang Dikuasainya untuk Pekerjaan dan Komunikasi Sehari-hari dengan Mitra Asing, Membaca Karya Tulis dalam Bahasa Tersebut', 1);

-- --------------------------------------------------------

--
-- Table structure for table `5_1_r`
--

CREATE TABLE IF NOT EXISTS `5_1_r` (
  `id_5_1_r` int(11) NOT NULL AUTO_INCREMENT,
  `cakupan` varchar(250) DEFAULT NULL,
  `nilai_r` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_5_1_r`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `5_1_r`
--

INSERT INTO `5_1_r` (`id_5_1_r`, `cakupan`, `nilai_r`) VALUES
(1, 'Telah Bekerja di Negara Asing atau Melaksanakan Pekerjaan di Negara, Lebih dari 2 Tahun', 4),
(2, 'Telah Bekerja di Negara Asing atau Melaksanakan Pekerjaan di Negara Asing, 1 - 2 Tahun', 3),
(3, 'Bekerja di Perusahaan yang Memakai Bahasa Asing sebagai Bahasa Korespondensi dan Komunikasi', 2),
(4, 'Bekerja di Perusahaan atau Lembaga yang Harus Memakai Bahasa Asing dengan Mitra Kerja Perusahaan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bahasa`
--

CREATE TABLE IF NOT EXISTS `bahasa` (
  `id_bahasa` int(11) NOT NULL AUTO_INCREMENT,
  `bahasa` varchar(250) DEFAULT NULL,
  `native` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_bahasa`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=185 ;

--
-- Dumping data for table `bahasa`
--

INSERT INTO `bahasa` (`id_bahasa`, `bahasa`, `native`) VALUES
(1, 'Abkhaz', NULL),
(2, 'Afar', NULL),
(3, 'Afrikaans', NULL),
(4, 'Akan', NULL),
(5, 'Albanian', NULL),
(6, 'Amharic', NULL),
(7, 'Arabic', NULL),
(8, 'Aragonese', NULL),
(9, 'Armenian', NULL),
(10, 'Assamese', NULL),
(11, 'Avaric', NULL),
(12, 'Avestan', NULL),
(13, 'Aymara', NULL),
(14, 'Azerbaijani', NULL),
(15, 'Bambara', NULL),
(16, 'Bashkir', NULL),
(17, 'Basque', NULL),
(18, 'Belarusian', NULL),
(19, 'Bengali, Bangla', NULL),
(20, 'Bihari', NULL),
(21, 'Bislama', NULL),
(22, 'Bosnian', NULL),
(23, 'Breton', NULL),
(24, 'Bulgarian', NULL),
(25, 'Burmese', NULL),
(26, 'Catalan, Valencian', NULL),
(27, 'Chamorro', NULL),
(28, 'Chechen', NULL),
(29, 'Chichewa, Chewa, Nyanja', NULL),
(30, 'Chinese', NULL),
(31, 'Chuvash', NULL),
(32, 'Cornish', NULL),
(33, 'Corsican', NULL),
(34, 'Cree', NULL),
(35, 'Croatian', NULL),
(36, 'Czech', NULL),
(37, 'Danish', NULL),
(38, 'Divehi, Dhivehi, Maldivian', NULL),
(39, 'Dutch', NULL),
(40, 'Dzongkha', NULL),
(41, 'English', NULL),
(42, 'Esperanto', NULL),
(43, 'Estonian', NULL),
(44, 'Ewe', NULL),
(45, 'Faroese', NULL),
(46, 'Fijian', NULL),
(47, 'Finnish', NULL),
(48, 'French', NULL),
(49, 'Fula, Fulah, Pulaar, Pular', NULL),
(50, 'Galician', NULL),
(51, 'Georgian', NULL),
(52, 'German', NULL),
(53, 'Greek (modern)', NULL),
(54, 'Guarani', NULL),
(55, 'Gujarati', NULL),
(56, 'Haitian, Haitian Creole', NULL),
(57, 'Hausa', NULL),
(58, 'Hebrew (modern)', NULL),
(59, 'Herero', NULL),
(60, 'Hindi', NULL),
(61, 'Hiri Motu', NULL),
(62, 'Hungarian', NULL),
(63, 'Interlingua', NULL),
(64, 'Indonesian', NULL),
(65, 'Interlingue', NULL),
(66, 'Irish', NULL),
(67, 'Igbo', NULL),
(68, 'Inupiaq', NULL),
(69, 'Ido', NULL),
(70, 'Icelandic', NULL),
(71, 'Italian', NULL),
(72, 'Inuktitut', NULL),
(73, 'Japanese', NULL),
(74, 'Javanese', NULL),
(75, 'Kalaallisut, Greenlandic', NULL),
(76, 'Kannada', NULL),
(77, 'Kanuri', NULL),
(78, 'Kashmiri', NULL),
(79, 'Kazakh', NULL),
(80, 'Khmer', NULL),
(81, 'Kikuyu, Gikuyu', NULL),
(82, 'Kinyarwanda', NULL),
(83, 'Kyrgyz', NULL),
(84, 'Komi', NULL),
(85, 'Kongo', NULL),
(86, 'Korean', NULL),
(87, 'Kurdish', NULL),
(88, 'Kwanyama, Kuanyama', NULL),
(89, 'Latin', NULL),
(90, 'Luxembourgish, Letzeburgesch', NULL),
(91, 'Ganda', NULL),
(92, 'Limburgish, Limburgan, Limburger', NULL),
(93, 'Lingala', NULL),
(94, 'Lao', NULL),
(95, 'Lithuanian', NULL),
(96, 'Luba-Katanga', NULL),
(97, 'Latvian', NULL),
(98, 'Manx', NULL),
(99, 'Macedonian', NULL),
(100, 'Malagasy', NULL),
(101, 'Malay', NULL),
(102, 'Malayalam', NULL),
(103, 'Maltese', NULL),
(104, 'Maori', NULL),
(105, 'Marathi (Marathi)', NULL),
(106, 'Marshallese', NULL),
(107, 'Mongolian', NULL),
(108, 'Nauru', NULL),
(109, 'Navajo, Navaho', NULL),
(110, 'Northern Ndebele', NULL),
(111, 'Nepali', NULL),
(112, 'Ndonga', NULL),
(113, 'Norwegian Bokmal', NULL),
(114, 'Norwegian Nynorsk', NULL),
(115, 'Norwegian', NULL),
(116, 'Nuosu', NULL),
(117, 'Southern Ndebele', NULL),
(118, 'Occitan', NULL),
(119, 'Ojibwe, Ojibwa', NULL),
(120, 'Old Church Slavonic, Church Slavonic, Old Bulgarian', NULL),
(121, 'Oromo', NULL),
(122, 'Oriya', NULL),
(123, 'Ossetian, Ossetic', NULL),
(124, 'Panjabi, Punjabi', NULL),
(125, 'Pali', NULL),
(126, 'Persian (Farsi)', NULL),
(127, 'Polish', NULL),
(128, 'Pashto, Pushto', NULL),
(129, 'Portuguese', NULL),
(130, 'Quechua', NULL),
(131, 'Romansh', NULL),
(132, 'Kirundi', NULL),
(133, 'Romanian', NULL),
(134, 'Russian', NULL),
(135, 'Sanskrit', NULL),
(136, 'Sardinian', NULL),
(137, 'Sindhi', NULL),
(138, 'Northern Sami', NULL),
(139, 'Samoan', NULL),
(140, 'Sango', NULL),
(141, 'Serbian', NULL),
(142, 'Scottish Gaelic, Gaelic', NULL),
(143, 'Shona', NULL),
(144, 'Sinhala, Sinhalese', NULL),
(145, 'Slovak', NULL),
(146, 'Slovene', NULL),
(147, 'Somali', NULL),
(148, 'Southern Sotho', NULL),
(149, 'Spanish, Castilian', NULL),
(150, 'Sundanese', NULL),
(151, 'Swahili', NULL),
(152, 'Swati', NULL),
(153, 'Swedish', NULL),
(154, 'Tamil', NULL),
(155, 'Telugu', NULL),
(156, 'Tajik', NULL),
(157, 'Thai', NULL),
(158, 'Tigrinya', NULL),
(159, 'Tibetan Standard, Tibetan, Central', NULL),
(160, 'Turkmen', NULL),
(161, 'Tagalog', NULL),
(162, 'Tswana', NULL),
(163, 'Tonga (Tonga Islands)', NULL),
(164, 'Turkish', NULL),
(165, 'Tsonga', NULL),
(166, 'Tatar', NULL),
(167, 'Twi', NULL),
(168, 'Tahitian', NULL),
(169, 'Uyghur, Uighur', NULL),
(170, 'Ukrainian', NULL),
(171, 'Urdu', NULL),
(172, 'Uzbek', NULL),
(173, 'Venda', NULL),
(174, 'Vietnamese', NULL),
(175, 'Volapuk', NULL),
(176, 'Walloon', NULL),
(177, 'Welsh', NULL),
(178, 'Wolof', NULL),
(179, 'Western Frisian', NULL),
(180, 'Xhosa', NULL),
(181, 'Yiddish', NULL),
(182, 'Yoruba', NULL),
(183, 'Zhuang, Chuang', NULL),
(184, 'Zulu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bakuan_kompetensi`
--

CREATE TABLE IF NOT EXISTS `bakuan_kompetensi` (
  `id_bakuan_kompetensi` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) DEFAULT NULL,
  `kompetensi` varchar(250) DEFAULT NULL,
  `satuan` int(11) DEFAULT NULL,
  `step` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_bakuan_kompetensi`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=621 ;

--
-- Dumping data for table `bakuan_kompetensi`
--

INSERT INTO `bakuan_kompetensi` (`id_bakuan_kompetensi`, `kode`, `kompetensi`, `satuan`, `step`) VALUES
(1, 'W.2.1.1', 'Gagasan sendiri dalam sintesa pemecahan masalah keinsinyuran.', 1, 'I.2'),
(2, 'W.2.1.2', 'Kearifan profesional dalam keputusan keinsinyuran.', 1, 'I.2'),
(3, 'W.2.1.3', 'Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1, 'I.2'),
(4, 'W.2.1.4', 'Mengenali dan menanggulangi masalah keinsinyuran.', 1, 'I.2'),
(5, 'W.2.1.5', 'Memperluas pengetahuan dan memupuk kerjasama antar kejuruan', 1, 'I.2'),
(6, 'W.2.1.6', 'Menyelidiki kebutuhan dan memanfaatkan peluang dalam pekerjaan atau bidang kejuruan.', 1, 'I.2'),
(7, 'W.2.2.1', 'Menyadari keterbatasan kepakaran dan pengetahuan dirinya ', 1, 'I.2'),
(8, 'W.2.2.2', 'Mencari informasi perkembangan teknologi atau kemajuan lainnya', 1, 'I.2'),
(9, 'W.2.2.3', 'Membaca majalah profesional, mengikuti seminar dan menjalin kerjasama antar profesional.', 1, 'I.2'),
(10, 'W.2.2.4', 'Melakukan penelitian dan percobaan untuk menyelesaikan masalah keinsinyuran', 1, 'I.2'),
(11, 'W.2.2.5', 'Memanfaatkan pengalaman untuk pengembangan keprofesionalannya.', 1, 'I.2'),
(12, 'W.2.2.6', 'Pencatatan mengenai kegiatan pengembangan keprofesionalannya.', 1, 'I.2'),
(13, 'W.2.3.1', 'Pengenalan kerekayasaan ', 1, 'I.2'),
(14, 'W.2.3.2', 'Pembuatan konsep penerapan kerekayasaan', 1, 'I.2'),
(15, 'W.2.3.3', 'Perincian penerapan kerekayasaan yang dipilih.', 1, 'I.2'),
(16, 'W.2.3.4', 'Pemutakhiran dokumentasi hasil-hasil penerapannya.', 1, 'I.2'),
(17, 'W.2.3.5', 'Pengkajian persyaratan bagi diperolehnya persetujuan penerapan kerekayasaan ', 1, 'I.2'),
(18, 'W.2.4.1', 'Pengembangan sistem mutu.', 1, 'I.2'),
(19, 'W.2.4.2', 'Mendorong penerapan kaidah penjaminan mutu ke rekan kerja dan anak-buah.', 1, 'I.2'),
(20, 'W.2.4.3', 'Melaksanakan setiap pekerjaan sesuai dengan bakuan mutu yang tepat.', 1, 'I.2'),
(21, 'W.2.4.4', 'Menerapkan tatacara kendali mutu dan penjaminan mutu.', 1, 'I.2'),
(22, 'W.2.5.1', 'Memilih dan menggunakan analisis matematik, ilmu keinsinyuran, simulasi komputer atau teknik pemodelan lainnya.', 1, 'I.2'),
(23, 'W.2.5.2', 'Memilih dan memanfaatkan penerapan  sistem komputer.', 1, 'I.2'),
(24, 'W.2.5.3', 'Mengarahkan dan melaksanakan tugas-tugas pemrograman dan penggunaan perangkat lunak.', 1, 'I.2'),
(25, 'W.2.5.4', 'Memilih dan menggunakan alat bantu teknologi dan memantau kinerjanya.', 1, 'I.2'),
(26, 'W.2.6.1', 'Merumuskan tujuan uji-coba.', 1, 'I.2'),
(27, 'W.2.6.2', 'Menyusun tatacara dan jadwal uji-coba.', 1, 'I.2'),
(28, 'W.2.6.3', 'Mengembangkan tatacara dan alat-alat pengukuran.', 1, 'I.2'),
(29, 'W.2.6.4', 'Melaksanakan uji-coba  dan pengukuran untuk kerja keinsinyuran yang kritis.', 1, 'I.2'),
(30, 'W.2.6.5', 'Mengawasi uji-coba  dan pengukuran untuk kerja yang tidak kritis.', 1, 'I.2'),
(31, 'W.2.6.6', 'Mengkaji-nilai hasil uji-coba  dan pengukuran.', 1, 'I.2'),
(32, 'W.1.1.1', 'Kesadaran tanggungjawab kecendekiaan dan profesi', 1, 'I.3'),
(33, 'W.1.1.2', 'Mengamalkan nilai dan jiwa Pancasila', 1, 'I.3'),
(34, 'W.1.1.3', 'Berpedoman konstitusi dan perundang-undangan ', 1, 'I.3'),
(35, 'W.1.1.4', 'Kesetiakawanan nasional dan kepedulian sosial ', 1, 'I.3'),
(36, 'W.1.1.5', 'Wawasan kebangsaan dan kemandirian  nasional', 1, 'I.3'),
(37, 'W.1.2.1', ' Tanggungjawab masyarakat di atas tanggungjawab profesi,', 1, 'I.3'),
(38, 'W.1.2.2', 'Menjunjung tinggi kehormatan, martabat dan nilai luhur profesi.', 1, 'I.3'),
(39, 'W.1.2.3', 'Melakukan pekerjaan, hanya dalam batasan kompetensinya.', 1, 'I.3'),
(40, 'W.1.2.4', 'Menerapkan kemampuan profesional dengan penuh amanah.', 1, 'I.3'),
(41, 'W.1.2.5', 'Memberikan pendapat profesi secara obyektif ', 1, 'I.3'),
(42, 'W.1.2.6', 'Pengembangan kemampuan profesional berkelanjutan.', 1, 'I.3'),
(43, 'W.1.2.7', 'Mendorong rekan kerja memajukan pengetahuan dan pengalaman', 1, 'I.3'),
(44, 'W.1.2.8', ' Secara aktif membantu dan mendorong rekan kerjanya untuk memajukan pengetahuan dan pengalaman mereka.', 1, 'I.3'),
(45, 'W.1.3.1', 'Menyadari saling ketergantungan dan keaneka-ragaman lingkungan hidup', 1, 'I.3'),
(46, 'W.1.3.2', 'Menyadari keterbatasan daya dukung lingkungan hidup ', 1, 'I.3'),
(47, 'W.1.3.3', 'Memperbaiki, mempertahankan dan memulihkan  lingkungan hidup.', 1, 'I.3'),
(48, 'W.1.3.4', 'Penggunaan  yang  bijaksana  sumber-daya  tak  terbarukan', 1, 'I.3'),
(49, 'W.1.3.5', 'Penggunaan bahan baku dan enerji secara hemat ', 1, 'I.3'),
(50, 'W.1.3.6', 'Memperhatikan dampak siklus hidup produk dan proyek terhadap lingkungan hidup.', 1, 'I.3'),
(51, 'W.1.3.7', 'Memperhitungkan tindakan keinsinyuran terhadap budaya atau warisan sejarah.', 1, 'I.3'),
(52, 'W.1.4.1', 'Bertanggung jawab atas risiko dan tanggung-gugat (liabilities) profesional', 1, 'I.3'),
(53, 'W.1.4.2', 'Menerapkan persyaratan kesehatan dan keselamatan kerja (K-3).', 1, 'I.3'),
(54, 'W.1.4.3', 'Menyelidiki kebutuhan dan bertindak memecahkan masalah keselamatan masyarakat', 1, 'I.3'),
(55, 'W.1.4.4', 'Tindakan pencegahan pekerjaan  yang berbahaya.', 1, 'I.3'),
(56, 'W.1.4.5', 'Menerapkan kaidah pencegahan, penanganan dan pemulihan bencana alam', 1, 'I.3'),
(57, 'W.1.1.1', 'Kesadaran tanggungjawab kecendekiaan dan profesi', 1, 'I.4'),
(58, 'W.1.1.2', 'Mengamalkan nilai dan jiwa Pancasila', 1, 'I.4'),
(59, 'W.1.1.3', 'Berpedoman konstitusi dan perundang-undangan ', 1, 'I.4'),
(60, 'W.1.1.4', 'Kesetiakawanan nasional dan kepedulian sosial ', 1, 'I.4'),
(61, 'W.1.1.5', 'Wawasan kebangsaan dan kemandirian  nasional', 1, 'I.4'),
(62, 'W.1.2.1', ' Tanggungjawab masyarakat di atas tanggungjawab profesi,', 1, 'I.4'),
(63, 'W.1.2.2', 'Menjunjung tinggi kehormatan, martabat dan nilai luhur profesi.', 1, 'I.4'),
(64, 'W.1.2.3', 'Melakukan pekerjaan, hanya dalam batasan kompetensinya.', 1, 'I.4'),
(65, 'W.1.2.4', 'Menerapkan kemampuan profesional dengan penuh amanah.', 1, 'I.4'),
(66, 'W.1.2.5', 'Memberikan pendapat profesi secara obyektif ', 1, 'I.4'),
(67, 'W.1.2.6', 'Pengembangan kemampuan profesional berkelanjutan.', 1, 'I.4'),
(68, 'W.1.2.7', 'Mendorong rekan kerja memajukan pengetahuan dan pengalaman', 1, 'I.4'),
(69, 'W.1.2.8', ' Secara aktif membantu dan mendorong rekan kerjanya untuk memajukan pengetahuan dan pengalaman mereka.', 1, 'I.4'),
(70, 'W.1.3.1', 'Menyadari saling ketergantungan dan keaneka-ragaman lingkungan hidup', 1, 'I.4'),
(71, 'W.1.3.2', 'Menyadari keterbatasan daya dukung lingkungan hidup ', 1, 'I.4'),
(72, 'W.1.3.3', 'Memperbaiki, mempertahankan dan memulihkan  lingkungan hidup.', 1, 'I.4'),
(73, 'W.1.3.4', 'Penggunaan  yang  bijaksana  sumber-daya  tak  terbarukan', 1, 'I.4'),
(74, 'W.1.3.5', 'Penggunaan bahan baku dan enerji secara hemat ', 1, 'I.4'),
(75, 'W.1.3.6', 'Memperhatikan dampak siklus hidup produk dan proyek terhadap lingkungan hidup.', 1, 'I.4'),
(76, 'W.1.3.7', 'Memperhitungkan tindakan keinsinyuran terhadap budaya atau warisan sejarah.', 1, 'I.4'),
(77, 'W.1.4.1', 'Bertanggung jawab atas risiko dan tanggung-gugat (liabilities) profesional', 1, 'I.4'),
(78, 'W.1.4.2', 'Menerapkan persyaratan kesehatan dan keselamatan kerja (K-3).', 1, 'I.4'),
(79, 'W.1.4.3', 'Menyelidiki kebutuhan dan bertindak memecahkan masalah keselamatan masyarakat', 1, 'I.4'),
(80, 'W.1.4.4', 'Tindakan pencegahan pekerjaan  yang berbahaya.', 1, 'I.4'),
(81, 'W.1.4.5', 'Menerapkan kaidah pencegahan, penanganan dan pemulihan bencana alam', 1, 'I.4'),
(82, 'W.2.1.1', 'Gagasan sendiri dalam sintesa pemecahan masalah keinsinyuran.', 1, 'I.5'),
(83, 'W.2.1.2', 'Kearifan profesional dalam keputusan keinsinyuran.', 1, 'I.5'),
(84, 'W.2.1.3', 'Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1, 'I.5'),
(85, 'W.2.1.4', 'Mengenali dan menanggulangi masalah keinsinyuran.', 1, 'I.5'),
(86, 'W.2.1.5', 'Memperluas pengetahuan dan memupuk kerjasama antar kejuruan', 1, 'I.5'),
(87, 'W.2.1.6', 'Menyelidiki kebutuhan dan memanfaatkan peluang dalam pekerjaan atau bidang kejuruan.', 1, 'I.5'),
(88, 'W.2.2.1', 'Menyadari keterbatasan kepakaran dan pengetahuan dirinya ', 1, 'I.5'),
(89, 'W.2.2.2', 'Mencari informasi perkembangan teknologi atau kemajuan lainnya', 1, 'I.5'),
(90, 'W.2.2.3', 'Membaca majalah profesional, mengikuti seminar dan menjalin kerjasama antar profesional.', 1, 'I.5'),
(91, 'W.2.2.4', 'Melakukan penelitian dan percobaan untuk menyelesaikan masalah keinsinyuran', 1, 'I.5'),
(92, 'W.2.2.5', 'Memanfaatkan pengalaman untuk pengembangan keprofesionalannya.', 1, 'I.5'),
(93, 'W.2.2.6', 'Pencatatan mengenai kegiatan pengembangan keprofesionalannya.', 1, 'I.5'),
(94, 'W.2.3.1', 'Pengenalan kerekayasaan ', 1, 'I.5'),
(95, 'W.2.3.2', 'Pembuatan konsep penerapan kerekayasaan', 1, 'I.5'),
(96, 'W.2.3.3', 'Perincian penerapan kerekayasaan yang dipilih.', 1, 'I.5'),
(97, 'W.2.3.4', 'Pemutakhiran dokumentasi hasil-hasil penerapannya.', 1, 'I.5'),
(98, 'W.2.3.5', 'Pengkajian persyaratan bagi diperolehnya persetujuan penerapan kerekayasaan ', 1, 'I.5'),
(99, 'W.2.4.1', 'Pengembangan sistem mutu.', 1, 'I.5'),
(100, 'W.2.4.2', 'Mendorong penerapan kaidah penjaminan mutu ke rekan kerja dan anak-buah.', 1, 'I.5'),
(101, 'W.2.4.3', 'Melaksanakan setiap pekerjaan sesuai dengan bakuan mutu yang tepat.', 1, 'I.5'),
(102, 'W.2.4.4', 'Menerapkan tatacara kendali mutu dan penjaminan mutu.', 1, 'I.5'),
(103, 'W.2.5.1', 'Memilih dan menggunakan analisis matematik, ilmu keinsinyuran, simulasi komputer atau teknik pemodelan lainnya.', 1, 'I.5'),
(104, 'W.2.5.2', 'Memilih dan memanfaatkan penerapan  sistem komputer.', 1, 'I.5'),
(105, 'W.2.5.3', 'Mengarahkan dan melaksanakan tugas-tugas pemrograman dan penggunaan perangkat lunak.', 1, 'I.5'),
(106, 'W.2.5.4', 'Memilih dan menggunakan alat bantu teknologi dan memantau kinerjanya.', 1, 'I.5'),
(107, 'W.2.6.1', 'Merumuskan tujuan uji-coba.', 1, 'I.5'),
(108, 'W.2.6.2', 'Menyusun tatacara dan jadwal uji-coba.', 1, 'I.5'),
(109, 'W.2.6.3', 'Mengembangkan tatacara dan alat-alat pengukuran.', 1, 'I.5'),
(110, 'W.2.6.4', 'Melaksanakan uji-coba  dan pengukuran untuk kerja keinsinyuran yang kritis.', 1, 'I.5'),
(111, 'W.2.6.5', 'Mengawasi uji-coba  dan pengukuran untuk kerja yang tidak kritis.', 1, 'I.5'),
(112, 'W.2.6.6', 'Mengkaji-nilai hasil uji-coba  dan pengukuran.', 1, 'I.5'),
(113, 'W.4.1.1', 'Melakukan pengembangan diri dalam kemampuan di bidang manajemen, termasuk hukum, ekonomi dan sosial.', 1, 'I.6'),
(114, 'W.4.1.2', 'Menentukan sasaran bagi diri sendiri dalam  mencapai tujuan kerja.', 1, 'I.6'),
(115, 'W.4.1.3', 'Menerapkan pengelolaan waktu dan tatakerja yang efektif.', 1, 'I.6'),
(116, 'W.4.1.4', 'Melakukan pengembangan diri dalam kepemimpinan dan kerjasama kelompok.', 1, 'I.6'),
(117, 'W.4.1.5', 'Melakukan pengembangan diri dalam cara berpikir yang berwawasan luas, analitis dan kreatif.', 1, 'I.6'),
(118, 'W.4.2.1', 'Melakukan tugas perencanaan dan pemantauan proyek.', 1, 'I.6'),
(119, 'W.4.2.2', 'Mengembangkan uraian  rincian pekerjaan yang terstruktur.', 1, 'I.6'),
(120, 'W.4.2.3', 'Menyiapkan jadwal pekerjaan dan jalur kritisnya.', 1, 'I.6'),
(121, 'W.4.2.4', 'Memantau kemajuan, menyelidiki penyimpangan dari jadwal dan memulai tindakan perbaikan.', 1, 'I.6'),
(122, 'W.4.3.1', 'Melakukan penilaian kinerja bawahan.', 1, 'I.6'),
(123, 'W.4.3.2', 'Mematuhi prinsip keadilan dan kebersamaan.', 1, 'I.6'),
(124, 'W.4.3.3', 'Menggalang lingkungan hubungan kerja yang efektif.', 1, 'I.6'),
(125, 'W.4.3.4', ' Mengorganisasikan kelompok-kelompok kerja.', 1, 'I.6'),
(126, 'W.4.3.5', 'Memimpin insinyur muda, teknisi atau tenaga bawahan lainnya.', 1, 'I.6'),
(127, 'W.4.3.6', 'Menghargai ataupun menghukum sesuai dengan kinerja (on-merit)', 1, 'I.6'),
(128, 'W.4.3.7', 'Memantau tugas-tugas untuk menjamin bahwa kegiatan dilaksanakan sesuai rencana dan mengambil tindakan perbaikan yang perlu.', 1, 'I.6'),
(129, 'W.4.4.1', 'Berkomunikasi dengan baik, benar dan lancar untuk menyampaikan pendapat secara  lisan  maupun tertulis dalam bahasa Indonesia.', 1, 'I.6'),
(130, 'W.4.4.2', 'Menyiapkan, menafsirkan dan memaparkan informasi.', 1, 'I.6'),
(131, 'W.4.4.3', 'Berhubungan dengan rekan dan pakar di dalam dan di luar kalangannya.', 1, 'I.6'),
(132, 'W.4.4.4', 'Mengartikan dengan benar instruksi keinsinyuran yang diterima.', 1, 'I.6'),
(133, 'W.4.4.5', 'Memberikan instruksi yang jelas, cermat dan tepat  kepada bawahan dalam suatu bahasa asing yang lazim dipergunakan di bidang keinsinyuran.', 1, 'I.6'),
(134, 'W.4.4.6', 'Memilih media  dan cara  komunikasi yang tepat guna.', 1, 'I.6'),
(135, 'W.4.5.1', 'Menyiapkan dan menyajikan ceramah (lectures) pada suatu tingkat profesional.', 1, 'I.6'),
(136, 'W.4.5.2', 'Menyiapkan tulisan untuk diterbitkan dalam berkala  keinsinyuran.', 1, 'I.6'),
(137, 'W.4.5.3', 'Menyampaikan informasi keinsinyuran secara efektif kepada kalangan keinsinyuran dan kalangan lainnya.', 1, 'I.6'),
(138, 'W.4.5.4', 'Meneruskan informasi keinsinyuran secara efektif kepada atasan (insinyur maupun bukan).', 1, 'I.6'),
(139, 'W.4.5.5', 'Melakukan perundingan, penyelesaian sengketa, pembinaan, pertukar-pikiran serta menyatakan pendapat dan sikap.', 1, 'I.6'),
(140, 'W.4.5.6', 'Menyiapkan laporan keinsinyuran professional, seperti laporan kemajuan pekerjaan, secara baik dan benar.', 1, 'I.6'),
(141, 'W.4.5.7', 'Menyiapkan dokumen seperti spesifikasi, bakuan dan paparan  grafis.', 1, 'I.6'),
(142, 'W.4.5.8', 'Menyiapkan dokumen yang lebih kompleks seperti analisis dampak lingkungan atau kontrak kerja.', 1, 'I.6'),
(143, 'W.4.5.9', 'Menafsirkan dengan benar gambar teknik serta grafik, spesifikasi, bakuan, peraturan, pedoman praktek dan analisis dampak lingkungan.', 1, 'I.6'),
(144, 'P.10.1.1', ' Menetapkan dan melaksanakan tujuan dan prioritas kerja.', 1, 'I.6'),
(145, 'P.10.1.2', 'Merumuskan metoda pendekatan untuk pengelolaan sumber-daya.', 1, 'I.6'),
(146, 'P.10.1.3', 'Melakukan analisis rincian tugas (work breakdown analysis) sehingga tersedia dasar bagi perhitungan kebutuhan  sumber-daya.', 1, 'I.6'),
(147, 'P.10.1.4', 'Membuat perkiraan kebutuhan waktu, biaya, bahan dan sumber-daya lainnya untuk suatu pekerjaan.', 1, 'I.6'),
(148, 'P.10.2.1', 'Mematuhi ketentuan kesehatan dan keselamatan kerja.', 1, 'I.6'),
(149, 'P.10.2.2', 'Menemu-kenali dan menentukan kebutuhan pelatihan bagi tenaga kerja teknis di tempat pekerjaan.', 1, 'I.6'),
(150, 'P.10.2.3', 'Melaksanakan program pengembangan pengalaman kerja untuk bawahan, termasuk pelatihan-ulang, penyesuaian pada teknologi baru dan pengembangan ketrampilan. ', 1, 'I.6'),
(151, 'P.10.2.4', 'Mengkaji efektifitas program pelatihan di tempat kerja.', 1, 'I.6'),
(152, 'P.10.2.5', 'Merumuskan kebutuhan pelatihan tenaga kerja non-teknis.', 1, 'I.6'),
(153, 'P.10.3.1', 'Melakukan tugas  kaji-nilai ekonomis atas pekerjaan yang dilaksanakan.', 1, 'I.6'),
(154, 'P.10.3.2', 'Memahami dampak hukum dari tiap pekerjaan yang dilaksanakan.', 1, 'I.6'),
(155, 'P.10.3.3', 'Memahami, menafsirkan dan menerapkan peraturan yang tepat.', 1, 'I.6'),
(156, 'P.10.3.4', 'Menilai kebutuhan pemasaran dan memberikan saran untuk strategi pemasaran.', 1, 'I.6'),
(157, 'P.10.3.5', 'Mengerjakan tugas pengelolaan  risiko.', 1, 'I.6'),
(158, 'P.10.3.6', 'Memahami kebutuhan kewira-usahaan suatu perusahaan dan bertindak sesuai kebutuhan tersebut dalam hal biaya, waktu dan faktor-faktor lainnya.', 1, 'I.6'),
(159, 'P.10.3.7', 'Mengkaji dan menyiapkan rencana usaha.', 1, 'I.6'),
(160, 'P.10.4.1', 'Menyiapkan dokumen, brosur, uraian teknis dan  spesifikasi mengenai produk barang/jasa keinsinyuran  untuk keperluan pemasaran.', 1, 'I.6'),
(161, 'P.10.4.2', 'Menyiapkan dokumen, pedoman, buku panduan untuk pemakaian operasi, pemeliharaan,  penyetelan dan perbaikan atas produk barang/jasa oleh konsumen. ', 1, 'I.6'),
(162, 'P.10.4.3', 'Melakukan pengamatan atas kebutuhan pasar/pelanggan masa-depan terhadap  penyempurnaan dan menemu-kenali perubahan/pembaharuan yang perlu atas produk barang/jasa. ', 1, 'I.6'),
(163, 'P.10.4.4', 'Memantau dan mengikuti kinerja dan keandalan produk barang/peralatan dan jasa yang dipakai pelanggan dan melakukan perbaikan dan penyempurnaan untuk kepuasan pelanggan. ', 1, 'I.6'),
(164, 'P.10.5.1', 'Menyiapkan dan melakukan kajian kebutuhan pasar akan barang/jasa keinsinyuran yang hendak dipasarkan.', 1, 'I.6'),
(165, 'P.10.5.2', 'Menyiapkan strategi dan program pentahapan pemasaran untuk menarik minat pasar/pelanggan.', 1, 'I.6'),
(166, 'P.10.5.3', 'Melakukan promosi dan paparan pengenalan produk barang/jasa keinsinyuran untuk meyakinkan pelanggan dan pasar.', 1, 'I.6'),
(167, 'P.10.5.4', 'Menyiapkan usulan penawaran produk barang/jasa keinsinyuran secara mandiri atau bersama tim proposal, meliputi proposal teknis, komersial dan kontraktual. ', 1, 'I.6'),
(168, 'P.10.5.5', 'Melaksanakan klasifikasi, negosiasi dan memberikan saran solusi/aplikasi teknis, penjelasan batasan tanggungjawab masing-masing untuk meyakinkan pelanggan sampai terlaksananya transaksi/kontrak penjualan produk barang/jasa ', 1, 'I.6'),
(169, 'P.10.6.1', 'Merumuskan dan menjelaskan batas syarat tanggungjawab jaminan kinerja dan perbaikan kerusakan purna-jual (warranty dan guarantee fee).', 1, 'I.6'),
(170, 'P.10.6.2', 'Melaksanakan pelayanan teknis purna-jual dan mengatasi masalah  teknis, sesuai tanggungjawab kontraktual.', 1, 'I.6'),
(171, 'P.10.6.3', 'Melaksanakan pelatihan pengembangan keahlian tenaga pemakai (operator) dan pemeliharaan produk.', 1, 'I.6'),
(172, 'P.10.6.4', 'Memelihara persediaan suku-cadang dan mengelola sumber daya untuk pelaksanaan pelayanan purna jual.', 1, 'I.6'),
(173, 'P.10.6.5', 'Melakukan pemantauan ke pelanggan untuk meningkatkan kehandalan pemakaian produk dan kepuasan pelanggan.', 1, 'I.6'),
(174, 'W.1.1.1', 'Kesadaran tanggungjawab kecendekiaan dan profesi', 1, 'II.1'),
(175, 'W.1.1.2', 'Mengamalkan nilai dan jiwa Pancasila', 1, 'II.1'),
(176, 'W.1.1.3', 'Berpedoman konstitusi dan perundang-undangan ', 1, 'II.1'),
(177, 'W.1.1.4', 'Kesetiakawanan nasional dan kepedulian sosial ', 1, 'II.1'),
(178, 'W.1.1.5', 'Wawasan kebangsaan dan kemandirian  nasional', 1, 'II.1'),
(179, 'W.1.2.1', ' Tanggungjawab masyarakat di atas tanggungjawab profesi,', 1, 'II.1'),
(180, 'W.1.2.2', 'Menjunjung tinggi kehormatan, martabat dan nilai luhur profesi.', 1, 'II.1'),
(181, 'W.1.2.3', 'Melakukan pekerjaan, hanya dalam batasan kompetensinya.', 1, 'II.1'),
(182, 'W.1.2.4', 'Menerapkan kemampuan profesional dengan penuh amanah.', 1, 'II.1'),
(183, 'W.1.2.5', 'Memberikan pendapat profesi secara obyektif ', 1, 'II.1'),
(184, 'W.1.2.6', 'Pengembangan kemampuan profesional berkelanjutan.', 1, 'II.1'),
(185, 'W.1.2.7', 'Mendorong rekan kerja memajukan pengetahuan dan pengalaman', 1, 'II.1'),
(186, 'W.1.2.8', ' Secara aktif membantu dan mendorong rekan kerjanya untuk memajukan pengetahuan dan pengalaman mereka.', 1, 'II.1'),
(187, 'W.1.3.1', 'Menyadari saling ketergantungan dan keaneka-ragaman lingkungan hidup', 1, 'II.1'),
(188, 'W.1.3.2', 'Menyadari keterbatasan daya dukung lingkungan hidup ', 1, 'II.1'),
(189, 'W.1.3.3', 'Memperbaiki, mempertahankan dan memulihkan  lingkungan hidup.', 1, 'II.1'),
(190, 'W.1.3.4', 'Penggunaan  yang  bijaksana  sumber-daya  tak  terbarukan', 1, 'II.1'),
(191, 'W.1.3.5', 'Penggunaan bahan baku dan enerji secara hemat ', 1, 'II.1'),
(192, 'W.1.3.6', 'Memperhatikan dampak siklus hidup produk dan proyek terhadap lingkungan hidup.', 1, 'II.1'),
(193, 'W.1.3.7', 'Memperhitungkan tindakan keinsinyuran terhadap budaya atau warisan sejarah.', 1, 'II.1'),
(194, 'W.1.4.1', 'Bertanggung jawab atas risiko dan tanggung-gugat (liabilities) profesional', 1, 'II.1'),
(195, 'W.1.4.2', 'Menerapkan persyaratan kesehatan dan keselamatan kerja (K-3).', 1, 'II.1'),
(196, 'W.1.4.3', 'Menyelidiki kebutuhan dan bertindak memecahkan masalah keselamatan masyarakat', 1, 'II.1'),
(197, 'W.1.4.4', 'Tindakan pencegahan pekerjaan  yang berbahaya.', 1, 'II.1'),
(198, 'W.1.4.5', 'Menerapkan kaidah pencegahan, penanganan dan pemulihan bencana alam', 1, 'II.1'),
(199, 'W.1.1.1', 'Kesadaran tanggungjawab kecendekiaan dan profesi', 1, 'II.2'),
(200, 'W.1.1.2', 'Mengamalkan nilai dan jiwa Pancasila', 1, 'II.2'),
(201, 'W.1.1.3', 'Berpedoman konstitusi dan perundang-undangan ', 1, 'II.2'),
(202, 'W.1.1.4', 'Kesetiakawanan nasional dan kepedulian sosial ', 1, 'II.2'),
(203, 'W.1.1.5', 'Wawasan kebangsaan dan kemandirian  nasional', 1, 'II.2'),
(204, 'W.1.2.1', ' Tanggungjawab masyarakat di atas tanggungjawab profesi,', 1, 'II.2'),
(205, 'W.1.2.2', 'Menjunjung tinggi kehormatan, martabat dan nilai luhur profesi.', 1, 'II.2'),
(206, 'W.1.2.3', 'Melakukan pekerjaan, hanya dalam batasan kompetensinya.', 1, 'II.2'),
(207, 'W.1.2.4', 'Menerapkan kemampuan profesional dengan penuh amanah.', 1, 'II.2'),
(208, 'W.1.2.5', 'Memberikan pendapat profesi secara obyektif ', 1, 'II.2'),
(209, 'W.1.2.6', 'Pengembangan kemampuan profesional berkelanjutan.', 1, 'II.2'),
(210, 'W.1.2.7', 'Mendorong rekan kerja memajukan pengetahuan dan pengalaman', 1, 'II.2'),
(211, 'W.1.2.8', ' Secara aktif membantu dan mendorong rekan kerjanya untuk memajukan pengetahuan dan pengalaman mereka.', 1, 'II.2'),
(212, 'W.1.3.1', 'Menyadari saling ketergantungan dan keaneka-ragaman lingkungan hidup', 1, 'II.2'),
(213, 'W.1.3.2', 'Menyadari keterbatasan daya dukung lingkungan hidup ', 1, 'II.2'),
(214, 'W.1.3.3', 'Memperbaiki, mempertahankan dan memulihkan  lingkungan hidup.', 1, 'II.2'),
(215, 'W.1.3.4', 'Penggunaan  yang  bijaksana  sumber-daya  tak  terbarukan', 1, 'II.2'),
(216, 'W.1.3.5', 'Penggunaan bahan baku dan enerji secara hemat ', 1, 'II.2'),
(217, 'W.1.3.6', 'Memperhatikan dampak siklus hidup produk dan proyek terhadap lingkungan hidup.', 1, 'II.2'),
(218, 'W.1.3.7', 'Memperhitungkan tindakan keinsinyuran terhadap budaya atau warisan sejarah.', 1, 'II.2'),
(219, 'W.1.4.1', 'Bertanggung jawab atas risiko dan tanggung-gugat (liabilities) profesional', 1, 'II.2'),
(220, 'W.1.4.2', 'Menerapkan persyaratan kesehatan dan keselamatan kerja (K-3).', 1, 'II.2'),
(221, 'W.1.4.3', 'Menyelidiki kebutuhan dan bertindak memecahkan masalah keselamatan masyarakat', 1, 'II.2'),
(222, 'W.1.4.4', 'Tindakan pencegahan pekerjaan  yang berbahaya.', 1, 'II.2'),
(223, 'W.1.4.5', 'Menerapkan kaidah pencegahan, penanganan dan pemulihan bencana alam', 1, 'II.2'),
(224, 'W.2.1.1', 'Gagasan sendiri dalam sintesa pemecahan masalah keinsinyuran.', 1, 'III.1'),
(225, 'W.2.1.2', 'Kearifan profesional dalam keputusan keinsinyuran.', 1, 'III.1'),
(226, 'W.2.1.3', 'Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1, 'III.1'),
(227, 'W.2.1.4', 'Mengenali dan menanggulangi masalah keinsinyuran.', 1, 'III.1'),
(228, 'W.2.1.5', 'Memperluas pengetahuan dan memupuk kerjasama antar kejuruan', 1, 'III.1'),
(229, 'W.2.1.6', 'Menyelidiki kebutuhan dan memanfaatkan peluang dalam pekerjaan atau bidang kejuruan.', 1, 'III.1'),
(230, 'W.2.2.1', 'Menyadari keterbatasan kepakaran dan pengetahuan dirinya ', 1, 'III.1'),
(231, 'W.2.2.2', 'Mencari informasi perkembangan teknologi atau kemajuan lainnya', 1, 'III.1'),
(232, 'W.2.2.3', 'Membaca majalah profesional, mengikuti seminar dan menjalin kerjasama antar profesional.', 1, 'III.1'),
(233, 'W.2.2.4', 'Melakukan penelitian dan percobaan untuk menyelesaikan masalah keinsinyuran', 1, 'III.1'),
(234, 'W.2.2.5', 'Memanfaatkan pengalaman untuk pengembangan keprofesionalannya.', 1, 'III.1'),
(235, 'W.2.2.6', 'Pencatatan mengenai kegiatan pengembangan keprofesionalannya.', 1, 'III.1'),
(236, 'W.2.3.1', 'Pengenalan kerekayasaan ', 1, 'III.1'),
(237, 'W.2.3.2', 'Pembuatan konsep penerapan kerekayasaan', 1, 'III.1'),
(238, 'W.2.3.3', 'Perincian penerapan kerekayasaan yang dipilih.', 1, 'III.1'),
(239, 'W.2.3.4', 'Pemutakhiran dokumentasi hasil-hasil penerapannya.', 1, 'III.1'),
(240, 'W.2.3.5', 'Pengkajian persyaratan bagi diperolehnya persetujuan penerapan kerekayasaan ', 1, 'III.1'),
(241, 'W.2.4.1', ' Pengembangan sistem mutu.', 1, 'III.1'),
(242, 'W.2.4.2', ' Mendorong penerapan kaidah penjaminan mutu ke rekan kerja dan anak-buah.', 1, 'III.1'),
(243, 'W.2.4.3', 'Melaksanakan setiap pekerjaan sesuai dengan bakuan mutu yang tepat.', 1, 'III.1'),
(244, 'W.2.4.4', 'Menerapkan tatacara kendali mutu dan penjaminan mutu.', 1, 'III.1'),
(245, 'W.2.5.1', 'Memilih dan menggunakan analisis matematik, ilmu keinsinyuran, simulasi komputer atau teknik pemodelan lainnya.', 1, 'III.1'),
(246, 'W.2.5.2', 'Memilih dan memanfaatkan penerapan  sistem komputer.', 1, 'III.1'),
(247, 'W.2.5.3', 'Mengarahkan dan melaksanakan tugas-tugas pemrograman dan penggunaan perangkat lunak.', 1, 'III.1'),
(248, 'W.2.5.4', 'Memilih dan menggunakan alat bantu teknologi dan memantau kinerjanya.', 1, 'III.1'),
(249, 'W.2.6.1', 'Merumuskan tujuan uji-coba.', 1, 'III.1'),
(250, 'W.2.6.2', 'Menyusun tatacara dan jadwal uji-coba.', 1, 'III.1'),
(251, 'W.2.6.3', 'Mengembangkan tatacara dan alat-alat pengukuran.', 1, 'III.1'),
(252, 'W.2.6.4', 'Melaksanakan uji-coba  dan pengukuran untuk kerja keinsinyuran yang kritis.', 1, 'III.1'),
(253, 'W.2.6.5', 'Mengawasi uji-coba  dan pengukuran untuk kerja yang tidak kritis.', 1, 'III.1'),
(254, 'W.2.6.6', 'Mengkaji-nilai hasil uji-coba  dan pengukuran.', 1, 'III.1'),
(255, 'W.3.1.1', 'Merundingkan spesifikasi awal atau pedoman rancangan (design brief) ditinjau dari keinginan pemberi tugas maupun keterbatasan kerekayasaan.', 1, 'III.1'),
(256, 'W.3.1.2', 'Melakukan analisis atas kebutuhan rancangan  fungsional.', 1, 'III.1'),
(257, 'W.3.1.3', 'Memenuhi parameter perancangan seperti kinerja, keandalan, kemudahan pemeliharaan dan ergonomik.', 1, 'III.1'),
(258, 'W.3.1.4', 'Menentukan dampak atas rancangan yang di akibatkan oleh faktor-faktor produksi, konstruksi, pemasangan, uji-pakai, implikasi siklus hidup,', 1, 'III.1'),
(259, 'W.3.1.5', 'Menentukan kendala yang mungkin ada, seperti tanggungjawab perdata atas produk, pengaruh lingkup fisik atas bagian yang dirancang, atau pengaruh bagian tersebut terhadap lingkungan, dan kemudian mengambil langkah tindak-lanjut yang tepat ', 1, 'III.1'),
(260, 'W.3.1.6', 'Menggunakan bakuan dan spesifikasi perancangan keinsinyuran dan menyusun spesifikasi ke-fungsi-an untuk rancangannya.', 1, 'III.1'),
(261, 'W.3.2.1', 'Menggunakan kreatifitas dan inisiatifnya dalam menyelidiki, menganalisis dan menyusun konsep-konsep bagi memenuhi tujuan rancangan.', 1, 'III.1'),
(262, 'W.3.2.2', 'Menganalisis konsep-konsep yang berkemungkinan menjadi rancangan akhir untuk mengkaji dampak faktor-faktor seperti kinerja, keandalan dan                   kemudahan pemeliharaan', 1, 'III.1'),
(263, 'W.3.2.3', 'Menemu-kenali  masalah yang mungkin timbul dan merundingkan kemungkinan  perubahan atau penyesuaian atas pedoman rancangan.', 1, 'III.1'),
(264, 'W.3.2.4', 'Melakukan analisis biaya-manfaat dan risiko, studi kelayakan dan pembiayaan siklus hidup untuk menghasilkan suatu rancangan yang layak dilaksanakan.', 1, 'III.1'),
(265, 'W.3.2.5', 'Menyiapkan dan merekomendasikan pelaksanaan suatu usulan yang memenuhi persyaratan pemberi tugas atau pelaksana manufaktur.', 1, 'III.1'),
(266, 'W.3.3.1', 'Melaksanakan atau mengatur pelaksanaan pekerjaan perancangan yang cukup berbobot.', 1, 'III.1'),
(267, 'W.3.3.2', 'Melaksanakan atau mengatur pelaksanaan analisis  untuk memilih komponen dan bahan material sesuai rancangan.', 1, 'III.1'),
(268, 'W.3.3.3', 'Menyiapkan dan memeriksa spesifikasi teknis sesuai rancangan.', 1, 'III.1'),
(269, 'W.3.4.1', ' Memaparkan rancangan secara langsung atau dengan model komputer.', 1, 'III.1'),
(270, 'W.3.4.2', ' Menyiapkan jadwal pengujian rancangan untuk uji kinerja dan lingkup fisik.', 1, 'III.1'),
(271, 'W.3.4.3', 'Mengawasi pengujian rancangan, analisis hasil pengujian dan mengajukan saran perbaikan.', 1, 'III.1'),
(272, 'W.3.4.4', 'Mengkaji dampak rancangan pada kondisi sekeliling.', 1, 'III.1'),
(273, 'W.3.4.5', ' Memaparkan hasil pengkajian dampak rancangan pada pihak-pihak terkait.', 1, 'III.1'),
(274, 'W.3.5.1', 'Menyiapkan dokumen penunjang rancangan untuk produksi atau konstruksi, pemasangan, operasi, pemeliharaan dan pelatihan.', 1, 'III.1'),
(275, 'W.3.5.2', 'Menyunting dan memeriksa dokumen pendukung.', 1, 'III.1'),
(276, 'W.3.6.1', 'Menerapkan tata identifikasi rancangan dengan cara-cara dokumentasi dan pencatatan yang tepat.', 1, 'III.1'),
(277, 'W.3.6.2', 'Menetapkan tatacara pengendalian dokumentasi dan catatan dalam melakukan perubahan rancangan.', 1, 'III.1'),
(278, 'W.3.6.3', 'Memastikan bahwa seluruh tata identifikasi rancangan tetap terjaga sebagai uraian yang benar sepanjang proses perancangan dan konstruksi', 1, 'III.1'),
(279, 'W.3.6.4', 'Mengawasi pelaksanaan penggambaran-ulang rancangan, sesuai dengan kenyataan dalam pelaksanaan konstruksi (as-built) atau pelaksanaan produksi (as-manufactured) ', 1, 'III.1'),
(280, 'P.7.1.1', 'Memberikan nasihat/konsultansi kepada pemimpin proyek.', 1, 'III.1'),
(281, 'P.7.1.2', 'Menyusun studi kelayakan dan rencana dasar (master plan).', 1, 'III.1'),
(282, 'P.7.1.3', 'Menyiapkan pedoman perancangan (design guidelines) perekayasaan  berdasarkan uraian kebutuhan pemberi tugas.', 1, 'III.1'),
(283, 'P.7.1.4', 'Menyiapkan rancangan pendahuluan, pengembangannya dan rancangan terinci (detailed design) perekayasaan, agar pemilik proyek dapat melakukan pelelangan. ', 1, 'III.1'),
(284, 'P.7.1.5', 'Melakukan tugas pemantauan kemajuan proyek, menyelidiki penyimpangan dari jadwal dan memulai tindakan perbaikan  yang perlu.', 1, 'III.1'),
(285, 'P.7.1.6', 'Mengembangkan uraian  rincian pekerjaan yang terstruktur serta menyiapkan jalur kritis (critical path) pada jadwal pelaksanaan proyek.', 1, 'III.1'),
(286, 'P.7.2.1', 'Menyiapkan jadwal pelelangan.', 1, 'III.1'),
(287, 'P.7.2.2', 'Mengkaji-nilai jadwal pelelangan.', 1, 'III.1'),
(288, 'P.7.2.3', 'Menyiapkan pelelangan.', 1, 'III.1'),
(289, 'P.7.2.4', 'Mengkaji-nilai penawaran.', 1, 'III.1'),
(290, 'P.7.2.5', 'Menyiapkan kontrak.', 1, 'III.1'),
(291, 'P.7.2.6', 'Mengusahakan pemenuhan terhadap persyaratan kontrak.', 1, 'III.1'),
(292, 'P.7.2.7', 'Memantau kemajuan pekerjaan dan menyelidiki penyimpangan terhadap persyaratan kontrak.', 1, 'III.1'),
(293, 'P.7.2.8', 'Memantau kinerja kontraktor dan menyelidiki penyimpangan terhadap persyaratan kontrak.', 1, 'III.1'),
(294, 'P.7.2.9', 'Menyelidiki kinerja kontraktor untuk merekomendasi berita-acara pembayaran untuk disetujui.', 1, 'III.1'),
(295, 'P.7.2.10', '  Menyiapkan laporan kemajuan pekerjaan untuk pemberi tugas.', 1, 'III.1'),
(296, 'P.7.3.1', 'Menyiapkan spesifikasi dan jadwal pekerjaan  konstruksi/instalasi.', 1, 'III.1'),
(297, 'P.7.3.2', 'Menyusun pentahapan pekerjaan konstruksi/instalasi.', 1, 'III.1'),
(298, 'P.7.3.3', 'Menyusun spesifikasi sarana dan jasa-jasa  yang dibutuhkan untuk pekerjaan konstruksi/instalasi.', 1, 'III.1'),
(299, 'P.7.3.4', 'Mengawasi pekerjaan konstruksi/instalasi.', 1, 'III.1'),
(300, 'P.7.3.5', 'Memastikan bahwa pekerjaan konstruksi/instalasi telah selesai dengan memuaskan untuk di-berita-acara-kan.', 1, 'III.1'),
(301, 'P.7.4.1', 'Melaksanakan tugas pengelolaan kerja lapangan untuk pekerjaan konstruksi/instalasi.', 1, 'III.1'),
(302, 'P.7.4.2', 'Melakukan tugas pemesanan bahan material, peralatan dan jasa pendukungnya.', 1, 'III.1'),
(303, 'P.7.4.3', 'Mengembangkan tatalaksana kerja.', 1, 'III.1'),
(304, 'P.7.4.4', 'Mengawasi penanganan bahan material di lapangan.', 1, 'III.1'),
(305, 'P.7.5.1', 'Melaksanakan tugas pengembangan program penerimaan hasil pekerjaan.', 1, 'III.1'),
(306, 'P.7.5.2', 'Melaksanakan program commissioning dan tugas pengawasannya.', 1, 'III.1'),
(307, 'P.7.5.3', 'Memastikan bahwa pekerjaan commissioning telah selesai dengan memuaskan untuk di-berita-acara-kan.', 1, 'III.1'),
(308, 'P.5.1.1', 'Menemu-kenali kebutuhan pengajaran dan atau pelatihan.', 1, 'III.2'),
(309, 'P.5.1.2', 'Merencanakan pengajaran untuk pendidikan tingkat lanjutan atau rencana pelatihan keinsinyuran  untuk suatu lembaga  pelatihan.', 1, 'III.2'),
(310, 'P.5.1.3', 'Mengembangkan program pelatihan kerja praktek.', 1, 'III.2'),
(311, 'P.5.1.4', 'Mengembangkan kurikulum, silabus atau latihan keinsinyuran.', 1, 'III.2'),
(312, 'P.5.2.1', 'Mengembangkan proses belajar-mengajar  untuk pendidikan dan pelatihan keinsinyuran.', 1, 'III.2'),
(313, 'P.5.2.2', 'Mengembangkan rencana pengembangan pengalaman kerja.', 1, 'III.2'),
(314, 'P.5.2.3', 'Mengelola program dalam mana siswa atau peserta latihan memperoleh teori keinsinyuran dan pengalaman praktis.', 1, 'III.2'),
(315, 'P.5.2.4', 'Melaksanakan secara efektif kegiatan pengajaran, pengembangan, dan belajar dalam bentuk yang paling tepat untuk sesuatu keadaan.', 1, 'III.2'),
(316, 'P.5.2.5', 'Menggunakan secara efektif teknologi pendidikan dan pelatihan untuk mendukung pengajaran, pengembangan dan proses belajar dalam program pendidikan atau pelatihan keinsinyuran. ', 1, 'III.2'),
(317, 'P.5.2.6', 'Mengembangkan kandungan khas suatu program pelatihan keinsinyuran melalui penelitian, pengkajian, percobaan dan sebagainya.', 1, 'III.2'),
(318, 'P.5.2.7', 'Menguji peserta pendidikan dan latihan keinsinyuran secara formatif dan sumatif.', 1, 'III.2'),
(319, 'P.5.2.8', 'Menilai kedaya-gunaan program pendidikan dan atau pelatihan keinsinyuran.', 1, 'III.2'),
(320, 'P.5.2.9', 'Mengkaji-ulang program pendidikan dan atau pelatihan keinsinyuran.', 1, 'III.2'),
(321, 'P.6.1.1', 'Mengidentifikasi kebutuhan penelitian.', 1, 'III.3'),
(322, 'P.6.1.2', 'Melakukan kajian pustaka.', 1, 'III.3'),
(323, 'P.6.1.3', 'Melakukan penelitian dasar dan atau terapan.', 1, 'III.3'),
(324, 'P.6.1.4', 'Mencari pengetahuan baru.', 1, 'III.3'),
(325, 'P.6.1.5', 'Menemu-kenali dan menyampaikan hasil penelitian.', 1, 'III.3'),
(326, 'P.6.2.1', 'Menemu-kenali kebutuhan pengembangan.', 1, 'III.3'),
(327, 'P.6.2.2', 'Memeriksa konsep-konsep yang mempunyai kemungkinan untuk dilaksanakan.', 1, 'III.3'),
(328, 'P.6.2.3', 'Memilih konsep yang akan dikembangkan lebih lanjut.', 1, 'III.3'),
(329, 'P.6.3.1', 'Merumuskan kebutuhan akhir pemakai.', 1, 'III.3'),
(330, 'P.6.3.2', 'Menyiapkan usulan untuk mencari sumber daya bagi pengembangan.', 1, 'III.3'),
(331, 'P.6.3.3', 'Menyiapkan perkiraan biaya untuk pengembangan, perancangan, produksi atau konstruksi, dan operasi.', 1, 'III.3'),
(332, 'P.6.4.1', 'Merumuskan ciri-ciri  produk yang diinginkan pasar.', 1, 'III.3'),
(333, 'P.6.4.2', 'Mengumpulkan informasi dan membuat rekomendasi untuk menentukan harga produk.', 1, 'III.3'),
(334, 'P.6.4.3', 'Membuat rekomendasi mengenai distribusi produk.', 1, 'III.3'),
(335, 'P.6.4.4', 'Membuat rekomendasi untuk mempromosikan produk.', 1, 'III.3'),
(336, 'P.6.5.1', 'Melakukan kaji-nilai  ekonomis atas produk hasil penelitian dan pengembangan.', 1, 'III.3'),
(337, 'P.6.5.2', 'Memilih mekanisme yang cocok untuk memasarkan produk hasil penelitian dan pengembangan.', 1, 'III.3'),
(338, 'P.6.5.3', 'Menyiapkan model peragaan untuk membuktikan kelayakan teknis dan komersial.', 1, 'III.3'),
(339, 'P.6.5.4', 'Mengembangkan rencana proyek percontohan untuk membuktikan kelayakan teknis dan komersial.', 1, 'III.3'),
(340, 'P.9.1.1', 'Menemu-kenali ciri-ciri utama suatu kelompok bahan material atau komponen untuk penggunaan tertentu,  dan kemungkinan bahan penggantinya.', 1, 'III.3'),
(341, 'P.9.1.2', 'Mengkaji penggunaan yang tepat bagi  bahan material atau komponen untuk penggunaan tertentu.', 1, 'III.3'),
(342, 'P.9.1.3', 'Membentuk hubungan dengan kejuruan  lain untuk dapat memperoleh bantuan kepakaran.', 1, 'III.3'),
(343, 'P.9.1.4', 'Mempelajari peluang untuk daur  ulang.', 1, 'III.3'),
(344, 'P.9.1.5', 'Mempelajari bahaya terhadap lingkungan atau bahaya lainnya dalam penggunaan atau pembuangan bahan material atau komponen sisa/berlebih.', 1, 'III.3'),
(345, 'P.9.2.1', 'Mencari lokasi sumber bahan baku yang sesuai.', 1, 'III.3'),
(346, 'P.9.2.2', 'Memilih bahan atau komponen yang biaya pengadaannya terjangkau.', 1, 'III.3'),
(347, 'P.9.3.1', 'Menetapkan tatacara penyiapan bahan material.', 1, 'III.3'),
(348, 'P.9.3.2', 'Menentukan interaksi antara berbagai bahan material atau komponen.', 1, 'III.3'),
(349, 'P.9.3.3', 'Melakukan kegiatan pengendalian proses.', 1, 'III.3'),
(350, 'P.9.4.1', 'Menemu-kenali rona lingkungan operasi.', 1, 'III.3'),
(351, 'P.9.4.2', 'Menemu-kenali persyaratan  pengujian bahan material atau komponen.', 1, 'III.3'),
(352, 'P.9.4.3', 'Melakukan atau mengawasi, dan mengkaji-nilai hasil pengujian di lapangan dan di laboratorium.', 1, 'III.3'),
(353, 'P.9.4.4', 'Memberikan pengarahan dalam pemeliharaan dan kalibrasi sarana pengujian.', 1, 'III.3'),
(354, 'P.9.4.5', 'Menyiapkan, menyetujui dan mensahkan laporan pengujian.', 1, 'III.3'),
(355, 'P.9.4.6', 'Merekomendasikan bahan material atau komponen untuk pemakaian-pemakaian yang khas.', 1, 'III.3'),
(356, 'P.9.5.1', 'Menemu-kenali penyebab penurunan mutu seperti aus, korosi, kelelahan dan radiasi ultraviolet.', 1, 'III.3'),
(357, 'P.9.5.2', 'Menggunakan teknik-teknik untuk mengurangi penurunan mutu dan mencegah kegagalan dini.', 1, 'III.3'),
(358, 'P.9.5.3', 'Menggunakan teknik-teknik untuk melihat  gejala adanya kemungkinan  kegagalan.', 1, 'III.3'),
(359, 'P.9.5.4', 'Memilih cara perlakuan (treatment) bahan material yang tepat, seperti perlakuan panas, perlakuan permukaan, dsb.', 1, 'III.3'),
(360, 'P.7.1.1', 'Memberikan nasihat/konsultansi kepada pemimpin proyek.', 1, 'III.4'),
(361, 'P.7.1.2', 'Menyusun studi kelayakan dan rencana dasar (master plan).', 1, 'III.4'),
(362, 'P.7.1.3', 'Menyiapkan pedoman perancangan (design guidelines) perekayasaan  berdasarkan uraian kebutuhan pemberi tugas.', 1, 'III.4'),
(363, 'P.7.1.4', 'Menyiapkan rancangan pendahuluan, pengembangannya dan rancangan terinci (detailed design) perekayasaan, agar pemilik proyek dapat melakukan pelelangan. ', 1, 'III.4'),
(364, 'P.7.1.5', 'Melakukan tugas pemantauan kemajuan proyek, menyelidiki penyimpangan dari jadwal dan memulai tindakan perbaikan  yang perlu.', 1, 'III.4'),
(365, 'P.7.1.6', 'Mengembangkan uraian  rincian pekerjaan yang terstruktur serta menyiapkan jalur kritis (critical path) pada jadwal pelaksanaan proyek.', 1, 'III.4'),
(366, 'P.7.2.1', 'Menyiapkan jadwal pelelangan.', 1, 'III.4'),
(367, 'P.7.2.2', 'Mengkaji-nilai jadwal pelelangan.', 1, 'III.4'),
(368, 'P.7.2.3', 'Menyiapkan pelelangan.', 1, 'III.4'),
(369, 'P.7.2.4', 'Mengkaji-nilai penawaran.', 1, 'III.4'),
(370, 'P.7.2.5', 'Menyiapkan kontrak.', 1, 'III.4'),
(371, 'P.7.2.6', 'Mengusahakan pemenuhan terhadap persyaratan kontrak.', 1, 'III.4'),
(372, 'P.7.2.7', 'Memantau kemajuan pekerjaan dan menyelidiki penyimpangan terhadap persyaratan kontrak.', 1, 'III.4'),
(373, 'P.7.2.8', 'Memantau kinerja kontraktor dan menyelidiki penyimpangan terhadap persyaratan kontrak.', 1, 'III.4'),
(374, 'P.7.2.9', 'Menyelidiki kinerja kontraktor untuk merekomendasi berita-acara pembayaran untuk disetujui.', 1, 'III.4'),
(375, 'P.7.2.10', '  Menyiapkan laporan kemajuan pekerjaan untuk pemberi tugas.', 1, 'III.4'),
(376, 'P.7.3.1', 'Menyiapkan spesifikasi dan jadwal pekerjaan  konstruksi/instalasi.', 1, 'III.4'),
(377, 'P.7.3.2', 'Menyusun pentahapan pekerjaan konstruksi/instalasi.', 1, 'III.4'),
(378, 'P.7.3.3', 'Menyusun spesifikasi sarana dan jasa-jasa  yang dibutuhkan untuk pekerjaan konstruksi/instalasi.', 1, 'III.4'),
(379, 'P.7.3.4', 'Mengawasi pekerjaan konstruksi/instalasi.', 1, 'III.4'),
(380, 'P.7.3.5', 'Memastikan bahwa pekerjaan konstruksi/instalasi telah selesai dengan memuaskan untuk di-berita-acara-kan.', 1, 'III.4'),
(381, 'P.7.4.1', 'Melaksanakan tugas pengelolaan kerja lapangan untuk pekerjaan konstruksi/instalasi.', 1, 'III.4'),
(382, 'P.7.4.2', 'Melakukan tugas pemesanan bahan material, peralatan dan jasa pendukungnya.', 1, 'III.4'),
(383, 'P.7.4.3', 'Mengembangkan tatalaksana kerja.', 1, 'III.4'),
(384, 'P.7.4.4', 'Mengawasi penanganan bahan material di lapangan.', 1, 'III.4'),
(385, 'P.7.5.1', 'Melaksanakan tugas pengembangan program penerimaan hasil pekerjaan.', 1, 'III.4'),
(386, 'P.7.5.2', 'Melaksanakan program commissioning dan tugas pengawasannya.', 1, 'III.4'),
(387, 'P.7.5.3', 'Memastikan bahwa pekerjaan commissioning telah selesai dengan memuaskan untuk di-berita-acara-kan.', 1, 'III.4'),
(388, 'P.8.1.1', 'Menganalisis tata-letak pabrik atau sistem dan aliran kerja dan mengambil langkah-langkah untuk mengoptimasikan fleksibilitas dan efisiensi.', 1, 'III.4'),
(389, 'P.8.1.2', 'Menerapkan kaidah-kaidah  perencanaan manajemen.', 1, 'III.4'),
(390, 'P.8.1.3', 'Memantau operasi proses dan mengubahnya di mana perlu  untuk memperbaiki keluaran (output).', 1, 'III.4'),
(391, 'P.8.1.4', 'Menggunakan berbagai cara analisis seperti analisis lintasan kritis, garis keseimbangan dan programa  linier.', 1, 'III.4'),
(392, 'P.8.1.5', 'Mengatur hubungan kerja antara  bagian perencanaan produksi dengan tim perancang produk.', 1, 'III.4'),
(393, 'P.8.1.6', 'Membangun barisan kerja untuk pekerjaan manufaktur.', 1, 'III.4'),
(394, 'P.8.1.7', 'Melakukan tugas analisis biaya terhadap proses manufaktur.', 1, 'III.4'),
(395, 'P.8.2.1', 'Memantau dan mengatur  kinerja proses produksi/manufaktur.', 1, 'III.4'),
(396, 'P.8.2.2', 'Mencari dan melaksanakan cara-cara baru  untuk perbaikan terus-menerus atas proses manufaktur.', 1, 'III.4'),
(397, 'P.8.2.3', 'Menerapkan kaidah  pengendalian mutu.', 1, 'III.4'),
(398, 'P.8.2.4', 'Memulai langkah perbaikan  untuk menurunkan tingkat kegagalan produk atau kemacetan sistem produksi.', 1, 'III.4'),
(399, 'P.8.2.5', 'Mengembangkan tatalaksana kerja yang khas.', 1, 'III.4'),
(400, 'P.8.2.6', 'Menilai kinerja dan kehandalan pemasok.', 1, 'III.4'),
(401, 'P.8.3.1', 'Memperhalus dan mengoptimasikan pengendalian operasi dan proses.', 1, 'III.4'),
(402, 'P.8.3.2', 'Melaksanakan tugas operasi dan pengendalian proses.', 1, 'III.4'),
(403, 'P.8.3.3', 'Melaksanakan tugas  analisis nilai kerja.', 1, 'III.4'),
(404, 'P.8.3.4', 'Melaksanakan tugas pemeriksaan dan penyelesaian masalah-masalah  manufaktur atau proses.', 1, 'III.4'),
(405, 'P.8.3.5', 'Mengembangkan dan melaksanakan proses produksi manufaktur yang fleksibel.', 1, 'III.4'),
(406, 'P.8.3.6', 'Mengembangkan dan melaksanakan tatalaksana ergonomi  dan keselamatan pabrik.', 1, 'III.4'),
(407, 'P.8.4.1', 'Mengembangkan tatacara penyediaan dan penanganan  bahan baku.', 1, 'III.4'),
(408, 'P.8.4.2', 'Menyusun spesifikasi, mengadakan/membeli dan mengalokasikan bahan baku.', 1, 'III.4'),
(409, 'P.8.4.3', 'Melakukan program optimasi pemakaian bahan baku.', 1, 'III.4'),
(410, 'P.8.5.1', 'Mengukur keluaran proses manufaktur dari segi jumlah, mutu dan harga untuk menilai apakah sasaran produksi telah tercapai.', 1, 'III.4'),
(411, 'P.8.5.2', 'Menganalisis produktifitas untuk menentukan di bagian mana dapat dilakukan perbaikan.', 1, 'III.4'),
(412, 'P.8.5.3', 'Menganalisis pemakaian bahan baku dan bahan pakai-habis (consumables) untuk meningkatkan  efisiensi dan memperbaiki pelayanan sarana pendukung', 1, 'III.4'),
(413, 'P.8.5.4', 'Menganalisis tatacara produksi secara umum untuk meningkatkan  efisiensi.', 1, 'III.4'),
(414, 'P.10.1.1', ' Menetapkan dan melaksanakan tujuan dan prioritas kerja.', 1, 'III.5'),
(415, 'P.10.1.2', 'Merumuskan metoda pendekatan untuk pengelolaan sumber-daya.', 1, 'III.5'),
(416, 'P.10.1.3', 'Melakukan analisis rincian tugas (work breakdown analysis) sehingga tersedia dasar bagi perhitungan kebutuhan  sumber-daya.', 1, 'III.5'),
(417, 'P.10.1.4', 'Membuat perkiraan kebutuhan waktu, biaya, bahan dan sumber-daya lainnya untuk suatu pekerjaan.', 1, 'III.5'),
(418, 'P.10.2.1', 'Mematuhi ketentuan kesehatan dan keselamatan kerja.', 1, 'III.5'),
(419, 'P.10.2.2', 'Menemu-kenali dan menentukan kebutuhan pelatihan bagi tenaga kerja teknis di tempat pekerjaan.', 1, 'III.5'),
(420, 'P.10.2.3', 'Melaksanakan program pengembangan pengalaman kerja untuk bawahan, termasuk pelatihan-ulang, penyesuaian pada teknologi baru dan pengembangan ketrampilan. ', 1, 'III.5'),
(421, 'P.10.2.4', 'Mengkaji efektifitas program pelatihan di tempat kerja.', 1, 'III.5'),
(422, 'P.10.2.5', 'Merumuskan kebutuhan pelatihan tenaga kerja non-teknis.', 1, 'III.5'),
(423, 'P.10.3.1', 'Melakukan tugas  kaji-nilai ekonomis atas pekerjaan yang dilaksanakan.', 1, 'III.5'),
(424, 'P.10.3.2', 'Memahami dampak hukum dari tiap pekerjaan yang dilaksanakan.', 1, 'III.5'),
(425, 'P.10.3.3', 'Memahami, menafsirkan dan menerapkan peraturan yang tepat.', 1, 'III.5'),
(426, 'P.10.3.4', 'Menilai kebutuhan pemasaran dan memberikan saran untuk strategi pemasaran.', 1, 'III.5'),
(427, 'P.10.3.5', 'Mengerjakan tugas pengelolaan  risiko.', 1, 'III.5'),
(428, 'P.10.3.6', 'Memahami kebutuhan kewira-usahaan suatu perusahaan dan bertindak sesuai kebutuhan tersebut dalam hal biaya, waktu dan faktor-faktor lainnya.', 1, 'III.5'),
(429, 'P.10.3.7', 'Mengkaji dan menyiapkan rencana usaha.', 1, 'III.5'),
(430, 'P.10.4.1', 'Menyiapkan dokumen, brosur, uraian teknis dan  spesifikasi mengenai produk barang/jasa keinsinyuran  untuk keperluan pemasaran.', 1, 'III.5'),
(431, 'P.10.4.2', 'Menyiapkan dokumen, pedoman, buku panduan untuk pemakaian operasi, pemeliharaan,  penyetelan dan perbaikan atas produk barang/jasa oleh konsumen. ', 1, 'III.5'),
(432, 'P.10.4.3', 'Melakukan pengamatan atas kebutuhan pasar/pelanggan masa-depan terhadap  penyempurnaan dan menemu-kenali perubahan/pembaharuan yang perlu atas produk barang/jasa. ', 1, 'III.5'),
(433, 'P.10.4.4', 'Memantau dan mengikuti kinerja dan keandalan produk barang/peralatan dan jasa yang dipakai pelanggan dan melakukan perbaikan dan penyempurnaan untuk kepuasan pelanggan. ', 1, 'III.5'),
(434, 'P.10.5.1', 'Menyiapkan dan melakukan kajian kebutuhan pasar akan barang/jasa keinsinyuran yang hendak dipasarkan.', 1, 'III.5'),
(435, 'P.10.5.2', 'Menyiapkan strategi dan program pentahapan pemasaran untuk menarik minat pasar/pelanggan.', 1, 'III.5'),
(436, 'P.10.5.3', 'Melakukan promosi dan paparan pengenalan produk barang/jasa keinsinyuran untuk meyakinkan pelanggan dan pasar.', 1, 'III.5'),
(437, 'P.10.5.4', 'Menyiapkan usulan penawaran produk barang/jasa keinsinyuran secara mandiri atau bersama tim proposal, meliputi proposal teknis, komersial dan kontraktual. ', 1, 'III.5'),
(438, 'P.10.5.5', 'Melaksanakan klasifikasi, negosiasi dan memberikan saran solusi/aplikasi teknis, penjelasan batasan tanggungjawab masing-masing untuk meyakinkan pelanggan sampai terlaksananya transaksi/kontrak penjualan produk barang/jasa ', 1, 'III.5'),
(439, 'P.10.6.1', 'Merumuskan dan menjelaskan batas syarat tanggungjawab jaminan kinerja dan perbaikan kerusakan purna-jual (warranty dan guarantee fee).', 1, 'III.5'),
(440, 'P.10.6.2', 'Melaksanakan pelayanan teknis purna-jual dan mengatasi masalah  teknis, sesuai tanggungjawab kontraktual.', 1, 'III.5'),
(441, 'P.10.6.3', 'Melaksanakan pelatihan pengembangan keahlian tenaga pemakai (operator) dan pemeliharaan produk.', 1, 'III.5'),
(442, 'P.10.6.4', 'Memelihara persediaan suku-cadang dan mengelola sumber daya untuk pelaksanaan pelayanan purna jual.', 1, 'III.5'),
(443, 'P.10.6.5', 'Melakukan pemantauan ke pelanggan untuk meningkatkan kehandalan pemakaian produk dan kepuasan pelanggan.', 1, 'III.5'),
(444, 'P.11.1.1', 'Menyiapkan dan mengembangkan kebijakan umum melalui pendekatan pengembangan wilayah.', 1, 'III.5'),
(445, 'P.11.1.2', 'Menyiapkan dan mengembangkan kebijakan umum dengan mengacu pada kelestarian lingkungan.', 1, 'III.5'),
(446, 'P.11.1.3', 'Menyiapkan dan mengembangkan kebijakan umum peningkatan kemampuan rancang-bangun dan perekayasaan produk-produk berbasiskan sumber-daya untuk memacu ekspor.', 1, 'III.5'),
(447, 'P.11.1.4', 'Menyusun suatu rancangan teknis yang mendorong peningkatan keterpaduan antar sektor pembangunan.', 1, 'III.5'),
(448, 'P.11.1.5', 'Menyusun perencanaan dan atau program (master plan, perencanaan jangka panjang/pendek, dsb.) untuk mendukung pengembangan daerah, termasuk perkotaan. ', 1, 'III.5'),
(449, 'P.11.2.1', 'Menyiapkan kebijakan teknis yang mendorong peran serta swasta dan masyarakat dalam pembangunan sektor-sektor publik.', 1, 'III.5'),
(450, 'P.11.2.2', 'Mengembangkan sistem manajemen teknis yang efektif dan efisien sehingga diperoleh produk perencanaan yang matang, pelaksanaan yang               tepat dan pengawasan yang ketat. ', 1, 'III.5'),
(451, 'P.11.2.3', 'Menyiapkan upaya-upaya penajaman prioritas pelaksanaan pembangunan guna memanfaatkan sumber-daya yang terbatas secara optimal.', 1, 'III.5'),
(452, 'P.11.3.1', 'Membuat peraturan/pedoman pembangunan dan penggunaan prasarana dan sarana umum bagi peningkatan jaminan keselamatan dan kesejahteraan masyarakat ', 1, 'III.5'),
(453, 'P.11.3.2', 'Mengembangkan rancangan teknologi tepat-guna, yang mempertimbangkan kemudahan dan kesinambungan operasi dan pemeliharaan.', 1, 'III.5'),
(454, 'P.11.3.3', 'Mengembangkan rancangan  teknologi sederhana yang sesuai untuk daerah pedesaan dan mendukung upaya pengentasan kemiskinan serta menciptakan lapangan kerja ketrampilan rendah. ', 1, 'III.5'),
(455, 'P.11.3.4', 'Mengembangkan rancangan teknis untuk membuka dan meningkatkan pertumbuhan daerah terpencil, terkucil  dan perbatasan.', 1, 'III.5'),
(456, 'P.11.4.1', 'Menemu-kenali kebutuhan akan aset baru.', 1, 'III.5'),
(457, 'P.11.4.2', 'Menyiapkan spesifikasi atau uraian untuk usulan pengadaan aset baru.', 1, 'III.5'),
(458, 'P.11.4.3', 'Melaksanakan kegiatan pengadaan aset.', 1, 'III.5'),
(459, 'P.11.4.4', 'Melaksanakan pengujian untuk penerimaan pada saat penyerahan.', 1, 'III.5'),
(460, 'P.11.5.1', 'Merumuskan parameter kinerja aset.', 1, 'III.5'),
(461, 'P.11.5.2', 'Menyiapkan petunjuk operasi dan melatih operator.', 1, 'III.5'),
(462, 'P.11.5.3', 'Merencanakan dan melakukan tugas pemantauan kondisi aset.', 1, 'III.5'),
(463, 'P.11.5.4', 'Mengawasi pengoperasian sistem-sistem aset.', 1, 'III.5'),
(464, 'P.11.5.5', 'Mengatur pengoperasian aset untuk menjamin pelayanan.', 1, 'III.5'),
(465, 'P.11.5.6', 'Mempelajari kemungkinan memperpanjang umur aset.', 1, 'III.5'),
(466, 'P.11.6.1', 'Mengembangkan kaidah pemeliharaan dan parameter kinerja aset.', 1, 'III.5'),
(467, 'P.11.6.2', 'Menyiapkan jadwal pemeliharaan pencegahan.', 1, 'III.5'),
(468, 'P.11.6.3', 'Menyiapkan petunjuk/panduan  untuk pemeliharaan perbaikan.', 1, 'III.5'),
(469, 'P.11.6.4', 'Menetapkan, dan atau merancangkan, alat bantu uji pemeliharaan.', 1, 'III.5'),
(470, 'P.11.6.5', 'Mengawasi tugas pemeliharaan.', 1, 'III.5'),
(471, 'P.11.6.6', 'Menentukan kebutuhan persediaan suku-cadang.', 1, 'III.5'),
(472, 'P.11.6.7', 'Melaksanakan pemeriksaan dan atau analisis atas kegagalan serta dampak akibatnya.', 1, 'III.5'),
(473, 'P.11.6.8', 'Melaksanakan analisis terhadap  modus kegagalan dan akibatnya.', 1, 'III.5'),
(474, 'P.11.7.1', 'Mempelajari penentuan umur ekonomis aset.', 1, 'III.5'),
(475, 'P.11.7.2', 'Menyelidiki penghapusan aset secara ekonomis dan layak lingkungan.', 1, 'III.5'),
(476, 'P.11.7.3', 'Merekomendasikan langkah penghapusan aset.', 1, 'III.5'),
(477, 'P.11.7.4', 'Melakukan pemulihan lahan bekas lokasi aset.', 1, 'III.5'),
(478, 'W.4.1.1', 'Melakukan pengembangan diri dalam kemampuan di bidang manajemen, termasuk hukum, ekonomi dan sosial.', 1, 'IV.1'),
(479, 'W.4.1.2', 'Menentukan sasaran bagi diri sendiri dalam  mencapai tujuan kerja.', 1, 'IV.1'),
(480, 'W.4.1.3', 'Menerapkan pengelolaan waktu dan tatakerja yang efektif.', 1, 'IV.1'),
(481, 'W.4.1.4', 'Melakukan pengembangan diri dalam kepemimpinan dan kerjasama kelompok.', 1, 'IV.1'),
(482, 'W.4.1.5', 'Melakukan pengembangan diri dalam cara berpikir yang berwawasan luas, analitis dan kreatif.', 1, 'IV.1'),
(483, 'W.4.2.1', 'Melakukan tugas perencanaan dan pemantauan proyek.', 1, 'IV.1'),
(484, 'W.4.2.2', 'Mengembangkan uraian  rincian pekerjaan yang terstruktur.', 1, 'IV.1'),
(485, 'W.4.2.3', 'Menyiapkan jadwal pekerjaan dan jalur kritisnya.', 1, 'IV.1'),
(486, 'W.4.2.4', 'Memantau kemajuan, menyelidiki penyimpangan dari jadwal dan memulai tindakan perbaikan.', 1, 'IV.1'),
(487, 'W.4.3.1', 'Melakukan penilaian kinerja bawahan.', 1, 'IV.1'),
(488, 'W.4.3.2', 'Mematuhi prinsip keadilan dan kebersamaan.', 1, 'IV.1'),
(489, 'W.4.3.3', 'Menggalang lingkungan hubungan kerja yang efektif.', 1, 'IV.1'),
(490, 'W.4.3.4', ' Mengorganisasikan kelompok-kelompok kerja.', 1, 'IV.1'),
(491, 'W.4.3.5', 'Memimpin insinyur muda, teknisi atau tenaga bawahan lainnya.', 1, 'IV.1'),
(492, 'W.4.3.6', 'Menghargai ataupun menghukum sesuai dengan kinerja (on-merit)', 1, 'IV.1'),
(493, 'W.4.3.7', 'Memantau tugas-tugas untuk menjamin bahwa kegiatan dilaksanakan sesuai rencana dan mengambil tindakan perbaikan yang perlu.', 1, 'IV.1'),
(494, 'W.4.4.1', 'Berkomunikasi dengan baik, benar dan lancar untuk menyampaikan pendapat secara  lisan  maupun tertulis dalam bahasa Indonesia.', 1, 'IV.1'),
(495, 'W.4.4.2', 'Menyiapkan, menafsirkan dan memaparkan informasi.', 1, 'IV.1'),
(496, 'W.4.4.3', 'Berhubungan dengan rekan dan pakar di dalam dan di luar kalangannya.', 1, 'IV.1'),
(497, 'W.4.4.4', 'Mengartikan dengan benar instruksi keinsinyuran yang diterima.', 1, 'IV.1'),
(498, 'W.4.4.5', 'Memberikan instruksi yang jelas, cermat dan tepat  kepada bawahan dalam suatu bahasa asing yang lazim dipergunakan di bidang keinsinyuran.', 1, 'IV.1'),
(499, 'W.4.4.6', 'Memilih media  dan cara  komunikasi yang tepat guna.', 1, 'IV.1'),
(500, 'W.4.5.1', 'Menyiapkan dan menyajikan ceramah (lectures) pada suatu tingkat profesional.', 1, 'IV.1'),
(501, 'W.4.5.2', 'Menyiapkan tulisan untuk diterbitkan dalam berkala  keinsinyuran.', 1, 'IV.1'),
(502, 'W.4.5.3', 'Menyampaikan informasi keinsinyuran secara efektif kepada kalangan keinsinyuran dan kalangan lainnya.', 1, 'IV.1'),
(503, 'W.4.5.4', 'Meneruskan informasi keinsinyuran secara efektif kepada atasan (insinyur maupun bukan).', 1, 'IV.1'),
(504, 'W.4.5.5', 'Melakukan perundingan, penyelesaian sengketa, pembinaan, pertukar-pikiran serta menyatakan pendapat dan sikap.', 1, 'IV.1'),
(505, 'W.4.5.6', 'Menyiapkan laporan keinsinyuran professional, seperti laporan kemajuan pekerjaan, secara baik dan benar.', 1, 'IV.1'),
(506, 'W.4.5.7', 'Menyiapkan dokumen seperti spesifikasi, bakuan dan paparan  grafis.', 1, 'IV.1'),
(507, 'W.4.5.8', 'Menyiapkan dokumen yang lebih kompleks seperti analisis dampak lingkungan atau kontrak kerja.', 1, 'IV.1'),
(508, 'W.4.5.9', 'Menafsirkan dengan benar gambar teknik serta grafik, spesifikasi, bakuan, peraturan, pedoman praktek dan analisis dampak lingkungan.', 1, 'IV.1'),
(509, 'W.4.1.1', 'Melakukan pengembangan diri dalam kemampuan di bidang manajemen, termasuk hukum, ekonomi dan sosial.', 1, 'IV.2'),
(510, 'W.4.1.2', 'Menentukan sasaran bagi diri sendiri dalam  mencapai tujuan kerja.', 1, 'IV.2'),
(511, 'W.4.1.3', 'Menerapkan pengelolaan waktu dan tatakerja yang efektif.', 1, 'IV.2'),
(512, 'W.4.1.4', 'Melakukan pengembangan diri dalam kepemimpinan dan kerjasama kelompok.', 1, 'IV.2'),
(513, 'W.4.1.5', 'Melakukan pengembangan diri dalam cara berpikir yang berwawasan luas, analitis dan kreatif.', 1, 'IV.2'),
(514, 'W.4.2.1', 'Melakukan tugas perencanaan dan pemantauan proyek.', 1, 'IV.2'),
(515, 'W.4.2.2', 'Mengembangkan uraian  rincian pekerjaan yang terstruktur.', 1, 'IV.2'),
(516, 'W.4.2.3', 'Menyiapkan jadwal pekerjaan dan jalur kritisnya.', 1, 'IV.2'),
(517, 'W.4.2.4', 'Memantau kemajuan, menyelidiki penyimpangan dari jadwal dan memulai tindakan perbaikan.', 1, 'IV.2'),
(518, 'W.4.3.1', 'Melakukan penilaian kinerja bawahan.', 1, 'IV.2'),
(519, 'W.4.3.2', 'Mematuhi prinsip keadilan dan kebersamaan.', 1, 'IV.2'),
(520, 'W.4.3.3', 'Menggalang lingkungan hubungan kerja yang efektif.', 1, 'IV.2'),
(521, 'W.4.3.4', ' Mengorganisasikan kelompok-kelompok kerja.', 1, 'IV.2'),
(522, 'W.4.3.5', 'Memimpin insinyur muda, teknisi atau tenaga bawahan lainnya.', 1, 'IV.2'),
(523, 'W.4.3.6', 'Menghargai ataupun menghukum sesuai dengan kinerja (on-merit)', 1, 'IV.2'),
(524, 'W.4.3.7', 'Memantau tugas-tugas untuk menjamin bahwa kegiatan dilaksanakan sesuai rencana dan mengambil tindakan perbaikan yang perlu.', 1, 'IV.2'),
(525, 'W.4.4.1', 'Berkomunikasi dengan baik, benar dan lancar untuk menyampaikan pendapat secara  lisan  maupun tertulis dalam bahasa Indonesia.', 1, 'IV.2'),
(526, 'W.4.4.2', 'Menyiapkan, menafsirkan dan memaparkan informasi.', 1, 'IV.2'),
(527, 'W.4.4.3', 'Berhubungan dengan rekan dan pakar di dalam dan di luar kalangannya.', 1, 'IV.2'),
(528, 'W.4.4.4', 'Mengartikan dengan benar instruksi keinsinyuran yang diterima.', 1, 'IV.2'),
(529, 'W.4.4.5', 'Memberikan instruksi yang jelas, cermat dan tepat  kepada bawahan dalam suatu bahasa asing yang lazim dipergunakan di bidang keinsinyuran.', 1, 'IV.2'),
(530, 'W.4.4.6', 'Memilih media  dan cara  komunikasi yang tepat guna.', 1, 'IV.2'),
(531, 'W.4.5.1', 'Menyiapkan dan menyajikan ceramah (lectures) pada suatu tingkat profesional.', 1, 'IV.2'),
(532, 'W.4.5.2', 'Menyiapkan tulisan untuk diterbitkan dalam berkala  keinsinyuran.', 1, 'IV.2'),
(533, 'W.4.5.3', 'Menyampaikan informasi keinsinyuran secara efektif kepada kalangan keinsinyuran dan kalangan lainnya.', 1, 'IV.2'),
(534, 'W.4.5.4', 'Meneruskan informasi keinsinyuran secara efektif kepada atasan (insinyur maupun bukan).', 1, 'IV.2'),
(535, 'W.4.5.5', 'Melakukan perundingan, penyelesaian sengketa, pembinaan, pertukar-pikiran serta menyatakan pendapat dan sikap.', 1, 'IV.2'),
(536, 'W.4.5.6', 'Menyiapkan laporan keinsinyuran professional, seperti laporan kemajuan pekerjaan, secara baik dan benar.', 1, 'IV.2'),
(537, 'W.4.5.7', 'Menyiapkan dokumen seperti spesifikasi, bakuan dan paparan  grafis.', 1, 'IV.2'),
(538, 'W.4.5.8', 'Menyiapkan dokumen yang lebih kompleks seperti analisis dampak lingkungan atau kontrak kerja.', 1, 'IV.2'),
(539, 'W.4.5.9', 'Menafsirkan dengan benar gambar teknik serta grafik, spesifikasi, bakuan, peraturan, pedoman praktek dan analisis dampak lingkungan.', 1, 'IV.2'),
(540, 'W.2.1.1', 'Gagasan sendiri dalam sintesa pemecahan masalah keinsinyuran.', 1, 'IV.3'),
(541, 'W.2.1.2', 'Kearifan profesional dalam keputusan keinsinyuran.', 1, 'IV.3'),
(542, 'W.2.1.3', 'Pekerjaan keinsinyuran yang kreatif dan inovatif.', 1, 'IV.3'),
(543, 'W.2.1.4', 'Mengenali dan menanggulangi masalah keinsinyuran.', 1, 'IV.3'),
(544, 'W.2.1.5', 'Memperluas pengetahuan dan memupuk kerjasama antar kejuruan', 1, 'IV.3'),
(545, 'W.2.1.6', 'Menyelidiki kebutuhan dan memanfaatkan peluang dalam pekerjaan atau bidang kejuruan.', 1, 'IV.3'),
(546, 'W.2.2.1', 'Menyadari keterbatasan kepakaran dan pengetahuan dirinya ', 1, 'IV.3'),
(547, 'W.2.2.2', 'Mencari informasi perkembangan teknologi atau kemajuan lainnya', 1, 'IV.3'),
(548, 'W.2.2.3', 'Membaca majalah profesional, mengikuti seminar dan menjalin kerjasama antar profesional.', 1, 'IV.3'),
(549, 'W.2.2.4', 'Melakukan penelitian dan percobaan untuk menyelesaikan masalah keinsinyuran', 1, 'IV.3'),
(550, 'W.2.2.5', 'Memanfaatkan pengalaman untuk pengembangan keprofesionalannya.', 1, 'IV.3'),
(551, 'W.2.2.6', 'Pencatatan mengenai kegiatan pengembangan keprofesionalannya.', 1, 'IV.3'),
(552, 'W.2.3.1', 'Pengenalan kerekayasaan ', 1, 'IV.3'),
(553, 'W.2.3.2', 'Pembuatan konsep penerapan kerekayasaan', 1, 'IV.3'),
(554, 'W.2.3.3', 'Perincian penerapan kerekayasaan yang dipilih.', 1, 'IV.3'),
(555, 'W.2.3.4', 'Pemutakhiran dokumentasi hasil-hasil penerapannya.', 1, 'IV.3'),
(556, 'W.2.3.5', 'Pengkajian persyaratan bagi diperolehnya persetujuan penerapan kerekayasaan ', 1, 'IV.3'),
(557, 'W.2.4.1', 'Pengembangan sistem mutu.', 1, 'IV.3'),
(558, 'W.2.4.2', 'Mendorong penerapan kaidah penjaminan mutu ke rekan kerja dan anak-buah.', 1, 'IV.3'),
(559, 'W.2.4.3', 'Melaksanakan setiap pekerjaan sesuai dengan bakuan mutu yang tepat.', 1, 'IV.3'),
(560, 'W.2.4.4', 'Menerapkan tatacara kendali mutu dan penjaminan mutu.', 1, 'IV.3'),
(561, 'W.2.5.1', 'Memilih dan menggunakan analisis matematik, ilmu keinsinyuran, simulasi komputer atau teknik pemodelan lainnya.', 1, 'IV.3'),
(562, 'W.2.5.2', 'Memilih dan memanfaatkan penerapan  sistem komputer.', 1, 'IV.3'),
(563, 'W.2.5.3', 'Mengarahkan dan melaksanakan tugas-tugas pemrograman dan penggunaan perangkat lunak.', 1, 'IV.3'),
(564, 'W.2.5.4', 'Memilih dan menggunakan alat bantu teknologi dan memantau kinerjanya.', 1, 'IV.3'),
(565, 'W.2.6.1', 'Merumuskan tujuan uji-coba.', 1, 'IV.3'),
(566, 'W.2.6.2', 'Menyusun tatacara dan jadwal uji-coba.', 1, 'IV.3'),
(567, 'W.2.6.3', 'Mengembangkan tatacara dan alat-alat pengukuran.', 1, 'IV.3'),
(568, 'W.2.6.4', 'Melaksanakan uji-coba  dan pengukuran untuk kerja keinsinyuran yang kritis.', 1, 'IV.3'),
(569, 'W.2.6.5', 'Mengawasi uji-coba  dan pengukuran untuk kerja yang tidak kritis.', 1, 'IV.3'),
(570, 'W.2.6.6', 'Mengkaji-nilai hasil uji-coba  dan pengukuran.', 1, 'IV.3'),
(571, 'P.6.1.1', 'Mengidentifikasi kebutuhan penelitian.', 1, 'IV.4'),
(572, 'P.6.1.2', 'Melakukan kajian pustaka.', 1, 'IV.4'),
(573, 'P.6.1.3', 'Melakukan penelitian dasar dan atau terapan.', 1, 'IV.4'),
(574, 'P.6.1.4', 'Mencari pengetahuan baru.', 1, 'IV.4'),
(575, 'P.6.1.5', 'Menemu-kenali dan menyampaikan hasil penelitian.', 1, 'IV.4'),
(576, 'P.6.2.1', 'Menemu-kenali kebutuhan pengembangan.', 1, 'IV.4'),
(577, 'P.6.2.2', 'Memeriksa konsep-konsep yang mempunyai kemungkinan untuk dilaksanakan.', 1, 'IV.4'),
(578, 'P.6.2.3', 'Memilih konsep yang akan dikembangkan lebih lanjut.', 1, 'IV.4'),
(579, 'P.6.3.1', 'Merumuskan kebutuhan akhir pemakai.', 1, 'IV.4'),
(580, 'P.6.3.2', 'Menyiapkan usulan untuk mencari sumber daya bagi pengembangan.', 1, 'IV.4'),
(581, 'P.6.3.3', 'Menyiapkan perkiraan biaya untuk pengembangan, perancangan, produksi atau konstruksi, dan operasi.', 1, 'IV.4'),
(582, 'P.6.4.1', 'Merumuskan ciri-ciri  produk yang diinginkan pasar.', 1, 'IV.4'),
(583, 'P.6.4.2', 'Mengumpulkan informasi dan membuat rekomendasi untuk menentukan harga produk.', 1, 'IV.4'),
(584, 'P.6.4.3', 'Membuat rekomendasi mengenai distribusi produk.', 1, 'IV.4'),
(585, 'P.6.4.4', 'Membuat rekomendasi untuk mempromosikan produk.', 1, 'IV.4'),
(586, 'P.6.5.1', 'Melakukan kaji-nilai  ekonomis atas produk hasil penelitian dan pengembangan.', 1, 'IV.4'),
(587, 'P.6.5.2', 'Memilih mekanisme yang cocok untuk memasarkan produk hasil penelitian dan pengembangan.', 1, 'IV.4'),
(588, 'P.6.5.3', 'Menyiapkan model peragaan untuk membuktikan kelayakan teknis dan komersial.', 1, 'IV.4'),
(589, 'P.6.5.4', 'Mengembangkan rencana proyek percontohan untuk membuktikan kelayakan teknis dan komersial.', 1, 'IV.4'),
(590, 'W.4.1.1', 'Melakukan pengembangan diri dalam kemampuan di bidang manajemen, termasuk hukum, ekonomi dan sosial.', 1, 'V'),
(591, 'W.4.1.2', 'Menentukan sasaran bagi diri sendiri dalam  mencapai tujuan kerja.', 1, 'V'),
(592, 'W.4.1.3', 'Menerapkan pengelolaan waktu dan tatakerja yang efektif.', 1, 'V'),
(593, 'W.4.1.4', 'Melakukan pengembangan diri dalam kepemimpinan dan kerjasama kelompok.', 1, 'V'),
(594, 'W.4.1.5', 'Melakukan pengembangan diri dalam cara berpikir yang berwawasan luas, analitis dan kreatif.', 1, 'V'),
(595, 'W.4.2.1', 'Melakukan tugas perencanaan dan pemantauan proyek.', 1, 'V'),
(596, 'W.4.2.2', 'Mengembangkan uraian  rincian pekerjaan yang terstruktur.', 1, 'V'),
(597, 'W.4.2.3', 'Menyiapkan jadwal pekerjaan dan jalur kritisnya.', 1, 'V'),
(598, 'W.4.2.4', 'Memantau kemajuan, menyelidiki penyimpangan dari jadwal dan memulai tindakan perbaikan.', 1, 'V'),
(599, 'W.4.3.1', 'Melakukan penilaian kinerja bawahan.', 1, 'V'),
(600, 'W.4.3.2', 'Mematuhi prinsip keadilan dan kebersamaan.', 1, 'V'),
(601, 'W.4.3.3', 'Menggalang lingkungan hubungan kerja yang efektif.', 1, 'V'),
(602, 'W.4.3.4', ' Mengorganisasikan kelompok-kelompok kerja.', 1, 'V'),
(603, 'W.4.3.5', 'Memimpin insinyur muda, teknisi atau tenaga bawahan lainnya.', 1, 'V'),
(604, 'W.4.3.6', 'Menghargai ataupun menghukum sesuai dengan kinerja (on-merit)', 1, 'V'),
(605, 'W.4.3.7', 'Memantau tugas-tugas untuk menjamin bahwa kegiatan dilaksanakan sesuai rencana dan mengambil tindakan perbaikan yang perlu.', 1, 'V'),
(606, 'W.4.4.1', 'Berkomunikasi dengan baik, benar dan lancar untuk menyampaikan pendapat secara  lisan  maupun tertulis dalam bahasa Indonesia.', 1, 'V'),
(607, 'W.4.4.2', 'Menyiapkan, menafsirkan dan memaparkan informasi.', 1, 'V'),
(608, 'W.4.4.3', 'Berhubungan dengan rekan dan pakar di dalam dan di luar kalangannya.', 1, 'V'),
(609, 'W.4.4.4', 'Mengartikan dengan benar instruksi keinsinyuran yang diterima.', 1, 'V'),
(610, 'W.4.4.5', 'Memberikan instruksi yang jelas, cermat dan tepat  kepada bawahan dalam suatu bahasa asing yang lazim dipergunakan di bidang keinsinyuran.', 1, 'V'),
(611, 'W.4.4.6', 'Memilih media  dan cara  komunikasi yang tepat guna.', 1, 'V'),
(612, 'W.4.5.1', 'Menyiapkan dan menyajikan ceramah (lectures) pada suatu tingkat profesional.', 1, 'V'),
(613, 'W.4.5.2', 'Menyiapkan tulisan untuk diterbitkan dalam berkala  keinsinyuran.', 1, 'V'),
(614, 'W.4.5.3', 'Menyampaikan informasi keinsinyuran secara efektif kepada kalangan keinsinyuran dan kalangan lainnya.', 1, 'V'),
(615, 'W.4.5.4', 'Meneruskan informasi keinsinyuran secara efektif kepada atasan (insinyur maupun bukan).', 1, 'V'),
(616, 'W.4.5.5', 'Melakukan perundingan, penyelesaian sengketa, pembinaan, pertukar-pikiran serta menyatakan pendapat dan sikap.', 1, 'V'),
(617, 'W.4.5.6', 'Menyiapkan laporan keinsinyuran professional, seperti laporan kemajuan pekerjaan, secara baik dan benar.', 1, 'V'),
(618, 'W.4.5.7', 'Menyiapkan dokumen seperti spesifikasi, bakuan dan paparan  grafis.', 1, 'V'),
(619, 'W.4.5.8', 'Menyiapkan dokumen yang lebih kompleks seperti analisis dampak lingkungan atau kontrak kerja.', 1, 'V'),
(620, 'W.4.5.9', 'Menafsirkan dengan benar gambar teknik serta grafik, spesifikasi, bakuan, peraturan, pedoman praktek dan analisis dampak lingkungan.', 1, 'V');

-- --------------------------------------------------------

--
-- Table structure for table `credential`
--

CREATE TABLE IF NOT EXISTS `credential` (
  `id_credential` int(2) NOT NULL AUTO_INCREMENT,
  `credential` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_credential`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `credential`
--

INSERT INTO `credential` (`id_credential`, `credential`) VALUES
(1, 'Penilai'),
(2, 'Registran'),
(0, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id_user` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id_user`, `email`) VALUES
('2014-00001', 'abby.s.nugraha@gmail.com'),
('2014-00002', 'febri@newsenses.biz'),
('2014-00003', 'fheby.kere.hore@gmail.com'),
('2014-00003', 'febri@newsenses.biz'),
('2015-00002', 'penilai@gmail.com'),
('2015-00001', 'fheby.kere.hore@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_identitas`
--

CREATE TABLE IF NOT EXISTS `jenis_identitas` (
  `id_jenis_identitas` int(2) NOT NULL,
  `identitas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_identitas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_identitas`
--

INSERT INTO `jenis_identitas` (`id_jenis_identitas`, `identitas`) VALUES
(1, 'KTP'),
(2, 'VISA');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id_user` varchar(10) NOT NULL,
  `id_credential` int(2) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_reference_1` (`id_credential`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_user`, `id_credential`, `username`, `password`) VALUES
('2014-00000', 0, 'administrator@faip.bkkpii', '4f47cd577ca826d33254039b41279417'),
('2015-00001', 2, 'fheby.kere.hore@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
('2015-00002', 1, 'penilai@gmail.com', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `negara`
--

CREATE TABLE IF NOT EXISTS `negara` (
  `id_negara` int(3) NOT NULL AUTO_INCREMENT,
  `negara` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_negara`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `negara`
--

INSERT INTO `negara` (`id_negara`, `negara`) VALUES
(1, 'Afrika Selatan'),
(2, 'Republik Afrika Tengah'),
(3, 'Aljazair'),
(4, 'Angola'),
(5, 'Benin'),
(6, 'Botswana'),
(7, 'Burkina Faso'),
(8, 'Burundi'),
(9, 'Chad'),
(10, 'Djibouti'),
(11, 'Eritrea'),
(12, 'Ethiopia'),
(13, 'Gabon'),
(14, 'Gambia'),
(15, 'Ghana'),
(16, 'Guinea'),
(17, 'Guinea Khatulistiwa'),
(18, 'Guinea-Bissau'),
(19, 'Kamerun'),
(20, 'Kenya'),
(21, 'Komoro'),
(22, 'Republik Demokratik Kongo'),
(23, 'Republik Kongo'),
(24, 'Lesotho'),
(25, 'Liberia'),
(26, 'Libya'),
(27, 'Madagaskar'),
(28, 'Malawi'),
(29, 'Mali'),
(30, 'Maroko'),
(31, 'Mauritania'),
(32, 'Mauritius'),
(33, 'Mesir'),
(34, 'Mozambik'),
(35, 'Namibia'),
(36, 'Niger'),
(37, 'Nigeria'),
(38, 'Pantai Gading'),
(39, 'Rwanda'),
(40, 'Sao Tome dan Principe'),
(41, 'Senegal'),
(42, 'Seychelles'),
(43, 'Sierra Leone'),
(44, 'Somalia'),
(45, 'Sudan'),
(46, 'Sudan Selatan'),
(47, 'Swaziland'),
(48, 'Tanjung Verde'),
(49, 'Tanzania'),
(50, 'Togo'),
(51, 'Tunisia'),
(52, 'Uganda'),
(53, 'Zambia'),
(54, 'Zimbabwe'),
(55, 'Amerika Serikat'),
(56, 'Antigua dan Barbuda'),
(57, 'Bahama'),
(58, 'Barbados'),
(59, 'Belize'),
(60, 'Dominika'),
(61, 'Republik Dominika'),
(62, 'El Salvador'),
(63, 'Grenada'),
(64, 'Guatemala'),
(65, 'Haiti'),
(66, 'Honduras'),
(67, 'Jamaika'),
(68, 'Kanada'),
(69, 'Kosta Rika'),
(70, 'Kuba'),
(71, 'Meksiko'),
(72, 'Nikaragua'),
(73, 'Panama'),
(74, 'Saint Kitts dan Nevis'),
(75, 'Saint Lucia'),
(76, 'Saint Vincent dan Grenadines'),
(77, 'Trinidad dan Tobago'),
(78, 'Argentina'),
(79, 'Bolivia'),
(80, 'Brasil'),
(81, 'Chili'),
(82, 'Ekuador'),
(83, 'Guyana'),
(84, 'Kolombia'),
(85, 'Paraguay'),
(86, 'Peru'),
(87, 'Suriname'),
(88, 'Uruguay'),
(89, 'Venezuela'),
(90, 'Afganistan'),
(91, 'Arab Saudi'),
(92, 'Armenia'),
(93, 'Azerbaijan'),
(94, 'Bahrain'),
(95, 'Bangladesh'),
(96, 'Bhutan'),
(97, 'Brunei'),
(98, 'Filipina'),
(99, 'India'),
(100, 'Indonesia'),
(101, 'Irak'),
(102, 'Iran'),
(103, 'Israel'),
(104, 'Jepang'),
(105, 'Kamboja'),
(106, 'Kazakhstan'),
(107, 'Kirgizstan'),
(108, 'Korea Selatan'),
(109, 'Korea Utara'),
(110, 'Kuwait'),
(111, 'Laos'),
(112, 'Lebanon'),
(113, 'Maladewa'),
(114, 'Malaysia'),
(115, 'Mongolia'),
(116, 'Myanmar'),
(117, 'Nepal'),
(118, 'Oman'),
(119, 'Pakistan'),
(120, 'Qatar'),
(121, 'Singapura'),
(122, 'Siprus'),
(123, 'Sri Lanka'),
(124, 'Suriah'),
(125, 'Tajikistan'),
(126, 'Thailand'),
(127, 'Timor Leste'),
(128, 'Republik Rakyat Tiongkok'),
(129, 'Turkmenistan'),
(130, 'Uni Emirat Arab'),
(131, 'Uzbekistan'),
(132, 'Vietnam'),
(133, 'Yaman'),
(134, 'Yordania'),
(135, 'Albania'),
(136, 'Andorra'),
(137, 'Austria'),
(138, 'Belanda'),
(139, 'Belarus'),
(140, 'Belgia'),
(141, 'Bosnia dan Herzegovina'),
(142, 'Britania Raya '),
(143, 'Inggris'),
(144, 'Irlandia Utara'),
(145, 'Skotlandia'),
(146, 'Wales'),
(147, 'Bulgaria'),
(148, 'Republik Ceko'),
(149, 'Denmark'),
(150, 'Estonia'),
(151, 'Finlandia'),
(152, 'Georgia'),
(153, 'Hongaria'),
(154, 'Republik Irlandia'),
(155, 'Islandia'),
(156, 'Italia'),
(157, 'Jerman'),
(158, 'Kroasia'),
(159, 'Latvia'),
(160, 'Liechtenstein'),
(161, 'Lituania'),
(162, 'Luksemburg'),
(163, 'Republik Makedonia'),
(164, 'Malta'),
(165, 'Moldova'),
(166, 'Monako'),
(167, 'Montenegro'),
(168, 'Norwegia'),
(169, 'Perancis'),
(170, 'Polandia'),
(171, 'Portugal'),
(172, 'Rumania'),
(173, 'Rusia'),
(174, 'San Marino'),
(175, 'Serbia'),
(176, 'Slovenia'),
(177, 'Slowakia'),
(178, 'Spanyol'),
(179, 'Swedia'),
(180, 'Swiss'),
(181, 'Turki'),
(182, 'Ukraina'),
(183, 'Vatikan'),
(184, 'Yunani'),
(185, 'Australia'),
(186, 'Fiji'),
(187, 'Kepulauan Marshall'),
(188, 'Federasi Mikronesia'),
(189, 'Kiribati'),
(190, 'Nauru'),
(191, 'Palau'),
(192, 'Papua Nugini'),
(193, 'Samoa'),
(194, 'Selandia Baru'),
(195, 'Kepulauan Solomon'),
(196, 'Tonga'),
(197, 'Tuvalu'),
(198, 'Vanuatu');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `id_user` varchar(10) NOT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id_user`, `phone`) VALUES
('2014-00001', '2502-104'),
('2014-00003', '09878899977'),
('2014-00003', '08123456789'),
('2014-00003', '02187776899'),
('2014-00003', '02123445555'),
('2015-00001', '6767');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
  `id_provinsi` int(2) NOT NULL AUTO_INCREMENT,
  `provinsi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_provinsi`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `provinsi`) VALUES
(1, 'Aceh'),
(2, 'Sumatera Utara'),
(3, 'Sumatera Barat'),
(4, 'Riau'),
(5, 'Jambi'),
(6, 'Sumatera Selatan'),
(7, 'Bengkulu'),
(8, 'Lampung'),
(9, 'Kepulauan Bangka Belitung'),
(10, 'Kepulauan Riau'),
(11, 'Jakarta'),
(12, 'Yogyakarta'),
(13, 'Jawa Barat'),
(14, 'Jawa Tengah'),
(15, 'Jawa Timur'),
(16, 'Banten'),
(17, 'Bali'),
(18, 'Nusa Tenggara Timur'),
(19, 'Nusa Tenggara Barat'),
(20, 'Kalimantan Barat'),
(21, 'Kalimantan Tengah'),
(22, 'Kalimantan Selatan'),
(23, 'Kalimantan Timur'),
(24, 'Kalimantan Utara'),
(25, 'Sulawesi Utara'),
(26, 'Sulawesi Tengah'),
(27, 'Sulawesi Selatan'),
(28, 'Sulawesi Tenggara'),
(29, 'Sulawesi Barat'),
(30, 'Gorontalo'),
(31, 'Maluku'),
(32, 'Maluku Utara'),
(33, 'Papua'),
(34, 'Papua Barat');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` varchar(10) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `no_kta` varchar(50) DEFAULT NULL,
  `alamat` text,
  `negara` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `id_jenis_identitas` int(2) DEFAULT NULL,
  `no_id` varchar(50) DEFAULT NULL,
  `negara_identitas` varchar(50) DEFAULT NULL,
  `provinsi_identitas` varchar(50) DEFAULT NULL,
  `tgl_lahir` varchar(25) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `negara_lahir` varchar(50) DEFAULT NULL,
  `provinsi_lahir` varchar(50) DEFAULT NULL,
  `user_submit` int(1) NOT NULL DEFAULT '0',
  `penilai_submit` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  KEY `fk_reference_3` (`id_jenis_identitas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `email`, `no_kta`, `alamat`, `negara`, `provinsi`, `id_jenis_identitas`, `no_id`, `negara_identitas`, `provinsi_identitas`, `tgl_lahir`, `tmp_lahir`, `negara_lahir`, `provinsi_lahir`, `user_submit`, `penilai_submit`) VALUES
('2014-00000', 'Administrator', 'administrator@faip.bkkpii', '-', '-', 'Indonesia', 'DKI Jakarta', 1, '-', '-', '-', '-', '-', '-', '-', 0, 0),
('2015-00001', 'Ir Febri Rambun Pamenan ', 'fheby.kere.hore@gmail.com', '3121212131', '42343243', 'Barbados', '', 1, '52434343', 'Belanda', '', '2015-03-03', '34343', 'Barbados', '', 1, 1),
('2015-00002', 'Penilai', 'penilai@gmail.com', '324324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
