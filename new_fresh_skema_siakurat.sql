-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dev_ais_reborn
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20251206235737_InitialBaseline','8.0.22');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ability_name` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abilities_user`
--

DROP TABLE IF EXISTS `abilities_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `ability_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_user_user_id_foreign` (`user_id`),
  KEY `abilities_user_ability_id_foreign` (`ability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities_user`
--

LOCK TABLES `abilities_user` WRITE;
/*!40000 ALTER TABLE `abilities_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `abilities_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=aktif, 0=tidak aktif',
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_kode_unique` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bukubesar`
--

DROP TABLE IF EXISTS `bukubesar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bukubesar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint(20) unsigned NOT NULL,
  `sumber_id` bigint(20) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `nomer` varchar(255) NOT NULL,
  `sumber_transaksi` varchar(255) NOT NULL,
  `nominal` decimal(50,2) NOT NULL,
  `tipe_mutasi` varchar(255) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bukubesar_coa_id_foreign` (`coa_id`),
  CONSTRAINT `bukubesar_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bukubesar`
--

LOCK TABLES `bukubesar` WRITE;
/*!40000 ALTER TABLE `bukubesar` DISABLE KEYS */;
/*!40000 ALTER TABLE `bukubesar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coa`
--

DROP TABLE IF EXISTS `coa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_aktif` int(11) NOT NULL DEFAULT 1 COMMENT '1=aktif, 0=tidak aktif',
  `parent_coa` bigint(20) unsigned DEFAULT NULL,
  `tipe_coa` varchar(255) NOT NULL COMMENT 'tipe coa statis, contoh : akun piutang, akun hutang, hpp, kasbank, dll',
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_postable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `coa_kode_unique` (`kode`) USING BTREE,
  UNIQUE KEY `coa_nama_unique` (`nama`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faktur_pembelian`
--

DROP TABLE IF EXISTS `faktur_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktur_pembelian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `nomer_faktur` varchar(255) NOT NULL,
  `tanggal_faktur` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `nilai_ppn` decimal(50,2) NOT NULL DEFAULT 0.00,
  `biaya_kirim` decimal(50,2) DEFAULT 0.00,
  `sudah_terbayar` decimal(50,2) NOT NULL DEFAULT 0.00,
  `status_proses` varchar(255) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grandtotal` decimal(50,2) NOT NULL,
  `tanggal_jatuh_tempo` date DEFAULT '0001-01-01',
  `tanggal_pesan` date DEFAULT '0001-01-01',
  `kategori_faktur` varchar(200) DEFAULT NULL COMMENT 'obat&bhp, non medis, dapur',
  `kode_bangsal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faktur_pembelian_nomer_faktur_unique` (`nomer_faktur`),
  KEY `faktur_pembelian_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `faktur_pembelian_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktur_pembelian`
--

LOCK TABLES `faktur_pembelian` WRITE;
/*!40000 ALTER TABLE `faktur_pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktur_pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktur_pembelian_rinci`
--

DROP TABLE IF EXISTS `faktur_pembelian_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktur_pembelian_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faktur_pembelian_id` bigint(20) unsigned NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `diskon_rupiah` decimal(50,2) DEFAULT 0.00,
  `subtotal` decimal(50,2) NOT NULL DEFAULT 0.00,
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `harga_barang` decimal(50,2) NOT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(200) DEFAULT NULL,
  `satuan_barang` varchar(50) DEFAULT NULL,
  `total` decimal(50,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faktur_pembelian_rinci_faktur_pembelian_id_foreign` (`faktur_pembelian_id`),
  CONSTRAINT `faktur_pembelian_rinci_faktur_pembelian_id_foreign` FOREIGN KEY (`faktur_pembelian_id`) REFERENCES `faktur_pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktur_pembelian_rinci`
--

