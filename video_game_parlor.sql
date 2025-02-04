-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 04, 2025 at 07:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_game_parlor`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

CREATE TABLE `Bookings` (
  `BookingID` int(11) NOT NULL,
  `SessionID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `MemberStatus` char(1) DEFAULT NULL,
  `Fee` decimal(10,2) DEFAULT NULL,
  `PrePaid` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`BookingID`, `SessionID`, `CustomerID`, `BookingDate`, `MemberStatus`, `Fee`, `PrePaid`) VALUES
(1, 1, 1, '2024-07-22', 'Y', NULL, NULL),
(2, 1, 2, '2024-07-22', 'N', 1500.00, 'N'),
(3, 1, 3, '2024-07-22', 'Y', 1000.00, 'Y'),
(4, 2, 4, '2024-07-22', 'Y', 1000.00, 'N'),
(5, 4, NULL, '2024-07-05', 'Y', 1000.00, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `Consoles`
--

CREATE TABLE `Consoles` (
  `ConsoleID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `PEGI` varchar(10) DEFAULT NULL,
  `ConsoleType` varchar(50) DEFAULT NULL,
  `ConsoleQty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Consoles`
--

INSERT INTO `Consoles` (`ConsoleID`, `Name`, `PEGI`, `ConsoleType`, `ConsoleQty`) VALUES
(1, 'Elden Ring: Shadow of the Erdtree', 'PG', 'XBOX 360', 3),
(2, 'Final Fantasy VII Rebirth', 'PG', 'PS3', 2),
(3, 'Destiny 2: The Final Shape', 'PG', 'PS2', 3),
(4, 'Tekken 8', 'PG', 'PS3', 2),
(5, 'Persona 3 Reload', 'PG', 'NINTENDO 64', 2),
(6, 'Cavern of Dreams', '15', 'NINTENDO SWITCH', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `MemberType` varchar(50) DEFAULT NULL,
  `MembershipFee` decimal(10,2) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `FirstName`, `Surname`, `Address`, `MemberType`, `MembershipFee`, `JoinDate`, `DateOfBirth`) VALUES
(1, 'Saanvi', 'Bhatta', 'Baneswhor, Kathmandu', 'Standard', 1500.00, '2024-01-01', '2015-03-01'),
(2, 'Bill', 'Gates', 'Maitidevi, Kathmandu', 'Premium', 20000.00, '2024-07-06', '2001-10-12'),
(3, 'Elon', 'Musk', 'Putalisadak, Kathmandu', 'Premium', 20000.00, '2024-03-28', '2003-07-20'),
(4, 'Kamala', 'Harris', 'Kapan, Kathmandu', 'Standard', 1500.00, '2024-01-05', '1973-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `Machines`
--

CREATE TABLE `Machines` (
  `MachineID` int(11) NOT NULL,
  `Game` varchar(100) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Machines`
--

INSERT INTO `Machines` (`MachineID`, `Game`, `Year`, `Floor`) VALUES
(1, 'COC', 2010, 1),
(3, 'Spiderman', 2016, 2),
(4, 'PUBG', 2004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `SessionConsoles`
--

CREATE TABLE `SessionConsoles` (
  `SessionID` int(11) NOT NULL,
  `SessionDate` date NOT NULL,
  `ConsoleID` int(11) NOT NULL,
  `ConsoleQty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SessionConsoles`
--

INSERT INTO `SessionConsoles` (`SessionID`, `SessionDate`, `ConsoleID`, `ConsoleQty`) VALUES
(1, '2024-07-22', 1, 2),
(2, '2024-07-22', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE `Sessions` (
  `SessionID` int(11) NOT NULL,
  `SessionDay` varchar(20) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `SessionType` varchar(20) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sessions`
--

INSERT INTO `Sessions` (`SessionID`, `SessionDay`, `StartTime`, `EndTime`, `SessionType`, `Floor`, `Price`) VALUES
(1, 'Sunday', '09:00:00', '21:00:00', 'Free', 1, 1500.00),
(2, 'Sunday', '09:00:00', '21:00:00', 'Free', 2, 1000.00),
(3, 'Saturday', '09:00:00', '21:00:00', 'Free', 1, 1500.00),
(4, 'Friday', '18:00:00', '22:00:00', 'Special', 2, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `SessionStaff`
--

CREATE TABLE `SessionStaff` (
  `SessionID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SessionStaff`
--

INSERT INTO `SessionStaff` (`SessionID`, `StaffID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `StaffID` int(11) NOT NULL,
  `StaffName` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`StaffID`, `StaffName`, `Role`) VALUES
(1, 'Sagar Aryal', 'Cafe'),
(2, 'Bikesh Khagdi', 'Maintenance'),
(3, 'Saroj Sapkota', 'Counter'),
(4, 'Jonathan Shrestha', 'Counter'),
(5, 'Rohan Chaudhary', 'Maintenance'),
(6, 'Rajeev Karmacharya', 'Cafe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `fk_bookings_sessions` (`SessionID`),
  ADD KEY `fk_bookings_customers` (`CustomerID`);

--
-- Indexes for table `Consoles`
--
ALTER TABLE `Consoles`
  ADD PRIMARY KEY (`ConsoleID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Machines`
--
ALTER TABLE `Machines`
  ADD PRIMARY KEY (`MachineID`);

--
-- Indexes for table `SessionConsoles`
--
ALTER TABLE `SessionConsoles`
  ADD PRIMARY KEY (`SessionID`,`SessionDate`,`ConsoleID`),
  ADD KEY `ConsoleID` (`ConsoleID`);

--
-- Indexes for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `SessionStaff`
--
ALTER TABLE `SessionStaff`
  ADD PRIMARY KEY (`SessionID`,`StaffID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Consoles`
--
ALTER TABLE `Consoles`
  MODIFY `ConsoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Machines`
--
ALTER TABLE `Machines`
  MODIFY `MachineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Sessions`
--
ALTER TABLE `Sessions`
  MODIFY `SessionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bookings_customers` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bookings_sessions` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SessionConsoles`
--
ALTER TABLE `SessionConsoles`
  ADD CONSTRAINT `sessionconsoles_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessionconsoles_ibfk_2` FOREIGN KEY (`ConsoleID`) REFERENCES `Consoles` (`ConsoleID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SessionStaff`
--
ALTER TABLE `SessionStaff`
  ADD CONSTRAINT `sessionstaff_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessionstaff_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
