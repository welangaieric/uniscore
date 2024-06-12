-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 03:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniscore`
--

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `lecturerName` varchar(60) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `lecturerName`, `phone`, `email`) VALUES
(1, 'welangai eric mmasi', '0110517055', 'welangaieric@gmail.c');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `studentAdm` varchar(60) NOT NULL,
  `unitName` varchar(60) NOT NULL,
  `unitCode` varchar(15) NOT NULL,
  `Marks` int(3) NOT NULL,
  `semester` int(2) NOT NULL,
  `academicYear` varchar(10) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `studentAdm`, `unitName`, `unitCode`, `Marks`, `semester`, `academicYear`) VALUES
(1, 'welangai', 'data structures', 'scs401', 50, 2, '0000'),
(2, 'bse230', 'datastructures', 'scs230', 20, 1, '2023-2024'),
(3, 'bse230', 'calculus', 'amm210', 70, 1, '2023-2024');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `studentName` varchar(30) NOT NULL,
  `course` varchar(60) NOT NULL,
  `year` year(4) NOT NULL,
  `semester` int(2) NOT NULL,
  `stdAdm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `studentName`, `course`, `year`, `semester`, `stdAdm`) VALUES
(1, 'welangai eric', 'software', '2001', 1, 'bse230');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `lecturerName` varchar(60) NOT NULL,
  `unitName` varchar(15) NOT NULL,
  `unitCode` varchar(7) NOT NULL,
  `lecID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `phone`, `email`, `password`, `date_created`, `role`) VALUES
(1, 'John', 'Doe', '123-456-7890', 'john.doe@example.com', 'password123', '2024-05-31 12:43:07', 'admin'),
(2, 'Jane', 'Smith', '234-567-8901', 'jane.smith@example.com', 'password123', '2024-05-31 12:43:07', 'admin'),
(3, 'Alice', 'Johnson', '345-678-9012', 'alice.johnson@example.com', 'password123', '2024-05-31 12:43:07', 'admin'),
(4, 'Bob', 'Brown', '456-789-0123', 'bob.brown@example.com', 'password123', '2024-05-31 12:43:07', 'admin'),
(5, 'Carol', 'Davis', '567-890-1234', 'carol.davis@example.com', 'password123', '2024-05-31 12:43:07', 'admin'),
(6, 'Tom', 'Clark', '678-901-2345', 'tom.clark@example.com', 'password123', '2024-05-31 12:43:07', 'lecturer'),
(7, 'Sara', 'Lewis', '789-012-3456', 'sara.lewis@example.com', 'password123', '2024-05-31 12:43:07', 'lecturer'),
(8, 'Mike', 'Robinson', '890-123-4567', 'mike.robinson@example.com', 'password123', '2024-05-31 12:43:07', 'lecturer'),
(9, 'Linda', 'Walker', '901-234-5678', 'linda.walker@example.com', 'password123', '2024-05-31 12:43:07', 'lecturer'),
(10, 'James', 'Hall', '012-345-6789', 'james.hall@example.com', 'password123', '2024-05-31 12:43:07', 'lecturer'),
(11, 'Emma', 'Young', '123-456-7891', 'emma.young@example.com', 'password123', '2024-05-31 12:43:07', 'lecturer'),
(15, 'Sophia', 'Adams', '567-890-1235', 'sophia.adams@example.com', 'password123', '2024-05-31 12:43:07', 'student'),
(16, 'eric', 'Baker', '11057455215', 'daniel.baker@example.com', 'password123', '2024-05-31 12:43:07', 'student'),
(17, 'Olivia', 'Campbell', '789-012-3457', 'olivia.campbell@example.com', 'password123', '2024-05-31 12:43:07', 'student'),
(18, 'Henry', 'Mitchell', '890-123-4568', 'henry.mitchell@example.com', 'password123', '2024-05-31 12:43:07', 'student'),
(21, 'welangai', 'Adams', '24567768', 'welangai.adams@example.com', 'password123', '2024-06-05 11:16:43', 'student'),
(24, 'welangai', 'Adams', '245677685', 'er.adams@example.com', 'password123', '2024-06-05 11:18:30', 'student'),
(25, 'Eric', 'Welangai', '0110517055', 'welangaieric@gmail.com', 'kdxdhg3u', '2024-06-05 15:33:55', 'student'),
(26, 'welangai', 'mmasi', '0110517056', 'welangai.eric@gmail.com', '4wjfrdqi', '2024-06-05 15:59:32', 'student'),
(30, 'welangai', 'mmasi', '01151055', 'welangairic@gmail.com', 'wqsupssr', '2024-06-05 16:05:48', 'student'),
(31, 'welangai', 'mmasi', '0110527055', 'welngaieric@gmail.com', 'hialfvy9', '2024-06-08 10:32:50', 'lecturer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
