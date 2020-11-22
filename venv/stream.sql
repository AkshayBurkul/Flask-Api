-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2020 at 03:51 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stream`
--

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--
-- Error reading structure for table stream.stream: #1932 - Table 'stream.stream' doesn't exist in engine
-- Error reading data for table stream.stream: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `stream`.`stream`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `stream_data`
--

CREATE TABLE `stream_data` (
  `id` int(11) NOT NULL,
  `stream_name` text NOT NULL,
  `description` varchar(50) NOT NULL,
  `enabled_stream` text NOT NULL,
  `video_source_type` varchar(11) NOT NULL,
  `resolution` varchar(20) NOT NULL,
  `frame_rate` varchar(11) NOT NULL,
  `recording_quality` varchar(20) NOT NULL,
  `video_length` int(11) NOT NULL,
  `auto_schedule` varchar(11) NOT NULL,
  `schedule_start` varchar(20) NOT NULL,
  `schedule_end` varchar(20) NOT NULL,
  `enabled_compression` varchar(11) NOT NULL,
  `compression_quality` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stream_data`
--

INSERT INTO `stream_data` (`id`, `stream_name`, `description`, `enabled_stream`, `video_source_type`, `resolution`, `frame_rate`, `recording_quality`, `video_length`, `auto_schedule`, `schedule_start`, `schedule_end`, `enabled_compression`, `compression_quality`) VALUES
(34, 'Camera2', 'Stream from Camera2', 'true', 'H264', 'Low(640x480)', '7fps', 'Medium', 44, 'true', '2020-07-01 3:00:00', '2020-07-01 5:00:00', 'false', 66),
(44, 'Camera1', 'stream from camera 1', 'false', 'H264', 'Medium(1280x720)', '9fps', 'High', 55, 'false', '2020-07-01 2:00:00', '2020-07-01 3:00:00', 'false', 44);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stream_data`
--
ALTER TABLE `stream_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stream_data`
--
ALTER TABLE `stream_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
