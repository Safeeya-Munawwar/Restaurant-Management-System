-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2025 at 11:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tablesnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminemployeenew`
--

CREATE TABLE `adminemployeenew` (
  `employee_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `hours_of_work` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminemployeenew`
--

INSERT INTO `adminemployeenew` (`employee_id`, `full_name`, `date_of_birth`, `address`, `phone`, `email`, `job_title`, `hours_of_work`, `salary`) VALUES
(1, 'Nilo', '2010-01-04', '12, A1 Road, Kandy', '0771234567', 'nilo@gmail.com', 'Assitant Chef', '10', 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `menunew`
--

CREATE TABLE `menunew` (
  `item_id` int(11) NOT NULL,
  `item_category` varchar(50) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menunew`
--

INSERT INTO `menunew` (`item_id`, `item_category`, `item_name`, `item_price`) VALUES
(1, 'Juice', 'Watermelon Juice', 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `ordersnew`
--

CREATE TABLE `ordersnew` (
  `order_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `table_number` int(11) DEFAULT NULL,
  `item_ordered_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordersnew`
--

INSERT INTO `ordersnew` (`order_id`, `reservation_id`, `table_number`, `item_ordered_name`, `quantity`, `amount`, `total_amount`) VALUES
(1, 1, 1, 'Submarine - Chicken', 2, 990.00, 1980.00),
(3, 3, 1, 'Beverages - Lemon N Ginger', 6, 350.00, 2100.00),
(4, 4, 4, 'Starters - French Fries with Chicken', 19, 790.00, 15010.00);

-- --------------------------------------------------------

--
-- Table structure for table `paymentsnew`
--

CREATE TABLE `paymentsnew` (
  `reservation_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `grandtotal_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservationnew`
--

CREATE TABLE `reservationnew` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `numberofguests` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `table_number` varchar(20) DEFAULT NULL,
  `specialoccasion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservationnew`
--

INSERT INTO `reservationnew` (`id`, `first_name`, `last_name`, `numberofguests`, `email`, `phone`, `date`, `time`, `table_number`, `specialoccasion`) VALUES
(1, 'Safeeya', 'Munawwar', 2, 'safi@gmail.com', '0771234567', '2025-07-26', '00:00:00', '1', 'Birth Day Celebration'),
(2, 'Safeeya', 'Munawwar', 2, 'xyz@gmail.com', '0765412345', '2025-07-26', '12:38:00', '1', 'Birth Day Celebration'),
(3, 'John', 'Smith', 6, 'john@gmail.com', '0771234567', '2025-07-31', '14:17:00', '2', 'Birth Day Celebration'),
(4, 'Nuwan', 'Bandara', 19, 'nuwan@gmail.com', '+94 771 234 56', '2025-08-08', '14:39:00', '4', 'Gathering');

-- --------------------------------------------------------

--
-- Table structure for table `tablesnew`
--

CREATE TABLE `tablesnew` (
  `id` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `table_number` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminemployeenew`
--
ALTER TABLE `adminemployeenew`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `menunew`
--
ALTER TABLE `menunew`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `ordersnew`
--
ALTER TABLE `ordersnew`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `paymentsnew`
--
ALTER TABLE `paymentsnew`
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `table_id` (`table_id`);

--
-- Indexes for table `reservationnew`
--
ALTER TABLE `reservationnew`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tablesnew`
--
ALTER TABLE `tablesnew`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_id` (`table_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminemployeenew`
--
ALTER TABLE `adminemployeenew`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menunew`
--
ALTER TABLE `menunew`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ordersnew`
--
ALTER TABLE `ordersnew`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservationnew`
--
ALTER TABLE `reservationnew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tablesnew`
--
ALTER TABLE `tablesnew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordersnew`
--
ALTER TABLE `ordersnew`
  ADD CONSTRAINT `ordersnew_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservationnew` (`id`);

--
-- Constraints for table `paymentsnew`
--
ALTER TABLE `paymentsnew`
  ADD CONSTRAINT `paymentsnew_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservationnew` (`id`),
  ADD CONSTRAINT `paymentsnew_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `tablesnew` (`table_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
