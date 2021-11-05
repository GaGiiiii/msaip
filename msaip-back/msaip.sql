-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2021 at 07:30 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msaip`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `makes`
--

INSERT INTO `makes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '2012', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(2, '2018', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(3, '2021', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(4, '2008', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(5, '2007', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(6, 'ST 2008', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(7, '2010', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(8, 'turbo 2012', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(9, '2006', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(10, '2021', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(11, '2003', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(12, '1999', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(13, '2005', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(14, '2015', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(15, '2017', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(16, 'G 2019', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(17, '2022', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(18, '1997', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(19, '1998', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(20, '2001', '2021-11-05 12:57:47', '2021-11-05 12:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ford', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(2, 'Audi', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(3, 'BMW', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(4, 'Mercedes-Benz', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(5, 'Opel', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(6, 'Peugeot', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(7, 'Honda', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(8, 'Citroen', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(9, 'Toyota', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(10, 'Fiat', '2021-11-05 12:57:47', '2021-11-05 12:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_03_155019_create_manufacturers_table', 1),
(6, '2021_11_03_155057_create_m_models_table', 1),
(7, '2021_11_03_155117_create_makes_table', 1),
(8, '2021_11_03_160212_create_types_table', 1),
(9, '2021_11_03_160249_create_saved_cars_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_models`
--

CREATE TABLE `m_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_id` bigint(20) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_models`
--

INSERT INTO `m_models` (`id`, `manufacturer_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fiesta', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(2, 2, 'A3', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(3, 2, 'A6', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(4, 3, '320d', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(5, 3, '720d', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(6, 3, 'M8', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(7, 4, 'G-Class', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(8, 4, 'S-Class', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(9, 4, 'A-Class', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(10, 4, 'C-Class', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(11, 5, 'Astra', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(12, 5, 'Corsa', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(13, 5, 'Kadet', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(14, 5, 'Insignia', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(15, 6, '407', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(16, 6, '308', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(17, 6, '406', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(18, 6, '208', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(19, 6, '207', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(20, 7, 'Acord', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(21, 7, 'Civic', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(22, 7, 'Clarity', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(23, 7, 'Ineight', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(24, 8, 'C6', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(25, 8, 'C5', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(26, 9, 'Yaris', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(27, 9, 'Supra', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(28, 10, 'Punto', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(29, 10, 'Punto-grande', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(30, 10, 'Stilo', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(31, 10, '500', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(32, 10, '500L', '2021-11-05 12:57:47', '2021-11-05 12:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_cars`
--

CREATE TABLE `saved_cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_cars`
--

INSERT INTO `saved_cars` (`id`, `user_id`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 5, 44, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(2, 7, 67, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(3, 3, 52, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(4, 7, 54, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(5, 8, 68, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(6, 4, 11, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(7, 2, 1, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(8, 3, 38, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(9, 7, 12, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(10, 9, 61, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(11, 3, 6, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(12, 2, 27, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(13, 6, 51, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(14, 3, 32, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(15, 3, 19, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(16, 7, 59, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(17, 6, 11, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(18, 2, 68, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(19, 3, 18, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(20, 3, 44, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(21, 1, 18, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(22, 5, 34, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(23, 4, 50, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(24, 9, 43, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(25, 5, 36, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(26, 7, 56, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(27, 6, 26, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(28, 5, 5, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(29, 7, 68, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(30, 10, 24, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(31, 6, 47, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(32, 7, 8, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(33, 1, 56, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(34, 1, 21, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(36, 3, 24, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(37, 9, 6, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(38, 4, 15, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(39, 1, 28, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(40, 2, 62, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(41, 1, 2, '2021-11-05 14:23:34', '2021-11-05 14:23:34'),
(54, 1, 1, '2021-11-05 14:31:32', '2021-11-05 14:31:32'),
(57, 1, 34, '2021-11-05 14:42:18', '2021-11-05 14:42:18'),
(58, 11, 2, '2021-11-05 14:46:53', '2021-11-05 14:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `make_id` bigint(20) NOT NULL,
  `m_model_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `make_id`, `m_model_id`, `created_at`, `updated_at`) VALUES
(1, 19, 1, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(2, 12, 1, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(3, 18, 2, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(4, 10, 3, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(5, 9, 4, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(6, 1, 4, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(7, 19, 4, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(8, 6, 4, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(9, 19, 5, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(10, 16, 5, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(11, 14, 5, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(12, 3, 6, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(13, 5, 6, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(15, 18, 7, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(16, 10, 7, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(17, 14, 7, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(18, 20, 7, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(19, 6, 8, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(20, 8, 8, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(21, 12, 8, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(23, 15, 9, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(24, 4, 10, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(25, 10, 11, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(26, 19, 11, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(27, 14, 11, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(28, 15, 12, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(29, 11, 12, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(30, 6, 12, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(31, 13, 13, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(32, 14, 14, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(33, 15, 15, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(34, 1, 15, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(35, 8, 16, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(36, 5, 17, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(37, 6, 17, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(38, 16, 17, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(39, 2, 18, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(40, 18, 19, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(41, 14, 19, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(42, 6, 20, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(43, 1, 21, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(44, 4, 21, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(45, 13, 21, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(46, 5, 22, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(47, 16, 22, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(48, 1, 22, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(49, 10, 23, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(50, 4, 23, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(51, 17, 24, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(52, 1, 24, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(53, 10, 24, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(54, 18, 25, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(55, 8, 25, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(56, 8, 26, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(57, 7, 27, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(58, 11, 27, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(59, 16, 27, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(60, 14, 28, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(61, 17, 28, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(62, 4, 29, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(64, 1, 30, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(65, 7, 31, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(66, 11, 31, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(67, 19, 32, '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(68, 6, 32, '2021-11-05 12:57:47', '2021-11-05 12:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'GaGiiiii', 'gagi@gagi.com', '2021-11-05 12:57:46', '$2y$10$bmLc1Z3R4EpDg8mwGVG5p.mf7F6NcZRk82qBfbkiMSwOphXBLLva.', 'gNwgf9EXwA', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(2, 'Eulah Batz', 'dhoeger@example.com', '2021-11-05 12:57:46', '$2y$10$2v/Fik4N2bZgeOB6uy8u5.3vg9XTGQqLq4Xv5VqEXXom.2Bjzu4Y.', 'pIyIbN4vqc', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(3, 'Ms. Cheyanne Emmerich', 'rubie.feil@example.net', '2021-11-05 12:57:46', '$2y$10$ej5pr1apg5T2FPQrjJqwR.8NoBBn7wp2kZq7qLBAnbGSwl6sny2Iu', 'NGoV6rVy67', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(4, 'Lloyd Tromp V', 'pkunde@example.net', '2021-11-05 12:57:46', '$2y$10$Syy0w//AP4Ec6lq89Vv6nuLSTszEVl2SFFk/XTM7SRyCeg1AQU6i.', '4NMfTye9Tc', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(5, 'Miss Gilda Powlowski Sr.', 'lfriesen@example.net', '2021-11-05 12:57:46', '$2y$10$df46P6ZL5UqjPbpCox7LbuPZ5zIYz5XFexTPdSkqEahzdfMCu/vGS', 'ztGhVwEXPh', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(6, 'Elliott Hansen', 'russel.will@example.org', '2021-11-05 12:57:46', '$2y$10$vNkVMlW51clQrPBZOFfc1.KFZhkGt4xPpizz.zO4kr0vneBqEWY8a', 'w7mknDOSdj', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(7, 'Jayce Schinner', 'pfranecki@example.com', '2021-11-05 12:57:46', '$2y$10$TV0aeysikG2dUHrBIGGbVOveojKm7693keNwSndcp8fu5.xGZ9Q7S', 'Oc4PViOtmI', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(8, 'Leonel Roberts Sr.', 'julia76@example.com', '2021-11-05 12:57:47', '$2y$10$kFZF2XxkN0pdLQL0AHV28.WLyn0050szDk67XToLmu3Fc6HKU58W6', 'CPLClw0iF3', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(9, 'Dax Thompson III', 'grant.marcelina@example.org', '2021-11-05 12:57:47', '$2y$10$Wf3P1gIwz2nAV1UMeq47f.xHJFsL8ajXV7zNpdSr8SUMu8yLmHunK', 'p6CeimGWnc', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(10, 'Sheila Glover', 'anahi99@example.org', '2021-11-05 12:57:47', '$2y$10$MkqAaxdqD9e92bfvTfflROqqYH2ToaliQf/hominA8uc5jgPuVTpq', 'Rgsq5c9QhY', '2021-11-05 12:57:47', '2021-11-05 12:57:47'),
(11, 'Pera', 'pera@pera.com', NULL, '$2y$10$Gp/CqSwO/1paYxytTOGnLe7N75hrlwM5tSplnSmBNcxrzve2Jj3Ve', NULL, '2021-11-05 14:46:40', '2021-11-05 14:46:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_models`
--
ALTER TABLE `m_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `saved_cars`
--
ALTER TABLE `saved_cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `saved_cars_user_id_type_id_unique` (`user_id`,`type_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types_m_model_id_make_id_unique` (`m_model_id`,`make_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `makes`
--
ALTER TABLE `makes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `m_models`
--
ALTER TABLE `m_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `saved_cars`
--
ALTER TABLE `saved_cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
