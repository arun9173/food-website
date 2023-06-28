-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2023 at 08:11 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freshfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(3) NOT NULL,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `adminname`, `email`, `mypassword`, `created_at`) VALUES
(2, 'admin.first', 'admin.first@gmail.com', '$2y$10$9VMoQs5pdZrZDdoDXCBjC.NxhhD0NGxSyQHjqHuzPW7yGCUh6Zljm', '2023-05-11 16:02:16'),
(3, 'admin.second', 'admin.second@gmail.com', '$2y$10$28BHdqHMp8pOh3H4xZXSDuh71UmJpTiQrrtinZVf5GtlD2kIwAGfa', '2023-05-12 09:55:31'),
(4, 'admin.third', 'admin.third@gmail.com', '$2y$10$9O4jdNqiSAHRf3GGdtXX5.cO7DHrPfufonSOzRDPVmQ7G5YBNGLgS', '2023-06-19 09:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(3) NOT NULL,
  `pro_id` int(3) NOT NULL,
  `pro_title` varchar(200) NOT NULL,
  `pro_image` varchar(200) NOT NULL,
  `pro_price` int(10) NOT NULL,
  `pro_qty` int(10) NOT NULL,
  `pro_subtotal` int(10) NOT NULL,
  `user_id` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `pro_id`, `pro_title`, `pro_image`, `pro_price`, `pro_qty`, `pro_subtotal`, `user_id`, `created_at`) VALUES
(33, 4, 'FRUITS', 'fruits.jpg', 60, 1, 60, 7, '2023-06-09 08:59:28'),
(36, 1, 'VEGETABLES', 'vegetables.jpg', 30, 1, 30, 9, '2023-06-25 10:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `icon`, `description`, `created_at`) VALUES
(1, 'VEGETABLES\r\n', 'vegetables.jpg', 'bistro-carrot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', '2023-05-05 11:41:14'),
(2, 'MEATS', 'meats.jpg', 'bistro-roast-leg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', '2023-05-05 11:41:14'),
(3, 'FISHES', 'fish.jpg', 'bistro-fish-1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', '2023-05-05 12:10:53'),
(4, 'FRUITS', 'fruits.jpg', 'bistro-apple', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', '2023-05-05 12:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `zip_code` int(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `order_notes` text NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'sent to admins',
  `price` int(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `lname`, `company_name`, `address`, `city`, `country`, `zip_code`, `email`, `phone_number`, `order_notes`, `status`, `price`, `user_id`, `created_at`) VALUES
(12, 'ARUN', 'KUMAR SINGH', 'ak_company', 'hno.149, gali no.7,harphool vihar', 'delhi', 'india', 110043, 'arunkumar47883@gmail.com', '9090909090', 'None', 'delivered', 60, 9, '2023-06-18 12:19:21'),
(13, 'ARUN', 'KUMAR SINGH', 'ak_company', 'Dwarka', 'delhi', 'india', 110043, 'arun@gmail.com', '8980890989', 'none', 'sent to admins', 30, 9, '2023-06-25 10:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(10) NOT NULL,
  `quantity` int(3) NOT NULL DEFAULT 1,
  `image` varchar(200) NOT NULL,
  `exp_date` varchar(200) NOT NULL,
  `category_id` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `quantity`, `image`, `exp_date`, `category_id`, `status`, `created_at`) VALUES
(1, 'VEGETABLES', 'Nulla ac sapien tincidunt, imperdiet massa eget, elementum sapien. Nulla tincidunt erat in ipsum ornare tempor.', '30', 1, 'vegetables.jpg', '2025', 1, 1, '2023-05-06 11:00:23'),
(2, 'MEATS', 'Nulla ac sapien tincidunt, imperdiet massa eget, elementum sapien. Nulla tincidunt erat in ipsum ornare tempor.', '150', 1, 'meats.jpg', '2023', 2, 1, '2023-05-06 11:00:23'),
(3, 'FISHES', 'Nulla ac sapien tincidunt, imperdiet massa eget, elementum sapien. Nulla tincidunt erat in ipsum ornare tempor.', '100', 1, 'fish.jpg', '2024', 3, 1, '2023-05-06 11:33:16'),
(4, 'FRUITS', 'Nulla ac sapien tincidunt, imperdiet massa eget, elementum sapien. Nulla tincidunt erat in ipsum ornare tempor.', '60', 1, 'fruits.jpg', '2025', 4, 1, '2023-05-06 11:33:16'),
(5, 'MEAT LOAF', 'Nulla ac sapien tincidunt, imperdiet massa eget, elementum sapien. Nulla tincidunt erat in ipsum ornare tempor.', '250', 1, 'meats.jpg', '2024', 2, 1, '2023-05-06 13:48:52'),
(6, 'TOMATOS', 'Ajbllnlfdn,Nulla ac sapien tincidunt, imperdiet massa eget, elementum sapien. Nulla tincidunt erat in ipsum ornare tempor.', '20', 1, 'vegetables.jpg', '2024', 1, 1, '2023-05-06 13:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `zip_code` int(10) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `username`, `mypassword`, `image`, `address`, `city`, `country`, `zip_code`, `phone_number`, `created_at`) VALUES
(7, 'pooja kumari', 'pooja@gmail.com', 'adam', '$2y$10$9VMoQs5pdZrZDdoDXCBjC.NxhhD0NGxSyQHjqHuzPW7yGCUh6Zljm', 'user.png', 'dwarka mor delhi 110043', 'kerla', 'india', 98001, '9599801158', '2023-05-03 11:43:50'),
(9, 'Arun', 'arun@gmail.com', 'arun123', '$2y$10$dZsF8s0TgEe3eR9FP5.xEe8EU/ozdIwJgcJKTfppaCWaEahL7n1FC', 'user.png', NULL, NULL, NULL, NULL, NULL, '2023-06-18 11:51:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
