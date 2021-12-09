-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2021 at 06:40 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_puskesmas_padaherang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bp_luar_daerah`
--

CREATE TABLE `bp_luar_daerah` (
  `id_luar_daerah` int(5) NOT NULL,
  `nama_luar_daerah` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bp_master`
--

CREATE TABLE `bp_master` (
  `id_indikator_bp` int(11) NOT NULL,
  `indikator_bp` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bp_trn_desa`
--

CREATE TABLE `bp_trn_desa` (
  `id_trn_bp` int(5) NOT NULL,
  `id_desa` int(5) NOT NULL,
  `id_indikator_bp` int(5) NOT NULL,
  `id_range_umur` int(5) DEFAULT NULL,
  `jumlah` int(5) NOT NULL,
  `periode_bp` varchar(8) NOT NULL,
  `jk` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bp_trn_luar_daerah`
--

CREATE TABLE `bp_trn_luar_daerah` (
  `id_trn_bp` int(5) NOT NULL,
  `id_luar_daerah` int(5) NOT NULL,
  `id_indikator_bp` int(5) NOT NULL,
  `id_range_umur` int(5) DEFAULT NULL,
  `jumlah` int(5) NOT NULL,
  `periode_bp` varchar(8) NOT NULL,
  `jk` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbd_ref_gejala`
--

CREATE TABLE `dbd_ref_gejala` (
  `id_gejala_dbd` int(5) NOT NULL,
  `nama_gejala_dbd` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbd_trn_pengobatan`
--

CREATE TABLE `dbd_trn_pengobatan` (
  `id_trn_pengobatan_dbd` int(5) NOT NULL,
  `id_pasien` int(5) NOT NULL,
  `id_ref_gejala_dbd` int(5) NOT NULL,
  `tgl_kunjungan` date NOT NULL,
  `tgl_mulai_sakit` date NOT NULL,
  `tgl_berobat_pasien` date NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trn_kesehatan_indera`
--

CREATE TABLE `detail_trn_kesehatan_indera` (
  `id_trn_kesehatan_indera` int(4) NOT NULL,
  `id_kesehatan_indera` int(4) NOT NULL,
  `id_ref_kesehatan_indera` int(4) NOT NULL,
  `laki_laki` varchar(4) NOT NULL,
  `perempuan` varchar(4) NOT NULL,
  `tanggal` varchar(16) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trn_kesehatan_jiwa`
--

CREATE TABLE `detail_trn_kesehatan_jiwa` (
  `id_trn_kesehatan_jiwa` int(4) NOT NULL,
  `id_kesehatan_jiwa` int(4) NOT NULL,
  `id_ref_kesehatan_jiwa` int(4) NOT NULL,
  `laki_laki` varchar(4) NOT NULL,
  `perempuan` varchar(4) NOT NULL,
  `tanggal` varchar(16) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trn_kesehatan_olahraga`
--

CREATE TABLE `detail_trn_kesehatan_olahraga` (
  `id_trn_kesehatan_olahraga` int(11) NOT NULL,
  `id_kesehatan_olahraga` int(11) NOT NULL,
  `laki_laki` varchar(6) DEFAULT NULL,
  `perempuan` varchar(6) DEFAULT NULL,
  `jumlah` varchar(6) DEFAULT NULL,
  `tanggal` varchar(16) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trn_kesehatan_pekerja`
--

CREATE TABLE `detail_trn_kesehatan_pekerja` (
  `id_trn_kesehatan_pekerja` int(11) NOT NULL,
  `id_kesehatan_pekerja` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` varchar(16) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trn_kesehatan_tradisional`
--

CREATE TABLE `detail_trn_kesehatan_tradisional` (
  `id_trn_kesehatan_tradisional` int(4) NOT NULL,
  `id_kesehatan_tradisional` int(4) NOT NULL,
  `id_ref_kesehatan_tradisional` int(4) NOT NULL,
  `laki_laki` varchar(6) NOT NULL,
  `perempuan` varchar(6) NOT NULL,
  `tanggal` varchar(16) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_mst_pangkat`
--

CREATE TABLE `employee_mst_pangkat` (
  `id_mst_pangkat` int(5) NOT NULL,
  `nama_pangkat` varchar(50) NOT NULL,
  `jumlah_gaji` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_mst_type`
--

CREATE TABLE `employee_mst_type` (
  `id_type_employee` int(5) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_ref_pendidikan`
--

CREATE TABLE `employee_ref_pendidikan` (
  `id_pendidikan_emloyee` int(5) NOT NULL,
  `nama_pendidikan` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_unit_kerja`
--

CREATE TABLE `employee_unit_kerja` (
  `id_unit_kerja` int(5) NOT NULL,
  `nama_unit_kerja` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filaria_lokasi_mst`
--

CREATE TABLE `filaria_lokasi_mst` (
  `id_lokasi_filaria` int(3) NOT NULL,
  `nama_llokasi_filaria` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filaria_trn_pemeriksaan`
--

CREATE TABLE `filaria_trn_pemeriksaan` (
  `id_trn_fillaria` int(5) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_desa` int(5) NOT NULL,
  `id_lokasi_filaria` int(2) NOT NULL,
  `limfedema` int(2) NOT NULL,
  `stadium` char(2) NOT NULL,
  `hidorkel` varchar(5) NOT NULL,
  `efek_serangan_akut` varchar(40) NOT NULL,
  `lingkar_bengkak` varchar(10) NOT NULL,
  `operasi_hidrokel` varchar(10) NOT NULL,
  `keterangan` text NOT NULL,
  `tahun_ditemukan` varchar(4) NOT NULL,
  `tahun_mulai_sakit` varchar(4) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gigi_mst_detail_penyakit`
--

CREATE TABLE `gigi_mst_detail_penyakit` (
  `id_detail_penyakit_gigi` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `detail_penyakit_gigi` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gigi_mst_kegiatan`
--

CREATE TABLE `gigi_mst_kegiatan` (
  `id_kegiatan_gigi` int(5) NOT NULL,
  `id_penyakit` int(5) NOT NULL,
  `nama_kegiatan` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gizi_mst_balita`
--

CREATE TABLE `gizi_mst_balita` (
  `id_balita_gizi` int(11) NOT NULL,
  `id_posyandu_desa` int(5) NOT NULL,
  `id_desa` int(5) NOT NULL,
  `nama_balita` varchar(50) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `berat_badan` int(2) NOT NULL,
  `tinggi_badan` int(2) NOT NULL,
  `tanggal_pemeriksaan` date NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gizi_mst_indikator_kadar`
--

CREATE TABLE `gizi_mst_indikator_kadar` (
  `id_indikator_gizi` int(3) NOT NULL,
  `indikator_gizi` varchar(50) NOT NULL,
  `nilai` int(6) NOT NULL,
  `status_kadar_gizi` enum('bergizi','tidak_bergizi') NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gizi_mst_range`
--

CREATE TABLE `gizi_mst_range` (
  `id_range_gizi` int(11) NOT NULL,
  `range_umur` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indera_details_kesehatan`
--

CREATE TABLE `indera_details_kesehatan` (
  `id_detail_kes_indra` int(5) NOT NULL,
  `id_mst_kes_indra` int(5) NOT NULL,
  `nama_details_kes_indra` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indera_mst_kesehatan`
--

CREATE TABLE `indera_mst_kesehatan` (
  `id_mst_kes_indra` int(5) NOT NULL,
  `nama_kes_indra` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ispa_mst_pengendalian`
--

CREATE TABLE `ispa_mst_pengendalian` (
  `id_desa` int(11) NOT NULL,
  `id_range_umur` int(3) NOT NULL,
  `jml_penduduk_balita` int(3) NOT NULL,
  `perkiraan_pnemonia` int(3) NOT NULL,
  `jml_kunjungan_balita_ispa` int(3) NOT NULL,
  `jml_kematian` int(3) NOT NULL,
  `tota_penderita` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jiwa_detail_kesehatan`
--

CREATE TABLE `jiwa_detail_kesehatan` (
  `id_detail_jiwa_kes` int(5) NOT NULL,
  `nama_detail_jiwa_kes` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jiwa_mst_kesehatan`
--

CREATE TABLE `jiwa_mst_kesehatan` (
  `id_kesehatan_jiwa` int(5) NOT NULL,
  `id_detail_jiwa_kes` int(5) NOT NULL,
  `nama_kesehatan_jiwa` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kesling_mst_akses`
--

CREATE TABLE `kesling_mst_akses` (
  `id_mst_akses` int(5) NOT NULL,
  `nama_mst_akses` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kesling_ref_kegiatan`
--

CREATE TABLE `kesling_ref_kegiatan` (
  `id_ref_kegiatan` int(5) NOT NULL,
  `nama_ref_kegiatan` varchar(70) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kesling_ref_pengawasan`
--

CREATE TABLE `kesling_ref_pengawasan` (
  `id_ref_pengawasan` int(5) NOT NULL,
  `nama_ref_pengawasan` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kesling_trn_akses`
--

CREATE TABLE `kesling_trn_akses` (
  `id_trn_kesling` int(5) NOT NULL,
  `id_akses_kesling` int(11) NOT NULL,
  `id_desa` int(5) DEFAULT NULL,
  `target_jiwa` int(11) NOT NULL,
  `target_persen` float NOT NULL,
  `realisasi_jiwa` int(11) NOT NULL,
  `realisasi_persen` float NOT NULL,
  `kesenjangan` float NOT NULL,
  `masalah` text NOT NULL,
  `pemecahan_masalah` text NOT NULL,
  `periode_kesling` varchar(8) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kesling_trn_kegiatan`
--

CREATE TABLE `kesling_trn_kegiatan` (
  `id_trn_kegiatan` int(5) NOT NULL,
  `id_ref_kegiatan` int(5) NOT NULL,
  `kalipucang` int(5) NOT NULL,
  `cibuluh` int(5) NOT NULL,
  `banjarharja` int(5) NOT NULL,
  `tunggilis` int(5) NOT NULL,
  `ciparakan` int(5) NOT NULL,
  `pamotan` int(5) NOT NULL,
  `bagolo` int(5) NOT NULL,
  `emplak` int(5) NOT NULL,
  `putrapinggan` int(5) NOT NULL,
  `periode_kesling` varchar(8) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kesling_trn_pengawasan`
--

CREATE TABLE `kesling_trn_pengawasan` (
  `id_trn_pengawasan` int(5) NOT NULL,
  `id_mst_akses` int(11) NOT NULL,
  `id_ref_pengawasan` int(5) DEFAULT NULL,
  `target_jiwa` int(11) NOT NULL,
  `target_persen` float NOT NULL,
  `realisasi_jiwa` int(11) NOT NULL,
  `realisasi_persen` float NOT NULL,
  `kesenjangan` float NOT NULL,
  `masalah` text NOT NULL,
  `pemecahan_masalah` text NOT NULL,
  `periode_kesling` varchar(8) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kusta_trn_pengobatan`
--

CREATE TABLE `kusta_trn_pengobatan` (
  `id_pengobatan_kusta` int(5) NOT NULL,
  `id_pasien` int(10) NOT NULL,
  `id_tindakan` int(5) NOT NULL,
  `status_pasien` enum('baru','lama') NOT NULL,
  `bulan_pemeriksaan` varchar(2) NOT NULL,
  `tahun_pemeriksaan` varchar(2) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_mst_vaksin`
--

CREATE TABLE `malaria_mst_vaksin` (
  `id_vaksin` int(11) NOT NULL,
  `nama_vaksin` varchar(50) NOT NULL,
  `jumlah_dosis` int(3) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_pengobatan_pasien`
--

CREATE TABLE `malaria_pengobatan_pasien` (
  `id_pengobatan_pasien` int(11) NOT NULL,
  `nama_pengobatan_pasien` varchar(50) NOT NULL,
  `nilai` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mata_detail_penyakit`
--

CREATE TABLE `mata_detail_penyakit` (
  `id_mata_penyakit` int(5) NOT NULL,
  `id_penyakit` int(5) NOT NULL,
  `detail_penyakit_mata` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_alkes`
--

CREATE TABLE `mst_alkes` (
  `id_alkes` int(5) NOT NULL,
  `nama_alkes` varchar(50) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `jenis_alkes` enum('1','0') NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_alkes`
--

INSERT INTO `mst_alkes` (`id_alkes`, `nama_alkes`, `merk`, `jenis_alkes`, `status`) VALUES
(1, 'Jarum Otot', 'Puma', '1', '1'),
(2, 'Jarum Kulit', 'Adidas', '1', '1'),
(3, 'Stetoskop', 'Nike', '0', '1'),
(4, 'Suntikanzzzz', 'Adidas', '1', '0'),
(5, 'Kapas', 'Dove', '1', '0'),
(6, 'Infus', 'Sanbe', '1', '1'),
(7, 'Jarum Kaki', 'Apapun', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_alkes_keluar`
--

CREATE TABLE `mst_alkes_keluar` (
  `id_alkes_keluar` int(5) NOT NULL,
  `id_alkes` int(5) NOT NULL,
  `qty` int(5) NOT NULL,
  `tgl_keluar` varchar(12) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_alkes_keluar`
--

INSERT INTO `mst_alkes_keluar` (`id_alkes_keluar`, `id_alkes`, `qty`, `tgl_keluar`, `status`) VALUES
(4, 1, 1, '28-11-2016', '0'),
(5, 1, 1, '29/11/2016', '0'),
(6, 1, 1, '07/12/2016', '0'),
(7, 1, 1, '07/12/2016', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mst_alkes_masuk`
--

CREATE TABLE `mst_alkes_masuk` (
  `id_alkes_masuk` int(5) NOT NULL,
  `id_alkes` int(5) NOT NULL,
  `id_type_gudang` int(5) NOT NULL,
  `qty` int(5) NOT NULL,
  `tgl_masuk` varchar(12) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_alkes_masuk`
--

INSERT INTO `mst_alkes_masuk` (`id_alkes_masuk`, `id_alkes`, `id_type_gudang`, `qty`, `tgl_masuk`, `status`) VALUES
(5, 1, 1, 2, '28/11/2016', '0'),
(6, 1, 2, 2, '28/11/2016', '0'),
(7, 1, 1, 10, '06/12/2016', '0'),
(8, 5, 2, 10, '06/12/2016', '0'),
(9, 1, 1, 10, '13/12/2016', '0'),
(10, 6, 1, 10, '13/12/2016', '0'),
(11, 1, 1, 10, '13/12/2016', '0'),
(12, 1, 1, 10, '13/12/2016', '0'),
(13, 1, 2, 10, '14/12/2016', '0'),
(14, 6, 1, 10, '14/12/2016', '0'),
(15, 1, 1, 10, '18/12/2016', '0'),
(16, 6, 2, 10, '18/12/2016', '0'),
(17, 1, 1, 50, '11/03/2020', '0'),
(18, 1, 1, 10, '11/03/2020', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_desa`
--

CREATE TABLE `mst_desa` (
  `id_desa` int(5) NOT NULL,
  `nama_desa` varchar(50) NOT NULL,
  `nama_kepala_desa` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_employee`
--

CREATE TABLE `mst_employee` (
  `id_employee` int(11) NOT NULL,
  `id_jabatan` int(3) NOT NULL,
  `id_poli` int(11) DEFAULT NULL,
  `name_employee` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `golongan_pns` varchar(2) NOT NULL,
  `status_pegawai` enum('1','0') NOT NULL DEFAULT '1',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_employee`
--

INSERT INTO `mst_employee` (`id_employee`, `id_jabatan`, `id_poli`, `name_employee`, `jenis_kelamin`, `no_telp`, `alamat`, `golongan_pns`, `status_pegawai`, `username`, `password`, `status`) VALUES
(1, 1, 0, 'admin', 'L', '083822293008', 'bandung', '1', '1', 'admin', '42525bb6d3b0dc06bb78ae548733e8fbb55446b3', '1'),
(2, 2, 0, 'satu', 'L', '49', 'bandung', '1', '1', 'obat', '42525bb6d3b0dc06bb78ae548733e8fbb55446b3', '1'),
(3, 3, 0, 'satu', 'L', '-', '-', '1', '1', 'daftar', '42525bb6d3b0dc06bb78ae548733e8fbb55446b3', '1'),
(4, 4, 1, 'Pemeriksaan gigi', 'L', '088008800880', 'Jl. Jakarta No. 48', '1', '1', 'gigi', '42525bb6d3b0dc06bb78ae548733e8fbb55446b3', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_kartu_pasien`
--

CREATE TABLE `mst_kartu_pasien` (
  `id_kartu_pasien` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_kegiatan_posyandu`
--

CREATE TABLE `mst_kegiatan_posyandu` (
  `id_kegiatan_posyandu` int(11) NOT NULL,
  `nama_kegiatan` varchar(64) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_kegiatan_posyandu`
--

INSERT INTO `mst_kegiatan_posyandu` (`id_kegiatan_posyandu`, `nama_kegiatan`, `status`) VALUES
(1, 'kia_kb', '1'),
(2, 'gizi', '1'),
(3, 'imunisasi', '1'),
(4, 'p2m', '1'),
(5, 'kesling', '1'),
(6, 'program_tambahan', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_kesehatan_indera`
--

CREATE TABLE `mst_kesehatan_indera` (
  `id_kesehatan_indera` int(4) NOT NULL,
  `nama_kesehatan_indera` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_kesehatan_indera`
--

INSERT INTO `mst_kesehatan_indera` (`id_kesehatan_indera`, `nama_kesehatan_indera`, `status`) VALUES
(1, 'KATARAK', '1'),
(2, 'GLAUKOMA', '1'),
(3, 'KELAINAN REFRAKSI', '1'),
(4, 'LAIN-LAIN', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_kesehatan_jiwa`
--

CREATE TABLE `mst_kesehatan_jiwa` (
  `id_kesehatan_jiwa` int(4) NOT NULL,
  `nama_kesehatan_jiwa` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_kesehatan_olahraga`
--

CREATE TABLE `mst_kesehatan_olahraga` (
  `id_kesehatan_olahraga` int(4) NOT NULL,
  `nama_kesehatan_olahraga` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_kesehatan_olahraga`
--

INSERT INTO `mst_kesehatan_olahraga` (`id_kesehatan_olahraga`, `nama_kesehatan_olahraga`, `status`) VALUES
(1, 'Jumlah Kelompok/klub yang ada', '1'),
(2, 'Jumlah Kelompok/klub yang dibina dalam gedung dan luar gedung', '1'),
(3, 'Pendapatan kelompok/klub olah raga', '1'),
(4, 'Pemeriksaan Kesehatan', '1'),
(5, 'Penyuluhan Kesehatan Olahraga', '1'),
(6, 'Petugas Yang Mengikuti Pelatihan', '1'),
(7, 'Konsultasi Kesehatan olah raga', '1'),
(8, 'anak sekolah', '1'),
(9, 'Orang dewasa', '1'),
(10, 'Calon Jemaan Haji', '1'),
(11, 'sebagai tim kesehatan pada event olah raga', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_kesehatan_pekerja`
--

CREATE TABLE `mst_kesehatan_pekerja` (
  `id_kesehatan_pekerja` int(4) NOT NULL,
  `nama_kesehatan_pekerja` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_kesehatan_pekerja`
--

INSERT INTO `mst_kesehatan_pekerja` (`id_kesehatan_pekerja`, `nama_kesehatan_pekerja`, `status`) VALUES
(1, 'Pekerja sakit yang dilayani', '1'),
(2, 'Kasus penyakit umum dikalangan pekerja', '1'),
(3, 'Gastritis', '1'),
(4, 'Chepalgia', '1'),
(5, 'Mialgia', '1'),
(6, 'RA', '1'),
(7, 'Kasus penyakit yang terkait dengan pekerjaan', '1'),
(8, 'Kasus kecelakaan yang terkait dengan pekerjaan', '1'),
(9, 'Frekuensi penyuluhan di tempat kerja formal', '1'),
(10, 'Frekuensi penyuluhan di tempat kerja informal', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_kesehatan_tradisional`
--

CREATE TABLE `mst_kesehatan_tradisional` (
  `id_kesehatan_tradisional` int(4) NOT NULL,
  `nama_kesehatan_tradisional` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_kesehatan_tradisional`
--

INSERT INTO `mst_kesehatan_tradisional` (`id_kesehatan_tradisional`, `nama_kesehatan_tradisional`, `status`) VALUES
(1, 'Jenis Keterampilan', '1'),
(2, 'Jenis Ramuan', '1'),
(3, 'Data Fasilitas Yan Kes Tradisional', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_klarifikasi_lab`
--

CREATE TABLE `mst_klarifikasi_lab` (
  `id_klarifikasi` int(4) NOT NULL,
  `nama_klarifikasi` varchar(64) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_klarifikasi_lab`
--

INSERT INTO `mst_klarifikasi_lab` (`id_klarifikasi`, `nama_klarifikasi`, `status`) VALUES
(1, 'hematologi', '1'),
(2, 'kimia_darah', '1'),
(3, 'hitung_jenis_lekosit', '1'),
(4, 'imunologi', '1'),
(5, 'jenis_pemeriksaan_urinalisa', '1'),
(6, 'widal', '1'),
(7, 'sedimen', '1'),
(8, 'mikrobiologi', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_medrec`
--

CREATE TABLE `mst_medrec` (
  `id_medrec` int(11) NOT NULL,
  `no_rekam_medis` int(11) NOT NULL,
  `id_registrasi` int(5) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosis` text NOT NULL,
  `terapi` text NOT NULL,
  `keterangan` text DEFAULT NULL,
  `status_rujukan` enum('0','1','2') NOT NULL,
  `dirujuk` varchar(100) DEFAULT NULL,
  `date_medrec` date NOT NULL,
  `time_medrec` time NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_medrec`
--

INSERT INTO `mst_medrec` (`id_medrec`, `no_rekam_medis`, `id_registrasi`, `id_employee`, `keluhan`, `diagnosis`, `terapi`, `keterangan`, `status_rujukan`, `dirujuk`, `date_medrec`, `time_medrec`, `status`) VALUES
(1, 200319579, 1, 4, 'asdf', 'asdf', 'asdf', 'asdf', '0', NULL, '2020-03-20', '20:51:00', '1'),
(2, 200319579, 2, 4, 'berlubang', 'karies', 'asdsadsadsda', '', '0', NULL, '2021-11-24', '13:22:00', '1'),
(3, 211130109, 3, 4, 'gigi berlubang', 'karies', 'tambal', '', '0', NULL, '2021-11-30', '10:08:00', '1'),
(4, 211130109, 4, 4, 'gigi busuk', 'sakit gigi', 'bor', '', '2', 'RS Al Islam', '2021-11-30', '10:14:00', '1'),
(5, 211130109, 6, 4, 'keluhan', 'diagnosis', 'terapi', '', '1', NULL, '2021-11-30', '10:16:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_medrec_inap`
--

CREATE TABLE `mst_medrec_inap` (
  `id_medrec_inap` int(11) NOT NULL,
  `no_rekam_medis` int(11) NOT NULL,
  `id_inap` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `tensi_darah` varchar(20) NOT NULL,
  `respiratori` varchar(20) NOT NULL,
  `nadi` varchar(10) NOT NULL,
  `suhu` varchar(10) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosis` text NOT NULL,
  `terapi` text NOT NULL,
  `keterangan` text NOT NULL,
  `dirujuk` text DEFAULT NULL,
  `tgl_medrec` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_obat`
--

CREATE TABLE `mst_obat` (
  `id_obat` int(5) NOT NULL,
  `id_type_obat` int(5) DEFAULT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `tgl_expire` varchar(12) NOT NULL,
  `id_satuan_obat` varchar(20) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_obat`
--

INSERT INTO `mst_obat` (`id_obat`, `id_type_obat`, `nama_obat`, `tgl_expire`, `id_satuan_obat`, `harga_satuan`, `status`) VALUES
(1, 5, 'Psikotropik', '27/03/2020', '1', 5000, '1'),
(2, 10, 'Psikotropik', '26/03/2020', '1', 50000, '0');

-- --------------------------------------------------------

--
-- Table structure for table `mst_pasien`
--

CREATE TABLE `mst_pasien` (
  `id_pasien` int(11) NOT NULL,
  `no_rekam_medis` bigint(20) NOT NULL,
  `status_asuransi` enum('umum','bpjs','askes','pkdg') NOT NULL,
  `no_asuransi` varchar(20) DEFAULT NULL,
  `no_induk_keluarga` varchar(30) NOT NULL,
  `name_patient` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` varchar(50) NOT NULL,
  `umur_pasien` int(3) NOT NULL,
  `jns_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `no_penanggung_jawab` varchar(20) NOT NULL,
  `golongan_darah` enum('A','B','AB','O','-') NOT NULL,
  `tensi_darah` varchar(20) NOT NULL,
  `berat_badan` int(11) NOT NULL,
  `tinggi_badan` int(11) NOT NULL,
  `respiratori` varchar(20) NOT NULL,
  `nadi` varchar(20) NOT NULL,
  `suhu` varchar(20) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `copy_ktp` varchar(255) NOT NULL,
  `copy_kk` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_pasien`
--

INSERT INTO `mst_pasien` (`id_pasien`, `no_rekam_medis`, `status_asuransi`, `no_asuransi`, `no_induk_keluarga`, `name_patient`, `tempat_lahir`, `tgl_lahir`, `umur_pasien`, `jns_kelamin`, `no_telp`, `no_penanggung_jawab`, `golongan_darah`, `tensi_darah`, `berat_badan`, `tinggi_badan`, `respiratori`, `nadi`, `suhu`, `pekerjaan`, `nama_ayah`, `nama_ibu`, `address`, `copy_ktp`, `copy_kk`, `status`) VALUES
(1, 200319579, 'umum', '', '123421', 'asdf', 'asdf', '08-08-1990', 0, 'Laki-laki', '08080', '80808', 'A', '100', 122, 123, '100', '100', '100', 'asdf', 'asdf', 'asdf', 'asdf', 'ktp_200319579.jpg', 'kk_200319579.jpg', '1'),
(2, 211130109, 'umum', '', '3273231902960001', 'Jafar Lukmana', 'Cirebon', '19-02-1996', 0, 'Laki-laki', '081', '0811', 'AB', '100', 60, 165, '100', '100', '100', 'swasta', 'ayah', 'ibu', 'alamat', 'ktp_211130109.png', 'kk_211130109.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_penyakit`
--

CREATE TABLE `mst_penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `penyebab` varchar(50) NOT NULL,
  `gejala` text NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_poli`
--

CREATE TABLE `mst_poli` (
  `id_poli` int(11) NOT NULL,
  `name_poli` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_poli`
--

INSERT INTO `mst_poli` (`id_poli`, `name_poli`, `status`) VALUES
(1, 'Gigi', '1'),
(2, 'Mata', '1'),
(3, 'Umum', '1'),
(4, 'KB', '1'),
(5, 'Imunisasi', '1'),
(6, 'Laboratorium', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_posyandu_desa`
--

CREATE TABLE `mst_posyandu_desa` (
  `id_posyandu_desa` int(11) NOT NULL,
  `id_desa` int(5) NOT NULL,
  `nama_posyandu` varchar(50) NOT NULL,
  `alamat_posyandu` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_resep`
--

CREATE TABLE `mst_resep` (
  `id_resep` int(5) NOT NULL,
  `id_obat` int(5) NOT NULL,
  `id_poli` int(5) NOT NULL,
  `id_registrasi` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `dosis` varchar(30) NOT NULL,
  `diminum` varchar(255) NOT NULL,
  `untuk_hari` int(11) NOT NULL,
  `tgl_resep` date NOT NULL,
  `status` enum('2','1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_resep`
--

INSERT INTO `mst_resep` (`id_resep`, `id_obat`, `id_poli`, `id_registrasi`, `id_employee`, `dosis`, `diminum`, `untuk_hari`, `tgl_resep`, `status`) VALUES
(1, 1, 1, 1, 4, '1x1', 'Sudah Makan,', 1, '2020-03-20', '2'),
(2, 1, 1, 2, 4, '2x1', 'Sudah Makan,', 10, '2021-11-24', '1'),
(3, 1, 1, 3, 4, '3x1', 'Sudah Makan,', 5, '2021-11-30', '2');

-- --------------------------------------------------------

--
-- Table structure for table `mst_resep_inap`
--

CREATE TABLE `mst_resep_inap` (
  `id_resep_inap` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_inap` int(11) NOT NULL,
  `id_medrec_inap` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `dosis` varchar(30) NOT NULL,
  `diminum` text NOT NULL,
  `untuk_hari` int(11) NOT NULL,
  `tgl_resep` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_ruangan`
--

CREATE TABLE `mst_ruangan` (
  `id_ruangan` int(20) NOT NULL,
  `nama_ruangan` varchar(20) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_ruangan`
--

INSERT INTO `mst_ruangan` (`id_ruangan`, `nama_ruangan`, `status`) VALUES
(1, 'Kenanga 1.1', '0'),
(2, 'Kenanga 2.1', '1'),
(3, 'Kenanga 2.2', '1'),
(4, 'Aula 1.1', '1'),
(5, 'Aula 1.2', '1'),
(6, 'Aula 1.3', '1'),
(7, 'Aula 1.4', '1'),
(8, 'Aula 1.5', '1'),
(9, 'Melati 1.1', '1'),
(10, 'Melati 1.2', '1'),
(11, 'Melati 1.3', '1'),
(12, 'Mawar 1.1', '1'),
(13, 'Mawar 1.2', '1'),
(14, 'Mawar 1.3', '1'),
(15, 'Mawar 1.4', '1'),
(16, 'Dahlia 1.1', '0'),
(17, 'Dahlia 1.2', '1'),
(18, 'isolasi 1.1', '1'),
(19, 'Isolasi 1.2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_tindakan`
--

CREATE TABLE `mst_tindakan` (
  `id_tindakan` int(11) NOT NULL,
  `id_medrec` int(11) NOT NULL,
  `tindakan` text NOT NULL,
  `id_alkes` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_tindakan`
--

INSERT INTO `mst_tindakan` (`id_tindakan`, `id_medrec`, `tindakan`, `id_alkes`, `qty`) VALUES
(1, 2, 'cabut', 1, 1),
(2, 3, 'suntik', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_tindakan_inap`
--

CREATE TABLE `mst_tindakan_inap` (
  `id_tindakan_inap` int(11) NOT NULL,
  `id_medrec_inap` int(11) NOT NULL,
  `tindakan` text NOT NULL,
  `id_alkes` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mst_type_gudang`
--

CREATE TABLE `mst_type_gudang` (
  `id_type_gudang` int(5) NOT NULL,
  `name_type_gudang` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_type_gudang`
--

INSERT INTO `mst_type_gudang` (`id_type_gudang`, `name_type_gudang`, `status`) VALUES
(1, 'BPJS Kesehatan', '1'),
(2, 'Dinas Kesehatan Kabupaten Pangandaran', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mst_type_obat`
--

CREATE TABLE `mst_type_obat` (
  `id_type_obat` int(5) NOT NULL,
  `nama_type_obat` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_type_obat`
--

INSERT INTO `mst_type_obat` (`id_type_obat`, `nama_type_obat`, `status`) VALUES
(1, 'Generic', '0'),
(2, 'Non Generic', '0'),
(3, 'Hehehehe', '0'),
(4, 'Generics', '0'),
(5, 'Psikotropik', '1'),
(6, 'narkotik', '1'),
(7, 'Antibiotik', '1'),
(8, 'Analgetik', '0'),
(9, 'batuk pilek', '0'),
(10, 'Nootropik/Neurotroopik', '1'),
(11, 'Nootropik/Neurotroopik', '0'),
(12, 'Analgesik non Narkotik', '1'),
(13, 'Antiinflamasi Non Steroid (AINS)', '1'),
(14, 'Antipirai', '1'),
(15, 'Antialergi/Antihistamin', '1'),
(16, 'Hormon Kortikosteroida', '1'),
(17, 'Antiepilepsi/Antikonvulsi', '1'),
(18, 'Antelmintik', '1'),
(19, 'Antifungi', '1'),
(20, 'Antiprotozoa(Antiamoeba dan Antigiardiasis)', '1'),
(21, 'Antivirus (Anti Herves)', '1'),
(22, 'Anti Parikinson', '1'),
(23, 'Obat untuk darah dan jaringan pembentuk darah', '1'),
(24, 'Anti Koagulasi', '1'),
(25, 'Anti Diabetik Oral', '1'),
(26, 'Obat Kardiovaskuler', '0'),
(27, 'Obat Kardiovaskuler', '1'),
(28, 'Anti Hypertensi', '1'),
(29, 'Anti trombotik (Anti Penyakit Jantung Trombotik)', '1'),
(30, 'Anti Hiperlipidemia', '1'),
(31, 'Obat topikal untu kulit', '1'),
(32, 'Preparat Topikal Laninnya', '1'),
(33, 'Larutan Elektrolit dan Nutrisi', '1'),
(34, 'Preparat mata Topikal', '1'),
(35, 'Oksitosik', '1'),
(36, 'Anti depresi dan anti mania', '1'),
(37, 'Obat saluran cerna', '1'),
(38, 'Anti Emetik', '1'),
(39, 'Anti Haemoroid', '1'),
(40, 'Obat Diare', '1'),
(41, 'Obat saluran Nafas', '1'),
(42, 'Anti tusif', '1'),
(43, 'Ekspektoran', '1'),
(44, 'Vitamin dan Mineral', '1'),
(45, 'Anti Psikosis', '1'),
(46, 'Anti Spasmodik Analgesik', '1'),
(47, 'Probiotic', '1'),
(48, 'OAT Paket Dewasa', '1'),
(49, 'Anestesi Lokal', '1'),
(50, 'Corona', '1');

-- --------------------------------------------------------

--
-- Table structure for table `promkes_master`
--

CREATE TABLE `promkes_master` (
  `id_indikator_promkes` int(11) NOT NULL,
  `indikator_promkes` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promkes_master`
--

INSERT INTO `promkes_master` (`id_indikator_promkes`, `indikator_promkes`, `status`) VALUES
(1, 'Indikator PHBS - Persalinan (Ada Ibu Bersalin)', '1'),
(2, 'Indikator PHBS - Persalinan (LINAKES)', '1'),
(3, 'Indikator PHBS - Memberi ASI Eksklusif (Bayi < 6 Bulan)', '1'),
(4, 'Indikator PHBS - Memberi ASI Eksklusif (ASI Saja)', '1'),
(5, 'Indikator PHBS - Memberi ASI Eksklusif (Bayi 6 - 12 Bulan)', '1'),
(6, 'Indikator PHBS - Memberi ASI Eksklusif (Bayi 6 - 12 Bulan Lulus ASI Eksklusif)', '1'),
(7, 'Indikator PHBS - Menimbang (Ada Bayi dan Balita)', '1'),
(8, 'Indikator PHBS - Menimbang (Ditimbang)', '1'),
(9, 'Indikator PHBS - Menggunakan Air Bersih', '1'),
(10, 'Indikator PHBS - Mencuci Tangan Dengan Air Bersih dan Sabun', '1'),
(11, 'Indikator PHBS - Menggunakan Jamban', '1'),
(12, 'Indikator PHBS - Memberantas Jentik Dirumah', '1'),
(13, 'Indikator PHBS - Makan Buah dan Sayur Setiap Hari', '1'),
(14, 'Indikator PHBS - Melakukan Aktivitas Fisik Setiap Hari', '1'),
(15, 'Indikator PHBS - Tidak Merokok Di Dalam Rumah', '1'),
(16, 'Status Keluarga - Sehat', '1'),
(17, 'Status Keluarga - Tidak Sehat', '1'),
(18, 'Status Rumah Tangga - Sehat', '1'),
(19, 'Status Rumah Tangga - Tidak Sehat', '1'),
(20, 'Menimbang - Ada Bayi dan Balita', '1'),
(21, 'Menimbang - Ditimbang', '1'),
(22, 'Indikator Kadarzi - Memberi ASI Eksklusif (Bayi < 6 Bulan)', '1'),
(23, 'Indikator Kadarzi - Memberi ASI Eksklusif (ASI Saja)', '1'),
(24, 'Indikator Kadarzi - Memberi ASI Eksklusif (Bayi 6 - 12)', '1'),
(25, 'Indikator Kadarzi - Memberi ASI Eksklusif (Bayi 6 - 12 Lulus ASI Eksklusif)', '1'),
(26, 'Indikator Kadarzi - Makan Aneka Ragam', '1'),
(27, 'Indikator Kadarzi - Menggunakan Garam Beryodium', '1'),
(28, 'Indikator Kadarzi - Memberikan Suplemen Vit A / Fo (BUMN, BUFAS, Bayi dan Balita)', '1'),
(29, 'Status Kadarzi - Kadarzi', '1'),
(30, 'Status Kadarzi - Tidak Kadarzi', '1'),
(31, 'Kematian WUS 10 - 49 Tahun (Tulis Umur Soal WUS Meninggal)', '1');

-- --------------------------------------------------------

--
-- Table structure for table `promkes_mst_detail`
--

CREATE TABLE `promkes_mst_detail` (
  `id_detail_promkes` int(4) NOT NULL,
  `no_urut_rt` int(5) NOT NULL,
  `no_urut_kk` int(5) NOT NULL,
  `nama_kk` varchar(50) NOT NULL,
  `id_promkes` int(4) NOT NULL,
  `nilai_detail_promkes` int(5) NOT NULL,
  `periode_promkes` varchar(8) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rabies_ref_letak_gigitan`
--

CREATE TABLE `rabies_ref_letak_gigitan` (
  `id_letak_gigitan` int(3) NOT NULL,
  `letak_gigitan` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rabies_ref_letak_gigitan`
--

INSERT INTO `rabies_ref_letak_gigitan` (`id_letak_gigitan`, `letak_gigitan`, `status`) VALUES
(1, 'Kaki', '1'),
(2, 'Tangan', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rabies_ref_observasi`
--

CREATE TABLE `rabies_ref_observasi` (
  `id_observasi_rabies` int(3) NOT NULL,
  `nama_observasi` varchar(30) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rabies_ref_observasi`
--

INSERT INTO `rabies_ref_observasi` (`id_observasi_rabies`, `nama_observasi`, `status`) VALUES
(1, 'Mati', '1'),
(2, 'Sehat', '1'),
(3, 'Liar', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rabies_ref_penyebab`
--

CREATE TABLE `rabies_ref_penyebab` (
  `id_penyebab` int(3) NOT NULL,
  `nama_penyebab` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rabies_ref_penyebab`
--

INSERT INTO `rabies_ref_penyebab` (`id_penyebab`, `nama_penyebab`, `status`) VALUES
(1, 'Mendapat VAR & SAR', '1'),
(2, 'Anjing', '1'),
(3, 'Kera', '1'),
(4, 'Kucing', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rabies_trn_kasus`
--

CREATE TABLE `rabies_trn_kasus` (
  `id_trn_kasus_rabies` int(3) NOT NULL,
  `id_desa` int(3) NOT NULL,
  `id_pasien` int(3) NOT NULL,
  `id_penyebab` int(3) NOT NULL,
  `id_letak_gigitan` int(3) NOT NULL,
  `tgl_kejadian` date NOT NULL,
  `id_observasi` int(3) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ref_diagnosis`
--

CREATE TABLE `ref_diagnosis` (
  `id_diagnosis` int(11) NOT NULL,
  `diagnosis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_diagnosis`
--

INSERT INTO `ref_diagnosis` (`id_diagnosis`, `diagnosis`) VALUES
(1, 'asdf'),
(2, 'karies'),
(3, 'karies'),
(4, 'sakit gigi'),
(5, 'diagnosis');

-- --------------------------------------------------------

--
-- Table structure for table `ref_jabatan`
--

CREATE TABLE `ref_jabatan` (
  `id_jabatan` int(3) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `page` varchar(20) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_jabatan`
--

INSERT INTO `ref_jabatan` (`id_jabatan`, `nama_jabatan`, `page`, `status`) VALUES
(1, 'Admin Master', 'Master', '1'),
(2, 'Admin Obat', 'Transaksi_obat', '1'),
(3, 'Staf Pendaftaran', 'Pendaftaran', '1'),
(4, 'Dokter Poli', 'Poli', '1'),
(5, 'Petugas Rawat Inap', 'Inap', '1'),
(6, 'Dokter Laboratorium', 'Lab', '1'),
(8, 'Admin Sistem', 'Sistem', '1'),
(9, 'ANC Terpadu', 'Anc_terpadu', '1'),
(10, 'YANKESUS', 'Yankesus', '1'),
(11, 'BP', 'Bp', '1'),
(12, 'Kesling', 'Kesling', '1'),
(13, 'Promkes', 'Promkes', '1'),
(14, 'Ispa', 'Ispa', '1'),
(15, 'Rabies', 'Rabies', '1'),
(16, 'Sekolah', 'Sekolah', '1'),
(17, 'Malaria', 'Malaria', '1'),
(18, 'DBD', 'Dbd', '1'),
(19, 'Filaria', 'Filaria', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kegiatan_posyandu`
--

CREATE TABLE `ref_kegiatan_posyandu` (
  `id_ref_kegiatan_posyandu` int(11) NOT NULL,
  `id_kegiatan_posyandu` int(11) NOT NULL,
  `nama_ref_kegiatan` varchar(64) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kegiatan_posyandu`
--

INSERT INTO `ref_kegiatan_posyandu` (`id_ref_kegiatan_posyandu`, `id_kegiatan_posyandu`, `nama_ref_kegiatan`, `status`) VALUES
(1, 1, 'k1', '1'),
(2, 1, 'k2', '1'),
(3, 1, 'k3', '1'),
(4, 1, 'k4', '1'),
(5, 2, 's', '1'),
(6, 2, 'k', '1'),
(7, 2, 'd', '1'),
(8, 2, 'n', '1'),
(9, 2, 'd_s', '1'),
(10, 2, 'n_s', '1'),
(11, 2, 'gizi_kurang', '1'),
(12, 2, 'gizi_buruk', '1'),
(13, 2, 'gizi_baik', '1'),
(14, 3, 'bcg', '1'),
(15, 3, 'campak', '1'),
(16, 3, 'venta_i', '1'),
(17, 3, 'venta_ii', '1'),
(18, 3, 'venta_iii', '1'),
(19, 3, 'polio_i', '1'),
(20, 3, 'polio_ii', '1'),
(21, 3, 'polio_iii', '1'),
(22, 3, 'polio_iv', '1'),
(23, 3, 'penyakit_menular', '1'),
(24, 4, 'rabies', '1'),
(25, 4, 'uks', '1'),
(26, 4, 'malari', '1'),
(27, 4, 'dbd', '1'),
(28, 4, 'tbc', '1'),
(29, 4, 'diare', '1'),
(30, 4, 'kusta', '1'),
(31, 4, 'ispa', '1'),
(32, 4, 'filaria', '1'),
(33, 5, 'spal', '1'),
(34, 5, 'jaga', '1'),
(35, 6, 'pusbila', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_keluhan`
--

CREATE TABLE `ref_keluhan` (
  `id_keluhan` int(11) NOT NULL,
  `keluhan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_keluhan`
--

INSERT INTO `ref_keluhan` (`id_keluhan`, `keluhan`) VALUES
(1, 'asdf'),
(2, 'berlubang'),
(3, 'gigi berlubang'),
(4, 'gigi busuk'),
(5, 'keluhan');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kesehatan_indera`
--

CREATE TABLE `ref_kesehatan_indera` (
  `id_ref_kesehatan_indera` int(4) NOT NULL,
  `id_kesehatan_indera` int(4) NOT NULL,
  `nama_ref_kesehatan_indera` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kesehatan_indera`
--

INSERT INTO `ref_kesehatan_indera` (`id_ref_kesehatan_indera`, `id_kesehatan_indera`, `nama_ref_kesehatan_indera`, `status`) VALUES
(1, 1, 'Jumlah orang yang diskrining katarak (usia >40 tahun)', '1'),
(2, 1, 'Jumlah orang diskrining (usia >40 tahun) yang menderita katatrak', '1'),
(3, 1, 'Jumlah Rujukan gangguan penlihatan pada kasus Diabetes Melitus ke Rumah Sakit', '1'),
(4, 1, 'Frekuensi Op Katarak Masal', '1'),
(5, 1, 'Penderita katarak yang datang ke lokasi Op', '1'),
(6, 1, 'Dana Bantuan Keuangan APBD I', '1'),
(7, 1, 'Dana Bantuan APBD II', '1'),
(8, 1, 'Perorangan/Swasta/LSM', '1'),
(9, 2, 'Jumlah orang yang diskrining', '1'),
(10, 2, 'Jumlah yang menderita glaukoma', '1'),
(11, 2, 'Jumlah penderita glaukoma yang dioperasi', '1'),
(12, 2, 'Jumlah penderita glaukoma yang diterapi', '1'),
(13, 2, 'Jumlah penderita glaukoma yang di rujuk', '1'),
(14, 3, 'Jumlah SD-MI di wilayah kerja puskesmas', '1'),
(15, 3, 'Jumlah SD-MI yang di lakukakn pernjaringan', '1'),
(16, 3, 'Jumalh murid SD-MI kelas I diskrining kes. indera', '1'),
(17, 3, 'Jumlah murid SD-MI kelas I dengan kelainan refraksi', '1'),
(18, 3, 'Jumlah murid SD-MI kelas V, VI yang diskrining kes. indera', '1'),
(19, 3, 'Jumlah murid SD-MI (Kelas V, VI) dengan kelainan refraksi', '1'),
(20, 3, 'Jumlah SMP wilayah kerja puseksmas', '1'),
(21, 3, 'Jumlah SMP yang dilakukan penjaringan', '1'),
(22, 3, 'Jumlah murid SMP kelas VII, VII ,IX yang di skrining', '1'),
(23, 3, 'Jumlah murid SMP kelas VII, VII, IX dengan kelainan refraksi', '1'),
(24, 3, 'Total kunjungan gangguan refraksi di puskesmas', '1'),
(25, 3, 'Jumlah kasus rujukan', '1'),
(26, 3, 'Jumlah pemberian Kacamata', '1'),
(27, 4, 'Konjungtivitis', '1'),
(28, 4, 'Kreatitis', '1'),
(29, 4, 'Kekurangan Vitamin A (Xeroftalmia)', '1'),
(30, 4, 'Gangguan mata dan adnesa lainya', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kesehatan_jiwa`
--

CREATE TABLE `ref_kesehatan_jiwa` (
  `id_ref_kesehatan_jiwa` int(4) NOT NULL,
  `id_kesehatan_jiwa` int(4) NOT NULL,
  `nama_ref_kesehatan_jiwa` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ref_kesehatan_tradisional`
--

CREATE TABLE `ref_kesehatan_tradisional` (
  `id_ref_kesehatan_tradisional` int(4) NOT NULL,
  `id_kesehatan_tradisional` int(4) NOT NULL,
  `nama_ref_kesehatan_tradisional` varchar(128) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kesehatan_tradisional`
--

INSERT INTO `ref_kesehatan_tradisional` (`id_ref_kesehatan_tradisional`, `id_kesehatan_tradisional`, `nama_ref_kesehatan_tradisional`, `status`) VALUES
(1, 1, 'Battra Pijat Urut', '1'),
(2, 1, 'Battra Patah Tulang', '1'),
(3, 1, 'Battra sunnat', '1'),
(4, 1, 'Battra Dukun Bayi', '1'),
(5, 1, 'Battra Pijat Refleksi', '1'),
(6, 1, 'Akupresurius', '1'),
(7, 1, 'Akuntukturis', '1'),
(8, 1, 'Chiropraktor', '1'),
(9, 1, 'Penata Kecantikan kulit/rambut', '1'),
(10, 1, 'Battra Bekam', '1'),
(11, 1, 'Shiatsu', '1'),
(12, 1, 'Ostheopat', '1'),
(13, 1, 'Apiterapis/Sengat lebah', '1'),
(14, 1, 'Battra Tenaga Dalam (prana)', '1'),
(15, 1, 'Battra Tenaga Dalam prawaskita', '1'),
(16, 1, 'Battra reiki', '1'),
(17, 1, 'Battra qigong', '1'),
(18, 1, 'Battra Kebatinan', '1'),
(19, 1, 'Battra Ajaran Agama', '1'),
(20, 1, 'Yoga', '1'),
(21, 1, 'Hipnoterapis', '1'),
(22, 1, 'Battra Meditasi', '1'),
(23, 1, 'Battra Touch For Health', '1'),
(24, 1, 'Battra lainnya sejenis', '1'),
(25, 2, 'Battra Ramuan Ind. (jamu)', '1'),
(26, 2, 'Battra Gurah', '1'),
(27, 2, 'Shine', '1'),
(28, 2, 'Homeopath', '1'),
(29, 2, 'Aromaterapis', '1'),
(30, 2, 'Spa terapis', '1'),
(31, 2, 'Aryuveda', '1'),
(32, 2, 'Batrra lainnya sejenis', '1'),
(33, 3, 'Fasyankestrad perorangan', '1'),
(34, 3, 'Fasyankestrad Kelompok', '1'),
(35, 3, 'SPA', '1'),
(36, 3, 'SALON', '1'),
(37, 3, 'Kelompok Pemanfaat TOGA', '1'),
(38, 3, 'Toko Obat Tradisional', '1'),
(39, 3, 'Posyandu melaksanakan Kestrad', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_klarifikasi_lab`
--

CREATE TABLE `ref_klarifikasi_lab` (
  `id_ref_klarifikasi` int(4) NOT NULL,
  `id_klarifikasi` int(4) NOT NULL,
  `nama_ref_klarifikasi` varchar(64) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_klarifikasi_lab`
--

INSERT INTO `ref_klarifikasi_lab` (`id_ref_klarifikasi`, `id_klarifikasi`, `nama_ref_klarifikasi`, `status`) VALUES
(1, 1, 'hemoglobin', '1'),
(2, 1, 'lecosit_wbc', '1'),
(3, 1, 'eritrosit_rbc', '1'),
(4, 1, 'hematokrit', '1'),
(5, 1, 'trombosit', '1'),
(6, 1, 'laju_endapan_darah', '1'),
(7, 1, 'waktu_pendarahan', '1'),
(8, 1, 'waktu_pembekuan', '1'),
(9, 2, 'glukosa_darah_sewaktu', '1'),
(10, 2, 'glukosa_darah_puasa', '1'),
(11, 2, 'glukosa_darah_2_jam_pp', '1'),
(12, 2, 'cholestrol_total', '1'),
(13, 2, 'trigliserida', '1'),
(14, 2, 'hdl_cholestrol', '1'),
(15, 2, 'ldl_cholestrol_direct', '1'),
(16, 2, 'ureum', '1'),
(17, 2, 'creatinin', '1'),
(18, 2, 'asam_urat', '1'),
(19, 2, 'sgot', '1'),
(20, 2, 'sgpt', '1'),
(21, 3, 'basifil', '1'),
(22, 3, 'eosinofil', '1'),
(23, 3, 'netrofil_batang', '1'),
(24, 3, 'netrofil_segmen', '1'),
(25, 3, 'limfosit', '1'),
(26, 3, 'monosif', '1'),
(27, 4, 'golongan_darah', '1'),
(28, 4, 'rhesus', '1'),
(29, 4, 'hbsag', '1'),
(30, 5, 'warna', '1'),
(31, 5, 'kekeruhan', '1'),
(32, 5, 'bi', '1'),
(33, 5, 'ph', '1'),
(34, 5, 'protein', '1'),
(35, 5, 'glukosa', '1'),
(36, 5, 'keton', '1'),
(37, 5, 'darah_samar', '1'),
(38, 5, 'lekosit', '1'),
(39, 5, 'nitrit', '1'),
(40, 5, 'urobiliinogen', '1'),
(41, 6, 'salmomlla_typhi_o', '1'),
(42, 6, 'salmomlla_paratyphi_ao', '1'),
(43, 6, 'salmomlla_paratyphi_bo', '1'),
(44, 6, 'salmomlla_paratyphi_co', '1'),
(45, 6, 'salmomlla_typhi_h', '1'),
(46, 6, 'salmomlla_paratyphi_ah', '1'),
(47, 6, 'salmomlla_paratyphi_bh', '1'),
(48, 6, 'salmomlla_paratyphi_ch', '1'),
(49, 7, 'lekosit_lpb', '1'),
(50, 7, 'eritrosit', '1'),
(51, 7, 'epitel', '1'),
(52, 7, 'kristal', '1'),
(53, 7, 'silinder', '1'),
(54, 7, 'lain_lain', '1'),
(55, 7, 'test_kehamilan', '1'),
(56, 8, 'bta_s_p_s', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_range_umur`
--

CREATE TABLE `ref_range_umur` (
  `id_range_umur` int(5) NOT NULL,
  `range_umur` varchar(40) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_range_umur`
--

INSERT INTO `ref_range_umur` (`id_range_umur`, `range_umur`, `status`) VALUES
(1, '0 - < 6 Bulan', '1'),
(2, '>= 6 Bulan - &lt; 1  Tahun', '1'),
(3, '0 - < 1 Tahun', '1'),
(4, '0 - &lt; 5 Tahun', '1'),
(5, '>= 1 Tahun - < 5 Tahun', '1'),
(6, '&lt; 5 Tahun', '1'),
(7, '>= 5 Tahun - < 10 Tahun', '1'),
(8, '>= 10 Tahun - &lt; 15 Tahun', '1'),
(9, '>= 15 Tahun - &lt; 20 Tahun', '1'),
(10, '>= 20 Tahun', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_satuan_obat`
--

CREATE TABLE `ref_satuan_obat` (
  `id_satuan` int(5) NOT NULL,
  `name_satuan` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_satuan_obat`
--

INSERT INTO `ref_satuan_obat` (`id_satuan`, `name_satuan`, `status`) VALUES
(1, 'Tablet', '1'),
(2, 'Botol', '1'),
(3, 'Vial', '1'),
(4, 'Ampul', '1'),
(5, 'Sachet', '1'),
(6, 'Box', '1'),
(7, 'Pcs', '1'),
(8, 'Suppositoria', '0'),
(9, 'POt', '1'),
(10, 'Tube 5 Gram', '1'),
(11, 'Botol 60 ml', '1'),
(12, 'Botol 170 ml', '1'),
(13, 'Botol 12 ml', '1'),
(14, 'Nebules 2,5 ml', '1'),
(15, 'Botol 100 ml', '1'),
(16, 'Liter', '1'),
(17, 'Roll', '1'),
(18, 'Set Vial', '1'),
(19, 'Kit', '1'),
(20, 'Set', '1'),
(21, 'Buah ', '1'),
(22, 'Dus', '1'),
(23, 'Hehehehe', '0'),
(24, 'Galons', '0'),
(25, 'Botol 30 ml', '1'),
(26, 'Kapsul', '1'),
(27, 'Kaplet', '1'),
(28, 'Paket', '1'),
(29, 'Tube', '1'),
(30, 'Wadah', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ref_terapi`
--

CREATE TABLE `ref_terapi` (
  `id_terapi` int(11) NOT NULL,
  `terapi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_terapi`
--

INSERT INTO `ref_terapi` (`id_terapi`, `terapi`) VALUES
(1, 'asdf'),
(2, 'asdsadsadsda'),
(3, 'tambal'),
(4, 'bor'),
(5, 'terapi');

-- --------------------------------------------------------

--
-- Table structure for table `trn_apotek_inap`
--

CREATE TABLE `trn_apotek_inap` (
  `id_apotek_inap` int(11) NOT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `id_alkes` int(11) DEFAULT NULL,
  `qty_in` int(11) NOT NULL,
  `qty_out` int(11) NOT NULL DEFAULT 0,
  `tanggal` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trn_detail_kegiatan_posyandu`
--

CREATE TABLE `trn_detail_kegiatan_posyandu` (
  `id_trn_detail_kegiatan_posyandu` int(11) NOT NULL,
  `id_kegiatan_posyandu` int(11) NOT NULL,
  `id_ref_kegiatan_posyandu` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_posyandu_desa` int(11) NOT NULL,
  `tanggal` varchar(64) NOT NULL,
  `nilai` varchar(64) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trn_detail_klarifikasi_lab`
--

CREATE TABLE `trn_detail_klarifikasi_lab` (
  `id_trn_detail_klarifikasi_lab` int(4) NOT NULL,
  `id_klarifikasi` int(4) NOT NULL,
  `id_ref_klarifikasi` int(4) NOT NULL,
  `id_pasien` int(4) NOT NULL,
  `id_employee` int(64) NOT NULL,
  `nilai` varchar(64) NOT NULL,
  `jumlah_tindakan` bigint(64) NOT NULL DEFAULT 1,
  `tanggal` varchar(64) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trn_detail_registrasi`
--

CREATE TABLE `trn_detail_registrasi` (
  `id_detail_registrasi` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `type_registrasi` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trn_gudang_obat_keluar`
--

CREATE TABLE `trn_gudang_obat_keluar` (
  `id_trn_gudang_obat_keluar` int(5) NOT NULL,
  `id_trn_gudang_obat_masuk` int(5) NOT NULL,
  `id_obat` int(5) NOT NULL,
  `id_type_gudang` int(5) NOT NULL,
  `qty` int(3) NOT NULL,
  `tanggal_keluar` varchar(12) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trn_gudang_obat_keluar`
--

INSERT INTO `trn_gudang_obat_keluar` (`id_trn_gudang_obat_keluar`, `id_trn_gudang_obat_masuk`, `id_obat`, `id_type_gudang`, `qty`, `tanggal_keluar`, `status`) VALUES
(1, 1, 1, 1, 0, '10/03/2020', '1'),
(2, 2, 1, 2, 0, '10/03/2020', '1'),
(3, 1, 1, 1, 10, '01/03/2020', '1'),
(4, 1, 1, 1, 40, '11/03/2020', '1');

-- --------------------------------------------------------

--
-- Table structure for table `trn_gudang_obat_masuk`
--

CREATE TABLE `trn_gudang_obat_masuk` (
  `id_trn_gudang_obat_masuk` int(5) NOT NULL,
  `id_obat` int(5) NOT NULL,
  `id_type_gudang` int(5) NOT NULL,
  `qty` int(3) NOT NULL,
  `tgl_obat_masuk` varchar(12) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trn_gudang_obat_masuk`
--

INSERT INTO `trn_gudang_obat_masuk` (`id_trn_gudang_obat_masuk`, `id_obat`, `id_type_gudang`, `qty`, `tgl_obat_masuk`, `status`) VALUES
(1, 1, 1, 50, '10/03/2020', '1'),
(2, 1, 2, 50, '10/03/2020', '0');

-- --------------------------------------------------------

--
-- Table structure for table `trn_obat_apotek_keluar`
--

CREATE TABLE `trn_obat_apotek_keluar` (
  `id_obat_apotek_keluar` int(5) NOT NULL,
  `id_obat_apotek_masuk` int(5) DEFAULT NULL,
  `id_obat` int(5) NOT NULL,
  `id_registrasi` int(5) DEFAULT NULL,
  `qty` int(3) NOT NULL,
  `tanggal_keluar` varchar(12) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trn_obat_apotek_keluar`
--

INSERT INTO `trn_obat_apotek_keluar` (`id_obat_apotek_keluar`, `id_obat_apotek_masuk`, `id_obat`, `id_registrasi`, `qty`, `tanggal_keluar`, `status`) VALUES
(1, 1, 1, NULL, 0, '01/03/2020', '1'),
(2, 2, 1, NULL, 0, '11/03/2020', '1'),
(3, 1, 1, 1, 1, '24/11/2021', '1'),
(4, 1, 1, 3, 15, '30/11/2021', '1');

-- --------------------------------------------------------

--
-- Table structure for table `trn_obat_apotek_masuk`
--

CREATE TABLE `trn_obat_apotek_masuk` (
  `id_obat_apotek_masuk` int(5) NOT NULL,
  `id_obat` int(5) NOT NULL,
  `qty` int(11) NOT NULL,
  `tgl_obat_masuk` varchar(12) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trn_obat_apotek_masuk`
--

INSERT INTO `trn_obat_apotek_masuk` (`id_obat_apotek_masuk`, `id_obat`, `qty`, `tgl_obat_masuk`, `status`) VALUES
(1, 1, 10, '01/03/2020', '1'),
(2, 1, 40, '11/03/2020', '1');

-- --------------------------------------------------------

--
-- Table structure for table `trn_pasien_inap`
--

CREATE TABLE `trn_pasien_inap` (
  `id_inap` int(20) NOT NULL,
  `id_registrasi` int(11) NOT NULL,
  `id_pasien` int(20) NOT NULL,
  `id_ruangan` int(20) DEFAULT NULL,
  `tensi_darah` varchar(20) NOT NULL,
  `berat_badan` varchar(20) NOT NULL,
  `tinggi_badan` varchar(20) NOT NULL,
  `respiratori` varchar(20) NOT NULL,
  `nadi` varchar(20) NOT NULL,
  `suhu` varchar(20) NOT NULL,
  `masuk` varchar(20) DEFAULT NULL,
  `keluar` varchar(20) DEFAULT NULL,
  `status_inap` enum('0','1','2','3','4') NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trn_pasien_inap`
--

INSERT INTO `trn_pasien_inap` (`id_inap`, `id_registrasi`, `id_pasien`, `id_ruangan`, `tensi_darah`, `berat_badan`, `tinggi_badan`, `respiratori`, `nadi`, `suhu`, `masuk`, `keluar`, `status_inap`, `status`) VALUES
(1, 5, 1, 1, '100', '122', '123', '100', '100', '100', '30-11-2021 10:15:22', NULL, '1', '1'),
(2, 0, 2, 16, '', '', '', '', '', '', '30-11-2021 10:17:01', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `trn_registrasi`
--

CREATE TABLE `trn_registrasi` (
  `id_registrasi` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `tensi_darah` varchar(20) NOT NULL,
  `berat_badan` varchar(20) NOT NULL,
  `tinggi_badan` varchar(20) NOT NULL,
  `respiratori` varchar(20) NOT NULL,
  `nadi` varchar(20) NOT NULL,
  `suhu` varchar(20) NOT NULL,
  `tipe_registrasi` enum('Rawat Jalan','Rawat Inap') NOT NULL,
  `tgl_registrasi` varchar(20) NOT NULL,
  `time_registrasi` varchar(20) NOT NULL,
  `antrian_status` enum('1','0') NOT NULL DEFAULT '1',
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trn_registrasi`
--

INSERT INTO `trn_registrasi` (`id_registrasi`, `id_pasien`, `id_poli`, `tensi_darah`, `berat_badan`, `tinggi_badan`, `respiratori`, `nadi`, `suhu`, `tipe_registrasi`, `tgl_registrasi`, `time_registrasi`, `antrian_status`, `status`) VALUES
(1, 1, 1, '123', '12', '123', '123', '123', '123', 'Rawat Jalan', '20-03-2020', '20:25:36', '0', '1'),
(2, 1, 1, '120', '122', '123', '100', '100', '39', 'Rawat Jalan', '24-11-2021', '13:20:28', '0', '1'),
(3, 2, 1, '120', '60', '165', '100', '100', '30', 'Rawat Jalan', '30-11-2021', '10:05:06', '0', '1'),
(4, 2, 1, '120', '60', '165', '100', '100', '100', 'Rawat Jalan', '30-11-2021', '10:12:53', '0', '1'),
(5, 1, 3, '100', '122', '123', '100', '100', '100', 'Rawat Inap', '30-11-2021', '10:15:22', '1', '1'),
(6, 2, 1, '100', '60', '165', '100', '100', '100', 'Rawat Jalan', '30-11-2021', '10:16:06', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uks_indikator_jml_sekolah`
--

CREATE TABLE `uks_indikator_jml_sekolah` (
  `id_indikator_sekolah` int(5) NOT NULL,
  `nama_indikator` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uks_indikator_jml_sekolah`
--

INSERT INTO `uks_indikator_jml_sekolah` (`id_indikator_sekolah`, `nama_indikator`, `status`) VALUES
(1, 'Sekolah UKS', '1'),
(2, 'Ada Dana Sehat', '1'),
(3, 'Ada Guru UKS', '1'),
(4, 'Yang ada dokcil / Kader UKS', '1'),
(5, 'Yang ada pelaksana UKS', '1'),
(6, 'Paket Minimal', '1'),
(7, 'Paket Standar', '1'),
(8, 'Paket Optimal', '1'),
(9, 'Paket Paripurna', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uks_mst_sekolah`
--

CREATE TABLE `uks_mst_sekolah` (
  `id_sekolah` int(5) NOT NULL,
  `nama_sekolah` varchar(50) NOT NULL,
  `id_tingkat_sekolah` int(5) NOT NULL,
  `status_jenis` enum('1','2') NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uks_mst_sekolah`
--

INSERT INTO `uks_mst_sekolah` (`id_sekolah`, `nama_sekolah`, `id_tingkat_sekolah`, `status_jenis`, `status`) VALUES
(1, 'SMAN 1 Bandung', 7, '1', '1'),
(2, 'SMPN 1 Bandung', 5, '1', '1'),
(3, 'SDN 1 Bandung', 3, '1', '1'),
(4, 'SDN 2 Bandung', 3, '1', '1'),
(5, 'SDN 3 Bandung', 3, '1', '1'),
(6, 'SMAN 2 Bandung', 7, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uks_ref_kelas`
--

CREATE TABLE `uks_ref_kelas` (
  `id_ref_kelas` int(11) NOT NULL,
  `nama_ref_kelas` varchar(10) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uks_ref_kelas`
--

INSERT INTO `uks_ref_kelas` (`id_ref_kelas`, `nama_ref_kelas`, `status`) VALUES
(1, 'VII', '1'),
(2, 'VIII', '1'),
(3, 'IX', '1'),
(4, 'X', '1'),
(5, 'XI', '1'),
(6, 'XII', '1'),
(7, 'I-XI', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uks_ref_tingkat_sekolah`
--

CREATE TABLE `uks_ref_tingkat_sekolah` (
  `id_tingkat_sekolah` int(5) NOT NULL,
  `tingkat_sekolah` varchar(10) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uks_ref_tingkat_sekolah`
--

INSERT INTO `uks_ref_tingkat_sekolah` (`id_tingkat_sekolah`, `tingkat_sekolah`, `status`) VALUES
(1, 'TK', '1'),
(2, 'RA', '1'),
(3, 'SD', '1'),
(4, 'MI', '1'),
(5, 'SMP', '1'),
(6, 'MTS', '1'),
(7, 'SMA/SMK', '1'),
(8, 'MA', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uks_trn_sekolah`
--

CREATE TABLE `uks_trn_sekolah` (
  `id_trn_sekolah` int(5) NOT NULL,
  `id_sekolah` int(5) NOT NULL,
  `id_ref_kelas` int(5) DEFAULT NULL,
  `id_indikator_sekolah` int(5) DEFAULT NULL,
  `jml_murid` int(11) NOT NULL DEFAULT 0,
  `jk_murid` enum('L','P') DEFAULT NULL,
  `jml_siswi_fe` int(11) NOT NULL DEFAULT 0,
  `jml_siswi_haid` int(11) NOT NULL DEFAULT 0,
  `jml_murid_dokcil` int(5) NOT NULL DEFAULT 0,
  `jml_murid_kkr` int(5) NOT NULL DEFAULT 0,
  `jml_murid_sbh` int(5) NOT NULL DEFAULT 0,
  `jml_murid_pks` int(5) NOT NULL DEFAULT 0,
  `jml_murid_pmr` int(5) NOT NULL DEFAULT 0,
  `jml_dilatih_uks` int(5) NOT NULL DEFAULT 0,
  `jml_belum_dilatih_uks` int(5) NOT NULL DEFAULT 0,
  `efek_samping` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `date_report` date NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uks_trn_sekolah`
--

INSERT INTO `uks_trn_sekolah` (`id_trn_sekolah`, `id_sekolah`, `id_ref_kelas`, `id_indikator_sekolah`, `jml_murid`, `jk_murid`, `jml_siswi_fe`, `jml_siswi_haid`, `jml_murid_dokcil`, `jml_murid_kkr`, `jml_murid_sbh`, `jml_murid_pks`, `jml_murid_pmr`, `jml_dilatih_uks`, `jml_belum_dilatih_uks`, `efek_samping`, `keterangan`, `date_report`, `status`) VALUES
(1, 1, 4, NULL, 99, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(2, 1, 4, NULL, 88, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(3, 1, 5, NULL, 33, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(4, 1, 5, NULL, 22, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(5, 1, 6, NULL, 33, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(6, 1, 6, NULL, 22, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(7, 1, NULL, NULL, 0, NULL, 18, 0, 0, 11, 22, 33, 44, 10, 15, 'haha', '-', '2017-03-29', '1'),
(8, 1, NULL, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(9, 1, NULL, 2, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(10, 1, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(11, 1, NULL, 4, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(12, 1, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(13, 1, NULL, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(14, 1, NULL, 7, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(15, 1, NULL, 8, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(16, 1, NULL, 9, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(17, 2, 1, NULL, 11, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(18, 2, 1, NULL, 22, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(19, 2, 2, NULL, 33, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(20, 2, 2, NULL, 44, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(21, 2, 3, NULL, 55, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(22, 2, 3, NULL, 66, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(23, 2, NULL, NULL, 0, NULL, 20, 0, 0, 10, 20, 30, 50, 27, 26, '-', '-', '2017-03-29', '1'),
(24, 2, NULL, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(25, 2, NULL, 2, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(26, 2, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(27, 2, NULL, 4, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(28, 2, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(29, 2, NULL, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(30, 2, NULL, 7, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(31, 2, NULL, 8, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(32, 2, NULL, 9, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(33, 3, 7, NULL, 13, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(34, 3, 7, NULL, 16, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(35, 3, NULL, NULL, 0, NULL, 31, 6, 3, 0, 0, 0, 0, 27, 13, '-', '-', '2017-03-29', '1'),
(36, 3, NULL, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(37, 3, NULL, 2, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(38, 3, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(39, 3, NULL, 4, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(40, 3, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(41, 3, NULL, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(42, 3, NULL, 7, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(43, 3, NULL, 8, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(44, 3, NULL, 9, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-29', '1'),
(45, 4, 7, NULL, 30, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(46, 4, 7, NULL, 23, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(47, 4, NULL, NULL, 0, NULL, 20, 20, 10, 0, 0, 0, 0, 18, 13, '-', '-', '2017-03-31', '1'),
(48, 4, NULL, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(49, 4, NULL, 2, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(50, 4, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(51, 4, NULL, 4, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(52, 4, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(53, 4, NULL, 6, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(54, 4, NULL, 7, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(55, 4, NULL, 8, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(56, 4, NULL, 9, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(57, 5, 7, NULL, 13, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(58, 5, 7, NULL, 16, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(59, 5, NULL, NULL, 0, NULL, 18, 6, 3, 0, 0, 0, 0, 20, 13, '-', '-', '2017-03-31', '1'),
(60, 5, NULL, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(61, 5, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(62, 5, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(63, 5, NULL, 7, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(64, 5, NULL, 9, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-03-31', '1'),
(65, 6, 4, NULL, 120, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(66, 6, 4, NULL, 100, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(67, 6, 5, NULL, 130, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(68, 6, 5, NULL, 110, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(69, 6, 6, NULL, 140, 'L', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(70, 6, 6, NULL, 120, 'P', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(71, 6, NULL, NULL, 0, NULL, 50, 0, 0, 13, 12, 11, 10, 31, 13, '-', '-', '2017-04-05', '1'),
(72, 6, NULL, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(73, 6, NULL, 2, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(74, 6, NULL, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(75, 6, NULL, 5, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(76, 6, NULL, 8, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1'),
(77, 6, NULL, 9, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2017-04-05', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bp_luar_daerah`
--
ALTER TABLE `bp_luar_daerah`
  ADD PRIMARY KEY (`id_luar_daerah`);

--
-- Indexes for table `bp_master`
--
ALTER TABLE `bp_master`
  ADD PRIMARY KEY (`id_indikator_bp`);

--
-- Indexes for table `bp_trn_desa`
--
ALTER TABLE `bp_trn_desa`
  ADD PRIMARY KEY (`id_trn_bp`);

--
-- Indexes for table `bp_trn_luar_daerah`
--
ALTER TABLE `bp_trn_luar_daerah`
  ADD PRIMARY KEY (`id_trn_bp`);

--
-- Indexes for table `dbd_ref_gejala`
--
ALTER TABLE `dbd_ref_gejala`
  ADD PRIMARY KEY (`id_gejala_dbd`);

--
-- Indexes for table `dbd_trn_pengobatan`
--
ALTER TABLE `dbd_trn_pengobatan`
  ADD PRIMARY KEY (`id_trn_pengobatan_dbd`);

--
-- Indexes for table `detail_trn_kesehatan_indera`
--
ALTER TABLE `detail_trn_kesehatan_indera`
  ADD PRIMARY KEY (`id_trn_kesehatan_indera`);

--
-- Indexes for table `detail_trn_kesehatan_jiwa`
--
ALTER TABLE `detail_trn_kesehatan_jiwa`
  ADD PRIMARY KEY (`id_trn_kesehatan_jiwa`);

--
-- Indexes for table `detail_trn_kesehatan_olahraga`
--
ALTER TABLE `detail_trn_kesehatan_olahraga`
  ADD PRIMARY KEY (`id_trn_kesehatan_olahraga`);

--
-- Indexes for table `detail_trn_kesehatan_pekerja`
--
ALTER TABLE `detail_trn_kesehatan_pekerja`
  ADD PRIMARY KEY (`id_trn_kesehatan_pekerja`);

--
-- Indexes for table `detail_trn_kesehatan_tradisional`
--
ALTER TABLE `detail_trn_kesehatan_tradisional`
  ADD PRIMARY KEY (`id_trn_kesehatan_tradisional`);

--
-- Indexes for table `employee_mst_pangkat`
--
ALTER TABLE `employee_mst_pangkat`
  ADD PRIMARY KEY (`id_mst_pangkat`);

--
-- Indexes for table `employee_mst_type`
--
ALTER TABLE `employee_mst_type`
  ADD PRIMARY KEY (`id_type_employee`);

--
-- Indexes for table `employee_ref_pendidikan`
--
ALTER TABLE `employee_ref_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan_emloyee`);

--
-- Indexes for table `employee_unit_kerja`
--
ALTER TABLE `employee_unit_kerja`
  ADD PRIMARY KEY (`id_unit_kerja`);

--
-- Indexes for table `filaria_lokasi_mst`
--
ALTER TABLE `filaria_lokasi_mst`
  ADD PRIMARY KEY (`id_lokasi_filaria`);

--
-- Indexes for table `filaria_trn_pemeriksaan`
--
ALTER TABLE `filaria_trn_pemeriksaan`
  ADD PRIMARY KEY (`id_trn_fillaria`);

--
-- Indexes for table `gigi_mst_detail_penyakit`
--
ALTER TABLE `gigi_mst_detail_penyakit`
  ADD PRIMARY KEY (`id_detail_penyakit_gigi`);

--
-- Indexes for table `gigi_mst_kegiatan`
--
ALTER TABLE `gigi_mst_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan_gigi`);

--
-- Indexes for table `gizi_mst_balita`
--
ALTER TABLE `gizi_mst_balita`
  ADD PRIMARY KEY (`id_balita_gizi`);

--
-- Indexes for table `gizi_mst_indikator_kadar`
--
ALTER TABLE `gizi_mst_indikator_kadar`
  ADD PRIMARY KEY (`id_indikator_gizi`);

--
-- Indexes for table `gizi_mst_range`
--
ALTER TABLE `gizi_mst_range`
  ADD PRIMARY KEY (`id_range_gizi`);

--
-- Indexes for table `indera_details_kesehatan`
--
ALTER TABLE `indera_details_kesehatan`
  ADD PRIMARY KEY (`id_detail_kes_indra`);

--
-- Indexes for table `indera_mst_kesehatan`
--
ALTER TABLE `indera_mst_kesehatan`
  ADD PRIMARY KEY (`id_mst_kes_indra`);

--
-- Indexes for table `ispa_mst_pengendalian`
--
ALTER TABLE `ispa_mst_pengendalian`
  ADD PRIMARY KEY (`id_desa`);

--
-- Indexes for table `jiwa_detail_kesehatan`
--
ALTER TABLE `jiwa_detail_kesehatan`
  ADD PRIMARY KEY (`id_detail_jiwa_kes`);

--
-- Indexes for table `jiwa_mst_kesehatan`
--
ALTER TABLE `jiwa_mst_kesehatan`
  ADD PRIMARY KEY (`id_kesehatan_jiwa`);

--
-- Indexes for table `kesling_mst_akses`
--
ALTER TABLE `kesling_mst_akses`
  ADD PRIMARY KEY (`id_mst_akses`);

--
-- Indexes for table `kesling_ref_kegiatan`
--
ALTER TABLE `kesling_ref_kegiatan`
  ADD PRIMARY KEY (`id_ref_kegiatan`);

--
-- Indexes for table `kesling_ref_pengawasan`
--
ALTER TABLE `kesling_ref_pengawasan`
  ADD PRIMARY KEY (`id_ref_pengawasan`);

--
-- Indexes for table `kesling_trn_akses`
--
ALTER TABLE `kesling_trn_akses`
  ADD PRIMARY KEY (`id_trn_kesling`);

--
-- Indexes for table `kesling_trn_kegiatan`
--
ALTER TABLE `kesling_trn_kegiatan`
  ADD PRIMARY KEY (`id_trn_kegiatan`);

--
-- Indexes for table `kesling_trn_pengawasan`
--
ALTER TABLE `kesling_trn_pengawasan`
  ADD PRIMARY KEY (`id_trn_pengawasan`);

--
-- Indexes for table `kusta_trn_pengobatan`
--
ALTER TABLE `kusta_trn_pengobatan`
  ADD PRIMARY KEY (`id_pengobatan_kusta`);

--
-- Indexes for table `malaria_mst_vaksin`
--
ALTER TABLE `malaria_mst_vaksin`
  ADD PRIMARY KEY (`id_vaksin`);

--
-- Indexes for table `malaria_pengobatan_pasien`
--
ALTER TABLE `malaria_pengobatan_pasien`
  ADD PRIMARY KEY (`id_pengobatan_pasien`);

--
-- Indexes for table `mata_detail_penyakit`
--
ALTER TABLE `mata_detail_penyakit`
  ADD PRIMARY KEY (`id_mata_penyakit`);

--
-- Indexes for table `mst_alkes`
--
ALTER TABLE `mst_alkes`
  ADD PRIMARY KEY (`id_alkes`);

--
-- Indexes for table `mst_alkes_keluar`
--
ALTER TABLE `mst_alkes_keluar`
  ADD PRIMARY KEY (`id_alkes_keluar`);

--
-- Indexes for table `mst_alkes_masuk`
--
ALTER TABLE `mst_alkes_masuk`
  ADD PRIMARY KEY (`id_alkes_masuk`);

--
-- Indexes for table `mst_desa`
--
ALTER TABLE `mst_desa`
  ADD PRIMARY KEY (`id_desa`);

--
-- Indexes for table `mst_employee`
--
ALTER TABLE `mst_employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `mst_kartu_pasien`
--
ALTER TABLE `mst_kartu_pasien`
  ADD PRIMARY KEY (`id_kartu_pasien`);

--
-- Indexes for table `mst_kegiatan_posyandu`
--
ALTER TABLE `mst_kegiatan_posyandu`
  ADD PRIMARY KEY (`id_kegiatan_posyandu`);

--
-- Indexes for table `mst_kesehatan_indera`
--
ALTER TABLE `mst_kesehatan_indera`
  ADD PRIMARY KEY (`id_kesehatan_indera`);

--
-- Indexes for table `mst_kesehatan_jiwa`
--
ALTER TABLE `mst_kesehatan_jiwa`
  ADD PRIMARY KEY (`id_kesehatan_jiwa`);

--
-- Indexes for table `mst_kesehatan_olahraga`
--
ALTER TABLE `mst_kesehatan_olahraga`
  ADD PRIMARY KEY (`id_kesehatan_olahraga`);

--
-- Indexes for table `mst_kesehatan_pekerja`
--
ALTER TABLE `mst_kesehatan_pekerja`
  ADD PRIMARY KEY (`id_kesehatan_pekerja`);

--
-- Indexes for table `mst_kesehatan_tradisional`
--
ALTER TABLE `mst_kesehatan_tradisional`
  ADD PRIMARY KEY (`id_kesehatan_tradisional`);

--
-- Indexes for table `mst_klarifikasi_lab`
--
ALTER TABLE `mst_klarifikasi_lab`
  ADD PRIMARY KEY (`id_klarifikasi`);

--
-- Indexes for table `mst_medrec`
--
ALTER TABLE `mst_medrec`
  ADD PRIMARY KEY (`id_medrec`);

--
-- Indexes for table `mst_medrec_inap`
--
ALTER TABLE `mst_medrec_inap`
  ADD PRIMARY KEY (`id_medrec_inap`);

--
-- Indexes for table `mst_obat`
--
ALTER TABLE `mst_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `mst_pasien`
--
ALTER TABLE `mst_pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `no_rekam_medis` (`no_rekam_medis`);

--
-- Indexes for table `mst_penyakit`
--
ALTER TABLE `mst_penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `mst_poli`
--
ALTER TABLE `mst_poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indexes for table `mst_posyandu_desa`
--
ALTER TABLE `mst_posyandu_desa`
  ADD PRIMARY KEY (`id_posyandu_desa`);

--
-- Indexes for table `mst_resep`
--
ALTER TABLE `mst_resep`
  ADD PRIMARY KEY (`id_resep`);

--
-- Indexes for table `mst_resep_inap`
--
ALTER TABLE `mst_resep_inap`
  ADD PRIMARY KEY (`id_resep_inap`);

--
-- Indexes for table `mst_ruangan`
--
ALTER TABLE `mst_ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `mst_tindakan`
--
ALTER TABLE `mst_tindakan`
  ADD PRIMARY KEY (`id_tindakan`);

--
-- Indexes for table `mst_tindakan_inap`
--
ALTER TABLE `mst_tindakan_inap`
  ADD PRIMARY KEY (`id_tindakan_inap`);

--
-- Indexes for table `mst_type_gudang`
--
ALTER TABLE `mst_type_gudang`
  ADD PRIMARY KEY (`id_type_gudang`);

--
-- Indexes for table `mst_type_obat`
--
ALTER TABLE `mst_type_obat`
  ADD PRIMARY KEY (`id_type_obat`);

--
-- Indexes for table `promkes_master`
--
ALTER TABLE `promkes_master`
  ADD PRIMARY KEY (`id_indikator_promkes`);

--
-- Indexes for table `promkes_mst_detail`
--
ALTER TABLE `promkes_mst_detail`
  ADD PRIMARY KEY (`id_detail_promkes`);

--
-- Indexes for table `rabies_ref_letak_gigitan`
--
ALTER TABLE `rabies_ref_letak_gigitan`
  ADD PRIMARY KEY (`id_letak_gigitan`);

--
-- Indexes for table `rabies_ref_observasi`
--
ALTER TABLE `rabies_ref_observasi`
  ADD PRIMARY KEY (`id_observasi_rabies`);

--
-- Indexes for table `rabies_ref_penyebab`
--
ALTER TABLE `rabies_ref_penyebab`
  ADD PRIMARY KEY (`id_penyebab`);

--
-- Indexes for table `rabies_trn_kasus`
--
ALTER TABLE `rabies_trn_kasus`
  ADD PRIMARY KEY (`id_trn_kasus_rabies`);

--
-- Indexes for table `ref_diagnosis`
--
ALTER TABLE `ref_diagnosis`
  ADD PRIMARY KEY (`id_diagnosis`);

--
-- Indexes for table `ref_jabatan`
--
ALTER TABLE `ref_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `ref_kegiatan_posyandu`
--
ALTER TABLE `ref_kegiatan_posyandu`
  ADD PRIMARY KEY (`id_ref_kegiatan_posyandu`);

--
-- Indexes for table `ref_keluhan`
--
ALTER TABLE `ref_keluhan`
  ADD PRIMARY KEY (`id_keluhan`);

--
-- Indexes for table `ref_kesehatan_indera`
--
ALTER TABLE `ref_kesehatan_indera`
  ADD PRIMARY KEY (`id_ref_kesehatan_indera`);

--
-- Indexes for table `ref_kesehatan_jiwa`
--
ALTER TABLE `ref_kesehatan_jiwa`
  ADD PRIMARY KEY (`id_ref_kesehatan_jiwa`);

--
-- Indexes for table `ref_kesehatan_tradisional`
--
ALTER TABLE `ref_kesehatan_tradisional`
  ADD PRIMARY KEY (`id_ref_kesehatan_tradisional`);

--
-- Indexes for table `ref_klarifikasi_lab`
--
ALTER TABLE `ref_klarifikasi_lab`
  ADD PRIMARY KEY (`id_ref_klarifikasi`);

--
-- Indexes for table `ref_range_umur`
--
ALTER TABLE `ref_range_umur`
  ADD PRIMARY KEY (`id_range_umur`);

--
-- Indexes for table `ref_satuan_obat`
--
ALTER TABLE `ref_satuan_obat`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `ref_terapi`
--
ALTER TABLE `ref_terapi`
  ADD PRIMARY KEY (`id_terapi`);

--
-- Indexes for table `trn_apotek_inap`
--
ALTER TABLE `trn_apotek_inap`
  ADD PRIMARY KEY (`id_apotek_inap`);

--
-- Indexes for table `trn_detail_kegiatan_posyandu`
--
ALTER TABLE `trn_detail_kegiatan_posyandu`
  ADD PRIMARY KEY (`id_trn_detail_kegiatan_posyandu`);

--
-- Indexes for table `trn_detail_klarifikasi_lab`
--
ALTER TABLE `trn_detail_klarifikasi_lab`
  ADD PRIMARY KEY (`id_trn_detail_klarifikasi_lab`);

--
-- Indexes for table `trn_detail_registrasi`
--
ALTER TABLE `trn_detail_registrasi`
  ADD PRIMARY KEY (`id_detail_registrasi`);

--
-- Indexes for table `trn_gudang_obat_keluar`
--
ALTER TABLE `trn_gudang_obat_keluar`
  ADD PRIMARY KEY (`id_trn_gudang_obat_keluar`);

--
-- Indexes for table `trn_gudang_obat_masuk`
--
ALTER TABLE `trn_gudang_obat_masuk`
  ADD PRIMARY KEY (`id_trn_gudang_obat_masuk`);

--
-- Indexes for table `trn_obat_apotek_keluar`
--
ALTER TABLE `trn_obat_apotek_keluar`
  ADD PRIMARY KEY (`id_obat_apotek_keluar`);

--
-- Indexes for table `trn_obat_apotek_masuk`
--
ALTER TABLE `trn_obat_apotek_masuk`
  ADD PRIMARY KEY (`id_obat_apotek_masuk`);

--
-- Indexes for table `trn_pasien_inap`
--
ALTER TABLE `trn_pasien_inap`
  ADD PRIMARY KEY (`id_inap`);

--
-- Indexes for table `trn_registrasi`
--
ALTER TABLE `trn_registrasi`
  ADD PRIMARY KEY (`id_registrasi`);

--
-- Indexes for table `uks_indikator_jml_sekolah`
--
ALTER TABLE `uks_indikator_jml_sekolah`
  ADD PRIMARY KEY (`id_indikator_sekolah`);

--
-- Indexes for table `uks_mst_sekolah`
--
ALTER TABLE `uks_mst_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `uks_ref_kelas`
--
ALTER TABLE `uks_ref_kelas`
  ADD PRIMARY KEY (`id_ref_kelas`);

--
-- Indexes for table `uks_ref_tingkat_sekolah`
--
ALTER TABLE `uks_ref_tingkat_sekolah`
  ADD PRIMARY KEY (`id_tingkat_sekolah`);

--
-- Indexes for table `uks_trn_sekolah`
--
ALTER TABLE `uks_trn_sekolah`
  ADD PRIMARY KEY (`id_trn_sekolah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bp_luar_daerah`
--
ALTER TABLE `bp_luar_daerah`
  MODIFY `id_luar_daerah` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bp_master`
--
ALTER TABLE `bp_master`
  MODIFY `id_indikator_bp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bp_trn_desa`
--
ALTER TABLE `bp_trn_desa`
  MODIFY `id_trn_bp` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bp_trn_luar_daerah`
--
ALTER TABLE `bp_trn_luar_daerah`
  MODIFY `id_trn_bp` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbd_ref_gejala`
--
ALTER TABLE `dbd_ref_gejala`
  MODIFY `id_gejala_dbd` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dbd_trn_pengobatan`
--
ALTER TABLE `dbd_trn_pengobatan`
  MODIFY `id_trn_pengobatan_dbd` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trn_kesehatan_indera`
--
ALTER TABLE `detail_trn_kesehatan_indera`
  MODIFY `id_trn_kesehatan_indera` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trn_kesehatan_jiwa`
--
ALTER TABLE `detail_trn_kesehatan_jiwa`
  MODIFY `id_trn_kesehatan_jiwa` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trn_kesehatan_olahraga`
--
ALTER TABLE `detail_trn_kesehatan_olahraga`
  MODIFY `id_trn_kesehatan_olahraga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trn_kesehatan_pekerja`
--
ALTER TABLE `detail_trn_kesehatan_pekerja`
  MODIFY `id_trn_kesehatan_pekerja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trn_kesehatan_tradisional`
--
ALTER TABLE `detail_trn_kesehatan_tradisional`
  MODIFY `id_trn_kesehatan_tradisional` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_mst_pangkat`
--
ALTER TABLE `employee_mst_pangkat`
  MODIFY `id_mst_pangkat` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_mst_type`
--
ALTER TABLE `employee_mst_type`
  MODIFY `id_type_employee` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_ref_pendidikan`
--
ALTER TABLE `employee_ref_pendidikan`
  MODIFY `id_pendidikan_emloyee` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_unit_kerja`
--
ALTER TABLE `employee_unit_kerja`
  MODIFY `id_unit_kerja` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filaria_lokasi_mst`
--
ALTER TABLE `filaria_lokasi_mst`
  MODIFY `id_lokasi_filaria` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filaria_trn_pemeriksaan`
--
ALTER TABLE `filaria_trn_pemeriksaan`
  MODIFY `id_trn_fillaria` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gigi_mst_detail_penyakit`
--
ALTER TABLE `gigi_mst_detail_penyakit`
  MODIFY `id_detail_penyakit_gigi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gigi_mst_kegiatan`
--
ALTER TABLE `gigi_mst_kegiatan`
  MODIFY `id_kegiatan_gigi` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gizi_mst_balita`
--
ALTER TABLE `gizi_mst_balita`
  MODIFY `id_balita_gizi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gizi_mst_indikator_kadar`
--
ALTER TABLE `gizi_mst_indikator_kadar`
  MODIFY `id_indikator_gizi` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gizi_mst_range`
--
ALTER TABLE `gizi_mst_range`
  MODIFY `id_range_gizi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indera_details_kesehatan`
--
ALTER TABLE `indera_details_kesehatan`
  MODIFY `id_detail_kes_indra` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indera_mst_kesehatan`
--
ALTER TABLE `indera_mst_kesehatan`
  MODIFY `id_mst_kes_indra` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ispa_mst_pengendalian`
--
ALTER TABLE `ispa_mst_pengendalian`
  MODIFY `id_desa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jiwa_detail_kesehatan`
--
ALTER TABLE `jiwa_detail_kesehatan`
  MODIFY `id_detail_jiwa_kes` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jiwa_mst_kesehatan`
--
ALTER TABLE `jiwa_mst_kesehatan`
  MODIFY `id_kesehatan_jiwa` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesling_mst_akses`
--
ALTER TABLE `kesling_mst_akses`
  MODIFY `id_mst_akses` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesling_ref_kegiatan`
--
ALTER TABLE `kesling_ref_kegiatan`
  MODIFY `id_ref_kegiatan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesling_ref_pengawasan`
--
ALTER TABLE `kesling_ref_pengawasan`
  MODIFY `id_ref_pengawasan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesling_trn_akses`
--
ALTER TABLE `kesling_trn_akses`
  MODIFY `id_trn_kesling` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesling_trn_kegiatan`
--
ALTER TABLE `kesling_trn_kegiatan`
  MODIFY `id_trn_kegiatan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesling_trn_pengawasan`
--
ALTER TABLE `kesling_trn_pengawasan`
  MODIFY `id_trn_pengawasan` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kusta_trn_pengobatan`
--
ALTER TABLE `kusta_trn_pengobatan`
  MODIFY `id_pengobatan_kusta` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malaria_mst_vaksin`
--
ALTER TABLE `malaria_mst_vaksin`
  MODIFY `id_vaksin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malaria_pengobatan_pasien`
--
ALTER TABLE `malaria_pengobatan_pasien`
  MODIFY `id_pengobatan_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mata_detail_penyakit`
--
ALTER TABLE `mata_detail_penyakit`
  MODIFY `id_mata_penyakit` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_alkes`
--
ALTER TABLE `mst_alkes`
  MODIFY `id_alkes` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mst_alkes_keluar`
--
ALTER TABLE `mst_alkes_keluar`
  MODIFY `id_alkes_keluar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mst_alkes_masuk`
--
ALTER TABLE `mst_alkes_masuk`
  MODIFY `id_alkes_masuk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mst_desa`
--
ALTER TABLE `mst_desa`
  MODIFY `id_desa` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_employee`
--
ALTER TABLE `mst_employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mst_kartu_pasien`
--
ALTER TABLE `mst_kartu_pasien`
  MODIFY `id_kartu_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_kegiatan_posyandu`
--
ALTER TABLE `mst_kegiatan_posyandu`
  MODIFY `id_kegiatan_posyandu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mst_kesehatan_indera`
--
ALTER TABLE `mst_kesehatan_indera`
  MODIFY `id_kesehatan_indera` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mst_kesehatan_jiwa`
--
ALTER TABLE `mst_kesehatan_jiwa`
  MODIFY `id_kesehatan_jiwa` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_kesehatan_olahraga`
--
ALTER TABLE `mst_kesehatan_olahraga`
  MODIFY `id_kesehatan_olahraga` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mst_kesehatan_pekerja`
--
ALTER TABLE `mst_kesehatan_pekerja`
  MODIFY `id_kesehatan_pekerja` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mst_kesehatan_tradisional`
--
ALTER TABLE `mst_kesehatan_tradisional`
  MODIFY `id_kesehatan_tradisional` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_klarifikasi_lab`
--
ALTER TABLE `mst_klarifikasi_lab`
  MODIFY `id_klarifikasi` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mst_medrec`
--
ALTER TABLE `mst_medrec`
  MODIFY `id_medrec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mst_medrec_inap`
--
ALTER TABLE `mst_medrec_inap`
  MODIFY `id_medrec_inap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_obat`
--
ALTER TABLE `mst_obat`
  MODIFY `id_obat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_pasien`
--
ALTER TABLE `mst_pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_penyakit`
--
ALTER TABLE `mst_penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_poli`
--
ALTER TABLE `mst_poli`
  MODIFY `id_poli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mst_posyandu_desa`
--
ALTER TABLE `mst_posyandu_desa`
  MODIFY `id_posyandu_desa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_resep`
--
ALTER TABLE `mst_resep`
  MODIFY `id_resep` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mst_resep_inap`
--
ALTER TABLE `mst_resep_inap`
  MODIFY `id_resep_inap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_ruangan`
--
ALTER TABLE `mst_ruangan`
  MODIFY `id_ruangan` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `mst_tindakan`
--
ALTER TABLE `mst_tindakan`
  MODIFY `id_tindakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_tindakan_inap`
--
ALTER TABLE `mst_tindakan_inap`
  MODIFY `id_tindakan_inap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_type_gudang`
--
ALTER TABLE `mst_type_gudang`
  MODIFY `id_type_gudang` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_type_obat`
--
ALTER TABLE `mst_type_obat`
  MODIFY `id_type_obat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `promkes_master`
--
ALTER TABLE `promkes_master`
  MODIFY `id_indikator_promkes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `promkes_mst_detail`
--
ALTER TABLE `promkes_mst_detail`
  MODIFY `id_detail_promkes` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rabies_ref_letak_gigitan`
--
ALTER TABLE `rabies_ref_letak_gigitan`
  MODIFY `id_letak_gigitan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rabies_ref_observasi`
--
ALTER TABLE `rabies_ref_observasi`
  MODIFY `id_observasi_rabies` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rabies_ref_penyebab`
--
ALTER TABLE `rabies_ref_penyebab`
  MODIFY `id_penyebab` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rabies_trn_kasus`
--
ALTER TABLE `rabies_trn_kasus`
  MODIFY `id_trn_kasus_rabies` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_diagnosis`
--
ALTER TABLE `ref_diagnosis`
  MODIFY `id_diagnosis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_jabatan`
--
ALTER TABLE `ref_jabatan`
  MODIFY `id_jabatan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ref_kegiatan_posyandu`
--
ALTER TABLE `ref_kegiatan_posyandu`
  MODIFY `id_ref_kegiatan_posyandu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ref_keluhan`
--
ALTER TABLE `ref_keluhan`
  MODIFY `id_keluhan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_kesehatan_indera`
--
ALTER TABLE `ref_kesehatan_indera`
  MODIFY `id_ref_kesehatan_indera` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ref_kesehatan_jiwa`
--
ALTER TABLE `ref_kesehatan_jiwa`
  MODIFY `id_ref_kesehatan_jiwa` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_kesehatan_tradisional`
--
ALTER TABLE `ref_kesehatan_tradisional`
  MODIFY `id_ref_kesehatan_tradisional` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `ref_klarifikasi_lab`
--
ALTER TABLE `ref_klarifikasi_lab`
  MODIFY `id_ref_klarifikasi` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `ref_range_umur`
--
ALTER TABLE `ref_range_umur`
  MODIFY `id_range_umur` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ref_satuan_obat`
--
ALTER TABLE `ref_satuan_obat`
  MODIFY `id_satuan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ref_terapi`
--
ALTER TABLE `ref_terapi`
  MODIFY `id_terapi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trn_apotek_inap`
--
ALTER TABLE `trn_apotek_inap`
  MODIFY `id_apotek_inap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trn_detail_kegiatan_posyandu`
--
ALTER TABLE `trn_detail_kegiatan_posyandu`
  MODIFY `id_trn_detail_kegiatan_posyandu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trn_detail_klarifikasi_lab`
--
ALTER TABLE `trn_detail_klarifikasi_lab`
  MODIFY `id_trn_detail_klarifikasi_lab` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trn_detail_registrasi`
--
ALTER TABLE `trn_detail_registrasi`
  MODIFY `id_detail_registrasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trn_gudang_obat_keluar`
--
ALTER TABLE `trn_gudang_obat_keluar`
  MODIFY `id_trn_gudang_obat_keluar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trn_gudang_obat_masuk`
--
ALTER TABLE `trn_gudang_obat_masuk`
  MODIFY `id_trn_gudang_obat_masuk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trn_obat_apotek_keluar`
--
ALTER TABLE `trn_obat_apotek_keluar`
  MODIFY `id_obat_apotek_keluar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trn_obat_apotek_masuk`
--
ALTER TABLE `trn_obat_apotek_masuk`
  MODIFY `id_obat_apotek_masuk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trn_pasien_inap`
--
ALTER TABLE `trn_pasien_inap`
  MODIFY `id_inap` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trn_registrasi`
--
ALTER TABLE `trn_registrasi`
  MODIFY `id_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uks_indikator_jml_sekolah`
--
ALTER TABLE `uks_indikator_jml_sekolah`
  MODIFY `id_indikator_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `uks_mst_sekolah`
--
ALTER TABLE `uks_mst_sekolah`
  MODIFY `id_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uks_ref_kelas`
--
ALTER TABLE `uks_ref_kelas`
  MODIFY `id_ref_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `uks_ref_tingkat_sekolah`
--
ALTER TABLE `uks_ref_tingkat_sekolah`
  MODIFY `id_tingkat_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `uks_trn_sekolah`
--
ALTER TABLE `uks_trn_sekolah`
  MODIFY `id_trn_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
