-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 05:24 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `tp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `fname`, `lname`, `tp`, `email`, `nic`, `dob`) VALUES
(6, 'Supun', 'Rasanga', '777123456', 'supun@gmail.com', '20001234567V', '2000-06-04'),
(4, 'Kavindu', 'Pathirana', '776281076', 'kavindu@gmail.com', '981560191V', '2022-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `emp_jobdepartment`
--

CREATE TABLE `emp_jobdepartment` (
  `job_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `appoint_date` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_jobdepartment`
--

INSERT INTO `emp_jobdepartment` (`job_id`, `emp_id`, `job_title`, `department`, `appoint_date`) VALUES
(6, 4, 'SE', 'ISD', '2022-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `sal_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `epf_etf` int(11) NOT NULL,
  `allowance` int(11) NOT NULL,
  `ot_per_hour` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`sal_id`, `emp_id`, `basic_salary`, `epf_etf`, `allowance`, `ot_per_hour`) VALUES
(1, 4, 35000, 4800, 10000, 150);

-- --------------------------------------------------------

--
-- Table structure for table `time_sheet`
--

CREATE TABLE `time_sheet` (
  `sheet_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `intime` varchar(100) NOT NULL,
  `outtime` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_sheet`
--

INSERT INTO `time_sheet` (`sheet_id`, `emp_id`, `intime`, `outtime`, `reason`, `date`) VALUES
(4, 4, '23:12', '01:13', 'Reason2', '2022-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `tp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lname`, `tp`, `email`, `nic`, `dob`, `password`, `user_type`) VALUES
(3, 'Kavindu', 'Pathirana', '0776281076', 'kavindu@gmail.com', '981560191V', '1998-06-04', '1234', 'User'),
(2, 'Admin', 'User', '0777123456', 'admin@gmail.com', '991234567V', '1999-06-04', '1234', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `emp_jobdepartment`
--
ALTER TABLE `emp_jobdepartment`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`sal_id`);

--
-- Indexes for table `time_sheet`
--
ALTER TABLE `time_sheet`
  ADD PRIMARY KEY (`sheet_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `emp_jobdepartment`
--
ALTER TABLE `emp_jobdepartment`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `sal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `time_sheet`
--
ALTER TABLE `time_sheet`
  MODIFY `sheet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
