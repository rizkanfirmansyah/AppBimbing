-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.12-MariaDB-1 - Debian 11
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for web_bimbingan
CREATE DATABASE IF NOT EXISTS `web_bimbingan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `web_bimbingan`;

-- Dumping structure for table web_bimbingan.detail_seminars
CREATE TABLE IF NOT EXISTS `detail_seminars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.detail_seminars: ~0 rows (approximately)
/*!40000 ALTER TABLE `detail_seminars` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_seminars` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.dosens
CREATE TABLE IF NOT EXISTS `dosens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.dosens: ~3 rows (approximately)
/*!40000 ALTER TABLE `dosens` DISABLE KEYS */;
INSERT INTO `dosens` (`id`, `user_id`, `nama`, `description`, `jurusan`, `created_at`, `updated_at`) VALUES
	(1, '3', 'Ahmad Komar', 'adwdawdwa', 'Teknik Komputer', NULL, NULL),
	(2, '3', 'Khoirida', 'adwdawdwa', 'Sistem Informasi', NULL, NULL),
	(7, '12', 'Anne Christiani M.Kom', NULL, 'Sistem Informasi', '2021-12-11 16:25:32', '2021-12-11 16:50:14');
/*!40000 ALTER TABLE `dosens` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.guidances
CREATE TABLE IF NOT EXISTS `guidances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mahasiswa_id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosen_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3',
  `description_dosen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.guidances: ~1 rows (approximately)
/*!40000 ALTER TABLE `guidances` DISABLE KEYS */;
INSERT INTO `guidances` (`id`, `mahasiswa_id`, `dosen_id`, `title`, `description`, `file`, `status`, `description_dosen`, `memo`, `created_at`, `updated_at`) VALUES
	(4, '7', '2', 'Cara membuat website dinamis', 'Cara membuat website dinamis yang keren dan juga bisa dihandalkan secara user dan interface\\', '1639059405687-db_puskesmas_padaherang.sql', '1', 'selamat anda berhasil', NULL, '2021-12-09 14:16:45', '2022-01-02 03:36:37'),
	(5, '7', '1', 'cara ,embuay', 'awdawdawd', '1639315811524-Screenshot_2021-11-23_16_03_49.png', '1', 'wadawdawdawd', NULL, '2021-12-12 13:30:11', '2021-12-12 16:16:14');
/*!40000 ALTER TABLE `guidances` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.mahasiswas
CREATE TABLE IF NOT EXISTS `mahasiswas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `npm` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.mahasiswas: ~5 rows (approximately)
/*!40000 ALTER TABLE `mahasiswas` DISABLE KEYS */;
INSERT INTO `mahasiswas` (`id`, `npm`, `user_id`, `nama`, `jurusan`, `created_at`, `updated_at`) VALUES
	(1, '2143441', '1', 'Rizkan', 'Sistem Informasi', '2021-12-08 08:51:43', '2021-12-08 08:51:43'),
	(3, '2143443', '3', 'Dosen Amarudin', 'Sistem Informasi', '2021-12-08 08:52:13', '2021-12-08 08:52:13'),
	(4, '121212', '4', 'Rizkan Aprianda Firmansyah', 'Teknik Informatika', '2021-12-11 14:20:17', '2021-12-11 14:20:17'),
	(5, '202021', '5', 'apa aja', 'Teknik Informatika', '2021-12-11 16:14:17', '2021-12-11 16:48:41'),
	(7, '214431', '13', 'Rizkan Aprianda Firmansyah', 'Teknik Informatika', '2021-12-12 13:29:54', '2021-12-12 13:29:54');
/*!40000 ALTER TABLE `mahasiswas` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.migrations: ~12 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(6, '2021_11_30_071618_create_sessions_table', 1),
	(10, '2014_10_12_000000_create_users_table', 2),
	(11, '2014_10_12_100000_create_password_resets_table', 2),
	(12, '2019_08_19_000000_create_failed_jobs_table', 2),
	(13, '2019_12_14_000001_create_personal_access_tokens_table', 2),
	(14, '2021_12_04_185729_create_mahasiswas_table', 2),
	(15, '2021_12_06_161927_create_dosens_table', 2),
	(16, '2021_12_07_005313_create_guidances_table', 2),
	(17, '2021_12_26_165432_create_notifications_table', 3),
	(18, '2021_12_26_165444_create_seminars_table', 3),
	(19, '2021_12_26_165458_create_detail_seminars_table', 3),
	(20, '2021_12_26_165518_create_peserta_seminars_table', 3),
	(21, '2021_12_26_170617_create_notification_statuses_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` (`id`, `from`, `to`, `role`, `type`, `link`, `title`, `status`, `description`, `created_at`, `updated_at`) VALUES
	(1, '214431', 'admin', 'personal', 'notification', '/admin/result?data=Cara%20membuat%20website%20dinamis&id=4', 'Pengajuan Bimbingan Mahasiswa Baru', 'action', 'Pengajuan Bimbingan Mahasiswa Baru', '2022-01-01 03:40:35', '2022-01-01 03:40:35'),
	(3, 'admin', 'dosen', 'personal', 'notification', '/dosen/proses/bimbingan?data=Cara membuat website dinamis&id=4', 'Pengajuan Bimbingan Kepada Dosen', 'action', 'Pengajuan Bimbingan Mahasiswa Kepada Dosen', '2022-01-02 03:25:10', '2022-01-02 03:25:10'),
	(4, 'dosen', '214431', 'personal', 'notification', '/bimbingan/hasil?data=cara ,embua&id=4', 'Selamat bimbingan berhasil di Setujui', 'action', 'selamat anda berhasil', '2022-01-02 03:36:58', '2022-01-02 03:36:58');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.notification_statuses
CREATE TABLE IF NOT EXISTS `notification_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.notification_statuses: ~0 rows (approximately)
/*!40000 ALTER TABLE `notification_statuses` DISABLE KEYS */;
INSERT INTO `notification_statuses` (`id`, `notification_id`, `username`, `status`, `created_at`, `updated_at`) VALUES
	(1, '1', 'admin', 'read', '2022-01-02 03:09:44', '2022-01-02 03:09:44'),
	(2, '2', 'dosen', 'read', '2022-01-02 03:24:16', '2022-01-02 03:24:16'),
	(3, '3', 'dosen', 'read', '2022-01-02 03:29:31', '2022-01-02 03:29:31'),
	(4, '4', '214431', 'read', '2022-01-02 03:38:18', '2022-01-02 03:38:18');
