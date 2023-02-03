-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2023 at 05:24 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web1ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `created_at`) VALUES
(1, 'Electronics', 'Electronics', 'electronics.png', '2022-12-26 07:46:34'),
(2, 'Mobile', 'mobile', 'mobile.png', '2022-12-26 07:46:59'),
(3, 'Men', 'men', 'men.png', '2022-12-26 07:47:17'),
(4, 'Women', 'women', 'women.png', '2022-12-26 07:47:32'),
(5, 'Sports', 'sports', 'sports', '2022-12-30 05:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 1,
  `op` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `product_id`, `price`, `quantity`, `op`, `created_at`) VALUES
(1, 1, 36, 150000.00, 1, '', '2022-12-29 07:55:55'),
(2, 1, 32, 25000.00, 1, '', '2022-12-29 07:55:55'),
(3, 1, 23, 45990.00, 1, '', '2022-12-29 07:55:55'),
(4, 1, 25, 7500.00, 1, '', '2022-12-29 07:55:55'),
(5, 2, 11, 40000.00, 1, '', '2022-12-29 07:56:16'),
(6, 2, 16, 30000.00, 1, '', '2022-12-29 07:56:16'),
(7, 2, 36, 150000.00, 1, '', '2022-12-29 07:56:16'),
(8, 2, 32, 25000.00, 1, '', '2022-12-29 07:56:16'),
(9, 3, 36, 150000.00, 1, '', '2022-12-29 07:57:39'),
(10, 3, 32, 25000.00, 1, '', '2022-12-29 07:57:39'),
(11, 3, 23, 45990.00, 1, '', '2022-12-29 07:57:39'),
(12, 3, 25, 7500.00, 1, '', '2022-12-29 07:57:39'),
(13, 4, 36, 150000.00, 1, '', '2022-12-29 07:57:45'),
(14, 4, 32, 25000.00, 1, '', '2022-12-29 07:57:45'),
(15, 4, 23, 45990.00, 1, '', '2022-12-29 07:57:45'),
(16, 4, 25, 7500.00, 1, '', '2022-12-29 07:57:45'),
(17, 5, 36, 150000.00, 1, '', '2022-12-29 07:59:13'),
(18, 5, 32, 25000.00, 1, '', '2022-12-29 07:59:13'),
(19, 5, 23, 45990.00, 1, '', '2022-12-29 07:59:13'),
(20, 5, 25, 7500.00, 1, '', '2022-12-29 07:59:13'),
(21, 6, 36, 150000.00, 1, '', '2022-12-29 07:59:58'),
(22, 6, 32, 25000.00, 1, '', '2022-12-29 07:59:58'),
(23, 6, 23, 45990.00, 1, '', '2022-12-29 07:59:58'),
(24, 6, 25, 7500.00, 1, '', '2022-12-29 07:59:58'),
(25, 7, 36, 150000.00, 1, '', '2022-12-29 08:00:16'),
(26, 7, 32, 25000.00, 1, '', '2022-12-29 08:00:16'),
(27, 7, 23, 45990.00, 1, '', '2022-12-29 08:00:16'),
(28, 7, 25, 7500.00, 1, '', '2022-12-29 08:00:16'),
(29, 8, 36, 150000.00, 1, '', '2022-12-29 08:01:08'),
(30, 9, 41, 23.00, 1, '', '2022-12-29 08:02:23'),
(31, 9, 36, 150000.00, 1, '', '2022-12-29 08:02:23'),
(32, 9, 35, 22999.00, 1, '', '2022-12-29 08:02:23'),
(33, 10, 35, 22999.00, 1, '', '2022-12-29 08:04:38'),
(34, 10, 33, 1000000.00, 1, '', '2022-12-29 08:04:38'),
(35, 10, 15, 50000.00, 1, '', '2022-12-29 08:04:38'),
(36, 10, 12, 50000.00, 1, '', '2022-12-29 08:04:38'),
(37, 11, 36, 150000.00, 1, '', '2022-12-30 04:37:36'),
(38, 11, 32, 25000.00, 1, '', '2022-12-30 04:37:36'),
(39, 11, 16, 30000.00, 1, '', '2022-12-30 04:37:36'),
(40, 11, 11, 40000.00, 1, '', '2022-12-30 04:37:36'),
(41, 12, 73, 82500.00, 1, '', '2023-01-31 13:14:35'),
(42, 12, 70, 400000.00, 1, '', '2023-01-31 13:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` float(10,2) NOT NULL,
  `discount` float(6,2) NOT NULL,
  `comment` varchar(512) NOT NULL,
  `payment` set('cash','bkash','nogod','cod') NOT NULL,
  `trxid` varchar(72) NOT NULL,
  `status` set('pe','pr','sh','co') NOT NULL DEFAULT 'pe' COMMENT '"pending","processing","shipped","completed"',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `discount`, `comment`, `payment`, `trxid`, `status`, `created_at`) VALUES
