-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2024 at 06:38 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modernphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `description`, `amount`, `date`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'My First Transaction', 49.99, '2024-03-09 00:00:00', '2024-03-10 13:33:28', '2024-03-10 13:33:28', 2),
(2, 'My Second Transaction', 39.99, '2024-03-10 00:00:00', '2024-03-10 13:53:03', '2024-03-10 13:53:03', 2),
(3, 'Your First Transaction', 29.99, '2024-03-10 00:00:00', '2024-03-10 15:33:29', '2024-03-10 15:33:29', 2),
(4, 'Your Second Transaction', 13.99, '2024-03-09 00:00:00', '2024-03-10 15:34:45', '2024-03-10 15:34:45', 2),
(5, 'Example %', 19.99, '2024-03-08 00:00:00', '2024-03-10 15:39:52', '2024-03-10 15:39:52', 2),
(6, 'Test', 13.99, '2024-03-10 00:00:00', '2024-03-10 17:14:45', '2024-03-10 17:14:45', 2),
(7, 'Test 2', 29.99, '2024-03-10 00:00:00', '2024-03-10 17:15:02', '2024-03-10 17:15:02', 2),
(10, 'Test 5', 12.99, '2024-03-10 00:00:00', '2024-03-10 17:16:30', '2024-03-10 17:16:30', 2),
(11, 'Test 4', 39.99, '2024-03-13 00:00:00', '2024-03-13 22:20:38', '2024-03-13 22:20:38', 2),
(13, 'Test 3', 49.98, '2024-03-13 00:00:00', '2024-03-13 22:25:47', '2024-03-13 22:25:47', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` tinyint UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `social_media_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `age`, `country`, `social_media_url`, `created_at`, `updated_at`) VALUES
(2, 'mbatilovic@gmail.com', '$2y$12$946S8ZlBL8Zn6hsRtfFmVefao42HRhnpjO9tiRdaWxDO3e53FiA1y', 45, 'Luxembourg', 'https://twitter.com', '2024-03-03 21:23:54', '2024-03-03 21:23:54'),
(3, 'test2@gmail.com', '$2y$12$aVqF6QC.3vDUrMsRB4woiO3ubw/fpUWtCCKlwVNJgzgCpQpxyw2C.', 45, 'Mexico', 'https://facebook.com', '2024-03-09 16:03:45', '2024-03-09 16:03:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
