-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 24, 2022 at 11:12 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `currency_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Currency`
--

CREATE TABLE `Currency` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `currency_code` varchar(6) NOT NULL,
  `exchange_rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Currency`
--

INSERT INTO `Currency` (`id`, `name`, `currency_code`, `exchange_rate`) VALUES
(1, 'bat (Tajlandia)', 'THB', 0.1278),
(2, 'dolar amerykański', 'USD', 4.692),
(3, 'dolar australijski', 'AUD', 3.2449),
(4, 'dolar Hongkongu', 'HKD', 0.5978),
(5, 'dolar kanadyjski', 'CAD', 3.6445),
(6, 'dolar nowozelandzki', 'NZD', 2.9249),
(7, 'dolar singapurski', 'SGD', 3.3734),
(8, 'euro', 'EUR', 4.7643),
(9, 'forint (Węgry)', 'HUF', 0.01199),
(10, 'frank szwajcarski', 'CHF', 4.8479),
(11, 'funt szterling', 'GBP', 5.6103),
(12, 'hrywna (Ukraina)', 'UAH', 0.1277),
(13, 'jen (Japonia)', 'JPY', 0.034093),
(14, 'korona czeska', 'CZK', 0.1942),
(15, 'korona duńska', 'DKK', 0.64),
(16, 'korona islandzka', 'ISK', 0.034153),
(17, 'korona norweska', 'NOK', 0.4693),
(18, 'korona szwedzka', 'SEK', 0.4572),
(19, 'kuna (Chorwacja)', 'HRK', 0.6332),
(20, 'lej rumuński', 'RON', 0.9653),
(21, 'lew (Bułgaria)', 'BGN', 2.4359),
(22, 'lira turecka', 'TRY', 0.2647),
(23, 'nowy izraelski szekel', 'ILS', 1.3614),
(24, 'peso chilijskie', 'CLP', 0.005052),
(25, 'peso filipińskie', 'PHP', 0.0835),
(26, 'peso meksykańskie', 'MXN', 0.227),
(27, 'rand (Republika Południowej Afryki)', 'ZAR', 0.2756),
(28, 'real (Brazylia)', 'BRL', 0.8533),
(29, 'ringgit (Malezja)', 'MYR', 1.0533),
(30, 'rupia indonezyjska', 'IDR', 0.00031247),
(31, 'rupia indyjska', 'INR', 0.058739),
(32, 'won południowokoreański', 'KRW', 0.003575),
(33, 'yuan renminbi (Chiny)', 'CNY', 0.6933),
(34, 'SDR (MFW)', 'XDR', 6.1441);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Currency`
--
ALTER TABLE `Currency`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Currency`
--
ALTER TABLE `Currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
