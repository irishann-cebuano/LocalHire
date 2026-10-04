-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2026 at 05:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_localhire`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_applications`
--

CREATE TABLE `tb_applications` (
  `application_id` int(11) NOT NULL,
  `job_seeker_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `resume` varchar(255) DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_businesses`
--

CREATE TABLE `tb_businesses` (
  `business_id` int(11) NOT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `business_type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_job_postings`
--

CREATE TABLE `tb_job_postings` (
  `job_id` int(11) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `job_type` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_job_seekers`
--

CREATE TABLE `tb_job_seekers` (
  `job_seeker_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `education` varchar(250) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `resume` varchar(250) DEFAULT NULL,
  `seeker_type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_job_seekers`
--

INSERT INTO `tb_job_seekers` (`job_seeker_id`, `name`, `email`, `password`, `phone`, `education`, `skills`, `experience`, `resume`, `seeker_type`, `created_at`) VALUES
(1, 'Juan Dela Cruz', 'juan@gmail.com', '$2y$10$CDmSUn2T9bzqjvDXGkecQuWyDwvAbw0XobnXFndH.Nq11QLJbu3ry', '+9123456789', NULL, NULL, NULL, NULL, NULL, '2026-10-04 02:56:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_applications`
--
ALTER TABLE `tb_applications`
  ADD PRIMARY KEY (`application_id`),
  ADD UNIQUE KEY `job_seeker_id` (`job_seeker_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `tb_businesses`
--
ALTER TABLE `tb_businesses`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `tb_job_postings`
--
ALTER TABLE `tb_job_postings`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `business_id` (`business_id`);

--
-- Indexes for table `tb_job_seekers`
--
ALTER TABLE `tb_job_seekers`
  ADD PRIMARY KEY (`job_seeker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_applications`
--
ALTER TABLE `tb_applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_businesses`
--
ALTER TABLE `tb_businesses`
  MODIFY `business_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_job_postings`
--
ALTER TABLE `tb_job_postings`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_job_seekers`
--
ALTER TABLE `tb_job_seekers`
  MODIFY `job_seeker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_applications`
--
ALTER TABLE `tb_applications`
  ADD CONSTRAINT `tb_applications_ibfk_1` FOREIGN KEY (`job_seeker_id`) REFERENCES `tb_job_seekers` (`job_seeker_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_applications_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `tb_job_postings` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_job_postings`
--
ALTER TABLE `tb_job_postings`
  ADD CONSTRAINT `tb_job_postings_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `tb_businesses` (`business_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