LOCK TABLES `faktur_pembelian_rinci` WRITE;
/*!40000 ALTER TABLE `faktur_pembelian_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktur_pembelian_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktur_penjualan`
--

DROP TABLE IF EXISTS `faktur_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktur_penjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pelanggan_id` bigint(20) unsigned NOT NULL,
  `ppn_id` bigint(20) unsigned DEFAULT NULL,
  `akun_piutang_id` bigint(20) unsigned DEFAULT NULL,
  `nomor_faktur` varchar(255) NOT NULL,
  `tanggal_faktur` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ppn_persen` decimal(5,2) DEFAULT 0.00,
  `ppn_rupiah` decimal(50,2) DEFAULT 0.00,
  `diskon_persen` decimal(5,2) DEFAULT NULL,
  `diskon_rupiah` decimal(50,2) DEFAULT NULL,
  `grandtotal` decimal(50,2) NOT NULL DEFAULT 0.00 COMMENT 'Dengan PPn',
  `sudah_terbayar` decimal(50,2) NOT NULL DEFAULT 0.00 COMMENT 'Nominal yang sudah dibayar',
  `status_proses` int(11) NOT NULL COMMENT '0: Belum | 1: Sudah',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode_poli` varchar(50) DEFAULT NULL,
  `nama_poli` varchar(50) DEFAULT NULL,
  `jam_registrasi` varchar(50) DEFAULT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL,
  `kode_dokter` varchar(50) DEFAULT NULL,
  `nama_dokter` varchar(255) DEFAULT NULL,
  `nama_pasien` varchar(255) NOT NULL DEFAULT '',
  `nomer_rawat` varchar(255) NOT NULL DEFAULT '',
  `nomer_rekam_medis` varchar(255) DEFAULT NULL,
  `tanggal_registrasi` date NOT NULL,
  `umur` varchar(50) DEFAULT NULL,
  `kode_penjamin` varchar(100) DEFAULT NULL,
  `nama_penjamin` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faktur_penjualan_nomor_faktur_unique` (`nomor_faktur`),
  KEY `faktur_penjualan_pelanggan_id_foreign` (`pelanggan_id`),
  KEY `faktur_penjualan_ppn_id_foreign` (`ppn_id`),
  KEY `faktur_penjualan_akun_piutang_id_foreign` (`akun_piutang_id`),
  CONSTRAINT `faktur_penjualan_ibfk_2` FOREIGN KEY (`akun_piutang_id`) REFERENCES `coa` (`id`),
  CONSTRAINT `faktur_penjualan_ibfk_3` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`),
  CONSTRAINT `faktur_penjualan_ppn_id_foreign` FOREIGN KEY (`ppn_id`) REFERENCES `ppn` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktur_penjualan`
--

LOCK TABLES `faktur_penjualan` WRITE;
/*!40000 ALTER TABLE `faktur_penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktur_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktur_penjualan_rinci`
--

DROP TABLE IF EXISTS `faktur_penjualan_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktur_penjualan_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faktur_penjualan_id` bigint(20) unsigned NOT NULL,
  `kuantitas` decimal(50,2) DEFAULT NULL,
  `diskon_persen` decimal(50,2) DEFAULT NULL,
  `diskon_rupiah` decimal(50,2) DEFAULT NULL,
  `subtotal` decimal(50,2) DEFAULT NULL COMMENT 'Harga - Diskon x kuantitas',
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `harga` decimal(50,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faktur_penjualan_rinci_faktur_penjualan_id_foreign` (`faktur_penjualan_id`),
  CONSTRAINT `faktur_penjualan_rinci_ibfk_1` FOREIGN KEY (`faktur_penjualan_id`) REFERENCES `faktur_penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktur_penjualan_rinci`
--

LOCK TABLES `faktur_penjualan_rinci` WRITE;
/*!40000 ALTER TABLE `faktur_penjualan_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktur_penjualan_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipsrs_suplier`
--

DROP TABLE IF EXISTS `ipsrs_suplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipsrs_suplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_suplier` varchar(255) NOT NULL,
  `nama_suplier` longtext NOT NULL,
  `status_aktif` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_ipsrs_suplier_kode_suplier` (`kode_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipsrs_suplier`
--

LOCK TABLES `ipsrs_suplier` WRITE;
/*!40000 ALTER TABLE `ipsrs_suplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipsrs_suplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurnal_umum`
--

DROP TABLE IF EXISTS `jurnal_umum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurnal_umum` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomer` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `debit` decimal(50,2) NOT NULL,
  `kredit` decimal(50,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jurnal_umum_nomer_unique` (`nomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnal_umum`
--

LOCK TABLES `jurnal_umum` WRITE;
/*!40000 ALTER TABLE `jurnal_umum` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnal_umum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurnal_umum_rinci`
--

DROP TABLE IF EXISTS `jurnal_umum_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurnal_umum_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jurnal_umum_id` bigint(20) unsigned NOT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `debit` decimal(50,2) NOT NULL,
  `kredit` decimal(50,2) NOT NULL,
  `pelanggan` bigint(20) unsigned DEFAULT NULL,
  `supplier` bigint(20) unsigned DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jurnal_umum_rinci_jurnal_umum_id_foreign` (`jurnal_umum_id`),
  KEY `jurnal_umum_rinci_coa_id_foreign` (`coa_id`),
  CONSTRAINT `jurnal_umum_rinci_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`),
  CONSTRAINT `jurnal_umum_rinci_jurnal_umum_id_foreign` FOREIGN KEY (`jurnal_umum_id`) REFERENCES `jurnal_umum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnal_umum_rinci`
--

LOCK TABLES `jurnal_umum_rinci` WRITE;
/*!40000 ALTER TABLE `jurnal_umum_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurnal_umum_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasbank_pembayaran`
--

DROP TABLE IF EXISTS `kasbank_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kasbank_pembayaran` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint(20) unsigned NOT NULL,
  `nomer` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kasbank_pembayaran_nomer_unique` (`nomer`),
  KEY `kasbank_pembayaran_coa_id_foreign` (`coa_id`),
  CONSTRAINT `kasbank_pembayaran_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasbank_pembayaran`
--

LOCK TABLES `kasbank_pembayaran` WRITE;
/*!40000 ALTER TABLE `kasbank_pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `kasbank_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasbank_pembayaran_rinci`
--

DROP TABLE IF EXISTS `kasbank_pembayaran_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kasbank_pembayaran_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kasbank_pembayaran_id` bigint(20) unsigned NOT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `nominal` double NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kasbank_pembayaran_rinci_kasbank_pembayaran_id_foreign` (`kasbank_pembayaran_id`),
  KEY `kasbank_pembayaran_rinci_coa_id_foreign` (`coa_id`),
  CONSTRAINT `kasbank_pembayaran_rinci_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`),
  CONSTRAINT `kasbank_pembayaran_rinci_kasbank_pembayaran_id_foreign` FOREIGN KEY (`kasbank_pembayaran_id`) REFERENCES `kasbank_pembayaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasbank_pembayaran_rinci`
--

LOCK TABLES `kasbank_pembayaran_rinci` WRITE;
/*!40000 ALTER TABLE `kasbank_pembayaran_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `kasbank_pembayaran_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasbank_penerimaan`
--

DROP TABLE IF EXISTS `kasbank_penerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kasbank_penerimaan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint(20) unsigned NOT NULL,
  `nomer` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kasbank_penerimaan_nomer_unique` (`nomer`),
  KEY `kasbank_penerimaan_coa_id_foreign` (`coa_id`),
  CONSTRAINT `kasbank_penerimaan_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasbank_penerimaan`
--

LOCK TABLES `kasbank_penerimaan` WRITE;
/*!40000 ALTER TABLE `kasbank_penerimaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kasbank_penerimaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasbank_penerimaan_rinci`
--

DROP TABLE IF EXISTS `kasbank_penerimaan_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kasbank_penerimaan_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kasbank_penerimaan_id` bigint(20) unsigned NOT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `nominal` double NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kasbank_penerimaan_rinci_kasbank_penerimaan_id_foreign` (`kasbank_penerimaan_id`),
  KEY `kasbank_penerimaan_rinci_coa_id_foreign` (`coa_id`),
  CONSTRAINT `kasbank_penerimaan_rinci_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`),
  CONSTRAINT `kasbank_penerimaan_rinci_kasbank_penerimaan_id_foreign` FOREIGN KEY (`kasbank_penerimaan_id`) REFERENCES `kasbank_penerimaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasbank_penerimaan_rinci`
--

LOCK TABLES `kasbank_penerimaan_rinci` WRITE;
/*!40000 ALTER TABLE `kasbank_penerimaan_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `kasbank_penerimaan_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aktifitas`
--

DROP TABLE IF EXISTS `log_aktifitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_aktifitas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(255) NOT NULL,
  `modul` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `payload` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aktifitas`
--

LOCK TABLES `log_aktifitas` WRITE;
/*!40000 ALTER TABLE `log_aktifitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_aktifitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_hapus_import_pendapatan`
--

DROP TABLE IF EXISTS `log_hapus_import_pendapatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_hapus_import_pendapatan` (
  `log_hapus_import_pendapatan_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomer` longtext NOT NULL,
  `dihapus_oleh` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `sumber_transaksi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`log_hapus_import_pendapatan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_hapus_import_pendapatan`
--

LOCK TABLES `log_hapus_import_pendapatan` WRITE;
/*!40000 ALTER TABLE `log_hapus_import_pendapatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_hapus_import_pendapatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping_coa_simrs`
--

DROP TABLE IF EXISTS `mapping_coa_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_coa_simrs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_rekening` varchar(50) NOT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `kode_coa` varchar(100) DEFAULT NULL,
  `nama_coa` varchar(100) DEFAULT NULL,
  `nama_rekening` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coa_id` (`coa_id`),
  CONSTRAINT `mapping_coa_simrs_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mapping_lawan_pendapatan_simrs`
--

DROP TABLE IF EXISTS `mapping_lawan_pendapatan_simrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_lawan_pendapatan_simrs` (
  `mapping_lawan_pendapatan_simrs_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_coa_simrs` varchar(50) NOT NULL,
  `nama_coa_simrs` varchar(100) NOT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`mapping_lawan_pendapatan_simrs_id`),
  KEY `coa_id` (`coa_id`),
  CONSTRAINT `mapping_lawan_pendapatan_simrs_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping_lawan_pendapatan_simrs`
--

LOCK TABLES `mapping_lawan_pendapatan_simrs` WRITE;
/*!40000 ALTER TABLE `mapping_lawan_pendapatan_simrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping_lawan_pendapatan_simrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping_pendapatan`
--

DROP TABLE IF EXISTS `mapping_pendapatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_pendapatan` (
  `mapping_pendapatan_id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jenis_perawatan` varchar(50) NOT NULL,
  `kode_penjamin` varchar(50) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `kode_poli` varchar(50) DEFAULT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `user_create` varchar(255) DEFAULT NULL,
  `user_edit` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `sumber_tindakan` varchar(50) NOT NULL DEFAULT '',
  `nm_perawatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mapping_pendapatan_id`),
  UNIQUE KEY `IX_mapping_pendapatan_kode_jenis_perawatan_kode_penjamin_sumber~` (`kode_jenis_perawatan`,`kode_penjamin`,`sumber_tindakan`),
  KEY `coa_id` (`coa_id`),
  CONSTRAINT `mapping_pendapatan_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping_pendapatan`
--

LOCK TABLES `mapping_pendapatan` WRITE;
/*!40000 ALTER TABLE `mapping_pendapatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping_pendapatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping_pendapatan_jual_obat`
--

DROP TABLE IF EXISTS `mapping_pendapatan_jual_obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_pendapatan_jual_obat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_rekening` varchar(100) NOT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coa_id` (`coa_id`),
  CONSTRAINT `mapping_pendapatan_jual_obat_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping_pendapatan_jual_obat`
--

LOCK TABLES `mapping_pendapatan_jual_obat` WRITE;
/*!40000 ALTER TABLE `mapping_pendapatan_jual_obat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping_pendapatan_jual_obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping_pendapatan_kamar`
--

DROP TABLE IF EXISTS `mapping_pendapatan_kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_pendapatan_kamar` (
  `mapping_pendapatan_kamar_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_kamar` varchar(50) NOT NULL,
  `nama_kamar` varchar(200) DEFAULT NULL,
  `status_aktif` varchar(1) NOT NULL,
  `pendapatan_kamar_coa_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`mapping_pendapatan_kamar_id`),
  UNIQUE KEY `IX_mapping_pendapatan_kamar_kode_kamar` (`kode_kamar`),
  KEY `pendapatan_kamar_coa_id` (`pendapatan_kamar_coa_id`),
  CONSTRAINT `mapping_pendapatan_kamar_ibfk_1` FOREIGN KEY (`pendapatan_kamar_coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping_pendapatan_kamar`
--

LOCK TABLES `mapping_pendapatan_kamar` WRITE;
/*!40000 ALTER TABLE `mapping_pendapatan_kamar` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping_pendapatan_kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping_pendapatan_umum`
--

DROP TABLE IF EXISTS `mapping_pendapatan_umum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_pendapatan_umum` (
  `mapping_pendapatan_umum_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `coa_id` bigint(20) unsigned NOT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `kode_penjamin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mapping_pendapatan_umum_id`),
  UNIQUE KEY `IX_mapping_pendapatan_umum_nama_kode_penjamin` (`nama`,`kode_penjamin`),
  KEY `coa_id` (`coa_id`),
  CONSTRAINT `mapping_pendapatan_umum_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping_pendapatan_umum`
--

LOCK TABLES `mapping_pendapatan_umum` WRITE;
/*!40000 ALTER TABLE `mapping_pendapatan_umum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping_pendapatan_umum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `type` enum('navigasi','aksi') NOT NULL DEFAULT 'navigasi',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomer_otomatis`
--

DROP TABLE IF EXISTS `nomer_otomatis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomer_otomatis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` longtext NOT NULL,
  `periode` longtext NOT NULL,
  `nomer_terakhir` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomer_otomatis`
--

LOCK TABLES `nomer_otomatis` WRITE;
/*!40000 ALTER TABLE `nomer_otomatis` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomer_otomatis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=aktif, 0=tidak aktif',
  `kode_pelanggan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelanggan_nama_unique` (`nama_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran_pembelian`
--

DROP TABLE IF EXISTS `pembayaran_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran_pembelian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `akun_bank_id` bigint(20) unsigned NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `nomer_pembayaran` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `total_bayar` decimal(50,2) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `akun_hutang_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pembayaran_pembelian_nomer_pembayaran_unique` (`nomer_pembayaran`),
  KEY `pembayaran_pembelian_supplier_id_foreign` (`supplier_id`),
  KEY `pembayaran_pembelian_akun_bank_id_foreign` (`akun_bank_id`),
  CONSTRAINT `pembayaran_pembelian_ibfk_1` FOREIGN KEY (`akun_bank_id`) REFERENCES `coa` (`id`),
  CONSTRAINT `pembayaran_pembelian_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran_pembelian`
--

LOCK TABLES `pembayaran_pembelian` WRITE;
/*!40000 ALTER TABLE `pembayaran_pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran_pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran_pembelian_rinci`
--

DROP TABLE IF EXISTS `pembayaran_pembelian_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran_pembelian_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pembayaran_pembelian_id` bigint(20) unsigned NOT NULL,
  `faktur_pembelian_id` bigint(20) unsigned NOT NULL,
  `nominal_bayar` decimal(50,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pembayaran_pembelian_rinci_pembayaran_pembelian_id_foreign` (`pembayaran_pembelian_id`),
  KEY `pembayaran_pembelian_rinci_faktur_id_foreign` (`faktur_pembelian_id`),
  CONSTRAINT `pembayaran_pembelian_rinci_ibfk_1` FOREIGN KEY (`faktur_pembelian_id`) REFERENCES `faktur_pembelian` (`id`),
  CONSTRAINT `pembayaran_pembelian_rinci_ibfk_2` FOREIGN KEY (`pembayaran_pembelian_id`) REFERENCES `pembayaran_pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran_pembelian_rinci`
--

LOCK TABLES `pembayaran_pembelian_rinci` WRITE;
/*!40000 ALTER TABLE `pembayaran_pembelian_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran_pembelian_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerimaan_penjualan`
--

DROP TABLE IF EXISTS `penerimaan_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaan_penjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `pelanggan_id` bigint(20) unsigned NOT NULL,
  `akun_bank_id` bigint(20) unsigned NOT NULL,
  `nomer` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_pembayaran` decimal(50,2) NOT NULL DEFAULT 0.00,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `akun_piutang_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `penerimaan_penjualan_nomer_unique` (`nomer`),
  KEY `penerimaan_penjualan_pelanggan_id_foreign` (`pelanggan_id`),
  KEY `penerimaan_penjualan_akun_bank_id_foreign` (`akun_bank_id`),
  CONSTRAINT `penerimaan_penjualan_akun_bank_id_foreign` FOREIGN KEY (`akun_bank_id`) REFERENCES `coa` (`id`),
  CONSTRAINT `penerimaan_penjualan_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaan_penjualan`
--

LOCK TABLES `penerimaan_penjualan` WRITE;
/*!40000 ALTER TABLE `penerimaan_penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaan_penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerimaan_penjualan_rinci`
--

DROP TABLE IF EXISTS `penerimaan_penjualan_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penerimaan_penjualan_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `penerimaan_penjualan_id` bigint(20) unsigned NOT NULL,
  `faktur_penjualan_id` bigint(20) unsigned NOT NULL,
  `nominal_bayar` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penerimaan_penjualan_rinci_penerimaan_penjualan_id_foreign` (`penerimaan_penjualan_id`),
  KEY `penerimaan_penjualan_rinci_faktur_penjualan_id_foreign` (`faktur_penjualan_id`),
  CONSTRAINT `penerimaan_penjualan_rinci_faktur_penjualan_id_foreign` FOREIGN KEY (`faktur_penjualan_id`) REFERENCES `faktur_penjualan` (`id`),
  CONSTRAINT `penerimaan_penjualan_rinci_ibfk_1` FOREIGN KEY (`penerimaan_penjualan_id`) REFERENCES `penerimaan_penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimaan_penjualan_rinci`
--

LOCK TABLES `penerimaan_penjualan_rinci` WRITE;
/*!40000 ALTER TABLE `penerimaan_penjualan_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimaan_penjualan_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_pembelian`
--

DROP TABLE IF EXISTS `pesanan_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_pembelian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `pelanggan_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `akun_diskon_id` int(11) NOT NULL DEFAULT 0,
  `akun_ppn_id` int(11) NOT NULL DEFAULT 0,
  `akun_biaya_kirim` int(11) NOT NULL DEFAULT 0,
  `gudang_id` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `nomer_pesanan` varchar(255) NOT NULL,
  `jatuh_tempo` int(11) NOT NULL DEFAULT 0 COMMENT 'Menggunakan hari',
  `tanggal` date NOT NULL,
  `ppn` int(11) NOT NULL DEFAULT 0,
  `nilai_ppn` decimal(50,2) NOT NULL DEFAULT 0.00,
  `biaya_kirim` decimal(50,2) NOT NULL DEFAULT 0.00,
  `diskon_persen` decimal(50,2) NOT NULL DEFAULT 0.00,
  `diskon_rupiah` decimal(50,2) NOT NULL DEFAULT 0.00,
  `grandtotal_sebelum_diskon` decimal(50,2) NOT NULL DEFAULT 0.00 COMMENT 'Grandtotal sebelum dipotong diskon',
  `grandtotal_setelah_diskon` decimal(50,2) NOT NULL DEFAULT 0.00 COMMENT 'Grandtotal setelah dipotong diskon',
  `grandtotal_akhir` decimal(50,2) NOT NULL DEFAULT 0.00 COMMENT 'Total akhir dengan menambah biaya kirim dan mengurangi diskon',
  `keterangan` text DEFAULT NULL,
  `status_proses` int(11) NOT NULL DEFAULT 0 COMMENT '0=belum,1=sudah',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pesanan_pembelian_nomer_pesanan_unique` (`nomer_pesanan`),
  KEY `pesanan_pembelian_supplier_id_foreign` (`supplier_id`),
  KEY `pesanan_pembelian_pelanggan_id_foreign` (`pelanggan_id`),
  CONSTRAINT `pesanan_pembelian_pelanggan_id_foreign` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`),
  CONSTRAINT `pesanan_pembelian_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_pembelian`
--

LOCK TABLES `pesanan_pembelian` WRITE;
/*!40000 ALTER TABLE `pesanan_pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan_pembelian_rinci`
--

DROP TABLE IF EXISTS `pesanan_pembelian_rinci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan_pembelian_rinci` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pesanan_pembelian_id` bigint(20) unsigned NOT NULL,
  `barang_id` bigint(20) unsigned NOT NULL,
  `kuantitas` double NOT NULL DEFAULT 0,
  `kuantitas_diterima` double NOT NULL DEFAULT 0,
  `harga_barang` decimal(50,2) NOT NULL DEFAULT 0.00,
  `diskon_persen` decimal(50,2) NOT NULL DEFAULT 0.00,
  `diskon_rupiah` decimal(50,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(50,2) NOT NULL DEFAULT 0.00 COMMENT 'Harga - Diskon X kuantitas',
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pesanan_pembelian_rinci_pesanan_pembelian_id_foreign` (`pesanan_pembelian_id`),
  KEY `pesanan_pembelian_rinci_barang_id_foreign` (`barang_id`),
  CONSTRAINT `pesanan_pembelian_rinci_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  CONSTRAINT `pesanan_pembelian_rinci_pesanan_pembelian_id_foreign` FOREIGN KEY (`pesanan_pembelian_id`) REFERENCES `pesanan_pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan_pembelian_rinci`
--

LOCK TABLES `pesanan_pembelian_rinci` WRITE;
/*!40000 ALTER TABLE `pesanan_pembelian_rinci` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesanan_pembelian_rinci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppn`
--

DROP TABLE IF EXISTS `ppn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppn` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_ppn` varchar(255) NOT NULL,
  `nilai_ppn` decimal(5,3) NOT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppn_nama_ppn_unique` (`nama_ppn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppn`
--

LOCK TABLES `ppn` WRITE;
/*!40000 ALTER TABLE `ppn` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferensi_perusahaan`
--

DROP TABLE IF EXISTS `preferensi_perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferensi_perusahaan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint(20) unsigned DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `shortname` varchar(25) DEFAULT NULL,
  `npwp_perusahaan` varchar(255) DEFAULT NULL,
  `no_telp_perusahaan` varchar(255) DEFAULT NULL,
  `email_perusahaan` varchar(255) DEFAULT NULL,
  `nama_penandatangan` varchar(255) DEFAULT NULL,
  `alamat_perusahaan` text DEFAULT NULL,
  `logo_perusahaan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preferensi_perusahaan_coa_id_foreign` (`coa_id`),
  CONSTRAINT `preferensi_perusahaan_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferensi_perusahaan`
--

LOCK TABLES `preferensi_perusahaan` WRITE;
/*!40000 ALTER TABLE `preferensi_perusahaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferensi_perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldo_akun`
--

DROP TABLE IF EXISTS `saldo_akun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldo_akun` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint(20) unsigned NOT NULL,
  `periode` varchar(255) NOT NULL,
  `saldo_awal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_debit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_kredit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `saldo_akhir` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saldo_akun_coa_id_foreign` (`coa_id`),
  CONSTRAINT `saldo_akun_coa_id_foreign` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldo_akun`
--

LOCK TABLES `saldo_akun` WRITE;
/*!40000 ALTER TABLE `saldo_akun` DISABLE KEYS */;
/*!40000 ALTER TABLE `saldo_akun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simrs_import_pendapatan`
--

DROP TABLE IF EXISTS `simrs_import_pendapatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simrs_import_pendapatan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomer_billing` varchar(200) NOT NULL,
  `tanggal_reg` date NOT NULL,
  `user_importer` varchar(200) NOT NULL,
  `import_time` datetime NOT NULL,
  `dokter` varchar(200) DEFAULT NULL,
  `nama_pasien` varchar(200) DEFAULT NULL,
  `penjamin` varchar(200) DEFAULT NULL,
  `poli` varchar(200) DEFAULT NULL,
  `status_layanan` varchar(200) DEFAULT NULL,
  `total_tagihan` decimal(50,2) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `jam_reg` varchar(200) DEFAULT NULL,
  `kode_dokter` varchar(200) DEFAULT NULL,
  `kode_penjamin` varchar(200) DEFAULT NULL,
  `kode_poli` varchar(200) DEFAULT NULL,
  `nama_kabupaten` varchar(200) DEFAULT NULL,
  `nama_kecamatan` varchar(200) DEFAULT NULL,
  `nama_kelurahan` varchar(200) DEFAULT NULL,
  `no_rekam_medis` varchar(200) DEFAULT NULL,
  `diagnosa_penyakit` varchar(200) DEFAULT NULL,
  `kamar_inap` varchar(200) DEFAULT NULL,
  `import_ke` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simrs_import_pendapatan`
--

LOCK TABLES `simrs_import_pendapatan` WRITE;
/*!40000 ALTER TABLE `simrs_import_pendapatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `simrs_import_pendapatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simrs_import_pendapatan_jual_obat`
--

DROP TABLE IF EXISTS `simrs_import_pendapatan_jual_obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simrs_import_pendapatan_jual_obat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `nama_pelanggan` varchar(200) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `jenis_jual` varchar(200) DEFAULT NULL,
  `ongkir` decimal(50,2) NOT NULL,
  `ppn` decimal(50,2) NOT NULL,
  `kode_gudang` varchar(100) NOT NULL,
  `kode_rekening` varchar(100) NOT NULL,
  `nama_rekening` varchar(200) NOT NULL,
  `nomer_transaksi` varchar(100) NOT NULL DEFAULT '',
  `grandtotal` decimal(50,2) DEFAULT NULL,
  `import_ke` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simrs_import_pendapatan_jual_obat`
--

LOCK TABLES `simrs_import_pendapatan_jual_obat` WRITE;
/*!40000 ALTER TABLE `simrs_import_pendapatan_jual_obat` DISABLE KEYS */;
/*!40000 ALTER TABLE `simrs_import_pendapatan_jual_obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=aktif, 0=tidak aktif',
  `kode_supplier` varchar(100) NOT NULL,
  `nama_supplier` varchar(200) NOT NULL,
  `email_supplier` varchar(255) DEFAULT NULL,
  `alamat_supplier` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kategori_supplier` varchar(200) DEFAULT NULL COMMENT 'obat & bhp, barang non medis, dapur',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe_coa`
--

DROP TABLE IF EXISTS `tipe_coa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipe_coa` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe_coa`
--

LOCK TABLES `tipe_coa` WRITE;
/*!40000 ALTER TABLE `tipe_coa` DISABLE KEYS */;
INSERT INTO `tipe_coa` VALUES (1,1,'Kasbank','2025-07-18 00:35:57','2025-07-18 00:35:57'),(2,1,'Akun Piutang','2025-07-18 00:35:57','2025-07-18 00:35:57'),(3,1,'Persediaan','2025-07-18 00:35:57','2025-07-18 00:35:57'),(4,1,'Aktiva Lancar lainnya','2025-07-18 00:35:57','2025-07-18 00:35:57'),(5,1,'Akumulasi Penyusutan','2025-07-18 00:35:57','2025-07-18 00:35:57'),(6,1,'Aktiva Lainnya','2025-07-18 00:35:57','2025-07-18 00:35:57'),(7,1,'Akun Hutang','2025-07-18 00:35:57','2025-07-18 00:35:57'),(8,1,'Hutang Lancar lainnya','2025-07-18 00:35:57','2025-07-18 00:35:57'),(9,1,'Hutang Jangka Panjang','2025-07-18 00:35:57','2025-07-18 00:35:57'),(10,1,'Ekuitas','2025-07-18 00:35:57','2025-07-18 00:35:57'),(11,1,'Pendapatan','2025-07-18 00:35:57','2025-07-18 00:35:57'),(12,1,'Beban Pokok Penjualan','2025-07-18 00:35:57','2025-07-18 00:35:57'),(13,1,'Beban','2025-07-18 00:35:57','2025-07-18 00:35:57'),(14,1,'Beban lain','2025-07-18 00:35:57','2025-07-18 00:35:57'),(15,1,'Pendapatan lain','2025-07-18 00:35:57','2025-07-18 00:35:57'),(16,1,'Piutang Usaha','2025-07-18 00:35:57','2025-07-18 00:35:57'),(17,1,'Utang Usaha','2025-07-18 00:35:57','2025-07-18 00:35:57'),(18,1,'Aset Lancar lainnya','2025-07-18 00:35:57','2025-07-18 00:35:57'),(19,1,'Aset Tetap','2025-07-18 00:35:57','2025-07-18 00:35:57'),(20,1,'Liabilitas Jangka Pendek','2025-07-18 00:35:57','2025-07-18 00:35:57');
/*!40000 ALTER TABLE `tipe_coa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jumlah_ganti_password` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `member` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-07  6:59:04
