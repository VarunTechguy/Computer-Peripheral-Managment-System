-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 03:39 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `from`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `order` ()  NO SQL
SELECT * FROM ord$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `products` ()  NO SQL
SELECT* FROM productquantity$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `s1` ()  NO SQL
SELECT * FROM salesman$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shop` ()  NO SQL
select * FROM shop$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ord`
--

CREATE TABLE `ord` (
  `Ord_id` varchar(5) NOT NULL,
  `Sname` varchar(20) NOT NULL,
  `Cname` varchar(20) NOT NULL,
  `date_of_purchase` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordercontains`
--

CREATE TABLE `ordercontains` (
  `Ord_id` varchar(5) NOT NULL,
  `Pid` varchar(5) NOT NULL,
  `Qop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `ordercontains`
--
DELIMITER $$
CREATE TRIGGER `t1` AFTER INSERT ON `ordercontains` FOR EACH ROW UPDATE productquantity SET productquantity.Pnum=productquantity.Pnum-NEW.Qop
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Pid` varchar(5) NOT NULL,
  `Pname` varchar(20) NOT NULL,
  `Myear` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productquantity`
--

CREATE TABLE `productquantity` (
  `Pid` varchar(5) NOT NULL,
  `Pnum` varchar(5) NOT NULL,
  `Sh_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `Sid` varchar(5) NOT NULL,
  `Sname` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Sh_id` varchar(4) NOT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `Sh_id` varchar(5) NOT NULL,
  `Sh_name` varchar(20) NOT NULL,
  `Sh_city` varchar(20) NOT NULL,
  `Sh_number` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shopbranch`
--

CREATE TABLE `shopbranch` (
  `Sh_id` varchar(4) NOT NULL,
  `Bname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sord`
--

CREATE TABLE `sord` (
  `Ord_id` int(11) NOT NULL,
  `Pid` varchar(20) NOT NULL,
  `Pquantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `sord`
--
DELIMITER $$
CREATE TRIGGER `t4` AFTER INSERT ON `sord` FOR EACH ROW UPDATE productquantity SET productquantity.Pnum=productquantity.Pnum+NEW.Pquantity
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ordercontains`
--
ALTER TABLE `ordercontains`
  ADD PRIMARY KEY (`Ord_id`,`Pid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Pid`);

--
-- Indexes for table `productquantity`
--
ALTER TABLE `productquantity`
  ADD PRIMARY KEY (`Pid`,`Sh_id`),
  ADD KEY `e5` (`Sh_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`Sid`),
  ADD KEY `e2` (`Sh_id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`Sh_id`);

--
-- Indexes for table `shopbranch`
--
ALTER TABLE `shopbranch`
  ADD PRIMARY KEY (`Sh_id`,`Bname`);

--
-- Indexes for table `sord`
--
ALTER TABLE `sord`
  ADD KEY `d1` (`Pid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productquantity`
--
ALTER TABLE `productquantity`
  ADD CONSTRAINT `e5` FOREIGN KEY (`Sh_id`) REFERENCES `shop` (`Sh_id`),
  ADD CONSTRAINT `e6` FOREIGN KEY (`Pid`) REFERENCES `product` (`Pid`);

--
-- Constraints for table `salesman`
--
ALTER TABLE `salesman`
  ADD CONSTRAINT `e2` FOREIGN KEY (`Sh_id`) REFERENCES `shop` (`Sh_id`);

--
-- Constraints for table `shopbranch`
--
ALTER TABLE `shopbranch`
  ADD CONSTRAINT `e1` FOREIGN KEY (`Sh_id`) REFERENCES `shop` (`Sh_id`),
  ADD CONSTRAINT `e4` FOREIGN KEY (`Sh_id`) REFERENCES `shop` (`Sh_id`);

--
-- Constraints for table `sord`
--
ALTER TABLE `sord`
  ADD CONSTRAINT `d1` FOREIGN KEY (`Pid`) REFERENCES `product` (`Pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