(1, 1, 239900.00, 14.50, 'please joldi pathan', 'bkash', 'dfgdfgdsfg', 'pe', '2022-12-29 07:55:55'),
(2, 25, 257234.50, 15.50, 'joldi pathan', 'bkash', 'fgygfuyw', 'co', '2022-12-29 07:56:16'),
(3, 1, 239914.50, 0.00, 'asdf', 'cash', 'sadf', 'pe', '2022-12-29 07:57:39'),
(4, 4, 239914.50, 0.00, 'pament', 'cash', '', 'pe', '2022-12-29 07:57:45'),
(5, 1, 239900.00, 14.50, 'asdf', 'cod', '', 'pe', '2022-12-29 07:59:13'),
(6, 4, 239900.00, 14.50, '', 'cash', '', 'sh', '2022-12-29 07:59:58'),
(7, 1, 239914.50, 0.00, 'sadf', 'cash', 'asdf', 'sh', '2022-12-29 08:00:16'),
(8, 26, 157500.00, 0.00, '', 'cash', '', 'pe', '2022-12-29 08:01:08'),
(9, 1, 181600.00, 73.10, 'sadfsadf', 'nogod', 'asdfsdfasdf', 'co', '2022-12-29 08:02:23'),
(10, 35, 1179149.00, 0.00, '', 'bkash', 'awserfzs', 'co', '2022-12-29 08:04:38'),
(11, 25, 257199.50, 50.50, 'pathan', 'nogod', '123544', 'co', '2022-12-30 04:37:36'),
(12, 1, 506000.00, 625.00, 'asdf', 'cash', '', 'co', '2023-01-31 13:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `sku` varchar(128) NOT NULL,
  `images` varchar(512) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(6) NOT NULL,
  `discount` int(2) NOT NULL,
  `hot` set('0','1') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `name`, `description`, `sku`, `images`, `price`, `quantity`, `discount`, `hot`, `created_at`) VALUES
