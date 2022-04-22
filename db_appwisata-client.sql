-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 08:09 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter-server`
--

-- --------------------------------------------------------

--
-- Table structure for table `tourism`
--

CREATE TABLE `tourism` (
  `id` int(10) NOT NULL,
  `tourism_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tourism_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tourism_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tourism_ticket_price` int(11) NOT NULL,
  `tourism_working_hours` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tourism_open_days` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tourism_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tourism`
--

INSERT INTO `tourism` (`id`, `tourism_name`, `tourism_description`, `tourism_location`, `tourism_ticket_price`, `tourism_working_hours`, `tourism_open_days`, `tourism_img`, `created_at`, `updated_at`) VALUES
(2, 'Alun-Alun Bojonegoro', 'Alun-alun Bojonegoro adalah sebuah tanah lapang yang berada di pusat Kabupaten Bojonegoro, Jawa Timur. alun-alun ini juga digunakan untuk berbagai kegiatan masyarakat, yaitu; salat Ied, pertandingan voly, konser musik, pertunjukan wayang kulit, dan sebagainya.Di bagian barat alun-alun berdiri Masjid Agung Bojonegoro', 'Kab. Bojonegoro, Jawa Timur', 2000, '08:00-16:00', 'Setiap Hari', 'EoqUVOYsexmjY7o4u7a8fwuziLaAkt62gws30FxK.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tourism_img`
--

CREATE TABLE `tourism_img` (
  `id` int(10) NOT NULL,
  `tourism_id` int(10) UNSIGNED NOT NULL,
  `tourism_img_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tourism_img`
--

INSERT INTO `tourism_img` (`id`, `tourism_id`, `tourism_img_file`, `created_at`, `updated_at`) VALUES
(5, 2, 'fPnNmetwcMPTPJoDvNXYGgMfYdLvZkWpuN904l49.jpg', NULL, NULL),
(6, 2, 'XZ5bBkaO6SEamWOFlMnCsqVNKDBCgQEAxg1davGQ.jpg', NULL, NULL),
(7, 2, '5oQfGPBdawAOzWldkom3EVYIzIQP1Uo0qBoh9g7M.jpg', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tourism`
--
ALTER TABLE `tourism`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tourism_img`
--
ALTER TABLE `tourism_img`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tourism`
--
ALTER TABLE `tourism`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tourism_img`
--
ALTER TABLE `tourism_img`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