/*!40000 ALTER TABLE `notification_statuses` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.peserta_seminars
CREATE TABLE IF NOT EXISTS `peserta_seminars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seminar_id` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sosmed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.peserta_seminars: ~0 rows (approximately)
/*!40000 ALTER TABLE `peserta_seminars` DISABLE KEYS */;
/*!40000 ALTER TABLE `peserta_seminars` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.seminars
CREATE TABLE IF NOT EXISTS `seminars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speaker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruangan` char(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '2',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.seminars: ~0 rows (approximately)
/*!40000 ALTER TABLE `seminars` DISABLE KEYS */;
INSERT INTO `seminars` (`id`, `title`, `speaker`, `ruangan`, `max`, `date`, `end_date`, `status`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Text tailwind webinar 2022', 'rizkan firmansyah', 'A-10', '150', NULL, NULL, '2', 'webinar tentang framework CSS', NULL, '2021-12-27 15:18:57', '2021-12-27 17:03:08');
/*!40000 ALTER TABLE `seminars` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.sessions: ~2 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('7CX0LAM0R5FSOLGZ7niYZkfdojfbTZdfPZRUMJXD', 5, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'YTo2OntzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY2hhbmdlL3Bhc3N3b3JkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGFuZ2UvcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoibTM2bndVSDZZSzQ0ZnRXaHlpUVZ3Mm5WODgwN3RjVVZseGdoTHF3RCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHZvTnQ1eTk4VjhILjl4cVh1SnJDL2VMUk5SVk5RYlozOWR5L0JXd2UzS2Jmd2t1ZFlvOXR5Ijt9', 1638814224),
	('mF4JXLAXBDHeXdes2mCQTicPgrqPDSoSPWbw5U3u', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'YTo2OntzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjMyOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW5BZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiIzN0NDWkxBYm50alJnQXdobk1uTzFxNHpmYUpUUThocmF2ZWNKV0xsIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR6MmtVVXlweG5qRzlJUEljYXpjbGwuWHNYZnRxdnlFdTZnQmFtZmJZNDNxVzA4eEVxZHBLTyI7fQ==', 1638815328);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table web_bimbingan.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` char(255) COLLATE utf8mb4_unicode_ci DEFAULT '3',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table web_bimbingan.users: ~6 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '1', NULL, NULL, '$2y$10$.n8gCHa6WsxG2NGMlKTI/eE70tKYYQYCISVP1nfZ8sMybNcH2gvpi', NULL, NULL, NULL, '2021-12-08 08:51:43', '2021-12-08 08:51:43'),
	(3, 'dosen', '2', NULL, NULL, '$2y$10$W1kxzI63L54dcDAUJ89kfeX/.heasDbOC6mdsz0NoonpYh2zcScTe', NULL, NULL, NULL, '2021-12-08 08:52:13', '2021-12-08 08:52:13'),
	(4, '121212', '3', NULL, NULL, '$2y$10$IqbEyqa5N4ympCW2Yfa6LujzO9R9PIC91BJUwVGfr8XmiF6ldvaea', NULL, NULL, NULL, '2021-12-11 14:20:17', '2021-12-11 14:20:17'),
	(5, '202021', '3', NULL, NULL, '$2y$10$XE/i43fiMhL9./Jt6wj5wusgRYNttkBNPcEa.j7Rdpa/045PlZ5U.', NULL, NULL, NULL, '2021-12-11 16:14:17', '2021-12-11 16:48:26'),
	(12, 'anne', '2', NULL, NULL, '$2y$10$3kzlcpFewIqsaD/1/4htEuZlTVno0pCzYQ96A8P6kFdjRVD.4YDae', NULL, NULL, NULL, '2021-12-11 16:25:32', '2021-12-11 16:25:32'),
	(13, '214431', '3', NULL, NULL, '$2y$10$tY6uHNDbsZlLfzRjC9JvQeevwfQG5gU.RIyjdEIXM1Ew8SlGA5UVy', NULL, NULL, NULL, '2021-12-12 13:29:54', '2021-12-12 13:29:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
