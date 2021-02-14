-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 12:40 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cname` varchar(20) NOT NULL,
  `Cid` varchar(5) NOT NULL,
  `Sid` varchar(5) NOT NULL,
  `City` varchar(15) NOT NULL,
  `Phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cname`, `Cid`, `Sid`, `City`, `Phone`) VALUES
('ruthwik', 'c1', '11', 'ban', '879898798');

-- --------------------------------------------------------

--
-- Table structure for table `ord`
--

CREATE TABLE `ord` (
  `Ord_id` varchar(5) NOT NULL,
  `Sid` varchar(5) NOT NULL,
  `Cid` varchar(5) NOT NULL,
  `Pamount` int(11) NOT NULL,
  `date_of_purchase` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ord`
--

INSERT INTO `ord` (`Ord_id`, `Sid`, `Cid`, `Pamount`, `date_of_purchase`) VALUES
('o1', '11', 'c1', 1000, '2019-11-01');

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
-- Dumping data for table `ordercontains`
--

INSERT INTO `ordercontains` (`Ord_id`, `Pid`, `Qop`) VALUES
('o1', 'p1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Pid` varchar(5) NOT NULL,
  `Pname` varchar(20) NOT NULL,
  `Myear` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Pid`, `Pname`, `Myear`) VALUES
('p1', 'rtx2080', 2014);

-- --------------------------------------------------------

--
-- Table structure for table `productquantity`
--

CREATE TABLE `productquantity` (
  `Pid` varchar(5) NOT NULL,
  `Pnum` varchar(5) NOT NULL,
  `Sh_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productquantity`
--

INSERT INTO `productquantity` (`Pid`, `Pnum`, `Sh_id`) VALUES
('p1', '2', 's1');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`firstname`, `lastname`, `email`, `Username`, `Password`) VALUES
('shreyas', 'srikanth', 'ss@123', 'shr123', 'sss'),
('varun', 'venkat', 'abc@123', 'shr1234', 'ssshh'),
('sachin', 'tendulkar', 'sachin@123', 'sachin12', 'sachin@12');

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `Sid` varchar(5) NOT NULL,
  `Sname` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Sh_id` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`Sid`, `Sname`, `City`, `Sh_id`) VALUES
('11', 'rahul', 'ban', 's1'),
('12', 'shreyas', 'ban', 's1');

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

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`Sh_id`, `Sh_name`, `Sh_city`, `Sh_number`) VALUES
('s1', 'glassgow', 'ban', 123456789),
('s2', 'ankithinfotec', 'mysore', 987654321);

-- --------------------------------------------------------

--
-- Table structure for table `shopbranch`
--

CREATE TABLE `shopbranch` (
  `Sh_id` varchar(4) NOT NULL,
  `Bname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopbranch`
--

INSERT INTO `shopbranch` (`Sh_id`, `Bname`) VALUES
('s1', 'mg road'),
('s2', 'mg road');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cid`),
  ADD KEY `e3` (`Sid`);

--
-- Indexes for table `ord`
--
ALTER TABLE `ord`
  ADD PRIMARY KEY (`Ord_id`,`Sid`,`Cid`),
  ADD KEY `e8` (`Sid`),
  ADD KEY `e9` (`Cid`);

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
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `e3` FOREIGN KEY (`Sid`) REFERENCES `salesman` (`Sid`);

--
-- Constraints for table `ord`
--
ALTER TABLE `ord`
  ADD CONSTRAINT `e8` FOREIGN KEY (`Sid`) REFERENCES `salesman` (`Sid`),
  ADD CONSTRAINT `e9` FOREIGN KEY (`Cid`) REFERENCES `customer` (`Cid`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
