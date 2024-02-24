-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 03:54 AM
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
-- Database: `inventory_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `CostPrice` decimal(10,2) NOT NULL,
  `SellingPrice` decimal(10,2) NOT NULL,
  `QuantityInStock` int(11) NOT NULL,
  `Color` varchar(12) DEFAULT NULL,
  `Size` varchar(5) DEFAULT NULL,
  `Material` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Category`, `Description`, `CostPrice`, `SellingPrice`, `QuantityInStock`, `Color`, `Size`, `Material`) VALUES
(12, 'AirMax 96', 'Sneakers', 'Nike Airmax', 75.00, 135.00, 5, 'Black', '10.5', 'Mixed'),
(1000, 'Nike Activewear 19.79558460395372', 'Activewear', 'Black Activewear by Nike', 41.04, 49.49, 14, 'Black', 'X', 'Polyester'),
(1001, 'Adidas Activewear 58.84751776125982', 'Activewear', 'Black Activewear by Adidas', 50.32, 92.55, 12, 'Black', 'S', 'Polyester'),
(1002, 'Puma Activewear 89.76542240918187', 'Activewear', 'Black Activewear by Puma', 26.94, 60.84, 14, 'Black', 'X', 'Polyester'),
(1003, 'Nike Athletic shorts 4.055020868829471', 'Athletic shorts', 'Black Athletic shorts by Nike', 45.76, 73.66, 28, 'Black', 'M', 'Polyester'),
(1004, 'Adidas Athletic shorts 68.16191940397202', 'Athletic shorts', 'Black Athletic shorts by Adidas', 56.05, 48.33, 30, 'Black', 'L', 'Polyester'),
(1005, 'Puma Athletic shorts 53.46483304487991', 'Athletic shorts', 'Black Athletic shorts by Puma', 56.35, 66.20, 19, 'Black', 'L', 'Polyester'),
(1006, 'Nike Backpacks 97.2861093443689', 'Backpacks', 'Black Backpacks by Nike', 42.19, 57.38, 26, 'Black', 'M', 'Polyester'),
(1007, 'Adidas Backpacks 5.060636350010183', 'Backpacks', 'Black Backpacks by Adidas', 34.20, 44.27, 16, 'Black', 'X', 'Polyester'),
(1008, 'Puma Backpacks 23.91782889507509', 'Backpacks', 'Black Backpacks by Puma', 56.17, 72.87, 10, 'Black', 'S', 'Polyester'),
(1009, 'Nike Activewear 49.06677049497773', 'Activewear', 'Blue Activewear by Nike', 35.67, 90.43, 10, 'Blue', 'S', 'Polyester'),
(1010, 'Adidas Activewear 61.4578419006037', 'Activewear', 'Blue Activewear by Adidas', 24.50, 75.34, 22, 'Blue', 'X', 'Polyester'),
(1011, 'Puma Activewear 27.095356422565274', 'Activewear', 'Blue Activewear by Puma', 53.86, 78.21, 23, 'Blue', 'M', 'Polyester'),
(1012, 'Nike Athletic shorts 31.39892474878479', 'Athletic shorts', 'Blue Athletic shorts by Nike', 29.35, 55.82, 22, 'Blue', 'L', 'Polyester'),
(1013, 'Adidas Athletic shorts 29.246177085904566', 'Athletic shorts', 'Blue Athletic shorts by Adidas', 27.37, 45.03, 28, 'Blue', 'L', 'Polyester'),
(1014, 'Puma Athletic shorts 8.176271066233769', 'Athletic shorts', 'Blue Athletic shorts by Puma', 51.97, 74.14, 19, 'Blue', 'X', 'Polyester'),
(1015, 'Nike Backpacks 53.18257413169609', 'Backpacks', 'Blue Backpacks by Nike', 59.33, 98.16, 28, 'Blue', 'S', 'Polyester'),
(1016, 'Adidas Backpacks 57.46675846862305', 'Backpacks', 'Blue Backpacks by Adidas', 27.80, 65.44, 21, 'Blue', 'X', 'Polyester'),
(1017, 'Puma Backpacks 40.107010528544905', 'Backpacks', 'Blue Backpacks by Puma', 52.18, 89.10, 24, 'Blue', 'M', 'Polyester'),
(1018, 'Nike Activewear 93.4220050400328', 'Activewear', 'Red Activewear by Nike', 35.41, 40.80, 29, 'Red', 'L', 'Polyester'),
(1019, 'Adidas Activewear 51.45765892365729', 'Activewear', 'Red Activewear by Adidas', 46.29, 85.94, 27, 'Red', 'X', 'Polyester'),
(1020, 'Puma Activewear 98.50347097823719', 'Activewear', 'Red Activewear by Puma', 53.00, 43.44, 27, 'Red', 'S', 'Polyester'),
(1021, 'Nike Athletic shorts 88.41235776283997', 'Athletic shorts', 'Red Athletic shorts by Nike', 31.31, 67.16, 18, 'Red', 'X', 'Polyester'),
(1022, 'Adidas Athletic shorts 71.88803578902785', 'Athletic shorts', 'Red Athletic shorts by Adidas', 43.36, 92.55, 23, 'Red', 'S', 'Polyester'),
(1023, 'Puma Athletic shorts 50.6536357576527', 'Athletic shorts', 'Red Athletic shorts by Puma', 49.69, 85.24, 21, 'Red', 'L', 'Polyester'),
(1024, 'Nike Backpacks 45.323829115670016', 'Backpacks', 'Red Backpacks by Nike', 53.05, 53.18, 23, 'Red', 'L', 'Polyester'),
(1025, 'Adidas Backpacks 43.81823981536389', 'Backpacks', 'Red Backpacks by Adidas', 33.95, 84.77, 24, 'Red', 'S', 'Polyester'),
(1026, 'Puma Backpacks 18.217035865613294', 'Backpacks', 'Red Backpacks by Puma', 49.85, 49.32, 21, 'Red', 'X', 'Polyester'),
(1027, 'Nike Activewear 22.299409957881466', 'Activewear', 'Black Activewear by Nike', 53.58, 81.57, 29, 'Black', 'M', 'Cotton'),
(1028, 'Adidas Activewear 64.89375584283262', 'Activewear', 'Black Activewear by Adidas', 23.76, 54.74, 29, 'Black', 'M', 'Cotton'),
(1029, 'Puma Activewear 99.53703172461785', 'Activewear', 'Black Activewear by Puma', 48.02, 45.42, 17, 'Black', 'X', 'Cotton'),
(1030, 'Nike Athletic shorts 47.9429073146944', 'Athletic shorts', 'Black Athletic shorts by Nike', 31.87, 66.54, 16, 'Black', 'S', 'Cotton'),
(1031, 'Adidas Athletic shorts 28.293363403802147', 'Athletic shorts', 'Black Athletic shorts by Adidas', 35.76, 77.46, 29, 'Black', 'M', 'Cotton'),
(1032, 'Puma Athletic shorts 82.58832644912259', 'Athletic shorts', 'Black Athletic shorts by Puma', 22.90, 65.94, 29, 'Black', 'S', 'Cotton'),
(1033, 'Nike Backpacks 42.497988643588485', 'Backpacks', 'Black Backpacks by Nike', 27.33, 42.46, 23, 'Black', 'S', 'Cotton'),
(1034, 'Adidas Backpacks 15.573705467929788', 'Backpacks', 'Black Backpacks by Adidas', 43.57, 70.77, 26, 'Black', 'X', 'Cotton'),
(1035, 'Puma Backpacks 44.2081081161351', 'Backpacks', 'Black Backpacks by Puma', 51.36, 67.23, 29, 'Black', 'X', 'Cotton'),
(1036, 'Nike Activewear 22.552825904034847', 'Activewear', 'Blue Activewear by Nike', 28.00, 92.44, 26, 'Blue', 'S', 'Cotton'),
(1037, 'Adidas Activewear 22.851719542268402', 'Activewear', 'Blue Activewear by Adidas', 39.03, 92.89, 30, 'Blue', 'X', 'Cotton'),
(1038, 'Puma Activewear 25.953413477124098', 'Activewear', 'Blue Activewear by Puma', 59.88, 95.20, 22, 'Blue', 'S', 'Cotton'),
(1039, 'Nike Athletic shorts 28.320813298524182', 'Athletic shorts', 'Blue Athletic shorts by Nike', 24.05, 84.14, 17, 'Blue', 'M', 'Cotton'),
(1040, 'Adidas Athletic shorts 66.52392369371273', 'Athletic shorts', 'Blue Athletic shorts by Adidas', 20.76, 69.16, 17, 'Blue', 'S', 'Cotton'),
(1041, 'Puma Athletic shorts 40.83359999659806', 'Athletic shorts', 'Blue Athletic shorts by Puma', 35.36, 49.28, 23, 'Blue', 'X', 'Cotton'),
(1042, 'Nike Backpacks 64.2503207216508', 'Backpacks', 'Blue Backpacks by Nike', 52.62, 41.91, 24, 'Blue', 'S', 'Cotton'),
(1043, 'Adidas Backpacks 46.662048573290974', 'Backpacks', 'Blue Backpacks by Adidas', 43.19, 58.63, 27, 'Blue', 'X', 'Cotton'),
(1044, 'Puma Backpacks 13.697493554742534', 'Backpacks', 'Blue Backpacks by Puma', 52.31, 58.45, 12, 'Blue', 'S', 'Cotton'),
(1045, 'Nike Activewear 64.92897324723096', 'Activewear', 'Red Activewear by Nike', 42.75, 48.04, 30, 'Red', 'X', 'Cotton'),
(1046, 'Adidas Activewear 41.74838917492739', 'Activewear', 'Red Activewear by Adidas', 49.02, 42.44, 10, 'Red', 'X', 'Cotton'),
(1047, 'Puma Activewear 1.13731725247327', 'Activewear', 'Red Activewear by Puma', 54.02, 59.32, 11, 'Red', 'X', 'Cotton'),
(1048, 'Nike Athletic shorts 32.68816120241597', 'Athletic shorts', 'Red Athletic shorts by Nike', 32.48, 51.10, 30, 'Red', 'M', 'Cotton'),
(1049, 'Adidas Athletic shorts 38.67346452425557', 'Athletic shorts', 'Red Athletic shorts by Adidas', 47.34, 70.70, 20, 'Red', 'X', 'Cotton'),
(1050, 'Puma Athletic shorts 0.1407844015776966', 'Athletic shorts', 'Red Athletic shorts by Puma', 36.90, 79.37, 10, 'Red', 'M', 'Cotton'),
(1051, 'Nike Backpacks 10.008896244698109', 'Backpacks', 'Red Backpacks by Nike', 59.83, 76.07, 10, 'Red', 'M', 'Cotton'),
(1052, 'Adidas Backpacks 28.915134658026638', 'Backpacks', 'Red Backpacks by Adidas', 23.34, 54.81, 30, 'Red', 'S', 'Cotton'),
(1053, 'Puma Backpacks 17.665616439344003', 'Backpacks', 'Red Backpacks by Puma', 25.43, 92.74, 30, 'Red', 'X', 'Cotton'),
(1054, 'Nike Activewear 30.41030944363243', 'Activewear', 'Black Activewear by Nike', 54.65, 79.87, 25, 'Black', 'M', 'Nylon'),
(1055, 'Adidas Activewear 62.46541790893806', 'Activewear', 'Black Activewear by Adidas', 55.50, 74.86, 15, 'Black', 'X', 'Nylon'),
(1056, 'Puma Activewear 46.79000419265591', 'Activewear', 'Black Activewear by Puma', 46.45, 68.04, 17, 'Black', 'L', 'Nylon'),
(1057, 'Nike Athletic shorts 36.16341560721715', 'Athletic shorts', 'Black Athletic shorts by Nike', 46.62, 44.61, 18, 'Black', 'L', 'Nylon'),
(1058, 'Adidas Athletic shorts 71.07078514161593', 'Athletic shorts', 'Black Athletic shorts by Adidas', 52.45, 93.42, 10, 'Black', 'S', 'Nylon'),
(1059, 'Puma Athletic shorts 41.70187464142393', 'Athletic shorts', 'Black Athletic shorts by Puma', 56.44, 67.45, 21, 'Black', 'X', 'Nylon'),
(1060, 'Nike Backpacks 40.068089999321934', 'Backpacks', 'Black Backpacks by Nike', 39.82, 67.55, 26, 'Black', 'S', 'Nylon'),
(1061, 'Adidas Backpacks 66.88099444553347', 'Backpacks', 'Black Backpacks by Adidas', 42.99, 47.50, 28, 'Black', 'X', 'Nylon'),
(1062, 'Puma Backpacks 12.924720638361501', 'Backpacks', 'Black Backpacks by Puma', 33.22, 89.30, 12, 'Black', 'X', 'Nylon'),
(1063, 'Nike Activewear 11.885074630272644', 'Activewear', 'Blue Activewear by Nike', 54.53, 75.03, 16, 'Blue', 'S', 'Nylon'),
(1064, 'Adidas Activewear 89.7817478420043', 'Activewear', 'Blue Activewear by Adidas', 52.15, 71.25, 14, 'Blue', 'M', 'Nylon'),
(1065, 'Puma Activewear 40.00871511177041', 'Activewear', 'Blue Activewear by Puma', 56.58, 58.21, 26, 'Blue', 'M', 'Nylon'),
(1066, 'Nike Athletic shorts 95.89384756599911', 'Athletic shorts', 'Blue Athletic shorts by Nike', 39.55, 41.49, 23, 'Blue', 'M', 'Nylon'),
(1067, 'Adidas Athletic shorts 21.311171000181854', 'Athletic shorts', 'Blue Athletic shorts by Adidas', 53.04, 91.02, 26, 'Blue', 'X', 'Nylon'),
(1068, 'Puma Athletic shorts 31.776050042152455', 'Athletic shorts', 'Blue Athletic shorts by Puma', 35.40, 47.32, 19, 'Blue', 'S', 'Nylon'),
(1069, 'Nike Backpacks 91.06304244237305', 'Backpacks', 'Blue Backpacks by Nike', 28.13, 67.31, 23, 'Blue', 'X', 'Nylon'),
(1070, 'Adidas Backpacks 96.41122556888612', 'Backpacks', 'Blue Backpacks by Adidas', 28.88, 78.49, 21, 'Blue', 'X', 'Nylon'),
(1071, 'Puma Backpacks 78.24218392208422', 'Backpacks', 'Blue Backpacks by Puma', 23.71, 75.95, 25, 'Blue', 'S', 'Nylon'),
(1072, 'Nike Activewear 79.29725514659403', 'Activewear', 'Red Activewear by Nike', 46.95, 96.21, 23, 'Red', 'X', 'Nylon'),
(1073, 'Adidas Activewear 50.604431471418984', 'Activewear', 'Red Activewear by Adidas', 27.32, 57.64, 29, 'Red', 'M', 'Nylon'),
(1074, 'Puma Activewear 72.30720303236247', 'Activewear', 'Red Activewear by Puma', 23.71, 94.42, 15, 'Red', 'X', 'Nylon'),
(1075, 'Nike Athletic shorts 56.25140849151779', 'Athletic shorts', 'Red Athletic shorts by Nike', 40.97, 69.63, 28, 'Red', 'X', 'Nylon'),
(1076, 'Adidas Athletic shorts 0.18097143637106888', 'Athletic shorts', 'Red Athletic shorts by Adidas', 43.59, 99.53, 14, 'Red', 'S', 'Nylon'),
(1077, 'Puma Athletic shorts 97.84438852020017', 'Athletic shorts', 'Red Athletic shorts by Puma', 46.46, 60.97, 26, 'Red', 'S', 'Nylon'),
(1078, 'Nike Backpacks 76.50079156877547', 'Backpacks', 'Red Backpacks by Nike', 35.61, 60.39, 21, 'Red', 'M', 'Nylon'),
(1079, 'Adidas Backpacks 62.4849368468718', 'Backpacks', 'Red Backpacks by Adidas', 52.52, 67.14, 27, 'Red', 'M', 'Nylon'),
(1080, 'Puma Backpacks 75.59328123516708', 'Backpacks', 'Red Backpacks by Puma', 31.69, 71.49, 25, 'Red', 'S', 'Nylon'),
(1127, 'Louis Vuitton Infinity Link', 'Jewelry', 'Louis Vuitton Necklace for Darrien', 1700.00, 2300.00, 2, 'White Gold', '14\'', 'Gold'),
(1128, 'Jordan 14', 'Activewear', '', 149.00, 250.00, 4, '', '', ''),
(1129, 'Jordan 14', 'Activewear', '', 149.00, 250.00, 4, '', '', ''),
(1130, 'Jordan 12', 'Activewear', '', 149.00, 250.00, 4, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1131;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
