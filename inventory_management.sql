-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2024 at 12:08 AM
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
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Street1` varchar(255) DEFAULT NULL,
  `AptNo` varchar(50) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `ContactNumber`, `Email`, `Street1`, `AptNo`, `City`, `State`, `ZipCode`, `Birthdate`) VALUES
(1001, 'Darrien', 'Brinkley', '3375018061', 'darrienbrinkley@gmail.com', '300 majestic blvd', '1', 'LAFAYETTE', 'Louisiana', '70508', '0000-00-00'),
(1002, 'Denzel', 'Living', '3378494119', 'c00044109@louisiana.edu', '300 majestic blvd', '', 'LAFAYETTE', 'Louisiana', '70508', '0000-00-00'),
(1003, 'Kaylon', 'Living', '3373993788', 'denzelliving@gmail.com', '300 majestic blvd', '', 'LAFAYETTE', 'LA', '70508', '2003-06-09'),
(1004, 'Noah', 'Calhoun', '555-1111', 'noah.calhoun@example.com', 'Plantation Lane', 'House 1', 'Charleston', 'SC', '29401', '1920-06-06'),
(1005, 'Allie', 'Hamilton', '555-2222', 'allie.hamilton@example.com', 'Plantation Lane', 'House 2', 'Charleston', 'SC', '29401', '1920-07-25'),
(1006, 'Hitch', 'LoveDoctor', '555-3333', 'hitch.lovedoctor@example.com', 'Romance Avenue', 'Suite 3', 'Love City', 'CA', '90210', '1970-12-15'),
(1007, 'Gabriel', 'Lightman', '555-4444', 'gabriel.lightman@example.com', 'Candlelit Street', 'Apt 4', 'Heartville', 'CA', '90211', '1985-02-14'),
(1008, 'Mia', 'Dolores', '555-5555', 'mia.dolores@example.com', 'Fairytale Lane', 'Castle 5', 'Dreamland', 'CA', '90212', '1990-04-03'),
(1009, 'William', 'Thacker', '555-6666', 'william.thacker@example.com', 'Bookstore Street', 'Flat 6', 'Notting Hill', 'UK', 'W11 1QQ', '1963-09-12'),
(1010, 'Anna', 'Scott', '555-7777', 'anna.scott@example.com', 'Movie Star Avenue', 'Penthouse 7', 'Hollywood', 'CA', '90214', '1970-08-09'),
(1011, 'Josey', 'Wales', '555-8888', 'josey.wales@example.com', 'Western Town', 'Saloon 8', 'Love County', 'OK', '73001', '1939-11-18'),
(1012, 'Landon', 'Carter', '555-9999', 'landon.carter@example.com', 'High School Lane', 'Room 9', 'Romanceville', 'CA', '90215', '1981-03-01'),
(1013, 'Samantha', 'Jones', '555-3456', 'samantha.jones@example.com', 'Cosmopolitan Street', 'Suite 10', 'City of Love', 'NY', '10001', '1968-05-11'),
(1014, 'John', 'McClane', '555-1111', 'john.mcclane@example.com', 'Nakatomi Plaza', 'Floor 1', 'Los Angeles', 'CA', '90001', '1955-07-12'),
(1015, 'Sarah', 'Connor', '555-2222', 'sarah.connor@example.com', 'Cyberdyne Systems', 'Apartment 2', 'Terminator Town', 'CA', '90002', '1963-02-25'),
(1016, 'Martin', 'Riggs', '555-3333', 'martin.riggs@example.com', 'Police Station', 'Office 3', 'Lethal City', 'CA', '90003', '1951-11-23'),
(1017, 'John', 'Rambo', '555-4444', 'john.rambo@example.com', 'Survival Camp', 'Cabin 4', 'Jungle Town', 'CA', '90004', '1947-07-06'),
(1018, 'Jason', 'Bourne', '555-5555', 'jason.bourne@example.com', 'Blackbriar HQ', 'Safe House 5', 'Spyville', 'CA', '90005', '1970-04-15'),
(1019, 'Ripley', 'Ellen', '555-6666', 'ripley.ellen@example.com', 'Weyland-Yutani Corp', 'Space Shuttle 6', 'Alien City', 'CA', '90006', '2092-02-07'),
(1020, 'James', 'Bond', '555-7777', 'james.bond@example.com', 'MI6 Headquarters', '007 Suite 7', 'London', 'UK', 'SW1A 1AA', '1920-11-11'),
(1021, 'Ethan', 'Hunt', '555-8888', 'ethan.hunt@example.com', 'IMF Base', 'Mission Control 8', 'Spy Central', 'CA', '90008', '1962-05-31'),
(1022, 'Dominic', 'Toretto', '555-9999', 'dominic.toretto@example.com', 'Garage Street', 'Warehouse 9', 'Fastville', 'CA', '90009', '1972-08-14'),
(1023, 'John', 'Wick', '555-0000', 'john.wick@example.com', 'Continental Hotel', 'Suite 10', 'Assassin City', 'NY', '10001', '1964-09-06'),
(1024, 'Mickey', 'Mouse', '555-1234', 'mickey.mouse@example.com', 'Main Street', 'Apt 1', 'Disneyland', 'CA', '12345', '1928-11-18'),
(1025, 'Minnie', 'Mouse', '555-5678', 'minnie.mouse@example.com', 'Main Street', 'Apt 2', 'Disneyland', 'CA', '12345', '1928-11-18'),
(1026, 'Donald', 'Duck', '555-9876', 'donald.duck@example.com', 'Duckburg Lane', 'Apt 3', 'Duckburg', 'CA', '54321', '1934-06-09'),
(1027, 'Daisy', 'Duck', '555-8765', 'daisy.duck@example.com', 'Duckburg Lane', 'Apt 4', 'Duckburg', 'CA', '54321', '1937-01-09'),
(1028, 'Goofy', 'Goof', '555-4321', 'goofy.goof@example.com', 'Goofy Road', 'Apt 5', 'Goofyville', 'CA', '98765', '1932-05-25'),
(1029, 'Pluto', 'Dog', '555-8769', 'pluto.dog@example.com', 'Doghouse Street', 'Apt 6', 'Dogtown', 'CA', '34567', '1930-09-05'),
(1030, 'Cinderella', 'Princess', '555-3456', 'cinderella@example.com', 'Royal Palace', 'Suite 7', 'Fairytale Kingdom', 'CA', '67890', '1920-03-12'),
(1031, 'Prince', 'Charming', '555-6543', 'prince.charming@example.com', 'Royal Palace', 'Suite 8', 'Fairytale Kingdom', 'CA', '09876', '1922-07-23'),
(1032, 'Ariel', 'Mermaid', '555-7890', 'ariel.mermaid@example.com', 'Ocean Avenue', 'Cave 9', 'Atlantica', 'CA', '56789', '1989-11-23'),
(1033, 'Eric', 'Prince', '555-0123', 'eric.prince@example.com', 'Castle Cliff', 'Suite 10', 'Kingdom Shore', 'CA', '45678', '1989-11-18'),
(1034, 'Buzz', 'Lightyear', '555-2345', 'buzz.lightyear@example.com', 'Star Command', 'Space Apt 21', 'Galaxy City', 'CA', '23456', '1995-11-19'),
(1035, 'Woody', 'Sheriff', '555-5432', 'woody.sheriff@example.com', 'Ranch Road', 'Cowboy Cabin 22', 'Toyland', 'CA', '78901', '1995-11-22'),
(1036, 'Britney', 'Spears', '555-1111', 'britney.spears@example.com', 'Popstar Avenue', 'Suite 1', 'Hit City', 'CA', '90210', '1981-12-02'),
(1037, 'Justin', 'Timberlake', '555-2222', 'justin.timberlake@example.com', 'Boyband Street', 'Studio 2', 'Sync City', 'CA', '90211', '1981-01-31'),
(1038, 'Christina', 'Aguilera', '555-3333', 'christina.aguilera@example.com', 'Vocal Range Lane', 'Mic 3', 'Genie City', 'CA', '90212', '1980-12-18'),
(1039, 'Backstreet', 'Boys', '555-4444', 'backstreet.boys@example.com', 'Boyband Boulevard', 'Tour Bus 4', 'Popville', 'CA', '90213', '1993-04-20'),
(1040, 'Spice', 'Girls', '555-5555', 'spice.girls@example.com', 'Girlband Street', 'Spice Mansion 5', 'Girlpower City', 'CA', '90214', '1994-05-04'),
(1041, 'Ricky', 'Martin', '555-6666', 'ricky.martin@example.com', 'Livin La Vida Loca Lane', 'Latin Groove 6', 'Danceville', 'CA', '90215', '1971-12-24'),
(1042, 'Shania', 'Twain', '555-7777', 'shania.twain@example.com', 'Country Road', 'Ranch 7', 'Twain Town', 'CA', '90216', '1965-08-28'),
(1043, 'Hanson', 'Brothers', '555-8888', 'hanson.brothers@example.com', 'MMMBop Street', 'Zac\'s Place 8', 'Tulsa', 'OK', '74103', '1980-10-22'),
(1044, 'Mariah', 'Carey', '555-9999', 'mariah.carey@example.com', 'High Note Avenue', 'Penthouse 9', 'Songbird City', 'CA', '90217', '1969-03-27'),
(1045, 'Whitney', 'Houston', '555-1234', 'whitney.houston@example.com', 'Greatest Love Lane', 'Heavenly Suite 10', 'Vocal City', 'CA', '90218', '1963-08-09'),
(1046, 'Kaylie', 'Living', '3372884787', 'denzelliving@gmail.com', '300 majestic blvd', '', 'LAFAYETTE', 'LA', '70508', '0000-00-00'),
(1047, 'Kaysen', 'Living', '3378968113', 'denzelliving@gmail.com', '300 majestic blvd', '', 'LAFAYETTE', 'LA', '70508', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `employee_passcode` varchar(4) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `total_hours_worked` decimal(10,2) DEFAULT 0.00,
  `role` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `address`, `phone_number`, `employee_passcode`, `last_login`, `last_logout`, `total_hours_worked`, `role`) VALUES
(4119, 'Denzel', 'Living', '300 Majestic Blvd 70508', '3378494119', '0630', '2024-02-21 16:39:45', '2024-02-21 16:39:13', 24.08, 'manager'),
(8061, 'Darrien', 'Brinkley', '300 Majestic Blvd 70508', '3375018061', '4241', '2024-02-18 12:21:52', '2024-02-21 16:33:17', 76.24, 'sales');

-- --------------------------------------------------------

--
-- Table structure for table `items_sold`
--

CREATE TABLE `items_sold` (
  `SaleID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `QuantitySold` int(11) DEFAULT NULL,
  `PricePerItem` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Material` varchar(15) DEFAULT NULL,
  `Status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Category`, `Description`, `CostPrice`, `SellingPrice`, `QuantityInStock`, `Color`, `Size`, `Material`, `Status`) VALUES
(100, 'Black Shiny Leopard Textured Leggings', 'Bottoms', 'black shiny leopard textured leggings', 3.50, 24.50, 3, 'Black', 'S', 'Poly', 'In-Stock'),
(101, 'Black Shiny Leopard Textured Leggings', 'Bottoms', 'Black Shiny Leopard Textured Leggings\r\n', 3.50, 24.50, 3, '', 'M', '', 'In-Stock'),
(102, 'Black Shiny Leopard Textured Leggings', 'Bottoms', 'Black Shiny Leopard Textured Leggings\r\n', 3.50, 24.50, 3, '', 'L', '', 'In-Stock'),
(103, 'Black Shiny Leopard Textured Leggings', 'Bottoms', 'Black Shiny Leopard Textured Leggings\r\n', 3.50, 24.50, 3, '', 'XL', '', 'In-Stock'),
(104, 'White Distressed Frayed Denim Shorts', 'Bottoms', 'White Distressed Frayed Denim Shorts\r', 8.50, 27.50, 2, NULL, '6', NULL, ''),
(105, 'White Distressed Frayed Denim Shorts', 'Bottoms', 'White Distressed Frayed Denim Shorts\r', 8.50, 27.50, 4, NULL, '8', NULL, ''),
(106, 'White Distressed Frayed Denim Shorts', 'Bottoms', 'White Distressed Frayed Denim Shorts\r', 8.50, 27.50, 4, NULL, '10', NULL, ''),
(107, 'White Distressed Frayed Denim Shorts', 'Bottoms', 'White Distressed Frayed Denim Shorts\r', 8.50, 27.50, 4, NULL, '12', NULL, ''),
(108, 'White Distressed Frayed Denim Shorts', 'Bottoms', 'White Distressed Frayed Denim Shorts\r', 8.50, 27.50, 3, NULL, '14', NULL, ''),
(109, 'White Distressed Frayed Denim Shorts', 'Bottoms', 'White Distressed Frayed Denim Shorts\r', 8.50, 27.50, 2, NULL, '16', NULL, ''),
(110, 'White Smocked Wrist Shift Top', 'Top', 'White Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'S', NULL, ''),
(111, 'White Smocked Wrist Shift Top', 'Top', 'White Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'M', NULL, ''),
(112, 'White Smocked Wrist Shift Top', 'Top', 'White Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'L', NULL, ''),
(113, 'White Smocked Wrist Shift Top', 'Top', 'White Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'XL', NULL, ''),
(114, 'White Smocked Wrist Shift Top', 'Top', 'White Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, '2XL', NULL, ''),
(115, 'Green Smocked Wrist Shift Top', 'Top', 'Green Smocked Wrist Shift Top\r', 4.70, 26.00, 3, NULL, 'S', NULL, ''),
(116, 'Green Smocked Wrist Shift Top', 'Top', 'Green Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'M', NULL, ''),
(117, 'Green Smocked Wrist Shift Top', 'Top', 'Green Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'L', NULL, ''),
(118, 'Green Smocked Wrist Shift Top', 'Top', 'Green Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, 'XL', NULL, ''),
(119, 'Green Smocked Wrist Shift Top', 'Top', 'Green Smocked Wrist Shift Top\r', 4.70, 26.50, 3, NULL, '2XL', NULL, ''),
(120, 'Blue Raw Hem Ankle-length Skinny Jeans', 'Bottoms', 'Blue Raw Hem Ankle-length Skinny Jeans\r', 12.80, 42.00, 2, NULL, '6', NULL, ''),
(121, 'Blue Raw Hem Ankle-length Skinny Jeans', 'Bottoms', 'Blue Raw Hem Ankle-length Skinny Jeans\r', 12.80, 42.00, 3, NULL, '8', NULL, ''),
(122, 'Blue Raw Hem Ankle-length Skinny Jeans', 'Bottoms', 'Blue Raw Hem Ankle-length Skinny Jeans\r', 12.80, 42.00, 3, NULL, '10', NULL, ''),
(123, 'Blue Raw Hem Ankle-length Skinny Jeans', 'Bottoms', 'Blue Raw Hem Ankle-length Skinny Jeans\r', 12.80, 42.00, 3, NULL, '12', NULL, ''),
(124, 'Blue Raw Hem Ankle-length Skinny Jeans', 'Bottoms', 'Blue Raw Hem Ankle-length Skinny Jeans\r', 12.80, 42.00, 2, NULL, '14', NULL, ''),
(125, 'Blue Raw Hem Ankle-length Skinny Jeans', 'Bottoms', 'Blue Raw Hem Ankle-length Skinny Jeans\r', 12.80, 42.00, 1, NULL, '16', NULL, ''),
(126, 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse', 'Top', 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse\r', 7.90, 32.00, 2, NULL, 'S', NULL, ''),
(127, 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse', 'Top', 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse\r', 7.90, 32.00, 2, NULL, 'M', NULL, ''),
(128, 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse', 'Top', 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse\r', 7.90, 32.00, 2, NULL, 'L', NULL, ''),
(129, 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse', 'Top', 'Black Mixed Floral Geometric Print Ruffled Long Sleeve Blouse\r', 7.90, 32.00, 2, NULL, 'XL', NULL, ''),
(130, 'Green Tiered Ruffled Sleeves Mini Dress with Pockets', 'Dress', 'Green Tiered Ruffled Sleeves Mini Dress with Pockets\r', 8.50, 42.00, 2, NULL, 'S', NULL, ''),
(131, 'Green Tiered Ruffled Sleeves Mini Dress with Pockets', 'Dress', 'Green Tiered Ruffled Sleeves Mini Dress with Pockets\r', 8.50, 42.00, 2, NULL, 'M', NULL, ''),
(132, 'Green Tiered Ruffled Sleeves Mini Dress with Pockets', 'Dress', 'Green Tiered Ruffled Sleeves Mini Dress with Pockets\r', 8.50, 42.00, 2, NULL, 'L', NULL, ''),
(133, 'Green Tiered Ruffled Sleeves Mini Dress with Pockets', 'Dress', 'Green Tiered Ruffled Sleeves Mini Dress with Pockets\r', 8.50, 42.00, 2, NULL, 'XL', NULL, ''),
(134, 'White Floral Smocked Flared Plus Size Dress', 'Dress', 'White Floral Smocked Flared Plus Size Dress\r', 10.98, 48.00, 2, NULL, '1X', NULL, ''),
(135, 'White Floral Smocked Flared Plus Size Dress', 'Dress', 'White Floral Smocked Flared Plus Size Dress\r', 10.98, 48.00, 2, NULL, '2X ', NULL, ''),
(136, 'White Floral Smocked Flared Plus Size Dress', 'Dress', 'White Floral Smocked Flared Plus Size Dress\r', 10.98, 48.00, 2, NULL, '3X', NULL, ''),
(137, 'Cheetah Spotted Plus Size Off Shoulder Blouse', 'Top', 'Cheetah Spotted Plus Size Off Shoulder Blouse\r', 6.50, 27.00, 2, NULL, '1X', NULL, ''),
(138, 'Cheetah Spotted Plus Size Off Shoulder Blouse', 'Top', 'Cheetah Spotted Plus Size Off Shoulder Blouse\r', 6.50, 27.00, 2, NULL, '2X', NULL, ''),
(139, 'Cheetah Spotted Plus Size Off Shoulder Blouse', 'Top', 'Cheetah Spotted Plus Size Off Shoulder Blouse\r', 6.50, 27.00, 2, NULL, '3X', NULL, ''),
(140, 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt', 'Top', 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt\r', 7.40, 23.50, 3, NULL, 'S', NULL, ''),
(141, 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt', 'Top', 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt\r', 7.40, 23.50, 3, NULL, 'M', NULL, ''),
(142, 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt', 'Top', 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt\r', 7.40, 23.50, 3, NULL, 'L', NULL, ''),
(143, 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt', 'Top', 'Sky Blue Ribbed Knit Ruffled Short Sleeve T Shirt\r', 7.40, 23.50, 3, NULL, 'XL', NULL, ''),
(144, 'Rose Contrast Leopard Color Block Blouse', 'Top', 'Rose Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 4, NULL, 'S', NULL, ''),
(145, 'Rose Contrast Leopard Color Block Blouse', 'Top', 'Rose Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 4, NULL, 'M', NULL, ''),
(146, 'Rose Contrast Leopard Color Block Blouse', 'Top', 'Rose Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 4, NULL, 'L', NULL, ''),
(147, 'Rose Contrast Leopard Color Block Blouse', 'Top', 'Rose Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 4, NULL, 'XL', NULL, ''),
(148, 'Khaki Contrast Leopard Color Block Blouse', 'Top', 'Khaki Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 2, NULL, 'S', NULL, ''),
(149, 'Khaki Contrast Leopard Color Block Blouse', 'Top', 'Khaki Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 2, NULL, 'M', NULL, ''),
(150, 'Khaki Contrast Leopard Color Block Blouse', 'Top', 'Khaki Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 2, NULL, 'L', NULL, ''),
(151, 'Khaki Contrast Leopard Color Block Blouse', 'Top', 'Khaki Contrast Leopard Color Block Blouse\r', 3.80, 28.00, 2, NULL, 'XL', NULL, ''),
(152, 'White Embroidered Spaghetti Straps Maxi Dress with Pearls', 'Dress', 'White Embroidered Spaghetti Straps Maxi Dress with Pearls\r', 6.60, 48.00, 1, NULL, 'S', NULL, ''),
(153, 'White Embroidered Spaghetti Straps Maxi Dress with Pearls', 'Dress', 'White Embroidered Spaghetti Straps Maxi Dress with Pearls\r', 6.60, 48.00, 2, NULL, 'M', NULL, ''),
(154, 'White Embroidered Spaghetti Straps Maxi Dress with Pearls', 'Dress', 'White Embroidered Spaghetti Straps Maxi Dress with Pearls\r', 6.60, 48.00, 2, NULL, 'L', NULL, ''),
(155, 'White Embroidered Spaghetti Straps Maxi Dress with Pearls', 'Dress', 'White Embroidered Spaghetti Straps Maxi Dress with Pearls\r', 6.60, 48.00, 2, NULL, 'XL', NULL, ''),
(156, 'Pink Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Pink Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 3, NULL, '8', NULL, ''),
(157, 'Pink Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Pink Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 3, NULL, '8.5', NULL, ''),
(158, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 2, NULL, '6', NULL, ''),
(159, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 3, NULL, '8', NULL, ''),
(160, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 3, NULL, '9.5', NULL, ''),
(161, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 1, NULL, '11', NULL, ''),
(162, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 3, NULL, '7', NULL, ''),
(163, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 3, NULL, '8.5', NULL, ''),
(164, 'Gray Hollow-out Thick Soled Slip On Slippers', 'Shoes', 'Gray Hollow-out Thick Soled Slip On Slippers\r', 2.98, 15.00, 2, NULL, '10', NULL, ''),
(165, 'Sky Blue Distressed Raw Edge Jean Shorts', 'Bottoms', 'Sky Blue Distressed Raw Edge Jean Shorts\r', 9.98, 32.00, 2, NULL, '6', NULL, ''),
(166, 'Sky Blue Distressed Raw Edge Jean Shorts', 'Bottoms', 'Sky Blue Distressed Raw Edge Jean Shorts\r', 9.98, 32.00, 3, NULL, '8', NULL, ''),
(167, 'Sky Blue Distressed Raw Edge Jean Shorts', 'Bottoms', 'Sky Blue Distressed Raw Edge Jean Shorts\r', 9.98, 32.00, 3, NULL, '10', NULL, ''),
(168, 'Sky Blue Distressed Raw Edge Jean Shorts', 'Bottoms', 'Sky Blue Distressed Raw Edge Jean Shorts\r', 9.98, 32.00, 3, NULL, '14', NULL, ''),
(169, 'Sky Blue Distressed Raw Edge Jean Shorts', 'Bottoms', 'Sky Blue Distressed Raw Edge Jean Shorts\r', 9.98, 32.00, 2, NULL, '16', NULL, ''),
(170, 'Sky Blue Distressed Raw Edge Jean Shorts', 'Bottoms', 'Sky Blue Distressed Raw Edge Jean Shorts\r', 9.98, 32.00, 1, NULL, '18', NULL, ''),
(171, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 2, NULL, '6', NULL, ''),
(172, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 3, NULL, '8', NULL, ''),
(173, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 3, NULL, '10', NULL, ''),
(174, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 3, NULL, '12', NULL, ''),
(175, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 3, NULL, '14', NULL, ''),
(176, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 2, NULL, '16', NULL, ''),
(177, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 1, NULL, '4', NULL, ''),
(178, 'Blue Raw Hem High Waist Skinny Denim Shorts', 'Bottoms', 'Blue Raw Hem High Waist Skinny Denim Shorts\r', 8.98, 28.00, 1, NULL, '18', NULL, ''),
(179, 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse', 'Top', 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse\r', 6.89, 32.00, 3, NULL, 'S', NULL, ''),
(180, 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse', 'Top', 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse\r', 6.98, 32.00, 3, NULL, 'M', NULL, ''),
(181, 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse', 'Top', 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse\r', 6.98, 32.00, 3, NULL, 'L', NULL, ''),
(182, 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse', 'Top', 'Sky Blue Floral Print Loose Fit Ruched V Neck Blouse\r', 6.98, 32.00, 3, NULL, 'XL', NULL, ''),
(183, 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top', 'Top', 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top\r', 3.40, 24.00, 2, NULL, 'S', NULL, ''),
(184, 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top', 'Top', 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top\r', 3.40, 24.00, 2, NULL, 'M', NULL, ''),
(185, 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top', 'Top', 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top\r', 3.40, 24.00, 2, NULL, 'L', NULL, ''),
(186, 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top', 'Top', 'Sky Blue Adjustable Spaghetti Straps Boho Floral Tank Top\r', 3.40, 24.00, 2, NULL, 'XL', NULL, ''),
(187, 'Sky Blue Vintage Frayed Hem Plus Size Drawstring Denim Shorts', 'Bottoms', 'Sky Blue Vintage Frayed Hem Plus Size Drawstring Denim Shorts\r', 10.70, 32.00, 2, NULL, '1X', NULL, ''),
(188, 'Sky Blue Vintage Frayed Hem Plus Size Drawstring Denim Shorts', 'Bottoms', 'Sky Blue Vintage Frayed Hem Plus Size Drawstring Denim Shorts\r', 10.70, 32.00, 2, NULL, '2X', NULL, ''),
(189, 'Sky Blue Vintage Frayed Hem Plus Size Drawstring Denim Shorts', 'Bottoms', 'Sky Blue Vintage Frayed Hem Plus Size Drawstring Denim Shorts\r', 10.70, 32.00, 2, NULL, '3X', NULL, ''),
(190, 'Gray Slouchy Dolman Sleeve High Low Sweater', 'Top', 'Gray Slouchy Dolman Sleeve High Low Sweater\r', 7.90, 38.00, 2, NULL, 'S', NULL, ''),
(191, 'Gray Slouchy Dolman Sleeve High Low Sweater', 'Top', 'Gray Slouchy Dolman Sleeve High Low Sweater\r', 7.90, 38.00, 2, NULL, 'M', NULL, ''),
(192, 'Gray Slouchy Dolman Sleeve High Low Sweater', 'Top', 'Gray Slouchy Dolman Sleeve High Low Sweater\r', 7.90, 38.00, 2, NULL, 'L', NULL, ''),
(193, 'Gray Slouchy Dolman Sleeve High Low Sweater', 'Top', 'Gray Slouchy Dolman Sleeve High Low Sweater\r', 7.90, 38.00, 2, NULL, 'XL', NULL, ''),
(194, 'Gray Slouchy Dolman Sleeve High Low Sweater', 'Top', 'Gray Slouchy Dolman Sleeve High Low Sweater\r', 7.90, 38.00, 2, NULL, '2XL', NULL, ''),
(195, 'Pink Printed 3/4 Dolman Sleeve Plus Size Blouse', 'Top', 'Pink Printed 3/4 Dolman Sleeve Plus Size Blouse\r', 4.40, 26.00, 3, NULL, '1X', NULL, ''),
(196, 'Pink Printed 3/4 Dolman Sleeve Plus Size Blouse', 'Top', 'Pink Printed 3/4 Dolman Sleeve Plus Size Blouse\r', 4.40, 26.00, 3, NULL, '2X', NULL, ''),
(197, 'Pink Printed 3/4 Dolman Sleeve Plus Size Blouse', 'Top', 'Pink Printed 3/4 Dolman Sleeve Plus Size Blouse\r', 4.40, 26.00, 3, NULL, '3X', NULL, ''),
(198, 'Blue Plus Size Open Knee Distressed Jeans', 'Bottoms', 'Blue Plus Size Open Knee Distressed Jeans\r', 13.90, 43.50, 2, NULL, '1X', NULL, ''),
(199, 'Blue Plus Size Open Knee Distressed Jeans', 'Bottoms', 'Blue Plus Size Open Knee Distressed Jeans\r', 13.90, 43.50, 2, NULL, '2X', NULL, ''),
(200, 'Blue Plus Size Open Knee Distressed Jeans', 'Bottoms', 'Blue Plus Size Open Knee Distressed Jeans\r', 13.90, 43.50, 1, NULL, '3X', NULL, ''),
(201, 'Blue Plus Size Vintage Wash Frayed Denim Shorts', 'Bottoms', 'Blue Plus Size Vintage Wash Frayed Denim Shorts\r', 10.98, 38.00, 2, NULL, '1X', NULL, ''),
(202, 'Blue Plus Size Vintage Wash Frayed Denim Shorts', 'Bottoms', 'Blue Plus Size Vintage Wash Frayed Denim Shorts\r', 10.98, 38.00, 2, NULL, '2X', NULL, ''),
(203, 'Blue Plus Size Vintage Wash Frayed Denim Shorts', 'Bottoms', 'Blue Plus Size Vintage Wash Frayed Denim Shorts\r', 10.98, 38.00, 2, NULL, '3X', NULL, ''),
(204, 'Rose Plus Size Paisley Print V Neck Roll Tab Sleeve Blouse', 'Top', 'Rose Plus Size Paisley Print V Neck Roll Tab Sleeve Blouse\r', 5.50, 28.00, 3, NULL, '1X', NULL, ''),
(205, 'Rose Plus Size Paisley Print V Neck Roll Tab Sleeve Blouse', 'Top', 'Rose Plus Size Paisley Print V Neck Roll Tab Sleeve Blouse\r', 5.50, 28.00, 3, NULL, '2X', NULL, ''),
(206, 'Rose Plus Size Paisley Print V Neck Roll Tab Sleeve Blouse', 'Top', 'Rose Plus Size Paisley Print V Neck Roll Tab Sleeve Blouse\r', 5.50, 28.00, 3, NULL, '3X', NULL, ''),
(207, 'Green Floral Print Frilled Off Shoulder Plus Size Blouse', 'Top', 'Green Floral Print Frilled Off Shoulder Plus Size Blouse\r', 6.40, 32.00, 2, NULL, '1X', NULL, ''),
(208, 'Green Floral Print Frilled Off Shoulder Plus Size Blouse', 'Top', 'Green Floral Print Frilled Off Shoulder Plus Size Blouse\r', 6.40, 32.00, 2, NULL, '2X', NULL, ''),
(209, 'Green Floral Print Frilled Off Shoulder Plus Size Blouse', 'Top', 'Green Floral Print Frilled Off Shoulder Plus Size Blouse\r', 6.40, 32.00, 2, NULL, '3X', NULL, ''),
(210, 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse', 'Top', 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse\r', 6.59, 36.00, 3, NULL, 'S', NULL, ''),
(211, 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse', 'Top', 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse\r', 6.59, 36.00, 3, NULL, 'M', NULL, ''),
(212, 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse', 'Top', 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse\r', 6.59, 36.00, 3, NULL, 'L', NULL, ''),
(213, 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse', 'Top', 'Fiery Red Floral Print Frill Trim Off-shoulder Lantern Sleeve Blouse\r', 6.59, 36.00, 3, NULL, 'XL', NULL, ''),
(214, 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress', 'Dress', 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress\r', 7.86, 38.00, 2, NULL, 'S', NULL, ''),
(215, 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress', 'Dress', 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress\r', 7.86, 38.00, 4, NULL, 'M', NULL, ''),
(216, 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress', 'Dress', 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress\r', 7.86, 38.00, 4, NULL, 'L', NULL, ''),
(217, 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress', 'Dress', 'Plaid Pattern Collared Neck Ruffled Sleeve Shirt Dress\r', 7.86, 38.00, 4, NULL, 'XL', NULL, ''),
(218, 'White Sequin Patch Chest Pocket Raglan Sleeve Top', 'Top', 'White Sequin Patch Chest Pocket Raglan Sleeve Top\r', 5.08, 34.00, 2, NULL, 'S', NULL, ''),
(219, 'White Sequin Patch Chest Pocket Raglan Sleeve Top', 'Top', 'White Sequin Patch Chest Pocket Raglan Sleeve Top\r', 5.08, 34.00, 2, NULL, 'M', NULL, ''),
(220, 'White Sequin Patch Chest Pocket Raglan Sleeve Top', 'Top', 'White Sequin Patch Chest Pocket Raglan Sleeve Top\r', 5.08, 34.00, 2, NULL, 'L', NULL, ''),
(221, 'White Sequin Patch Chest Pocket Raglan Sleeve Top', 'Top', 'White Sequin Patch Chest Pocket Raglan Sleeve Top\r', 5.08, 34.00, 2, NULL, 'XL', NULL, ''),
(222, 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans', 'Bottoms', 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans\r', 11.96, 54.00, 2, NULL, '6', NULL, ''),
(223, 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans', 'Bottoms', 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans\r', 11.96, 54.00, 3, NULL, '8', NULL, ''),
(224, 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans', 'Bottoms', 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans\r', 11.96, 54.00, 3, NULL, '10', NULL, ''),
(225, 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans', 'Bottoms', 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans\r', 11.96, 54.00, 3, NULL, '12', NULL, ''),
(226, 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans', 'Bottoms', 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans\r', 11.96, 54.00, 3, NULL, '14', NULL, ''),
(227, 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans', 'Bottoms', 'Light Blue Acid Wash Distressed Straight Leg Cropped Jeans\r', 11.96, 54.00, 2, NULL, '16', NULL, ''),
(228, 'Black Textured Flutter Sleeve Top Wide Leg Pants Set', 'Bottoms', 'Black Textured Flutter Sleeve Top Wide Leg Pants Set\r', 12.23, 46.50, 2, NULL, 'S', NULL, ''),
(229, 'Black Textured Flutter Sleeve Top Wide Leg Pants Set', 'Bottoms', 'Black Textured Flutter Sleeve Top Wide Leg Pants Set\r', 12.23, 46.50, 2, NULL, 'M', NULL, ''),
(230, 'Black Textured Flutter Sleeve Top Wide Leg Pants Set', 'Bottoms', 'Black Textured Flutter Sleeve Top Wide Leg Pants Set\r', 12.23, 46.50, 2, NULL, 'L', NULL, ''),
(231, 'Black Textured Flutter Sleeve Top Wide Leg Pants Set', 'Bottoms', 'Black Textured Flutter Sleeve Top Wide Leg Pants Set\r', 12.23, 46.50, 2, NULL, 'XL', NULL, ''),
(232, 'Rose Red Short Puff Sleeve Sequin Babydoll Romper', 'Bottoms', 'Rose Red Short Puff Sleeve Sequin Babydoll Romper\r', 14.30, 64.00, 2, NULL, 'S', NULL, ''),
(233, 'Rose Red Short Puff Sleeve Sequin Babydoll Romper', 'Bottoms', 'Rose Red Short Puff Sleeve Sequin Babydoll Romper\r', 14.30, 64.00, 2, NULL, 'M', NULL, ''),
(234, 'Rose Red Short Puff Sleeve Sequin Babydoll Romper', 'Bottoms', 'Rose Red Short Puff Sleeve Sequin Babydoll Romper\r', 14.30, 64.00, 2, NULL, 'L', NULL, ''),
(235, 'Rose Red Short Puff Sleeve Sequin Babydoll Romper', 'Bottoms', 'Rose Red Short Puff Sleeve Sequin Babydoll Romper\r', 14.30, 64.00, 2, NULL, 'XL', NULL, ''),
(236, 'Bright White Heavy Distressed Straight Leg Jeans', 'Bottoms', 'Bright White Heavy Distressed Straight Leg Jeans\r', 11.81, 48.00, 2, NULL, '6', NULL, ''),
(237, 'Bright White Heavy Distressed Straight Leg Jeans', 'Bottoms', 'Bright White Heavy Distressed Straight Leg Jeans\r', 11.81, 48.00, 2, NULL, '8', NULL, ''),
(238, 'Bright White Heavy Distressed Straight Leg Jeans', 'Bottoms', 'Bright White Heavy Distressed Straight Leg Jeans\r', 11.81, 48.00, 2, NULL, '10', NULL, ''),
(239, 'Bright White Heavy Distressed Straight Leg Jeans', 'Bottoms', 'Bright White Heavy Distressed Straight Leg Jeans\r', 11.81, 48.00, 2, NULL, '12', NULL, ''),
(240, 'Bright White Heavy Distressed Straight Leg Jeans', 'Bottoms', 'Bright White Heavy Distressed Straight Leg Jeans\r', 11.81, 48.00, 2, NULL, '14', NULL, ''),
(241, 'Bright White Heavy Distressed Straight Leg Jeans', 'Bottoms', 'Bright White Heavy Distressed Straight Leg Jeans\r', 11.81, 48.00, 1, NULL, '16', NULL, ''),
(242, 'Light Blue High Rise Distressed Straight Leg Jeans', 'Bottoms', 'Light Blue High Rise Distressed Straight Leg Jeans\r', 12.38, 52.00, 3, NULL, '6', NULL, ''),
(243, 'Light Blue High Rise Distressed Straight Leg Jeans', 'Bottoms', 'Light Blue High Rise Distressed Straight Leg Jeans\r', 12.38, 52.00, 3, NULL, '8', NULL, ''),
(244, 'Light Blue High Rise Distressed Straight Leg Jeans', 'Bottoms', 'Light Blue High Rise Distressed Straight Leg Jeans\r', 12.38, 52.00, 3, NULL, '10', NULL, ''),
(245, 'Light Blue High Rise Distressed Straight Leg Jeans', 'Bottoms', 'Light Blue High Rise Distressed Straight Leg Jeans\r', 12.38, 52.00, 3, NULL, '12', NULL, ''),
(246, 'Light Blue High Rise Distressed Straight Leg Jeans', 'Bottoms', 'Light Blue High Rise Distressed Straight Leg Jeans\r', 12.38, 52.00, 3, NULL, '14', NULL, ''),
(247, 'Light Blue High Rise Distressed Straight Leg Jeans', 'Bottoms', 'Light Blue High Rise Distressed Straight Leg Jeans\r', 12.38, 52.00, 2, NULL, '16', NULL, ''),
(248, 'Desert Palm Boho Leopard Wide Leg Pants', 'Bottoms', 'Desert Palm Boho Leopard Wide Leg Pants\r', 5.76, 28.00, 2, NULL, 'S', NULL, ''),
(249, 'Desert Palm Boho Leopard Wide Leg Pants', 'Bottoms', 'Desert Palm Boho Leopard Wide Leg Pants\r', 5.76, 28.00, 2, NULL, 'M', NULL, ''),
(250, 'Desert Palm Boho Leopard Wide Leg Pants', 'Bottoms', 'Desert Palm Boho Leopard Wide Leg Pants\r', 5.76, 28.00, 2, NULL, 'L', NULL, ''),
(251, 'Desert Palm Boho Leopard Wide Leg Pants', 'Bottoms', 'Desert Palm Boho Leopard Wide Leg Pants\r', 5.76, 28.00, 2, NULL, 'XL', NULL, ''),
(252, 'White Wavy Textured Mock Neck Cap Sleeve Top', 'Top', 'White Wavy Textured Mock Neck Cap Sleeve Top\r', 3.86, 36.00, 4, NULL, 'M', NULL, ''),
(253, 'White Wavy Textured Mock Neck Cap Sleeve Top', 'Top', 'White Wavy Textured Mock Neck Cap Sleeve Top\r', 3.86, 36.00, 4, NULL, 'L', NULL, ''),
(254, 'White Wavy Textured Mock Neck Cap Sleeve Top', 'Top', 'White Wavy Textured Mock Neck Cap Sleeve Top\r', 3.86, 36.00, 4, NULL, 'XL', NULL, ''),
(255, 'Light French Beige Acid Washed High Rise Cropped Wide Leg', 'Bottoms', 'Light French Beige Acid Washed High Rise Cropped Wide Leg\r', 11.79, 62.00, 2, NULL, '6', NULL, ''),
(256, 'Light French Beige Acid Washed High Rise Cropped Wide Leg', 'Bottoms', 'Light French Beige Acid Washed High Rise Cropped Wide Leg\r', 11.79, 62.00, 3, NULL, '8', NULL, ''),
(257, 'Light French Beige Acid Washed High Rise Cropped Wide Leg', 'Bottoms', 'Light French Beige Acid Washed High Rise Cropped Wide Leg\r', 11.79, 62.00, 3, NULL, '10', NULL, ''),
(258, 'Light French Beige Acid Washed High Rise Cropped Wide Leg', 'Bottoms', 'Light French Beige Acid Washed High Rise Cropped Wide Leg\r', 11.79, 62.00, 3, NULL, '12', NULL, ''),
(259, 'Light French Beige Acid Washed High Rise Cropped Wide Leg', 'Bottoms', 'Light French Beige Acid Washed High Rise Cropped Wide Leg\r', 11.79, 62.00, 3, NULL, '14', NULL, ''),
(260, 'Light French Beige Acid Washed High Rise Cropped Wide Leg', 'Bottoms', 'Light French Beige Acid Washed High Rise Cropped Wide Leg\r', 11.79, 62.00, 3, NULL, '16', NULL, ''),
(261, 'Rose Red Floral Square Neck Flutter Tank Top', 'Top', 'Rose Red Floral Square Neck Flutter Tank Top\r', 4.91, 36.00, 3, NULL, 'S', NULL, ''),
(262, 'Rose Red Floral Square Neck Flutter Tank Top', 'Top', 'Rose Red Floral Square Neck Flutter Tank Top\r', 4.91, 36.00, 3, NULL, 'M', NULL, ''),
(263, 'Rose Red Floral Square Neck Flutter Tank Top', 'Top', 'Rose Red Floral Square Neck Flutter Tank Top\r', 4.91, 36.00, 3, NULL, 'L', NULL, ''),
(264, 'Rose Red Floral Square Neck Flutter Tank Top', 'Top', 'Rose Red Floral Square Neck Flutter Tank Top\r', 4.91, 36.00, 3, NULL, 'XL', NULL, ''),
(265, 'Rose Red Floral Square Neck Flutter Tank Top', 'Top', 'Rose Red Floral Square Neck Flutter Tank Top\r', 4.91, 36.00, 1, NULL, '2XL', NULL, ''),
(266, 'Rose Red Floral Square Neck Flutter Tank Top', 'Top', 'Rose Red Floral Square Neck Flutter Tank Top\r', 4.91, 36.00, 1, NULL, '3XL', NULL, ''),
(267, 'Beige V Neck Textured Split Hem Oversized Top', 'Top', 'Beige V Neck Textured Split Hem Oversized Top\r', 4.09, 24.00, 3, NULL, 'S', NULL, ''),
(268, 'Beige V Neck Textured Split Hem Oversized Top', 'Top', 'Beige V Neck Textured Split Hem Oversized Top\r', 4.09, 24.00, 3, NULL, 'M', NULL, ''),
(269, 'Beige V Neck Textured Split Hem Oversized Top', 'Top', 'Beige V Neck Textured Split Hem Oversized Top\r', 4.09, 24.00, 3, NULL, 'L', NULL, ''),
(270, 'Beige V Neck Textured Split Hem Oversized Top', 'Top', 'Beige V Neck Textured Split Hem Oversized Top\r', 4.09, 24.00, 3, NULL, 'XL', NULL, ''),
(271, 'Guacamole Green Studded Short Sleeve Top', 'Top', 'Guacamole Green Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'M', NULL, ''),
(272, 'Guacamole Green Studded Short Sleeve Top', 'Top', 'Guacamole Green Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'L', NULL, ''),
(273, 'Guacamole Green Studded Short Sleeve Top', 'Top', 'Guacamole Green Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'XL', NULL, ''),
(274, 'Dark Grey Studded Short Sleeve Top', 'Top', 'Dark Grey Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'S', NULL, ''),
(275, 'Dark Grey Studded Short Sleeve Top', 'Top', 'Dark Grey Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'M', NULL, ''),
(276, 'Dark Grey Studded Short Sleeve Top', 'Top', 'Dark Grey Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'L', NULL, ''),
(277, 'Dark Grey Studded Short Sleeve Top', 'Top', 'Dark Grey Studded Short Sleeve Top\r', 5.66, 32.00, 3, NULL, 'XL', NULL, ''),
(278, 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'S', NULL, ''),
(279, 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'M', NULL, ''),
(280, 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'L', NULL, ''),
(281, 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Oatmeal Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 2, NULL, 'XL', NULL, ''),
(282, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'S', NULL, ''),
(283, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'M', NULL, ''),
(284, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'L', NULL, ''),
(285, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress', 'Dress', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater Dress\r', 9.97, 48.00, 3, NULL, 'XL', NULL, ''),
(286, 'Bright Pink Half Button Collared Loose Romper', 'Bottoms', 'Bright Pink Half Button Collared Loose Romper\r', 7.18, 24.50, 2, NULL, 'S', NULL, ''),
(287, 'Bright Pink Half Button Collared Loose Romper', 'Bottoms', 'Bright Pink Half Button Collared Loose Romper\r', 7.18, 24.50, 2, NULL, 'M', NULL, ''),
(288, 'Bright Pink Half Button Collared Loose Romper', 'Bottoms', 'Bright Pink Half Button Collared Loose Romper\r', 7.18, 24.50, 2, NULL, 'L', NULL, ''),
(289, 'Bright Pink Half Button Collared Loose Romper', 'Bottoms', 'Bright Pink Half Button Collared Loose Romper\r', 7.18, 24.50, 2, NULL, 'XL', NULL, ''),
(290, 'Black Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Black Vintage Washed Frilled High Waist Denim Shorts\r', 9.44, 38.50, 3, NULL, '6', NULL, ''),
(291, 'Black Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Black Vintage Washed Frilled High Waist Denim Shorts\r', 9.44, 38.50, 3, NULL, '8', NULL, ''),
(292, 'Black Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Black Vintage Washed Frilled High Waist Denim Shorts\r', 9.44, 38.50, 3, NULL, '10', NULL, ''),
(293, 'Black Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Black Vintage Washed Frilled High Waist Denim Shorts\r', 9.44, 38.50, 2, NULL, '12', NULL, ''),
(294, 'Black Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Black Vintage Washed Frilled High Waist Denim Shorts\r', 9.44, 38.50, 2, NULL, '14', NULL, ''),
(295, 'Black Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Black Vintage Washed Frilled High Waist Denim Shorts\r', 9.44, 38.50, 2, NULL, '16', NULL, ''),
(296, 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts\r', 10.56, 38.50, 3, NULL, '6', NULL, ''),
(297, 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts\r', 10.56, 38.50, 3, NULL, '8', NULL, ''),
(298, 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts\r', 10.56, 38.50, 3, NULL, '10', NULL, ''),
(299, 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts\r', 10.56, 38.50, 3, NULL, '12', NULL, ''),
(300, 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts\r', 10.56, 38.50, 2, NULL, '14', NULL, ''),
(301, 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts', 'Bottoms', 'Dusty Pink Vintage Washed Frilled High Waist Denim Shorts\r', 10.56, 38.50, 2, NULL, '16', NULL, ''),
(302, 'Sky Blue Stud Embellished High Waist Denim Shorts', 'Bottoms', 'Sky Blue Stud Embellished High Waist Denim Shorts\r', 8.97, 42.00, 2, NULL, '10', NULL, ''),
(303, 'Sky Blue Stud Embellished High Waist Denim Shorts', 'Bottoms', 'Sky Blue Stud Embellished High Waist Denim Shorts\r', 8.97, 42.00, 2, NULL, '12', NULL, ''),
(304, 'Sky Blue Stud Embellished High Waist Denim Shorts', 'Bottoms', 'Sky Blue Stud Embellished High Waist Denim Shorts\r', 8.97, 42.00, 2, NULL, '14', NULL, ''),
(305, 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'S', NULL, ''),
(306, 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'M', NULL, ''),
(307, 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'L', NULL, ''),
(308, 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Bright Pink Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'XL', NULL, ''),
(309, 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'S', NULL, ''),
(310, 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'M', NULL, ''),
(311, 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'L', NULL, ''),
(312, 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Blue Sapphire Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'XL', NULL, ''),
(313, 'Pink Collared V Neck Puff Sleeve T-shirt', 'Top', 'Pink Collared V Neck Puff Sleeve T-shirt\r', 5.57, 38.50, 3, NULL, 'S', NULL, ''),
(314, 'Pink Collared V Neck Puff Sleeve T-shirt', 'Top', 'Pink Collared V Neck Puff Sleeve T-shirt\r', 5.57, 38.50, 3, NULL, 'M', NULL, ''),
(315, 'Pink Collared V Neck Puff Sleeve T-shirt', 'Top', 'Pink Collared V Neck Puff Sleeve T-shirt\r', 5.57, 38.50, 3, NULL, 'L', NULL, ''),
(316, 'Pink Collared V Neck Puff Sleeve T-shirt', 'Top', 'Pink Collared V Neck Puff Sleeve T-shirt\r', 5.57, 38.50, 3, NULL, 'XL', NULL, ''),
(317, 'Jungle Green Wavy Texture Cap Sleeve Top', 'Top', 'Jungle Green Wavy Texture Cap Sleeve Top\r', 4.06, 36.00, 3, NULL, 'S', NULL, ''),
(318, 'Jungle Green Wavy Texture Cap Sleeve Top', 'Top', 'Jungle Green Wavy Texture Cap Sleeve Top\r', 4.06, 36.00, 3, NULL, 'M', NULL, ''),
(319, 'Jungle Green Wavy Texture Cap Sleeve Top', 'Top', 'Jungle Green Wavy Texture Cap Sleeve Top\r', 4.06, 36.00, 3, NULL, 'L', NULL, ''),
(320, 'Jungle Green Wavy Texture Cap Sleeve Top', 'Top', 'Jungle Green Wavy Texture Cap Sleeve Top\r', 4.06, 36.00, 3, NULL, 'XL', NULL, ''),
(321, 'Jungle Green Wavy Texture Cap Sleeve Top', 'Top', 'Jungle Green Wavy Texture Cap Sleeve Top\r', 4.06, 36.00, 3, NULL, '2XL', NULL, ''),
(322, 'Brown Plus Size Vintage Floral Print Drawstring Waist Mini Dress', 'Dress', 'Brown Plus Size Vintage Floral Print Drawstring Waist Mini Dress\r', 11.95, 52.00, 2, NULL, '1X', NULL, ''),
(323, 'Brown Plus Size Vintage Floral Print Drawstring Waist Mini Dress', 'Dress', 'Brown Plus Size Vintage Floral Print Drawstring Waist Mini Dress\r', 11.95, 52.00, 2, NULL, '2X', NULL, ''),
(324, 'Brown Plus Size Vintage Floral Print Drawstring Waist Mini Dress', 'Dress', 'Brown Plus Size Vintage Floral Print Drawstring Waist Mini Dress\r', 11.95, 52.00, 2, NULL, '3X', NULL, ''),
(325, 'Brown Suede Square Neck Puff Sleeve Dress', 'Dress', 'Brown Suede Square Neck Puff Sleeve Dress\r', 8.29, 56.50, 1, NULL, 'S', NULL, ''),
(326, 'Brown Suede Square Neck Puff Sleeve Dress', 'Dress', 'Brown Suede Square Neck Puff Sleeve Dress\r', 8.29, 56.50, 2, NULL, 'M', NULL, ''),
(327, 'Brown Suede Square Neck Puff Sleeve Dress', 'Dress', 'Brown Suede Square Neck Puff Sleeve Dress\r', 8.29, 56.50, 2, NULL, 'L', NULL, ''),
(328, 'Brown Suede Square Neck Puff Sleeve Dress', 'Dress', 'Brown Suede Square Neck Puff Sleeve Dress\r', 8.29, 56.50, 2, NULL, 'XL', NULL, ''),
(329, 'Black Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Black Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 1, NULL, 'S', NULL, ''),
(330, 'Black Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Black Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 2, NULL, 'M', NULL, ''),
(331, 'Black Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Black Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 2, NULL, 'L', NULL, ''),
(332, 'Black Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Black Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 2, NULL, 'XL', NULL, ''),
(333, 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 1, NULL, 'S', NULL, ''),
(334, 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 2, NULL, 'M', NULL, ''),
(335, 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 2, NULL, 'L', NULL, ''),
(336, 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater', 'Top', 'Light French Beige Crew Neck Cable Knit Short Sleeve Sweater\r', 7.51, 36.00, 2, NULL, 'XL', NULL, ''),
(337, 'Black Leather Panel Patchwork High Waist Leggings', 'Bottoms', 'Black Leather Panel Patchwork High Waist Leggings\r', 4.83, 32.00, 2, NULL, 'S', NULL, ''),
(338, 'Black Leather Panel Patchwork High Waist Leggings', 'Bottoms', 'Black Leather Panel Patchwork High Waist Leggings\r', 4.83, 32.00, 4, NULL, 'M', NULL, ''),
(339, 'Black Leather Panel Patchwork High Waist Leggings', 'Bottoms', 'Black Leather Panel Patchwork High Waist Leggings\r', 4.83, 32.00, 4, NULL, 'L', NULL, ''),
(340, 'Black Leather Panel Patchwork High Waist Leggings', 'Bottoms', 'Black Leather Panel Patchwork High Waist Leggings\r', 4.83, 32.00, 4, NULL, 'XL', NULL, ''),
(341, 'Khaki High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Khaki High Waist Faux Suede Skinny Leggings\r', 5.25, 38.00, 1, NULL, 'S', NULL, ''),
(342, 'Khaki High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Khaki High Waist Faux Suede Skinny Leggings\r', 5.25, 38.00, 2, NULL, 'M', NULL, ''),
(343, 'Khaki High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Khaki High Waist Faux Suede Skinny Leggings\r', 5.25, 38.00, 2, NULL, 'L', NULL, ''),
(344, 'Khaki High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Khaki High Waist Faux Suede Skinny Leggings\r', 5.25, 38.00, 2, NULL, 'XL', NULL, ''),
(345, 'Real Teal Quilted Short Sleeve Wide Leg Pants Set', 'Bottoms', 'Real Teal Quilted Short Sleeve Wide Leg Pants Set\r', 12.21, 42.00, 1, NULL, 'S', NULL, ''),
(346, 'Real Teal Quilted Short Sleeve Wide Leg Pants Set', 'Bottoms', 'Real Teal Quilted Short Sleeve Wide Leg Pants Set\r', 12.21, 42.00, 2, NULL, 'M', NULL, ''),
(347, 'Real Teal Quilted Short Sleeve Wide Leg Pants Set', 'Bottoms', 'Real Teal Quilted Short Sleeve Wide Leg Pants Set\r', 12.21, 42.00, 2, NULL, 'L', NULL, ''),
(348, 'Real Teal Quilted Short Sleeve Wide Leg Pants Set', 'Bottoms', 'Real Teal Quilted Short Sleeve Wide Leg Pants Set\r', 12.21, 42.00, 2, NULL, 'XL', NULL, ''),
(349, 'Yellow Printed Printed 3/4 Dolman Sleeve Plus Size Blouse', 'Top', 'Yellow Printed Printed 3/4 Dolman Sleeve Plus Size Blouse\r', 4.40, 32.00, 3, NULL, '1X', NULL, ''),
(350, 'Yellow Printed Printed 3/4 Dolman Sleeve Plus Size Blouse', 'Top', 'Yellow Printed Printed 3/4 Dolman Sleeve Plus Size Blouse\r', 4.40, 32.00, 3, NULL, '2X', NULL, ''),
(351, 'Yellow Printed Printed 3/4 Dolman Sleeve Plus Size Blouse', 'Top', 'Yellow Printed Printed 3/4 Dolman Sleeve Plus Size Blouse\r', 4.40, 32.00, 3, NULL, '3X', NULL, ''),
(352, 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top', 'Top', 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top\r', 5.91, 28.50, 3, NULL, 'S', NULL, ''),
(353, 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top', 'Top', 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top\r', 5.91, 28.50, 3, NULL, 'M', NULL, ''),
(354, 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top', 'Top', 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top\r', 5.91, 28.50, 3, NULL, 'L', NULL, ''),
(355, 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top', 'Top', 'White Valentine\'s Day Sequined Heart Crew Neck Short Sleeve Top\r', 5.91, 28.50, 3, NULL, 'XL', NULL, ''),
(356, 'Black Faux Leather High Waist Sports Leggings', 'Bottoms', 'Black Faux Leather High Waist Sports Leggings\r', 6.65, 36.50, 2, NULL, 'S', NULL, ''),
(357, 'Black Faux Leather High Waist Sports Leggings', 'Bottoms', 'Black Faux Leather High Waist Sports Leggings\r', 6.65, 36.50, 2, NULL, 'M', NULL, ''),
(358, 'Black Faux Leather High Waist Sports Leggings', 'Bottoms', 'Black Faux Leather High Waist Sports Leggings\r', 6.65, 36.50, 2, NULL, 'L', NULL, ''),
(359, 'Black Faux Leather High Waist Sports Leggings', 'Bottoms', 'Black Faux Leather High Waist Sports Leggings\r', 6.65, 36.50, 2, NULL, 'XL', NULL, ''),
(360, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 1, NULL, '5.5', NULL, ''),
(361, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 1, NULL, '6', NULL, ''),
(362, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 2, NULL, '7', NULL, ''),
(363, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 2, NULL, '8', NULL, ''),
(364, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 2, NULL, '8.5', NULL, ''),
(365, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 1, NULL, '9.5', NULL, ''),
(366, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 1, NULL, '10', NULL, ''),
(367, 'Black Print Thick Sole Slip On Slippers', 'Shoes', 'Black Print Thick Sole Slip On Slippers\r', 4.43, 18.00, 1, NULL, '11', NULL, ''),
(368, 'Rose Red Leopard Trim V Neck Short Sleeve Plus Size Corded Top', 'Top', 'Rose Red Leopard Trim V Neck Short Sleeve Plus Size Corded Top\r', 6.03, 36.00, 3, NULL, '1X', NULL, ''),
(369, 'Rose Red Leopard Trim V Neck Short Sleeve Plus Size Corded Top', 'Top', 'Rose Red Leopard Trim V Neck Short Sleeve Plus Size Corded Top\r', 6.03, 36.00, 3, NULL, '2X', NULL, ''),
(370, 'Rose Red Leopard Trim V Neck Short Sleeve Plus Size Corded Top', 'Top', 'Rose Red Leopard Trim V Neck Short Sleeve Plus Size Corded Top\r', 6.03, 36.00, 3, NULL, '3X', NULL, ''),
(371, 'Apricot Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Apricot Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'S', NULL, ''),
(372, 'Apricot Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Apricot Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'M', NULL, ''),
(373, 'Apricot Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Apricot Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'L', NULL, ''),
(374, 'Apricot Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Apricot Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'XL', NULL, ''),
(375, 'Black Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Black Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'S', NULL, ''),
(376, 'Black Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Black Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'M', NULL, ''),
(377, 'Black Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Black Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'L', NULL, ''),
(378, 'Black Crinkled V Neck Wide Sleeve T-shirt', 'Top', 'Black Crinkled V Neck Wide Sleeve T-shirt\r', 3.30, 32.00, 4, NULL, 'XL', NULL, ''),
(379, 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts', 'Bottoms', 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts\r', 8.70, 42.50, 3, NULL, 'S', NULL, ''),
(380, 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts', 'Bottoms', 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts\r', 8.70, 42.50, 3, NULL, 'M', NULL, ''),
(381, 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts', 'Bottoms', 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts\r', 8.70, 42.50, 3, NULL, 'L', NULL, ''),
(382, 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts', 'Bottoms', 'Sky Blue Gypsy Mid-rise Distressed Denim Shorts\r', 8.70, 42.50, 3, NULL, 'XL', NULL, ''),
(383, 'Black High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Black High Waist Faux Suede Skinny Leggings\r', 5.37, 38.00, 1, NULL, 'S', NULL, ''),
(384, 'Black High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Black High Waist Faux Suede Skinny Leggings\r', 5.37, 38.00, 2, NULL, 'M', NULL, ''),
(385, 'Black High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Black High Waist Faux Suede Skinny Leggings\r', 5.37, 38.00, 2, NULL, 'L', NULL, ''),
(386, 'Black High Waist Faux Suede Skinny Leggings', 'Bottoms', 'Black High Waist Faux Suede Skinny Leggings\r', 5.37, 38.00, 2, NULL, 'XL', NULL, ''),
(387, 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress', 'Dress', 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress\r', 9.70, 58.00, 1, NULL, 'S', NULL, ''),
(388, 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress', 'Dress', 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress\r', 9.70, 58.00, 2, NULL, 'M', NULL, ''),
(389, 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress', 'Dress', 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress\r', 9.70, 58.00, 2, NULL, 'L', NULL, ''),
(390, 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress', 'Dress', 'Rose Floral Print Smocked Square Neck Bubble Sleeve Dress\r', 9.70, 58.00, 2, NULL, 'XL', NULL, ''),
(391, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater', 'Top', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater\r', 6.18, 36.50, 2, NULL, 'S', NULL, ''),
(392, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater', 'Top', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater\r', 6.18, 36.50, 4, NULL, 'M', NULL, ''),
(393, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater', 'Top', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater\r', 6.18, 36.50, 4, NULL, 'L', NULL, ''),
(394, 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater', 'Top', 'Blackish Green Patch Pocket Ribbed Knit Short Sleeve Sweater\r', 6.18, 36.50, 4, NULL, 'XL', NULL, ''),
(1000, 'Airmax 95', 'Sneakers', 'Vapormax', 90.00, 219.00, 23, 'Black', '10.5', 'Mixed', ''),
(1001, 'Jordan 11', 'Activewear', 'space jam', 100.00, 219.00, 25, '', '11', '', ''),
(1002, 'jordan 11', 'Sneakers', 'k', 29.00, 59.00, 25, 'j', 'k', 'k', '');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SaleID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  `ItemsSold` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `shift_time` decimal(10,2) DEFAULT NULL,
  `shift_date` date DEFAULT NULL,
  `total_transactions` int(11) DEFAULT NULL,
  `total_cash` decimal(10,2) DEFAULT NULL,
  `total_checks` decimal(10,2) DEFAULT NULL,
  `total_card_sales` decimal(10,2) DEFAULT NULL,
  `total_sales` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `employee_id`, `shift_time`, `shift_date`, `total_transactions`, `total_cash`, `total_checks`, `total_card_sales`, `total_sales`) VALUES
(12, 4119, 0.04, '2024-02-21', 0, NULL, NULL, NULL, NULL),
(13, 4119, 0.03, '2024-02-21', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL,
  `SaleID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `TransactionDate` date NOT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `CashReceived` decimal(10,2) DEFAULT NULL,
  `ChangeGiven` decimal(10,2) DEFAULT NULL,
  `CheckNumber` varchar(20) DEFAULT NULL,
  `CreditCardNumber` varchar(16) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `items_sold`
--
ALTER TABLE `items_sold`
  ADD KEY `SaleID` (`SaleID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD KEY `fk_customer` (`CustomerID`),
  ADD KEY `fk_employee_id` (`employee_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `transactions_ibfk_2` (`CustomerID`),
  ADD KEY `transactions_ibfk_1` (`SaleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1049;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8062;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SaleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items_sold`
--
ALTER TABLE `items_sold`
  ADD CONSTRAINT `items_sold_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sales` (`SaleID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
