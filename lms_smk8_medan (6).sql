-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 26, 2026 at 05:09 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_smk8_medan`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f', 'i:3;', 1771988568),
('laravel-cache-fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f:timer', 'i:1771988568;', 1771988568),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1772038119),
('laravel-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1772038119;', 1772038119);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head_department_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `head_department_id`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Perhotelan', 1, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770001822/lms_smkn8medan/kyi7onyjybz2qivbziqg.jpg', '2026-01-17 04:17:23', '2026-02-01 20:10:22', NULL),
(3, 'Kuliner', 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770001946/lms_smkn8medan/mar5aahlh2itdrigpkxl.jpg', '2026-01-17 04:19:37', '2026-02-01 20:12:26', NULL),
(4, 'Desain dan Produksi Busana', 1, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770001979/lms_smkn8medan/sq7iu7twq1e9dsm0uqra.jpg', '2026-01-17 04:19:37', '2026-02-01 20:13:00', NULL),
(5, 'Kecantikan Kulit dan Rambut', 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988528/lms_smkn8medan/obzbir78jigvz1oasbop.jpg', '2026-01-17 04:20:08', '2026-02-24 20:02:09', NULL),
(12, 'teknik telekomunikasi', 5, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988562/lms_smkn8medan/hf5a3p9hjqcftyo0zytt.jpg', '2026-02-02 21:04:24', '2026-02-24 20:02:42', '2026-02-02 21:05:16'),
(13, 'teknik telekomunikasii', NULL, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770182954/lms_smkn8medan/mq8yof99fnlgvgbiwn61.jpg', '2026-02-03 22:29:14', '2026-02-03 22:30:13', '2026-02-03 22:30:13'),
(14, 'teknik telekomunikasie', NULL, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770183649/lms_smkn8medan/of4ms0vmk5wdopofcdmp.png', '2026-02-03 22:40:49', '2026-02-03 22:42:10', '2026-02-03 22:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exporter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint UNSIGNED NOT NULL,
  `data` json NOT NULL,
  `import_id` bigint UNSIGNED NOT NULL,
  `validation_error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_import_rows`
--

INSERT INTO `failed_import_rows` (`id`, `data`, `import_id`, `validation_error`, `created_at`, `updated_at`) VALUES
(1, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"11\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(2, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"12\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(3, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"10\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(4, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"11\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(5, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"12\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(6, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"10\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(7, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"11\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(8, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"12\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(9, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"10\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(10, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"11\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 1, NULL, '2026-01-29 20:40:24', '2026-01-29 20:40:24'),
(11, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"11\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(12, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"12\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(13, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"10\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(14, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"11\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(15, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"12\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(16, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"10\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(17, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"11\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(18, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"12\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(19, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"10\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(20, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"11\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 3, NULL, '2026-01-29 20:48:29', '2026-01-29 20:48:29'),
(21, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(22, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(23, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(24, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(25, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(26, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(27, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(28, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 4, NULL, '2026-01-29 20:51:27', '2026-01-29 20:51:27'),
(29, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 4, NULL, '2026-01-29 20:51:28', '2026-01-29 20:51:28'),
(30, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 4, NULL, '2026-01-29 20:51:28', '2026-01-29 20:51:28'),
(31, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(32, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(33, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(34, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(35, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(36, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(37, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(38, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(39, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(40, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 5, NULL, '2026-01-29 20:53:45', '2026-01-29 20:53:45'),
(41, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 6, NULL, '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(42, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 6, 'The selected department id is invalid. The selected class level id is invalid.', '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(43, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 6, NULL, '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(44, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 6, 'The selected department id is invalid.', '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(45, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 6, 'The selected class level id is invalid.', '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(46, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 6, 'The selected department id is invalid.', '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(47, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 6, NULL, '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(48, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 6, 'The selected department id is invalid. The selected class level id is invalid.', '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(49, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 6, NULL, '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(50, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 6, 'The selected department id is invalid.', '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(51, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(52, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(53, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(54, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(55, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(56, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(57, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(58, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(59, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(60, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 7, 'The selected department id is invalid. The selected class level id is invalid. The selected tingkat id is invalid.', '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(61, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 8, NULL, '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(62, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 8, 'The selected department id is invalid. The selected class level id is invalid.', '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(63, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 8, NULL, '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(64, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 8, 'The selected department id is invalid.', '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(65, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 8, 'The selected class level id is invalid.', '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(66, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 8, 'The selected department id is invalid.', '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(67, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 8, NULL, '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(68, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 8, 'The selected department id is invalid. The selected class level id is invalid.', '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(69, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 8, NULL, '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(70, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 8, 'The selected department id is invalid.', '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(71, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 9, NULL, '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(72, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 9, 'The selected department id is invalid. The selected class level id is invalid.', '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(73, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 9, NULL, '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(74, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 9, 'The selected department id is invalid.', '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(75, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 9, 'The selected class level id is invalid.', '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(76, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"1\"}', 9, 'The selected department id is invalid.', '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(77, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 9, NULL, '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(78, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"3\"}', 9, 'The selected department id is invalid. The selected class level id is invalid.', '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(79, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 9, NULL, '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(80, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"1\", \"class_level_id\": \"2\"}', 9, 'The selected department id is invalid.', '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(81, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(82, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"3\"}', 10, 'The selected class level id is invalid.', '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(83, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(84, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(85, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 10, 'The selected class level id is invalid.', '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(86, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(87, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(88, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 10, 'The selected class level id is invalid.', '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(89, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(90, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 10, NULL, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(91, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(92, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"3\"}', 11, 'The selected class level id is invalid.', '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(93, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(94, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(95, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 11, 'The selected class level id is invalid.', '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(96, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(97, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(98, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"3\"}', 11, 'The selected class level id is invalid.', '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(99, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(100, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 11, NULL, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(101, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(102, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(103, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(104, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(105, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(106, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(107, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(108, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(109, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(110, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 12, NULL, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(111, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(112, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(113, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(114, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(115, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(116, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(117, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(118, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(119, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(120, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 13, NULL, '2026-01-29 22:14:23', '2026-01-29 22:14:23'),
(121, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(122, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(123, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(124, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(125, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(126, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(127, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(128, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(129, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(130, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 14, NULL, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(131, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(132, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(133, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(134, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(135, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(136, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(137, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(138, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(139, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(140, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 15, NULL, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(141, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(142, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(143, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(144, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(145, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(146, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(147, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(148, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(149, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(150, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 24, NULL, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(151, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(152, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(153, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(154, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(155, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(156, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(157, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(158, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(159, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(160, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 25, NULL, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(161, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(162, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(163, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(164, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(165, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(166, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(167, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(168, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(169, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(170, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 26, NULL, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(171, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(172, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(173, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(174, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(175, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(176, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(177, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(178, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(179, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(180, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 27, NULL, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(181, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(182, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(183, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(184, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(185, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(186, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(187, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(188, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(189, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(190, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 28, NULL, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(191, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(192, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(193, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(194, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(195, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(196, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(197, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(198, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(199, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(200, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 29, NULL, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(201, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(202, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(203, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(204, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(205, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(206, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(207, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(208, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(209, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(210, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 31, NULL, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(211, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(212, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(213, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(214, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(215, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(216, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(217, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(218, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(219, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(220, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 32, NULL, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(221, '{\"name\": \"Siswa 1\", \"nisn\": \"20240001\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(222, '{\"name\": \"Siswa 2\", \"nisn\": \"20240002\", \"tingkat_id\": \"2\", \"department_id\": \"3\", \"class_level_id\": \"4\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(223, '{\"name\": \"Siswa 3\", \"nisn\": \"20240003\", \"tingkat_id\": \"3\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(224, '{\"name\": \"Siswa 4\", \"nisn\": \"20240004\", \"tingkat_id\": \"1\", \"department_id\": \"4\", \"class_level_id\": \"2\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(225, '{\"name\": \"Siswa 5\", \"nisn\": \"20240005\", \"tingkat_id\": \"2\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(226, '{\"name\": \"Siswa 6\", \"nisn\": \"20240006\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(227, '{\"name\": \"Siswa 7\", \"nisn\": \"20240007\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(228, '{\"name\": \"Siswa 8\", \"nisn\": \"20240008\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"4\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(229, '{\"name\": \"Siswa 9\", \"nisn\": \"20240009\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"1\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(230, '{\"name\": \"Siswa 10\", \"nisn\": \"20240010\", \"tingkat_id\": \"1\", \"department_id\": \"2\", \"class_level_id\": \"2\"}', 38, NULL, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(231, '{\"nip\": \"20240001\", \"name\": \"Siswa 1\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(232, '{\"nip\": \"20240002\", \"name\": \"Siswa 2\", \"department_id\": \"3\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(233, '{\"nip\": \"20240003\", \"name\": \"Siswa 3\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(234, '{\"nip\": \"20240004\", \"name\": \"Siswa 4\", \"department_id\": \"4\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(235, '{\"nip\": \"20240005\", \"name\": \"Siswa 5\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(236, '{\"nip\": \"20240006\", \"name\": \"Siswa 6\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(237, '{\"nip\": \"20240007\", \"name\": \"Siswa 7\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(238, '{\"nip\": \"20240008\", \"name\": \"Siswa 8\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(239, '{\"nip\": \"20240009\", \"name\": \"Siswa 9\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58'),
(240, '{\"nip\": \"20240010\", \"name\": \"Siswa 10\", \"department_id\": \"2\"}', 41, NULL, '2026-02-01 20:58:58', '2026-02-01 20:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '3fb31c4f-0f8d-4924-bfc1-5ec317ead0e7', 'database', 'default', '{\"uuid\":\"3fb31c4f-0f8d-4924-bfc1-5ec317ead0e7\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:26;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:7:\\\"actions\\\";a:1:{i:0;a:22:{s:4:\\\"name\\\";s:21:\\\"downloadFailedRowsCsv\\\";s:5:\\\"color\\\";s:6:\\\"danger\\\";s:5:\\\"event\\\";N;s:9:\\\"eventData\\\";a:0:{}s:17:\\\"dispatchDirection\\\";b:0;s:19:\\\"dispatchToComponent\\\";N;s:15:\\\"extraAttributes\\\";a:0:{}s:4:\\\"icon\\\";N;s:12:\\\"iconPosition\\\";E:42:\\\"Filament\\\\Support\\\\Enums\\\\IconPosition:Before\\\";s:8:\\\"iconSize\\\";N;s:10:\\\"isOutlined\\\";b:0;s:10:\\\"isDisabled\\\";b:0;s:5:\\\"label\\\";s:42:\\\"Download information about the failed rows\\\";s:11:\\\"shouldClose\\\";b:0;s:16:\\\"shouldMarkAsRead\\\";b:1;s:18:\\\"shouldMarkAsUnread\\\";b:0;s:21:\\\"shouldOpenUrlInNewTab\\\";b:1;s:15:\\\"shouldPostToUrl\\\";b:0;s:4:\\\"size\\\";E:33:\\\"Filament\\\\Support\\\\Enums\\\\Size:Small\\\";s:7:\\\"tooltip\\\";N;s:3:\\\"url\\\";s:129:\\\"\\/filament\\/imports\\/1\\/failed-rows\\/download?authGuard=web&signature=6267a79acaeb2b0d94a3c3409ee831f03d5a4a8ed162d825216384228246dbd7\\\";s:4:\\\"view\\\";s:25:\\\"filament::components.link\\\";}}s:4:\\\"body\\\";s:80:\\\"Your student import has completed and 0 rows imported. 10 rows failed to import.\\\";s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";s:19:\\\"heroicon-o-x-circle\\\";s:9:\\\"iconColor\\\";s:6:\\\"danger\\\";s:6:\\\"status\\\";s:6:\\\"danger\\\";s:5:\\\"title\\\";s:16:\\\"Import completed\\\";s:4:\\\"view\\\";N;s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"c4d6e2be-136f-4ba6-a548-3a832fca22fc\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"},\"createdAt\":1769744424,\"delay\":null}', 'PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'lms_smk8_medan.notifications\' doesn\'t exist in D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:47\nStack trace:\n#0 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(47): PDO->prepare(\'insert into `no...\')\n#1 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `no...\', Array)\n#2 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `no...\', Array, Object(Closure))\n#3 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `no...\', Array, Object(Closure))\n#4 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4002): Illuminate\\Database\\MySqlConnection->insert(\'insert into `no...\', Array)\n#5 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insert(Array)\n#6 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1412): Illuminate\\Database\\Eloquent\\Builder->__call(\'insert\', Array)\n#7 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany.php(373): Illuminate\\Database\\Eloquent\\Model->save()\n#9 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(390): Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany->Illuminate\\Database\\Eloquent\\Relations\\{closure}(Object(Illuminate\\Notifications\\DatabaseNotification))\n#10 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany.php(370): tap(Object(Illuminate\\Notifications\\DatabaseNotification), Object(Closure))\n#11 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\DatabaseChannel.php(19): Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany->create(Array)\n#12 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(163): Illuminate\\Notifications\\Channels\\DatabaseChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\DatabaseNotification))\n#13 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(118): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'f9727d15-9c9f-4...\', Object(Filament\\Notifications\\DatabaseNotification), \'database\')\n#14 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#15 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(113): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#16 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(57): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\DatabaseNotification), Array)\n#17 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\DatabaseNotification), Array)\n#18 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#19 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#21 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#22 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#23 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#24 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#25 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#26 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#28 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#29 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#32 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#33 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#35 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#38 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#41 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#42 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#43 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#44 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#52 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'lms_smk8_medan.notifications\' doesn\'t exist (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: lms_smk8_medan, SQL: insert into `notifications` (`id`, `type`, `data`, `read_at`, `notifiable_id`, `notifiable_type`, `updated_at`, `created_at`) values (c4d6e2be-136f-4ba6-a548-3a832fca22fc, Filament\\Notifications\\DatabaseNotification, {\"actions\":[{\"name\":\"downloadFailedRowsCsv\",\"color\":\"danger\",\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download information about the failed rows\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"shouldPostToUrl\":false,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/imports\\/1\\/failed-rows\\/download?authGuard=web&signature=6267a79acaeb2b0d94a3c3409ee831f03d5a4a8ed162d825216384228246dbd7\",\"view\":\"filament::components.link\"}],\"body\":\"Your student import has completed and 0 rows imported. 10 rows failed to import.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-x-circle\",\"iconColor\":\"danger\",\"status\":\"danger\",\"title\":\"Import completed\",\"view\":null,\"viewData\":[],\"format\":\"filament\"}, ?, 26, App\\Models\\User, 2026-01-30 03:40:24, 2026-01-30 03:40:24)) in D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `no...\', Array, Object(Closure))\n#1 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `no...\', Array, Object(Closure))\n#2 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4002): Illuminate\\Database\\MySqlConnection->insert(\'insert into `no...\', Array)\n#3 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insert(Array)\n#4 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1412): Illuminate\\Database\\Eloquent\\Builder->__call(\'insert\', Array)\n#5 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#6 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany.php(373): Illuminate\\Database\\Eloquent\\Model->save()\n#7 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(390): Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany->Illuminate\\Database\\Eloquent\\Relations\\{closure}(Object(Illuminate\\Notifications\\DatabaseNotification))\n#8 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany.php(370): tap(Object(Illuminate\\Notifications\\DatabaseNotification), Object(Closure))\n#9 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\DatabaseChannel.php(19): Illuminate\\Database\\Eloquent\\Relations\\HasOneOrMany->create(Array)\n#10 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(163): Illuminate\\Notifications\\Channels\\DatabaseChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\DatabaseNotification))\n#11 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(118): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'f9727d15-9c9f-4...\', Object(Filament\\Notifications\\DatabaseNotification), \'database\')\n#12 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(113): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(57): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\DatabaseNotification), Array)\n#15 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\DatabaseNotification), Array)\n#16 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#22 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2026-01-29 20:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `haris`
--

