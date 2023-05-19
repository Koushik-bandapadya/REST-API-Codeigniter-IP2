-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 03:08 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing1`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_catagory`
--

CREATE TABLE `client_catagory` (
  `id` int(16) NOT NULL,
  `client_type` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_catagory`
--

INSERT INTO `client_catagory` (`id`, `client_type`) VALUES
(1, 'Distributor'),
(2, 'Dealer'),
(3, 'Wholesaler'),
(4, 'Retailer');

-- --------------------------------------------------------

--
-- Table structure for table `client_info`
--

CREATE TABLE `client_info` (
  `id` int(32) NOT NULL,
  `catagory_id` int(32) NOT NULL,
  `client_code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `contact_number` varchar(16) DEFAULT NULL,
  `email` varchar(16) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `office_id` int(16) DEFAULT NULL,
  `client_parent_id` int(16) DEFAULT NULL,
  `handler_id` int(16) NOT NULL,
  `client_pairID` varchar(16) NOT NULL,
  `client_contacted` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_info`
--

INSERT INTO `client_info` (`id`, `catagory_id`, `client_code`, `name`, `contact_number`, `email`, `address`, `office_id`, `client_parent_id`, `handler_id`, `client_pairID`, `client_contacted`) VALUES
(1, 1, '104749', 'Alam Enterprise', '', '', '', 0, 0, 3, '16.1.2.3', '');

-- --------------------------------------------------------

--
-- Table structure for table `company_user`
--

CREATE TABLE `company_user` (
  `id` int(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `mobile` int(100) NOT NULL,
  `created_time` date NOT NULL,
  `employee_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_user`
--

INSERT INTO `company_user` (`id`, `username`, `password`, `mobile`, `created_time`, `employee_id`) VALUES
(1, 'osman@total.com', 'abcdtotal', 1234, '2019-07-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(64) NOT NULL,
  `designation` int(16) NOT NULL,
  `team_id` int(16) DEFAULT NULL,
  `transfer_team_id` int(16) DEFAULT NULL,
  `info_id` int(16) NOT NULL,
  `created_date` date DEFAULT NULL,
  `parent_id` int(16) DEFAULT NULL,
  `coded_employeeId` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `designation`, `team_id`, `transfer_team_id`, `info_id`, `created_date`, `parent_id`, `coded_employeeId`) VALUES
(1, 1, NULL, NULL, 1, '2019-06-30', 16, '16.1');

-- --------------------------------------------------------

--
-- Table structure for table `employee_designation`
--

CREATE TABLE `employee_designation` (
  `id` int(64) NOT NULL,
  `designation` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_designation`
--

INSERT INTO `employee_designation` (`id`, `designation`) VALUES
(1, 'Manager'),
(2, 'DSM'),
(3, 'ASM'),
(4, 'Officer'),
(5, 'DSR'),
(6, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE `employee_info` (
  `id` int(64) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `contact_number` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `office_email` varchar(32) DEFAULT NULL,
  `home_address` varchar(32) DEFAULT NULL,
  `emergency_contact` varchar(32) DEFAULT NULL,
  `is_client_handler` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_info`
--

INSERT INTO `employee_info` (`id`, `name`, `contact_number`, `email`, `office_email`, `home_address`, `emergency_contact`, `is_client_handler`) VALUES
(1, 'Osman', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(64) NOT NULL,
  `txid` varchar(64) NOT NULL,
  `client_id` int(64) NOT NULL,
  `taker_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL,
  `quantityes` varchar(16) DEFAULT NULL,
  `delevary_date` date NOT NULL,
  `plant` int(16) NOT NULL,
  `taking_date` date NOT NULL,
  `order_type` int(8) DEFAULT NULL,
  `customer_order_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plant_detail`
--

CREATE TABLE `plant_detail` (
  `id` int(16) NOT NULL,
  `plant` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_detail`
--

INSERT INTO `plant_detail` (`id`, `plant`) VALUES
(1, 'CTG'),
(2, 'TALTOLA'),
(3, 'BOGRA'),
(4, 'MONGLA');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(128) NOT NULL,
  `p_name` varchar(16) NOT NULL,
  `p_type` int(16) NOT NULL,
  `p_retailPrice` varchar(16) DEFAULT NULL,
  `p_wholesalePrice` varchar(16) DEFAULT NULL,
  `p_specialPrice` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `p_name`, `p_type`, `p_retailPrice`, `p_wholesalePrice`, `p_specialPrice`) VALUES
(1, '12Kg', 1, '', '', '1500'),
(2, '12Kg', 2, '', '', '1500'),
(3, '15Kg', 1, '', '', '1500'),
(4, '15Kg', 2, '', '', '1500'),
(5, '33Kg', 1, '', '', '1500'),
(6, '33Kg', 2, '', '', '1500'),
(7, '45Kg', 1, '', '', '1500'),
(8, '45Kg', 2, '', '', '1500'),
(9, '12KgBoc', 1, '', '', '1500'),
(11, 'Quantaz', 1, '', '', '1500');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id` int(16) NOT NULL,
  `type` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id`, `type`) VALUES
(1, 'New'),
(2, 'Refill');

-- --------------------------------------------------------

--
-- Table structure for table `stock_updated`
--

CREATE TABLE `stock_updated` (
  `id` int(128) NOT NULL,
  `taking_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `insert_date_time` datetime NOT NULL,
  `order_code` varchar(64) NOT NULL,
  `taker_id` int(16) NOT NULL,
  `order_for_client_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_updated_details`
--

CREATE TABLE `stock_updated_details` (
  `id` int(64) NOT NULL,
  `txid` varchar(64) NOT NULL,
  `client_id` int(64) NOT NULL,
  `taker_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL,
  `quantityes` varchar(16) NOT NULL,
  `delevary_date` date NOT NULL,
  `plant` int(16) NOT NULL,
  `taking_date` date NOT NULL,
  `order_type` int(8) NOT NULL,
  `customer_order_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_updated_details`
--

INSERT INTO `stock_updated_details` (`id`, `txid`, `client_id`, `taker_id`, `product_id`, `quantityes`, `delevary_date`, `plant`, `taking_date`, `order_type`, `customer_order_id`) VALUES
(39401, '15762907277010', 153, 21, 1, '100', '2019-12-14', 2, '2019-12-14', 2, 0),
(89450, '15795805288909', 76, 12, 11, '50', '2020-01-21', 2, '2020-01-21', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_order`
--

CREATE TABLE `tbl_customer_order` (
  `id` int(128) NOT NULL,
  `taking_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `insert_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_code` varchar(64) DEFAULT NULL,
  `taker_id` int(16) NOT NULL,
  `order_for_client_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_catagory`
--
ALTER TABLE `client_catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_info`
--
ALTER TABLE `client_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_client_handler` (`handler_id`,`client_pairID`);

--
-- Indexes for table `company_user`
--
ALTER TABLE `company_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employees` (`id`,`parent_id`,`info_id`);

--
-- Indexes for table `employee_designation`
--
ALTER TABLE `employee_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `txid` (`txid`),
  ADD KEY `idx_order` (`client_id`,`delevary_date`),
  ADD KEY `idx_order_txid` (`txid`);

--
-- Indexes for table `plant_detail`
--
ALTER TABLE `plant_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_updated`
--
ALTER TABLE `stock_updated`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_updated_details`
--
ALTER TABLE `stock_updated_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_order`
--
ALTER TABLE `tbl_customer_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_catagory`
--
ALTER TABLE `client_catagory`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `client_info`
--
ALTER TABLE `client_info`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;
--
-- AUTO_INCREMENT for table `company_user`
--
ALTER TABLE `company_user`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `employee_designation`
--
ALTER TABLE `employee_designation`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employee_info`
--
ALTER TABLE `employee_info`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plant_detail`
--
ALTER TABLE `plant_detail`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stock_updated`
--
ALTER TABLE `stock_updated`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_updated_details`
--
ALTER TABLE `stock_updated_details`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89451;
--
-- AUTO_INCREMENT for table `tbl_customer_order`
--
ALTER TABLE `tbl_customer_order`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