(6, 5, 7, 'Watch Tower', 'watch tower desc', 'wt1234', '63a962d666bc9.png', 2222.00, 120, 20, '0', '2022-12-26 09:01:10'),
(7, 2, 4, 'mobile', 'smartmobail', 'jgsiouoer', '63a962f236595.png', 25000.00, 40, 12, '1', '2022-12-26 09:01:38'),
(9, 1, 2, 'clock 1', 'clock 1', 'hfahfgualgk', '63aa928639de8.png', 600.00, 12, 10, '1', '2022-12-27 06:36:54'),
(10, 1, 1, 'mobile', 'clock', 'rtiuyiku', '63aa9366a58a2.png', 40000.00, 50, 10, '1', '2022-12-27 06:40:38'),
(11, 1, 1, 'Sony', 'jui9j9koikjui', 'fhyth4f', '63aa93acb6e49.png', 40000.00, 5, 10, '1', '2022-12-27 06:41:48'),
(12, 1, 1, 'Infinity', '\r\nSmart Telivesion', 'infinitySmartTelivision', '63aa947891098.png', 50000.00, 18, 15, '1', '2022-12-27 06:45:12'),
(15, 1, 2, 'LLOYD', 'air condiction', 'rytyuu', '63aa95c2689ac.png', 50000.00, 5, 10, '1', '2022-12-27 06:50:42'),
(16, 2, 4, 'Samsung y90', 'Smart', 'mobil', '63aa95efc4991.png', 30000.00, 100, 12, '1', '2022-12-27 06:51:27'),
(17, 1, 1, 'WRIDE', 'LAPTOP', 'tyjkuikikuj', '63aa967962abe.png', 100000.00, 8, 10, '1', '2022-12-27 06:53:45'),
(23, 1, 1, 'Canon', 'Canon Camera', 'fhhg', '63aa98fc78b02.png', 45990.00, 12, 15, '1', '2022-12-27 07:04:28'),
(24, 2, 3, 'phone', 'Vintage telecommunication technology and retro household items concept with a red push button telephone isolated on white background with a clipping path cut out', 'fhuhug', '63aa9a4981922.png', 10500.00, 22, 20, '0', '2022-12-27 07:10:01'),
(25, 2, 3, 'Nokia Mobile', 'Nokia Button Mobile ', 'jgkhjgkljhtioujreidk', '63aa9b4f9ce44.png', 7500.00, 30, 15, '1', '2022-12-27 07:14:23'),
(26, 2, 3, 'Mobile', '1111', '222', '63aaa6e8a2ded.png', 12000.00, 1, 2, '0', '2022-12-27 08:03:52'),
(29, 2, 4, 'Mobile', 'kjjuhunjn5', 'lplolklk0lll58582', '63aaab12cca8b.png', 500.00, 10, 15, '0', '2022-12-27 08:21:38'),
(32, 1, 1, 'Singer plus', 'Singer\r\n', '2315.11', '63aaabd1771e1.png', 25000.00, 8, 5, '1', '2022-12-27 08:24:49'),
(33, 1, 1, 'iron man suit', 'iron', 'omg', '63aaac1d479e9.png', 1000000.00, 5, 10, '1', '2022-12-27 08:26:05'),
(34, 2, 3, 'ghh', '1', 'rft', '63aaac2026f62.png', 500.00, 111, 2, '1', '2022-12-27 08:26:08'),
(35, 2, 4, 'poco m2 Pro Max', 'this is shahin user phone.', 'amiging phone', '63aaac289f7c5.png', 22999.00, 1, 10, '1', '2022-12-27 08:26:16'),
(36, 2, 4, 'iphone 14 promax', 'iphone', '2354', '63aaac74aa3d2.png', 150000.00, 8, 15, '1', '2022-12-27 08:27:32'),
(38, 1, 1, 'LLOY', 'GETTY I', '111', '63aaaceac28f1.png', 120.00, 3, 5, '0', '2022-12-27 08:29:30'),
(41, 2, 4, 'Samsung Galaxy A13', 'SAMSUNG GALAXY A13 - USER OPINIONS AND REVIEWS', 'ghfghkh', '63aaad8294529.png', 23.00, 20, 10, '1', '2022-12-27 08:32:02'),
(46, 1, 2, 'Walton', '1511', '41141', '63ae7a7a59f6a.png', 60000.00, 5, 25, '1', '2022-12-30 05:43:22'),
(48, 1, 1, 'LG', '1215', '5451', '63ae7b02da13d.png', 50000.00, 12, 23, '1', '2022-12-30 05:45:38'),
(49, 1, 1, 'acer ', 'Laptop', '1561', '63ae7b4b4be6b.png', 54000.00, 13, 10, '1', '2022-12-30 05:46:51'),
(50, 2, 4, 'MackBook pro', 'jfkhgu', 'fgerkgjioe', '63ae7b752cfa2.png', 219990.00, 2, 10, '1', '2022-12-30 05:47:33'),
(51, 2, 4, 'Redmi Note8', 'Redmi', '654845', '63ae7b859585d.png', 30000.00, 5, 12, '1', '2022-12-30 05:47:49'),
(56, 2, 4, 'Watch', 'clock', '5458', '63ae7bfeeb131.png', 200.00, 3, 5, '1', '2022-12-30 05:49:50'),
(58, 2, 4, 'as', 'asf', 'bb', '63ae7c773645e.png', 12000.00, 1, 20, '1', '2022-12-30 05:51:51'),
(59, 2, 4, 'Samsung Galaxy Z Fold3 5G', 'htjkghjmg', 'ukyjm67uij', '63ae7c91a4c26.png', 195.00, 21, 16, '1', '2022-12-30 05:52:17'),
(61, 1, 2, 'laptop', 'agfd', 'aa', '63ae7cd9c37a1.png', 50000.00, 1, 30, '1', '2022-12-30 05:53:29'),
(65, 1, 1, 'apple', 'asg', 'ss', '63ae7d231d6af.png', 1000000.00, 1, 50, '1', '2022-12-30 05:54:43'),
(66, 1, 1, 'Smart SEL-32L22KS 32\" HD Basic LED Television', 'Resolution: HD (1360x768) Resolution\r\n2x HDMI, 1x USB, Audio Out\r\nMaterial: Plastic Fiber\r\nPicture Modes: Dynamic, Standard,Soft, User', 'gfnhjgghn gfhjdth', '63ae7d28de59d.png', 14500.00, 14, 15, '1', '2022-12-30 05:54:48'),
(68, 1, 1, 'laptop', 'jjyt', 'jj', '63ae7d5292969.png', 50000.00, 2, 20, '1', '2022-12-30 05:55:30'),
(70, 1, 2, 'man of steel', 'jiot', 'sup', '63ae7dada67be.png', 400000.00, 1, 30, '1', '2022-12-30 05:57:01'),
(71, 2, 4, 'Samsung', 'ewsfa', 'rtfsf', '63ae7ddca3444.png', 200000.00, 1, 12, '0', '2022-12-30 05:57:48'),
(72, 5, 5, 'The world Best Player Jersey', 'The world Best Player Jersey.Messi.', 'The world Best Player Jersey', '63ae7f5c97821.png', 1000.00, 1, 5, '1', '2022-12-30 06:04:12'),
(73, 1, 9, 'Asus vivobook 15 ', 'Ryzen7. 5700u\r\nRam 8Gb,512 gb ssd', 'Ananta er personal Laptop', '63ae8b99e1e51.png', 82500.00, 1, 0, '1', '2022-12-30 06:56:25'),
(74, 5, 6, 'testing db class', 'testing db class insert', 'dbclass01', 'imagenameee.png', 1000.00, 100, 5, '1', '2023-02-03 10:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `description`, `image`, `created_at`) VALUES
(1, 1, 'TV', 'TV', 'tv.png', '2022-12-26 07:48:13'),
(2, 1, 'AC', 'AC', 'ac.png', '2022-12-26 07:48:29'),
(3, 2, 'Button Mobile', 'mobile', 'mobile.png', '2022-12-26 07:48:54'),
(4, 2, 'Smart Mobile', 'smart mobile', 'mobile2.png', '2022-12-26 07:54:35'),
(5, 5, 'Jersey', 'jersey', 'jersey', '2022-12-30 05:58:55'),
(6, 5, 'Football', 'football', 'football', '2022-12-30 05:59:22'),
(7, 5, 'Cricket', 'cricket', 'cricket', '2022-12-30 05:59:39'),
(9, 1, 'Laptop', 'laptop', 'laptop.png', '2022-12-30 06:00:46'),
(10, 1, 'Mobile', 'mobile', 'mobile.png', '2022-12-30 06:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role` set('1','2','3') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$/Xo7PcwqvFEJygj2UllMZunWvPOnJ.M0LiN.FiTFpWJOjLNznEK8m', '2', '2022-12-21 07:45:31'),
(4, 'Iqbal Hossain', 'abcd@gmail.com', '$2y$10$cAZfy3BWyQACvz3aGL7gTeiy7IwhIkWNM14Edj8turit.O8SbupMW', '2', '2022-12-21 07:47:14'),
(5, 'mamun', 'mamun@gmail.com', '$2y$10$LXXoFhw/hYMjBWtToAZCSu.vidUKCuUjNu1chVWhLPTIri9iNOAa2', '2', '2022-12-21 07:47:25'),
(6, 'Ananta Kumar Das', 'anantakumar@gmail.com', '$2y$10$6WS5p9weW5tSpMY1OGbUiO9gHPQqwcXKWlC9LrnJaX2bQ.zqg9Q9.', '2', '2022-12-21 07:48:07'),
(7, 'owishi', 'ohichowdhury25@gmail.com', '$2y$10$/.ZhazhaeIz/wR5nlGptn.tWCw8K0c9MMV6dyP8h66KHe3q9z7ofq', '2', '2022-12-21 07:48:16'),
(8, 'Fatema', 'brazil@gmail.com', '$2y$10$1IhuQl/hLGcNmvxYU/ZNPO7sv4MhrGMI2kO97tA6yX.1ZnWE.Zvy6', '2', '2022-12-21 07:48:19'),
(12, 'ananta', 'abc@gmail.com', '$2y$10$ds9z.wZvpm9Ll9dNR5OmoegLrEDRdmkX0uf2/KnTyZJaYTTq/zt2u', '2', '2022-12-21 08:02:20'),
(19, 'Ridoy', 'ridoymojumder922@gmail.com', '$2y$10$lwgXBdRuF0pjDjcKvEjKLOQUsgo7KadoJGGsuVzWl6XYSorjgFnIu', '2', '2022-12-21 08:13:05'),
(21, 'Najmul', 'abcde@gmail.com', '$2y$10$ZWQ/U.oF0.h88K.M5UgPf.WzRPiOGZzYNGwPvRm0cMWBTAzNeuWkq', '2', '2022-12-21 08:13:47'),
(22, 'nurmohammad', 'nurmohammad@gmail.com', '$2y$10$hZYiGAjdf2quzCNhbwO.QuM2jH8avSq9pyu.1vnOR4qTkYjJUuRpW', '2', '2022-12-21 08:14:03'),
(23, 'sharif', 'sharif1234567th@gmail.com', '$2y$10$ONxIPD/4hvbK0RyRtWv5T.vazydG1auSUemOGdSVIHKjRlrTwyFDW', '2', '2022-12-21 08:15:20'),
(24, 'Akhi', 'akhi@gmail.com', '$2y$10$5Iatqny.DMWDJhnbrcXA6.TYlMLlU4xcfRggTp3Vb2ifJAiwiHnSC', '2', '2022-12-21 08:15:52'),
(25, 'Najmul', 'najmul@gmail.com', '$2y$10$rq.hYr8iJAKmV20ZPxtDOOgfftgb5tZaW4DuAnS2I1NQ9ZiWlxruC', '2', '2022-12-26 07:32:45'),
(26, 'Fatema', 'fatema@gmail.com', '$2y$10$cigzrjVqVyxIQvqj9JFxkeJypp1lMgP.oGZTSrJURCxTtG/GS07jC', '2', '2022-12-26 08:07:28'),
(31, 'owishi', 'owishichowdhury@gmail.com', '$2y$10$orxPkywyBQbmmdkC2DT56uPMAvZ31mEl8ScKME.88wfjqiYW5zRO2', '2', '2022-12-26 09:00:48'),
(32, 'khusnur Akther', 'adibaakhi@gmail.com', '$2y$10$Tr/Lx7ld7iMePaAwEgFM6eoKZv1rDe0j.50zod.mQUgNgQumRaK6.', '2', '2022-12-26 09:01:13'),
(35, 'Ananta', 'ananta@gmail.com', '$2y$10$KbMOU8IZQABOwHmYlKy19.PA8fWCwvr34Ng9vt08qUeyE/tUHG/VO', '2', '2022-12-27 06:34:25'),
(36, 'Rabbi ', 'rabbi@gmail.com', '$2y$10$2muWrv9b5Pt5V4GrigE/iuOAAuGg02SFQOQbwJUs3Yx/15mXZwRdi', '2', '2022-12-27 06:36:39'),
(42, 'owishi', 'chowdhuryowishi@gmail.com', '$2y$10$rwM2On7t/xvHTb.UFl0nbuxFIojC9N0XKNdn8mSmU7bcYz0/p.EnG', '2', '2022-12-27 06:41:17'),
(43, 'Rabbi Hossain', 'shantooo123@gmail.com', '$2y$10$0WHeoK1koFgf.OnCt49lJ.xWZ9S9y1QrY.eOw88YFOfscSe7.ccg.', '2', '2022-12-27 06:41:47'),
(45, 'Shahin Hossain', 'shshahin61@gmail.com', '$2y$10$caEEJdlC9VgTf2B5yEmmluB8Q.2CUXlPj6k/SZ2F3piM8f.utaDFG', '2', '2022-12-27 06:44:15'),
(55, 'shanto', 'shantooo383@gmail.com', '$2y$10$ZPvuyCHrQwI1IVs6IBkycekn9ab2OtHOhzujcYhqKccwNna7j./Va', '2', '2022-12-27 06:49:51'),
(84, 'khusnur akther', 'akhi@mail.com', '$2y$10$HTeJyznRBb6/vsKcgW.H8OkhB6R58ysX3umqCKDnag3blo1n74j5O', '1', '2022-12-30 05:44:19'),
(85, 'MAJEDA AKTER', 'majeda123@gmail.com', '$2y$10$fatVJICgQD6KHY4UTYuda.zAF54JvXAz8WBi3O6wEWbImjZMoGLR2', '1', '2022-12-30 05:44:40'),
(86, 'Israt Jahan ', 'promi1199if@gmail.com', '$2y$10$9ecC.JmATQo9K/UZ2gdnReW0IBDzoKkTISWF63de2t/h9t0VpeS4.', '1', '2022-12-30 05:49:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