CREATE TABLE `haris` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_hari` varchar(20) NOT NULL,
  `urutan` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `haris`
--

INSERT INTO `haris` (`id`, `nama_hari`, `urutan`, `created_at`, `updated_at`) VALUES
(1, 'Senin', 1, NULL, NULL),
(2, 'Selasa', 2, NULL, NULL),
(3, 'Rabu', 3, NULL, NULL),
(4, 'Kamis', 4, NULL, NULL),
(5, 'Jumat', 5, NULL, NULL),
(6, 'Sabtu', 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `completed_at`, `file_name`, `file_path`, `importer`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2026-01-29 20:40:24', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/Uszq6M6iAY47h7hpgxLdreavwToNr3-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 20:36:27', '2026-01-29 20:40:24'),
(2, NULL, 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/eCrPBz8PUZgFLx3hnUDkn3CddLxlsN-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 0, 10, 0, 26, '2026-01-29 20:41:46', '2026-01-29 20:41:46'),
(3, '2026-01-29 20:48:29', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/g6B3LCBu2LmiW6hkMorLBiNcJBwwJ7-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 20:48:28', '2026-01-29 20:48:29'),
(4, '2026-01-29 20:51:28', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/o4OzEqVfPsvGy6HW2hATG5VQro0Bqu-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 20:51:27', '2026-01-29 20:51:28'),
(5, '2026-01-29 20:53:45', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/GJYXRmVOz4J6ffgcLEfMAqyJq5Dd2V-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 20:53:44', '2026-01-29 20:53:45'),
(6, '2026-01-29 21:10:13', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/e8vRi1wm6QtJrvBVKgfaCAGZmtp53z-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:10:13', '2026-01-29 21:10:13'),
(7, '2026-01-29 21:18:47', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/u7iQP7AnAO1Hj7NeQ3D1BT0aTQt0xm-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:18:47', '2026-01-29 21:18:47'),
(8, '2026-01-29 21:23:16', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/myuM6K842wF2xkH8ocHdWZKteKeT0v-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:23:16', '2026-01-29 21:23:16'),
(9, '2026-01-29 21:25:00', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/YGeSari96WB4YHVNWU02lnW14xoezl-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:25:00', '2026-01-29 21:25:00'),
(10, '2026-01-29 21:29:16', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/nNdcPUNIw22BZHOrgcBhoLcxPUje1U-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:29:16', '2026-01-29 21:29:16'),
(11, '2026-01-29 21:36:28', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/6F43Az6QmTTc3IGrbCae1TOLCu1xYn-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:36:28', '2026-01-29 21:36:28'),
(12, '2026-01-29 21:42:17', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/7s2o4Ju5p6R5Ed1qpMzugrWpQOwDas-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 21:42:17', '2026-01-29 21:42:17'),
(13, '2026-01-29 22:14:24', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/0Wy4eiz0pDxGUpuxPzXRVu08h20Pmt-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 22:14:23', '2026-01-29 22:14:24'),
(14, '2026-01-29 22:20:56', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/VoJexOKacsW6HrKUMYy6yUpPGATt1T-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 22:20:56', '2026-01-29 22:20:56'),
(15, '2026-01-29 22:24:02', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/7soh8mca7QgPH7UhZjTlXhYMdpw4VF-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 22:24:02', '2026-01-29 22:24:02'),
(16, '2026-01-29 22:27:39', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/PGhS4ueY1v77bakOvcCrtiJerctRBN-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:27:39', '2026-01-29 22:27:39'),
(17, '2026-01-29 22:31:58', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/igCL4uGOIGG7zSTbGsPVAEaJ1X0WHo-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:31:58', '2026-01-29 22:31:58'),
(18, '2026-01-29 22:46:17', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/Ze4p7XQ4bdWzmk5MrzXRmDOH1icLXD-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:46:17', '2026-01-29 22:46:17'),
(19, '2026-01-29 22:48:53', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/ZxkKCbh0GKAWeumZAnCJt0MPHT2h5r-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:48:53', '2026-01-29 22:48:53'),
(20, '2026-01-29 22:50:54', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/dZyteUSi4Q6rITHOhkUSXTPAsTsGa6-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:50:54', '2026-01-29 22:50:54'),
(21, '2026-01-29 22:52:04', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/Z8N4qMjcWHXJ6O74kuXxwRrOpghxKE-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:52:04', '2026-01-29 22:52:04'),
(22, '2026-01-29 22:55:54', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/9IsHN22fnTMElRWLuIwsTRflgQ2KKg-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 22:55:54', '2026-01-29 22:55:54'),
(23, '2026-01-29 23:02:36', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/Z89EwEZ5LtDerhrc7R2KnP5TLKlmjA-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 23:02:36', '2026-01-29 23:02:36'),
(24, '2026-01-29 23:03:52', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/k1X5RnLQJUDerMJbtfQco36Awerx9G-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:03:52', '2026-01-29 23:03:52'),
(25, '2026-01-29 23:07:32', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/AS2wuhy2fzSO9Pi15e82qDFnaULKjg-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:07:32', '2026-01-29 23:07:32'),
(26, '2026-01-29 23:09:19', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/0cFAtV1ADPbRRhpVsuOSw8a3Wst1HC-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:09:19', '2026-01-29 23:09:19'),
(27, '2026-01-29 23:11:44', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/0WGJGu6c5CNiwpJJReBtpjmkuotzUU-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:11:44', '2026-01-29 23:11:44'),
(28, '2026-01-29 23:20:02', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/9Dysv5zchIvGujmKo6bgoGCe8aDLqh-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:20:02', '2026-01-29 23:20:02'),
(29, '2026-01-29 23:23:33', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/4LLHarD6cRhjVXpSAZg84VDPQBxjli-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:23:33', '2026-01-29 23:23:33'),
(30, '2026-01-29 23:50:13', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/SYoe8CPQMzCKCMOzGrzS958jFTrYwi-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-29 23:50:13', '2026-01-29 23:50:13'),
(31, '2026-01-29 23:54:28', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/UukPA1tjxEXmIuXnkJGroeIpujBXsp-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:54:28', '2026-01-29 23:54:28'),
(32, '2026-01-29 23:58:51', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/gqlqugxAGjJHxKOI1Fhd1u8Dfe5wj9-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-29 23:58:51', '2026-01-29 23:58:51'),
(33, '2026-01-30 00:06:38', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/2nx7nLF6V33jm6E4VZpgEoT1R1NzKu-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 00:06:38', '2026-01-30 00:06:38'),
(34, '2026-01-30 00:15:53', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/wS9Rdntt2K5Td7bgIZVeB9cCzoaeuZ-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 00:15:53', '2026-01-30 00:15:53'),
(35, '2026-01-30 00:25:07', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/04rmD6ikdn0YLFw1ftsaHuv1OZXxk1-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 00:25:07', '2026-01-30 00:25:07'),
(36, '2026-01-30 00:45:52', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/aqmqiOTbYug79I4Pnjs6ydO1aYTck7-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 00:45:52', '2026-01-30 00:45:52'),
(37, '2026-01-30 00:46:49', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/0ytvexld5dw8MwpJsSVk1A8tm0B72D-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 00:46:49', '2026-01-30 00:46:49'),
(38, '2026-01-30 00:52:21', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/ucHnLY878rZqWnOZEh2jTl3EyFrVve-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 0, 26, '2026-01-30 00:52:21', '2026-01-30 00:52:21'),
(39, '2026-01-30 00:57:51', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/0zuhhuCQVpmLgSK3lsDUc3lo5lhcHP-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 00:57:47', '2026-01-30 00:57:51'),
(40, '2026-01-30 01:02:31', 'students_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/b5lfuTzvuEMCnZi2TWJpSJ3wN2lNCm-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 26, '2026-01-30 01:02:26', '2026-01-30 01:02:31'),
(41, '2026-02-01 20:58:58', 'teacher_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/fzlQPuPVwuIohbwyU2je5EvNCGMwfP-metadGVhY2hlcl9pbXBvcnRfMTAuY3N2-.csv', 'App\\Filament\\Imports\\GuruImporter', 10, 10, 0, 8, '2026-02-01 20:58:54', '2026-02-01 20:58:58'),
(42, '2026-02-01 21:01:04', 'teacher_import_10.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/8NkzeAHDO5uBIo2byw6nIRMGKheFXC-metadGVhY2hlcl9pbXBvcnRfMTAuY3N2-.csv', 'App\\Filament\\Imports\\GuruImporter', 10, 10, 10, 8, '2026-02-01 21:00:59', '2026-02-01 21:01:04'),
(43, '2026-02-04 21:21:36', 'students_import_random_name.csv', 'D:\\reyhan\\Magang\\Website LMS\\lms_smkn8medan\\storage\\app/private\\livewire-tmp/wArLdiGswEFoZQxv9TBmt4lXzRzSCL-metac3R1ZGVudHNfaW1wb3J0X3JhbmRvbV9uYW1lLmNzdg==-.csv', 'App\\Filament\\Imports\\StudentImporter', 10, 10, 10, 8, '2026-02-04 21:21:32', '2026-02-04 21:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(4, 'default', '{\"uuid\":\"b740ce19-4145-41c5-a444-73ea068e11d1\",\"displayName\":\"Filament\\\\Actions\\\\Imports\\\\Jobs\\\\ImportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":5,\"failOnTimeout\":false,\"backoff\":\"60,120,300,600\",\"timeout\":null,\"retryUntil\":1769830907,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Imports\\\\Jobs\\\\ImportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Imports\\\\Jobs\\\\ImportCsv\\\":6:{s:11:\\\"\\u0000*\\u0000importer\\\";O:36:\\\"App\\\\Filament\\\\Imports\\\\StudentImporter\\\":3:{s:9:\\\"\\u0000*\\u0000import\\\";O:38:\\\"Filament\\\\Actions\\\\Imports\\\\Models\\\\Import\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";N;s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:1;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:8:{s:7:\\\"user_id\\\";i:26;s:9:\\\"file_name\\\";s:22:\\\"students_import_10.csv\\\";s:9:\\\"file_path\\\";s:149:\\\"D:\\\\reyhan\\\\Magang\\\\Website LMS\\\\lms_smkn8medan\\\\storage\\\\app\\/private\\\\livewire-tmp\\/eCrPBz8PUZgFLx3hnUDkn3CddLxlsN-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv\\\";s:8:\\\"importer\\\";s:36:\\\"App\\\\Filament\\\\Imports\\\\StudentImporter\\\";s:10:\\\"total_rows\\\";i:10;s:10:\\\"updated_at\\\";s:19:\\\"2026-01-30 03:41:46\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-01-30 03:41:46\\\";s:2:\\\"id\\\";i:2;}s:11:\\\"\\u0000*\\u0000original\\\";a:8:{s:7:\\\"user_id\\\";i:26;s:9:\\\"file_name\\\";s:22:\\\"students_import_10.csv\\\";s:9:\\\"file_path\\\";s:149:\\\"D:\\\\reyhan\\\\Magang\\\\Website LMS\\\\lms_smkn8medan\\\\storage\\\\app\\/private\\\\livewire-tmp\\/eCrPBz8PUZgFLx3hnUDkn3CddLxlsN-metac3R1ZGVudHNfaW1wb3J0XzEwLmNzdg==-.csv\\\";s:8:\\\"importer\\\";s:36:\\\"App\\\\Filament\\\\Imports\\\\StudentImporter\\\";s:10:\\\"total_rows\\\";i:10;s:10:\\\"updated_at\\\";s:19:\\\"2026-01-30 03:41:46\\\";s:10:\\\"created_at\\\";s:19:\\\"2026-01-30 03:41:46\\\";s:2:\\\"id\\\";i:2;}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:5:{s:4:\\\"name\\\";s:4:\\\"name\\\";s:4:\\\"nisn\\\";s:4:\\\"nisn\\\";s:13:\\\"department_id\\\";s:13:\\\"department_id\\\";s:14:\\\"class_level_id\\\";s:14:\\\"class_level_id\\\";s:10:\\\"tingkat_id\\\";s:10:\\\"tingkat_id\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000import\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Imports\\\\Models\\\\Import\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:7:\\\"\\u0000*\\u0000rows\\\";s:1972:\\\"YToxMDp7aTowO2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDEiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwMSI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIyIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIyIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjExIjt9aToxO2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDIiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwMiI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIxIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIzIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjEyIjt9aToyO2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDMiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwMyI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIyIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIxIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjEwIjt9aTozO2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDQiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwNCI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIxIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIyIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjExIjt9aTo0O2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDUiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwNSI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIyIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIzIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjEyIjt9aTo1O2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDYiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwNiI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIxIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIxIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjEwIjt9aTo2O2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDciO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwNyI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIyIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIyIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjExIjt9aTo3O2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDgiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwOCI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIxIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIzIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjEyIjt9aTo4O2E6NTp7czo0OiJuYW1lIjtzOjc6IlNpc3dhIDkiO3M6NDoibmlzbiI7czo4OiIyMDI0MDAwOSI7czoxMzoiZGVwYXJ0bWVudF9pZCI7czoxOiIyIjtzOjE0OiJjbGFzc19sZXZlbF9pZCI7czoxOiIxIjtzOjEwOiJ0aW5na2F0X2lkIjtzOjI6IjEwIjt9aTo5O2E6NTp7czo0OiJuYW1lIjtzOjg6IlNpc3dhIDEwIjtzOjQ6Im5pc24iO3M6ODoiMjAyNDAwMTAiO3M6MTM6ImRlcGFydG1lbnRfaWQiO3M6MToiMSI7czoxNDoiY2xhc3NfbGV2ZWxfaWQiO3M6MToiMiI7czoxMDoidGluZ2thdF9pZCI7czoyOiIxMSI7fX0=\\\";s:12:\\\"\\u0000*\\u0000columnMap\\\";a:5:{s:4:\\\"name\\\";s:4:\\\"name\\\";s:4:\\\"nisn\\\";s:4:\\\"nisn\\\";s:13:\\\"department_id\\\";s:13:\\\"department_id\\\";s:14:\\\"class_level_id\\\";s:14:\\\"class_level_id\\\";s:10:\\\"tingkat_id\\\";s:10:\\\"tingkat_id\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"a0f51344-c7b8-4162-b03f-39fa93db80dc\\\";}\"},\"createdAt\":1769744507,\"delay\":null}', 0, NULL, 1769744507, 1769744507);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a0f5115c-a566-4998-8b37-f0ae6f7608a0', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"/ycSsjhIDqwqO1XaQcTlZEloIgVWVlIYJOOiuHPCjwY=\";}}}}', NULL, 1769744187, 1769744424),
('a0f51344-c7b8-4162-b03f-39fa93db80dc', '', 1, 1, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"QbB8svwgk9NPlspOMbcZWkszaTDSjRTFkxIX7yhHZq0=\";}}}}', NULL, 1769744507, NULL),
('a0f515aa-31c1-455f-8ae0-6acaadc181e6', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"59l0JeIzySh3nLMcWXbR1jMI0GDNYQ19IhcaYP+pw9s=\";}}}}', NULL, 1769744909, 1769744909),
('a0f516ba-f4a4-4cd4-a6af-2ea900cc9fd2', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:4;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"1JY2Dxcs/Pn91RPzBD+VnxNdOV4VIQHklTrfgsT1Mf8=\";}}}}', NULL, 1769745087, 1769745088),
('a0f5178c-4533-455e-b85a-5fb5cbaad567', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:5;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"QKKhW3P/g+8rUKzprL9KUANqd8LnN/o6qvjFqNck7JE=\";}}}}', NULL, 1769745225, 1769745225),
('a0f51d70-ac46-4c97-840b-c0042361b0d5', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:6;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"uE5Jq4LQtEfXzMA6kTmCLHdeFZBsnAqCHzxrKiv0g58=\";}}}}', NULL, 1769746213, 1769746213),
('a0f52080-6b3e-4ed1-90ea-a35ba4a45f82', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:7;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"7Eccnu9ucHSjUGP5s6vYh2cMyhBQg05fUcT2vmMAClQ=\";}}}}', NULL, 1769746727, 1769746727),
('a0f5221b-2fdf-49a7-b502-d39cf814f35d', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:8;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"FO24+CkX/doChBresJ2IMfaMMRTsey8KZ/y242deyq8=\";}}}}', NULL, 1769746996, 1769746996),
('a0f522b9-b5f8-4860-89b7-d6a16be9d292', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3727:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:9;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"JHSHo2v0kMxyfz2HCqGOLJZsyyy7vXhqXPMi8f93DI4=\";}}}}', NULL, 1769747100, 1769747100),
('a0f52440-414b-41cd-bd7d-eab8ca06e5da', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:10;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"HTvdzicAsM2wP3cr9qDc3V2KAsfu10DZsT++ZTBr3Zc=\";}}}}', NULL, 1769747356, 1769747356),
('a0f526d4-3958-4d3d-a602-d76b7a110d57', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:11;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce20000000000000000\";}\";s:4:\"hash\";s:44:\"f+f0ELMZkxqq9RkR9R4Q4gq3B+LlkWw0My9MF7BXUC4=\";}}}}', NULL, 1769747788, 1769747788);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a0f528e8-721a-4e56-b2b2-b70af940a7fe', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:12;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"N2foZ8L6gybznaVLSkH06Gq3oqodspcMrR72Is5VgOE=\";}}}}', NULL, 1769748137, 1769748137),
('a0f53463-a630-4719-aa72-80ca6b872040', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:13;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"R7CGgeuezg9jN+pNQE4maZI2qt03XDaG+T1mkn4XeI8=\";}}}}', NULL, 1769750063, 1769750063),
('a0f536ba-eb13-4b9b-9bdb-dd63604d2cc1', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:14;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"vRQxKoDAC3R0YxZ/G3jRmX2qF6aclFkNCHu4DNwQIoQ=\";}}}}', NULL, 1769750456, 1769750456),
('a0f537d6-c8a8-4df2-b147-bd9763ed5d10', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:15;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"MhKFRasEdzffIch6XRqOmsCUhJXqYoxUfB6lELmthfQ=\";}}}}', NULL, 1769750642, 1769750642),
('a0f53921-8dba-4036-9ff0-741d435d9c23', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:16;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"Ya99QSRjZPl/Q+IJmZvIMhmEa9btLGVIgUKk4d4uCXk=\";}}}}', NULL, 1769750859, 1769750859),
('a0f53aad-12e8-4e2d-9726-6fe74b7d3c5a', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:17;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"XuocPQsxTx8KMEMyTpUPpA76IsE1U0QcMxKKi1GAmr8=\";}}}}', NULL, 1769751118, 1769751118),
('a0f53fcb-600b-43c0-8cad-0627e8499f0a', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:18;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"1xcmCltF5T4B2iLUqGp/dCDUFosWGnK11kArme9MLf0=\";}}}}', NULL, 1769751977, 1769751977),
('a0f540b9-a0d8-49dc-ae0f-333d1989b06f', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3729:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:11:\"tingkat_ids\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:19;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d050000000000000000\";}\";s:4:\"hash\";s:44:\"WOw1c3CVlAUEIRI7m/vyKCMLesUKkJVs5ax14VpuxZI=\";}}}}', NULL, 1769752133, 1769752133),
('a0f54172-bc23-41fa-b8cd-c6f6f1071bb3', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:20;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"Z++Et/WmqHaeHsnFa3R0NSkZLnjSAQxIY1ZFfHNmQlE=\";}}}}', NULL, 1769752254, 1769752254),
('a0f541dd-a800-425b-97f3-d3ebb3382f93', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:21;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"W2PHuX3r0zUn+zBt3VUfuWyFER8mgwx78J/BGwgSUo0=\";}}}}', NULL, 1769752324, 1769752324),
('a0f5433b-cc1b-46b0-8091-cfaffefcc322', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:22;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"CP0HZ5UsePcj6I1YsIWH7/+Nx7aoieIXCtSnLZgRjc0=\";}}}}', NULL, 1769752554, 1769752554);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a0f545a1-6c8d-4e1f-b153-b95af2607ff6', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:23;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"l0vv03KW4QrAJP5qjFWxmX51rHR+a8goS3tIYWvzAs8=\";}}}}', NULL, 1769752956, 1769752956),
('a0f54615-7f7b-4d3f-b513-b7d41124d8e0', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:24;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"xggYjG5qRA7tr7byaeB3bmGW+1MO+JHeWqqURisXfFU=\";}}}}', NULL, 1769753032, 1769753032),
('a0f54764-ba2a-4775-a14d-39360ce6b04c', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:25;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"y7LH4tAGp1UMdkEo2DUMVPmmAMedYYCG0BvgW9IcCBo=\";}}}}', NULL, 1769753252, 1769753252),
('a0f54808-6355-4605-bf72-8409395fad33', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:26;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"xhDn4LjO2MJDfLg5+KDpEWWlVa7048fEk6VOLDDgM9Y=\";}}}}', NULL, 1769753359, 1769753359),
('a0f548e5-37d9-4bbf-9d27-a0e4db4046aa', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:27;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"a2uNV/u2XV0XF2snXM1VTDDEycsNrTkRfk0nct+e/Xc=\";}}}}', NULL, 1769753504, 1769753504),
('a0f54bdd-3042-4943-8ff3-c63635e397eb', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3718:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:10:\"department\";s:13:\"department_id\";s:11:\"class_level\";s:14:\"class_level_id\";s:7:\"tingkat\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:28;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d4d0000000000000000\";}\";s:4:\"hash\";s:44:\"h7Y+TVeJCPIpZVT4JpuFp95AHdeMJcVT6zO5KSUPc/E=\";}}}}', NULL, 1769754002, 1769754002),
('a0f54d1f-6547-4dca-9b8d-2112ea75caab', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:29;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"+UetuAZHCZ9ucm9xg/rBaQH7s6ghMAo2cIGCqzwK5j8=\";}}}}', NULL, 1769754213, 1769754213),
('a0f556a8-ae91-447b-92f8-d8aa51a9353b', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:30;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"g7w4shvWJkMNBJpZC1KtgMp2fpKldptui1bNyy9uPv4=\";}}}}', NULL, 1769755813, 1769755813),
('a0f5582d-9e73-4209-81c2-66b4640005e8', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:31;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"2+yJXmh90WN0/0L7C/KmED2O+E4S9d8iidfAcCh21vw=\";}}}}', NULL, 1769756068, 1769756068),
('a0f559bf-28eb-4043-a410-d94368822246', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:32;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"UFmgDa5GXO1q6Lt314GAagjJwRzAyMeaigPDkdznnzA=\";}}}}', NULL, 1769756331, 1769756331),
('a0f55c88-6039-4e0c-8117-253708e6bf26', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:33;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"htKn1/uHdQBECGTleBnZaeJjQnuCp/dIBN/8v1ardOk=\";}}}}', NULL, 1769756798, 1769756798);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a0f55fd6-6ff9-49e7-beb5-e254ef8332ed', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:34;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"pIgG93g9/OFjEwFFSQ7gNKx3op7lH6tlPkVhvH56oAA=\";}}}}', NULL, 1769757353, 1769757353),
('a0f56324-2acd-4342-90a0-79dcd9a6f89e', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:35;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"LIIYHPcRqGksJJm1b9RYFYypzdP57a5vKZQRMqMDfgA=\";}}}}', NULL, 1769757907, 1769757907),
('a0f56a8f-4f3c-4352-bf1d-84b307839af0', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:36;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"jm30q9kz2qDEou9DNs6TOMwFgeH2KVTnVcKT8OI8bnM=\";}}}}', NULL, 1769759152, 1769759152),
('a0f56ae7-8e85-4dc7-be48-5b111fd75f46', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:37;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"PLYwQc3BYU/WJZ/J+tVKrqRh7SSEzh8oBg12JF597ew=\";}}}}', NULL, 1769759209, 1769759209),
('a0f56ce1-6e48-4617-8599-6f2bd581767d', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:38;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"bIf2T7cKmWlRVNBKAcXiCkNOwDQ6abbyHwHuqXuHs3s=\";}}}}', NULL, 1769759541, 1769759541),
('a0f56ed3-6f93-46bc-8254-25f0f54f57d9', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:39;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"lQhW+iFd7Wh4KbH+aYXIUQz7SI6xmZAj1vVGbONHLTA=\";}}}}', NULL, 1769759867, 1769759871),
('a0f5707d-5445-4c94-997b-98ddf67b5c34', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3728:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:5:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:40;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000ce10000000000000000\";}\";s:4:\"hash\";s:44:\"+PdQZtPaSFXLmneU66LbULuurHZPybGoabYgS13JM1M=\";}}}}', NULL, 1769760146, 1769760151),
('a0fb2258-2119-4058-be11-838e7446dda3', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3646:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:3:{s:4:\"name\";s:4:\"name\";s:3:\"nip\";s:3:\"nip\";s:13:\"department_id\";s:13:\"department_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:41;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c680000000000000000\";}\";s:4:\"hash\";s:44:\"el62X17nzKCjbSaqqoKB7+ZICL6vsKzWWOKdfwPtwIk=\";}}}}', NULL, 1770004734, 1770004738),
('a0fb2317-c5e0-4890-8882-f4f6497bece0', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3646:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:3:{s:4:\"name\";s:4:\"name\";s:3:\"nip\";s:3:\"nip\";s:13:\"department_id\";s:13:\"department_id\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:42;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000c680000000000000000\";}\";s:4:\"hash\";s:44:\"5pezYAoPxzb4PP1LSuRhmXtyHKHs74MaJz34As4OETQ=\";}}}}', NULL, 1770004859, 1770004864),
('a1013364-4fc3-4fec-8e05-640113529e2b', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:3752:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:5:{s:9:\"authGuard\";s:3:\"web\";s:9:\"columnMap\";a:6:{s:4:\"name\";s:4:\"name\";s:4:\"nisn\";s:4:\"nisn\";s:13:\"department_id\";s:13:\"department_id\";s:14:\"class_level_id\";s:14:\"class_level_id\";s:10:\"tingkat_id\";s:10:\"tingkat_id\";s:5:\"photo\";s:5:\"photo\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:43;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:3040:\"function () use ($authGuard, $columnMap, $import, $jobConnection, $options): void {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) { /** @phpstan-ignore instanceof.alwaysTrue */\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(\\Illuminate\\Support\\Facades\\URL::signedRoute(\'filament.imports.failed-rows.download\', [\'authGuard\' => $authGuard, \'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d5c0000000000000000\";}\";s:4:\"hash\";s:44:\"3ePY6Gknut0HYWce+dKUBR1fAT3aypRXMcdWzuL8E+Q=\";}}}}', NULL, 1770265292, 1770265296);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `module_student_class_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED DEFAULT NULL,
  `position` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `content_url` text COLLATE utf8mb4_unicode_ci,
  `duration` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_user`
--

CREATE TABLE `lesson_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_user_durations`
--

CREATE TABLE `lesson_user_durations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `seconds` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_06_033101_create_modules_table', 1),
(5, '2026_01_06_042611_add_department_id_to_users_table', 1),
(6, '2026_01_06_045314_create_lessons_table', 1),
(7, '2026_01_06_045416_create_lesson_user_table', 1),
(8, '2026_01_06_080133_create_sections_table', 1),
(9, '2026_01_06_082705_add_section_id_to_lessons_table', 1),
(10, '2026_01_06_084712_add_position_to_lessons', 1),
(11, '2026_01_07_071906_create_quizzes_table', 1),
(12, '2026_01_07_072002_create_quiz_questions_table', 1),
(13, '2026_01_07_072028_create_quiz_user_table', 1),
(14, '2026_01_07_073733_add_correct_option_to_quiz_questions', 1),
(15, '2026_01_07_081426_add_lesson_id_to_quizzes', 1),
(16, '2026_01_09_064215_add_profile_to_users_table', 1),
(17, '2026_01_09_080938_add_jurusan_to_users_table', 1),
(18, '2026_01_09_081059_add_jurusan_to_modules_table', 1),
(19, '2026_01_09_085331_add_content_fields_to_lessons', 1),
(20, '2026_01_12_035254_update_content_type_enum_on_lessons', 1),
(21, '2026_01_12_083156_create_lesson_user_durations_table', 1),
(22, '2026_01_12_083157_create_tasks_table', 1),
(23, '2026_01_12_090123_create_task_submissions_table', 1),
(24, '2026_01_13_033647_add_module_id_to_tasks_table', 1),
(25, '2026_01_14_035550_add_submitted_at_to_task_submissions_table', 1),
(26, '2026_01_14_080706_add_duration_to_quizzes_table', 1),
(27, '2026_01_14_085100_create_departments_table', 1),
(28, '2026_01_17_035254_add_foreign_keys_to_departments_relations', 1),
(29, '2026_01_19_031055_add_class_level_to_users_table', 2),
(30, '2026_01_19_041215_add_image_to_departments_table', 3),
(31, '2026_01_19_041247_add_thumbnail_to_modules_table', 4),
(32, '2026_01_30_033333_create_imports_table', 5),
(33, '2026_01_30_033334_create_exports_table', 6),
(34, '2026_01_30_033335_create_failed_import_rows_table', 7),
(35, '2026_02_03_040131_add_deleted_at_to_departments_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `title`, `jurusan`, `description`, `thumbnail`, `department_id`, `is_active`, `created_at`, `updated_at`) VALUES
(9, 'dasar busana 1', NULL, 'pendidikan dasar busana', 'thumbnails/01KFRECA17NSA3F4NFE9TZCQD5.jpg', 4, 0, '2026-01-24 09:46:14', '2026-01-24 09:46:14'),
(10, 'teori dan praktik memasak (Indonesia, Kontinental, Asia)', NULL, 'test', 'thumbnails/01KFRFN4JW68XMCCGA2KPDCCSN.jpg', 3, 0, '2026-01-24 10:08:31', '2026-01-24 10:08:31'),
(11, 'Pastry & Bakery, Tata Hidang (servis)', NULL, 'test', 'thumbnails/01KFRFP2TTJQ1KB4CY9DHT4GS8.jpg', 3, 0, '2026-01-24 10:09:02', '2026-01-24 10:09:02'),
(12, 'Ilmu Gizi, Sanitasi & Higiene', NULL, 'test', 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770189389/lms_smkn8medan/ygyokhnvlrm1jzwc1nf1.jpg', 3, 0, '2026-01-24 10:09:52', '2026-02-04 00:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `modules_student_class`
--

CREATE TABLE `modules_student_class` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `student_class_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules_student_class`
--

INSERT INTO `modules_student_class` (`id`, `module_id`, `teacher_id`, `student_class_id`, `created_at`, `updated_at`) VALUES
(16, 12, 2, 2, NULL, NULL),
(22, 11, 2, 2, NULL, NULL),
(27, 10, 2, 2, NULL, NULL),
(32, 9, NULL, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules_teacher`
--

CREATE TABLE `modules_teacher` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules_teacher`
--

INSERT INTO `modules_teacher` (`id`, `module_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(13, 10, 2, NULL, NULL),
(14, 11, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules_tingkat`
--

CREATE TABLE `modules_tingkat` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `tingkat_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `modules_tingkat`
--

INSERT INTO `modules_tingkat` (`id`, `module_id`, `tingkat_id`, `created_at`, `updated_at`) VALUES
(5, 10, 1, NULL, NULL),
(6, 11, 2, NULL, NULL),
(7, 12, 3, NULL, NULL),
(12, 9, 1, NULL, NULL),
(14, 9, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_student_class_schedules`
--

CREATE TABLE `module_student_class_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `module_student_class_id` bigint UNSIGNED NOT NULL,
  `hari_id` bigint UNSIGNED NOT NULL,
  `rentang_jam_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `module_student_class_schedules`
--

INSERT INTO `module_student_class_schedules` (`id`, `module_student_class_id`, `hari_id`, `rentang_jam_id`, `created_at`, `updated_at`) VALUES
(11, 22, 1, 2, '2026-02-04 03:36:16', '2026-02-04 03:36:16'),
(12, 22, 2, 4, '2026-02-04 03:36:16', '2026-02-04 03:36:16'),
(17, 27, 1, 6, '2026-02-04 07:29:34', '2026-02-04 07:29:34'),
(18, 27, 3, 8, '2026-02-04 07:29:34', '2026-02-04 07:29:34'),
(22, 16, 1, 7, '2026-02-04 23:37:21', '2026-02-04 23:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `section_id` bigint UNSIGNED DEFAULT NULL,
  `lesson_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `passing_score` int NOT NULL DEFAULT '70',
  `duration` int DEFAULT NULL COMMENT 'Durasi quiz dalam menit',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_a` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_b` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_c` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_d` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_option` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_user`
--

CREATE TABLE `quiz_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `score` int DEFAULT NULL,
  `is_passed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentang_jams`
--

CREATE TABLE `rentang_jams` (
  `id` bigint UNSIGNED NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rentang_jams`
--

INSERT INTO `rentang_jams` (`id`, `jam_mulai`, `jam_selesai`, `created_at`, `updated_at`) VALUES
(1, '07:00:00', '07:45:00', NULL, NULL),
(2, '07:45:00', '08:30:00', NULL, NULL),
(3, '08:30:00', '09:15:00', NULL, NULL),
(4, '09:30:00', '10:15:00', NULL, NULL),
(5, '10:15:00', '11:00:00', NULL, NULL),
(6, '11:00:00', '11:45:00', NULL, NULL),
(7, '13:00:00', '13:45:00', NULL, NULL),
(8, '13:45:00', '14:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `module_student_class_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('TmXKNGVGnHfNLKg43PeUA3P5FSLmKhgQ1m85v3vU', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidXdOd0VjcWFuT0dxbjg2Z0VuY1U5MUYzTjEwMnFhS09jSW45TVl6eCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9tb2R1bGVzLzkvZGV0YWlsIjtzOjU6InJvdXRlIjtzOjQ4OiJmaWxhbWVudC5hZG1pbi5wYWdlcy5tb2R1bGVzLntkZXBhcnRtZW50fS5kZXRhaWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiNDMwMzdlMDdiNGJhMTUyNzc3NGRkYjY1MDNlNGIyOWUwMmQzN2UwM2Q2NjkxYjcxZTBkNmU0MWM3ZDllOTViNCI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1772041723);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat_id` bigint UNSIGNED DEFAULT NULL,
  `nisn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_level_id` bigint UNSIGNED DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `name`, `tingkat_id`, `nisn`, `class_level_id`, `department_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 7, 'Muhammad Fadlil Habill', 2, '2205181033', 4, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988056/lms_smkn8medan/l35oe6q5sqgyzuvkwe9q.jpg', '2026-01-20 22:47:30', '2026-02-24 19:54:16'),
(2, 8, 'Suryani Siahaan', 2, '1232142321', 5, 2, 'students/01KG1C9X40D10S6G6PB826BXDE.jpeg', '2026-01-20 22:47:30', '2026-02-24 19:52:50'),
(8, 22, 'haryanto ginting', 2, '2205671822', 4, 2, 'students/01KFR9BZN0EJ9APNCGJN1FEQNX.jpeg', '2026-01-24 08:18:41', '2026-02-24 19:53:30'),
(9, 24, 'reyhan yonathan batubara', 2, '2205181022', 2, 3, 'students/01KG19RTGCA2WT2K7DSH2CBK02.jpeg', '2026-01-27 20:18:51', '2026-02-24 19:53:44'),
(10, 25, 'jon evansius situmorang', 2, '2205181032', NULL, NULL, 'students/01KG1A0PH81EJJW0N9BDFRK60X.jpeg', '2026-01-27 20:23:09', '2026-02-02 20:40:33'),
(11, 27, 'wisnu sunandar', 2, '22051801070', 6, 4, 'students/01KG6DKJ6W5RSTKN3KCV7WGZ6V.jpeg', '2026-01-29 20:02:06', '2026-02-02 21:10:04'),
(42, 39, 'Siswa 1', 2, '20240001', 6, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770091773/lms_smkn8medan/gcqspbpwsfdye4owit2w.jpg', '2026-01-30 01:02:27', '2026-02-02 21:09:33'),
(43, 40, 'Siswa 2', 2, '20240002', 4, NULL, NULL, '2026-01-30 01:02:27', '2026-02-03 22:55:31'),
(44, 41, 'Siswa 3', 2, '20240003', NULL, 2, NULL, '2026-01-30 01:02:28', '2026-02-01 21:52:48'),
(45, 42, 'Siswa 4', 2, '20240004', NULL, 4, NULL, '2026-01-30 01:02:28', '2026-02-01 21:54:24'),
(46, 43, 'Siswa 5', 2, '20240005', 4, 2, NULL, '2026-01-30 01:02:29', '2026-01-30 01:02:29'),
(47, 44, 'Siswa 6', 2, '20240006', NULL, 2, NULL, '2026-01-30 01:02:29', '2026-02-01 21:52:48'),
(48, 45, 'Siswa 7', 2, '20240007', NULL, 2, NULL, '2026-01-30 01:02:29', '2026-02-01 21:54:24'),
(49, 46, 'Siswa 8', 1, '20240008', 4, 2, NULL, '2026-01-30 01:02:30', '2026-01-30 01:02:30'),
(50, 47, 'Siswa 9', 2, '20240009', NULL, 2, NULL, '2026-01-30 01:02:30', '2026-02-01 21:52:48'),
(51, 48, 'Siswa 10', 2, '20240010', NULL, 2, NULL, '2026-01-30 01:02:31', '2026-02-01 21:54:24'),
(52, 49, 'afasfsf', 1, '22051810245', NULL, 3, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1769960884/lms_smkn8medan/adralmpq2j8hb8tde9pw.jpg', '2026-02-01 08:48:06', '2026-02-01 08:48:06'),
(53, 50, 'lina milani', 1, '22051810000', 5, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770216843/lms_smkn8medan/osfowlusditmqclk0x4k.png', '2026-02-04 07:54:03', '2026-02-04 07:54:03'),
(54, 51, 'asdasd', 1, '1243423423', 4, 2, NULL, '2026-02-04 07:56:28', '2026-02-04 07:56:28'),
(55, 55, 'reyhan', 1, '24124324', 6, 2, NULL, '2026-02-04 16:55:50', '2026-02-04 16:55:50'),
(56, 56, 'rwerwe', 2, '1234567887', 6, 3, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770251219/lms_smkn8medan/uebjsjr21yrwzuulg8l2.jpg', '2026-02-04 17:27:00', '2026-02-04 17:27:00'),
(57, 39, 'Bagas Utami', 1, '20240001', 2, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:33', '2026-02-04 21:21:33'),
(58, 40, 'Bagas Firmansyah', 2, '20240002', 4, 3, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:33', '2026-02-04 21:21:33'),
(59, 41, 'Rizky Utami', 3, '20240003', 5, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:34', '2026-02-04 21:21:34'),
(60, 42, 'Yoga Santoso', 1, '20240004', 2, 4, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:34', '2026-02-04 21:21:34'),
(61, 43, 'Safira Utami', 2, '20240005', 4, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:34', '2026-02-04 21:21:34'),
(62, 44, 'Rizky Hidayat', 1, '20240006', 5, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:35', '2026-02-04 21:21:35'),
(63, 45, 'Putri Utami', 1, '20240007', 2, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:35', '2026-02-04 21:21:35'),
(64, 46, 'Rizky Kurniawan', 1, '20240008', 4, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:36', '2026-02-04 21:21:36'),
(65, 47, 'Aisyah Hidayat', 1, '20240009', 6, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:36', '2026-02-04 21:21:36'),
(66, 48, 'Reza Ramadhan', 1, '20240010', 2, 2, 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770218034/lms_smkn8medan/wncxbhje33vdyumsfai8.jpg', '2026-02-04 21:21:36', '2026-02-04 21:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat_id` bigint UNSIGNED DEFAULT NULL,
  `homeroom_teacher_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `department_id`, `name`, `tingkat_id`, `homeroom_teacher_id`, `created_at`, `updated_at`) VALUES
(2, 3, 'X Kuliner A', 1, 2, NULL, '2026-01-30 02:55:23'),
(4, 2, 'X hotel D', 1, 1, '2026-01-25 22:18:38', '2026-01-30 02:55:53'),
(5, 2, 'X hotel E', 1, 2, '2026-01-25 22:20:40', '2026-01-30 02:56:05'),
(6, 4, 'X busana B', 1, 1, '2026-01-26 21:21:47', '2026-01-30 02:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment_type` enum('file','link') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` datetime NOT NULL,
  `allow_revision` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_submissions`
--

CREATE TABLE `task_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `submission_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `graded_at` datetime DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `status` enum('submitted','revised','graded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `teacher_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `name`, `nip`, `photo`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'winaryo sulistianto s.pd', '1234567789', 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988285/lms_smkn8medan/owvfwmk9t4x1onkbkufm.jpg', 4, '2026-01-19 21:26:23', '2026-02-24 19:58:05'),
(2, 4, 'Ariston Simbolon', '2305102089', 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988183/lms_smkn8medan/h7l4lpr79rjyttgig1q1.jpg', 2, '2026-01-20 21:09:23', '2026-02-24 19:56:23'),
(5, 28, 'suryo winoto s.pd', '2205101030', 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988213/lms_smkn8medan/ei7dq9xwpgw0c0kvvhbw.jpg', 4, '2026-01-29 20:03:07', '2026-02-24 19:56:53'),
(6, 39, 'ayu suryaningsi s.pd', '32543251341', 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1771988248/lms_smkn8medan/z1f9yowwvzoa1mjpmzqi.jpg', 2, '2026-02-01 21:01:00', '2026-02-24 19:57:28'),
(7, 40, 'Siswa 2', '20240002', NULL, 3, '2026-02-01 21:01:00', '2026-02-01 21:01:00'),
(8, 41, 'Siswa 3', '20240003', NULL, 2, '2026-02-01 21:01:01', '2026-02-01 21:01:01'),
(9, 42, 'Siswa 4', '20240004', NULL, 4, '2026-02-01 21:01:01', '2026-02-01 21:01:01'),
(10, 43, 'Siswa 5', '20240005', NULL, 2, '2026-02-01 21:01:02', '2026-02-01 21:01:02'),
(11, 44, 'Siswa 6', '20240006', NULL, 2, '2026-02-01 21:01:02', '2026-02-01 21:01:02'),
(12, 45, 'Siswa 7', '20240007', NULL, 2, '2026-02-01 21:01:03', '2026-02-01 21:01:03'),
(13, 46, 'Siswa 8', '20240008', NULL, 2, '2026-02-01 21:01:03', '2026-02-01 21:01:03'),
(14, 47, 'Siswa 9', '20240009', NULL, 2, '2026-02-01 21:01:03', '2026-02-01 21:01:03'),
(15, 48, 'Siswa 10', '20240010', NULL, 2, '2026-02-01 21:01:04', '2026-02-01 21:01:04'),
(16, 52, 'asdasdas', '12412423432', 'https://res.cloudinary.com/dfcpydoq8/image/upload/v1770217090/lms_smkn8medan/db0e8iv3oncjjzpoeijg.jpg', 2, '2026-02-04 07:58:11', '2026-02-04 07:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `tingkat`
--

CREATE TABLE `tingkat` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tingkat`
--

INSERT INTO `tingkat` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'X', NULL, NULL),
(2, 'XI', NULL, NULL),
(3, 'XII', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `identifier`, `name`, `nisn`, `jurusan`, `photo`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '', 'Jon Penakluk Wanita', '1234567890', NULL, 'profile-photos/KHmYtdBOCudaqBGOJdzHtJDaI35ILoHUUUKRZjRL.png', NULL, NULL, '$2y$12$mQWMlCiNzCmvjMxyEtl17.H8HEitnA8Zg2d32IL3Y/1POR1jVVzMS', NULL, '2026-01-16 20:54:54', '2026-01-18 20:59:45'),
(2, '1987654321', 'Guru Demo', NULL, NULL, NULL, NULL, NULL, '$2y$12$ZCCCOczfdov/ARYPSoqh72uWP.p/P60sNsl9niYE7HM1...', NULL, '2026-01-19 21:26:23', '2026-01-19 21:26:23'),
(3, '1234567890', 'Demo Siswa', '132', 'ew', 'profile-photos/IWK1qOcmqROR14n30OWsB1ph0WOTCdskeYu...', NULL, NULL, '$2y$12$QLzzw6NczHKS71BFgufxu2fZ6nVxnOrzIrOsqqlP/M...', NULL, '2026-01-19 21:26:23', '2026-01-19 21:26:23'),
(4, '2305102089', 'Muhammad Hafizh', NULL, NULL, NULL, NULL, NULL, '$2y$12$Ewlbb8tWNXEmCCu01WC4Au7FMME9deQ7t14OoqZSBGxoQRQ4KHZmm', NULL, '2026-01-20 21:09:23', '2026-01-20 21:09:23'),
(7, '0001', 'Muhammad Fadlil Habil', '123456', NULL, NULL, NULL, NULL, '$2y$12$o1Yj6hyeQGEWQKZm.AT13OfBhBGK7YDzHe5qTlHgoHMfLEdjhmdAu', 'cjvr2jbomT', '2026-01-20 22:47:29', '2026-01-20 22:47:29'),
(8, '0002', 'operator smkn 8 medan', '123457', NULL, NULL, 'superadmin@gmail.com', NULL, '$2y$12$I0ulU7gXFT06sUM7wE74Xub/R2sW8WiqS87FcJJ9jHcp7IZSMLBe6', 'b1lgvpq8PvbdUUxbbz8YYQ4GkcdAqT0KAew8TpSayP8QyYKVadKEdp8gbCbj', '2026-01-20 22:47:30', '2026-02-24 20:00:05'),
(20, NULL, 'budi sudarso', NULL, NULL, NULL, NULL, NULL, '$2y$12$Zs53KRVUAVOb9MegpR1nme2C1Mv6zA046w.eum72Wi0aQc67IBc6a', NULL, '2026-01-24 08:11:42', '2026-01-24 08:11:42'),
(21, NULL, 'haryanto ginting suka', NULL, NULL, 'admin-photos/01KFR99J5CS46KBVB0WEYZDQAG.jpg', NULL, NULL, '$2y$12$sFQy4TG.5kb7egzGB4kPFu6sv.mf6zfSj9IyLQHqRScqtp00xjOHq', NULL, '2026-01-24 08:17:21', '2026-01-24 08:26:29'),
(22, '2205671822', 'haryanto ginting', NULL, NULL, NULL, NULL, NULL, '$2y$12$2qpdSR2GDv4UxIlyv.lynuL/gUvQAsayG52m4gm9WNAz26oTZbJy6', NULL, '2026-01-24 08:18:41', '2026-01-24 08:18:41'),
(23, NULL, 'fernando robert harahap', NULL, NULL, 'admin-photos/01KFR9X4CXC8691YSMWDQEBSJC.jpeg', NULL, NULL, '$2y$12$1P3Jywq6cTd1UPsXsToReuOpkS7lwS/K.tzlpJ0xRZiULvYKOChWe', NULL, '2026-01-24 08:28:02', '2026-01-24 08:28:28'),
(24, '2205181022', 'reyhan yonathan batubara', NULL, NULL, NULL, NULL, NULL, '$2y$12$AKUw2lgcsWWRQwdU.9FZeeRyJeOmnXWVivDyNp4Vu6X7seJh3iahi', NULL, '2026-01-27 20:18:51', '2026-01-27 20:18:51'),
(25, '2205181032', 'jon evansius situmorang', NULL, NULL, NULL, NULL, NULL, '$2y$12$6pWH8joopRedALzlZxKc.ORAt3WxPgYbO2/l1huziLLcRwpr0Wwi6', NULL, '2026-01-27 20:23:09', '2026-01-29 19:49:43'),
(26, NULL, 'operator smkn 8 medan', NULL, NULL, 'admin-photos/01KG6DG415NWD9PX24E59BAV0J.jpeg', NULL, NULL, '$2y$12$e24.a7ieb/2O239gFawqBe3dPvJ7zHCLfIf/lDuSPPXCPpthJjVZa', NULL, '2026-01-29 20:00:12', '2026-01-29 20:00:12'),
(27, '22051801070', 'wisnu sunandar', NULL, NULL, NULL, NULL, NULL, '$2y$12$B6Tg56g0pE0womE.1K2ZvubWFcZ5y4CsPVt/I6Kx.zQSSWhZGEkne', NULL, '2026-01-29 20:02:06', '2026-01-29 20:02:06'),
(28, '2205101030', 'suryo winoto', NULL, NULL, NULL, NULL, NULL, '$2y$12$cntmFKULsLWSdkejqDiHeecjAQK030gO8clLTroTkOSI7GH.aLGXa', NULL, '2026-01-29 20:03:07', '2026-01-29 20:03:07'),
(39, '20240001', 'Siswa 1', NULL, NULL, NULL, NULL, NULL, '$2y$12$TlHSlzvlLpkouoXZoazDNe5HMq8/7XpShUM3J6atF1o2pV14gcCPO', NULL, '2026-01-30 01:02:27', '2026-01-30 01:02:27'),
(40, '20240002', 'Siswa 2', NULL, NULL, NULL, NULL, NULL, '$2y$12$BnBNUWDn1NJrWNAXdHp2QOFkutNwi7aDq/huAgb22WrEZybNPWfTi', NULL, '2026-01-30 01:02:27', '2026-01-30 01:02:27'),
(41, '20240003', 'Siswa 3', NULL, NULL, NULL, NULL, NULL, '$2y$12$CTKMecsI4cAE9EaY7Tdvl.FnO7LmS0fkuhhi3UcMW67eBzL0823zi', NULL, '2026-01-30 01:02:28', '2026-01-30 01:02:28'),
(42, '20240004', 'Siswa 4', NULL, NULL, NULL, NULL, NULL, '$2y$12$apHXoc8SgbiDkIHe1KvIZuAgJ7F833bMSLMJ1KuP9mgF7fvqbl5u6', NULL, '2026-01-30 01:02:28', '2026-01-30 01:02:28'),
(43, '20240005', 'Siswa 5', NULL, NULL, NULL, NULL, NULL, '$2y$12$UV3RbgAuxu6b09t4uaDcKum7U3twuUfSSkdJKMk./vBDx7wzOFPFu', NULL, '2026-01-30 01:02:29', '2026-01-30 01:02:29'),
(44, '20240006', 'Siswa 6', NULL, NULL, NULL, NULL, NULL, '$2y$12$CX/i7L7eIGXmvrc37uQTSOFtZlBhzyRf0YBPqt4xOPfd/9X0dxRS2', NULL, '2026-01-30 01:02:29', '2026-01-30 01:02:29'),
(45, '20240007', 'Siswa 7', NULL, NULL, NULL, NULL, NULL, '$2y$12$/joJACPNTCslnpb/BDiIO.yYrfHrXKPjwrSTHKWAr8ittcEUFO/cu', NULL, '2026-01-30 01:02:29', '2026-01-30 01:02:29'),
(46, '20240008', 'Siswa 8', NULL, NULL, NULL, NULL, NULL, '$2y$12$3FDjMOJFWupRR8MYDQrpBuN6WvrHTdba.VT3gq5CgW3ZRUK57ePIi', NULL, '2026-01-30 01:02:30', '2026-01-30 01:02:30'),
(47, '20240009', 'Siswa 9', NULL, NULL, NULL, NULL, NULL, '$2y$12$XC2U6oiPyzz9i.2t1FMlRO28ZkTzukJrCZIjpAfRMiW5oZ46OV4si', NULL, '2026-01-30 01:02:30', '2026-01-30 01:02:30'),
(48, '20240010', 'Siswa 10', NULL, NULL, NULL, NULL, NULL, '$2y$12$/9Fhm.KUvqWRXbnQxdlAPuW5vzH3ICflUWhhynAR1uQ4m/sWCqU2G', NULL, '2026-01-30 01:02:31', '2026-01-30 01:02:31'),
(49, '22051810245', 'afasfsf', NULL, NULL, NULL, NULL, NULL, '$2y$12$FHfkm.bGbn4QzLQZppEfAOmP0Ev/HJyAY2LkuqmRBGAXhFx7kwiX6', NULL, '2026-02-01 08:48:06', '2026-02-01 08:48:06'),
(50, '22051810000', 'lina milani', NULL, NULL, NULL, NULL, NULL, '$2y$12$scy1H5ugjiyeO8bQtdZiNeELw4Htz6PLaX.EAZi2z1/MgMTUlACfi', NULL, '2026-02-04 07:54:03', '2026-02-04 07:54:03'),
(51, '1243423423', 'asdasd', NULL, NULL, NULL, NULL, NULL, '$2y$12$.G6m.jclFZ.AqmdKF7D3OOayT.nyU//.ZLqtkDnGtY.vscbPBtUVa', NULL, '2026-02-04 07:56:28', '2026-02-04 07:56:28'),
(52, '12412423432', 'asdasdas', NULL, NULL, NULL, NULL, NULL, '$2y$12$Zfv36aIoGAQKSqxFlsZVNOB9l4.Dd8F1Hi.XYqlA0oaDED.cJQiuW', NULL, '2026-02-04 07:58:11', '2026-02-04 07:58:11'),
(53, '212312434', 'reyhan', NULL, NULL, NULL, NULL, NULL, '$2y$12$pEZpClVLX2PGhkH7qkh9ZenOsrO4DtF3EuH7WmfWo1u0ge28ll9ty', NULL, '2026-02-04 16:47:20', '2026-02-04 16:47:20'),
(54, '22051810245', 'reyhan', NULL, NULL, NULL, NULL, NULL, '$2y$12$IVHjbgDS09u2xjdhnmw3Y.CL0bD4MQS4X8TmwQCV85o12W59WxJES', NULL, '2026-02-04 16:53:18', '2026-02-04 16:53:18'),
(55, '24124324', 'reyhan', NULL, NULL, NULL, NULL, NULL, '$2y$12$1wLLTFF8Sj31uSTBn7hmAO1dagzxlVHkbKCzDcxJOq2i/B1Uxg616', 'ifRd8LgTTxdQcQjqKPCZRwns9jjJhUWvA8Yj5Rdo5oUDk9127CjDC04nsX6u', '2026-02-04 16:55:50', '2026-02-04 16:55:50'),
(56, '1234567887', 'rwerwe', NULL, NULL, NULL, NULL, NULL, '$2y$12$4gNoNTajDqYJKe4dESv0nu3ZAN8NpFk2DKFFqGpaXaFWvG/7eWfOu', NULL, '2026-02-04 17:27:00', '2026-02-04 17:27:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `haris`
--
ALTER TABLE `haris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_hari` (`nama_hari`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_module_id_foreign` (`module_student_class_id`),
  ADD KEY `lessons_section_id_foreign` (`section_id`);

--
-- Indexes for table `lesson_user`
--
ALTER TABLE `lesson_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lesson_user_user_id_lesson_id_unique` (`user_id`,`lesson_id`),
  ADD KEY `lesson_user_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `lesson_user_durations`
--
ALTER TABLE `lesson_user_durations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lesson_user_durations_user_id_lesson_id_unique` (`user_id`,`lesson_id`),
  ADD KEY `lesson_user_durations_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_department_id_foreign` (`department_id`);

--
-- Indexes for table `modules_student_class`
--
ALTER TABLE `modules_student_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_student_class_module_id_index` (`module_id`),
  ADD KEY `modules_student_class_student_class_id_index` (`student_class_id`),
  ADD KEY `fk_msc_teacher` (`teacher_id`);

--
-- Indexes for table `modules_teacher`
--
ALTER TABLE `modules_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_teacher_module_id_index` (`module_id`),
  ADD KEY `modules_teacher_teacher_id_index` (`teacher_id`);

--
-- Indexes for table `modules_tingkat`
--
ALTER TABLE `modules_tingkat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_module_tingkat` (`module_id`,`tingkat_id`),
  ADD KEY `fk_modules_tingkat_tingkat` (`tingkat_id`);

--
-- Indexes for table `module_student_class_schedules`
--
ALTER TABLE `module_student_class_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_kelas_slot` (`module_student_class_id`,`hari_id`,`rentang_jam_id`),
  ADD KEY `hari_id` (`hari_id`),
  ADD KEY `rentang_jam_id` (`rentang_jam_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_module_id_foreign` (`module_id`),
  ADD KEY `quizzes_section_id_foreign` (`section_id`),
  ADD KEY `quizzes_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `quiz_user`
--
ALTER TABLE `quiz_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_user_user_id_foreign` (`user_id`),
  ADD KEY `quiz_user_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `rentang_jams`
--
ALTER TABLE `rentang_jams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jam_mulai` (`jam_mulai`,`jam_selesai`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_module_id_foreign` (`module_student_class_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_user_id_index` (`user_id`),
  ADD KEY `students_class_level_id_index` (`class_level_id`),
  ADD KEY `students_department_id_index` (`department_id`),
  ADD KEY `fk_students_tingkat` (`tingkat_id`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_classes_homeroom_teacher_id_index` (`homeroom_teacher_id`),
  ADD KEY `fk_student_classes_department` (`department_id`),
  ADD KEY `fk_student_classes_tingkat` (`tingkat_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_lesson_id_foreign` (`lesson_id`),
  ADD KEY `tasks_module_id_foreign` (`module_id`);

--
-- Indexes for table `task_submissions`
--
ALTER TABLE `task_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_submissions_task_id_foreign` (`task_id`),
  ADD KEY `task_submissions_user_id_foreign` (`user_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_user_id_foreign` (`user_id`),
  ADD KEY `teachers_department_id_foreign` (`department_id`);

--
-- Indexes for table `tingkat`
--
ALTER TABLE `tingkat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `haris`
--
ALTER TABLE `haris`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lesson_user`
--
ALTER TABLE `lesson_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lesson_user_durations`
--
ALTER TABLE `lesson_user_durations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `modules_student_class`
--
ALTER TABLE `modules_student_class`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `modules_teacher`
--
ALTER TABLE `modules_teacher`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `modules_tingkat`
--
ALTER TABLE `modules_tingkat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `module_student_class_schedules`
--
ALTER TABLE `module_student_class_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_user`
--
ALTER TABLE `quiz_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rentang_jams`
--
ALTER TABLE `rentang_jams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task_submissions`
--
ALTER TABLE `task_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tingkat`
--
ALTER TABLE `tingkat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_module_student_class_id_foreign` FOREIGN KEY (`module_student_class_id`) REFERENCES `modules_student_class` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `lessons_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_user`
--
ALTER TABLE `lesson_user`
  ADD CONSTRAINT `lesson_user_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_user_durations`
--
ALTER TABLE `lesson_user_durations`
  ADD CONSTRAINT `lesson_user_durations_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_user_durations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `modules_student_class`
--
ALTER TABLE `modules_student_class`
  ADD CONSTRAINT `fk_msc_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `modules_student_class_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `modules_student_class_student_class_id_foreign` FOREIGN KEY (`student_class_id`) REFERENCES `student_classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modules_teacher`
--
ALTER TABLE `modules_teacher`
  ADD CONSTRAINT `modules_teacher_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `modules_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modules_tingkat`
--
ALTER TABLE `modules_tingkat`
  ADD CONSTRAINT `fk_modules_tingkat_module` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_modules_tingkat_tingkat` FOREIGN KEY (`tingkat_id`) REFERENCES `tingkat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `module_student_class_schedules`
--
ALTER TABLE `module_student_class_schedules`
  ADD CONSTRAINT `module_student_class_schedules_ibfk_1` FOREIGN KEY (`module_student_class_id`) REFERENCES `modules_student_class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `module_student_class_schedules_ibfk_2` FOREIGN KEY (`hari_id`) REFERENCES `haris` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `module_student_class_schedules_ibfk_3` FOREIGN KEY (`rentang_jam_id`) REFERENCES `rentang_jams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_user`
--
ALTER TABLE `quiz_user`
  ADD CONSTRAINT `quiz_user_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_module_student_class_id_foreign` FOREIGN KEY (`module_student_class_id`) REFERENCES `modules_student_class` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_tingkat` FOREIGN KEY (`tingkat_id`) REFERENCES `tingkat` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `students_class_level_id_foreign` FOREIGN KEY (`class_level_id`) REFERENCES `student_classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `students_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD CONSTRAINT `fk_student_classes_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_classes_tingkat` FOREIGN KEY (`tingkat_id`) REFERENCES `tingkat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_classes_homeroom_teacher_id_foreign` FOREIGN KEY (`homeroom_teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_submissions`
--
ALTER TABLE `task_submissions`
  ADD CONSTRAINT `task_submissions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
